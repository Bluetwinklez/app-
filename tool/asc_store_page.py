#!/usr/bin/env python3
"""Prepares the next App Store version page from tool/store_page.json.

  asc_store_page.py plan     only report what would change
  asc_store_page.py apply    create the draft version and write the text

Nothing is submitted for review: the version stays a draft. Text fields of
every locale in the file are written; a locale the page does not have yet is
created, copying the support and marketing URLs from the primary locale.
"""
import hashlib
import json
import os
import sys
import urllib.request

sys.path.insert(0, os.path.dirname(__file__))
from asc_provision import Api  # noqa: E402

VERSION = os.environ.get("NEW_VERSION", "1.8.0")
LIVE = {"READY_FOR_SALE", "READY_FOR_DISTRIBUTION", "REPLACED_WITH_NEW_VERSION",
        "REMOVED_FROM_SALE", "DEVELOPER_REMOVED_FROM_SALE"}
VERSION_FIELDS = ("description", "keywords", "promotionalText", "whatsNew")
INFO_FIELDS = ("name", "subtitle")


def state(v):
    a = v["attributes"]
    return a.get("appVersionState") or a.get("appStoreState")


def upload_one(api, set_id, path):
    with open(path, "rb") as f:
        data = f.read()
    shot = api.call("POST", "/appScreenshots", body={"data": {
        "type": "appScreenshots",
        "attributes": {"fileName": os.path.basename(path), "fileSize": len(data)},
        "relationships": {"appScreenshotSet": {
            "data": {"type": "appScreenshotSets", "id": set_id}}}}})["data"]
    for op in shot["attributes"]["uploadOperations"]:
        chunk = data[op["offset"]:op["offset"] + op["length"]]
        req = urllib.request.Request(op["url"], data=chunk, method=op["method"])
        for h in op.get("requestHeaders", []):
            req.add_header(h["name"], h["value"])
        with urllib.request.urlopen(req, timeout=120):
            pass
    api.call("PATCH", f"/appScreenshots/{shot['id']}", body={"data": {
        "type": "appScreenshots", "id": shot["id"],
        "attributes": {"uploaded": True,
                       "sourceFileChecksum": hashlib.md5(data).hexdigest()}}})


def upload_screenshots(api, version, wanted):
    root = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")
    locs = {l["attributes"]["locale"]: l for l in api.call(
        "GET", f"/appStoreVersions/{version['id']}/appStoreVersionLocalizations",
        query={"limit": "50"})["data"]}
    for locale, types in wanted.items():
        loc = locs[locale]
        sets = {st["attributes"]["screenshotDisplayType"]: st for st in api.call(
            "GET", f"/appStoreVersionLocalizations/{loc['id']}/appScreenshotSets")["data"]}
        for display_type, files in types.items():
            st = sets.get(display_type) or api.call("POST", "/appScreenshotSets", body={"data": {
                "type": "appScreenshotSets",
                "attributes": {"screenshotDisplayType": display_type},
                "relationships": {"appStoreVersionLocalization": {"data": {
                    "type": "appStoreVersionLocalizations", "id": loc["id"]}}}}})["data"]
            have = api.call("GET", f"/appScreenshotSets/{st['id']}/appScreenshots")["data"]
            if have:
                print(f"{locale} {display_type}: already has {len(have)} screenshots, kept")
                continue
            for name in files:
                upload_one(api, st["id"], os.path.join(root, name))
            print(f"{locale} {display_type}: uploaded {len(files)} screenshots")


def main():
    mode = sys.argv[1] if len(sys.argv) > 1 else "plan"
    apply = mode == "apply"
    env = os.environ
    api = Api(env["ASC_API_KEY_ID"], env["ASC_API_ISSUER_ID"], env["ASC_API_PRIVATE_KEY_PATH"])
    with open(os.path.join(os.path.dirname(__file__), "store_page.json"), encoding="utf-8") as f:
        pages = json.load(f)

    app = api.call("GET", "/apps", query={"filter[bundleId]": env["IOS_BUNDLE_ID"]})["data"][0]
    versions = api.call("GET", f"/apps/{app['id']}/appStoreVersions", query={"limit": "10"})["data"]
    version = next((v for v in versions if state(v) not in LIVE), None)
    if version:
        print(f"Editable version: {version['attributes']['versionString']} ({state(version)})")
    elif apply:
        version = api.call("POST", "/appStoreVersions", body={"data": {
            "type": "appStoreVersions",
            "attributes": {"platform": "IOS", "versionString": VERSION,
                           "releaseType": "AFTER_APPROVAL"},
            "relationships": {"app": {"data": {"type": "apps", "id": app["id"]}}}}})["data"]
        print(f"Created draft version {VERSION}")
    else:
        print(f"Would create draft version {VERSION}")
        version = None

    # Version text
    existing = {}
    if version:
        for loc in api.call("GET", f"/appStoreVersions/{version['id']}/appStoreVersionLocalizations",
                            query={"limit": "50"})["data"]:
            existing[loc["attributes"]["locale"]] = loc
    # Support and marketing URLs come from the newest live version's first locale.
    live = next((v for v in versions if state(v) in LIVE), None)
    live_locs = api.call("GET", f"/appStoreVersions/{live['id']}/appStoreVersionLocalizations",
                         query={"limit": "50"})["data"] if live else []
    primary = live_locs[0] if live_locs else next(iter(existing.values()), None)
    urls = {k: primary["attributes"][k] for k in ("supportUrl", "marketingUrl")
            if primary and primary["attributes"].get(k)}
    screenshots = pages.pop("_screenshots", {})
    for locale, page in pages.items():
        attrs = {k: page[k] for k in VERSION_FIELDS if k in page}
        if locale in existing:
            print(f"{locale}: {'update' if apply else 'would update'} {', '.join(attrs)}")
            if apply:
                loc = existing[locale]
                api.call("PATCH", f"/appStoreVersionLocalizations/{loc['id']}", body={"data": {
                    "type": "appStoreVersionLocalizations", "id": loc["id"], "attributes": attrs}})
        else:
            print(f"{locale}: {'create' if apply else 'would create'} (urls: {sorted(urls)})")
            if apply:
                api.call("POST", "/appStoreVersionLocalizations", body={"data": {
                    "type": "appStoreVersionLocalizations",
                    "attributes": {"locale": locale, **attrs, **urls},
                    "relationships": {"appStoreVersion": {
                        "data": {"type": "appStoreVersions", "id": version["id"]}}}}})

    # App name and subtitle (per locale)
    infos = api.call("GET", f"/apps/{app['id']}/appInfos")["data"]
    # Only the info that belongs to the editable version can change.
    infos = [i for i in infos
             if (i["attributes"].get("state") or i["attributes"].get("appStoreState")) not in LIVE]
    if not infos:
        print("No editable app info yet; name and subtitle were not changed.")
    for info in infos:
        locs = {l["attributes"]["locale"]: l for l in api.call(
            "GET", f"/appInfos/{info['id']}/appInfoLocalizations", query={"limit": "50"})["data"]}
        for locale, page in pages.items():
            attrs = {k: page[k] for k in INFO_FIELDS if k in page}
            if locale in locs:
                if all(locs[locale]["attributes"].get(k) == v for k, v in attrs.items()):
                    continue
                print(f"app info {locale}: {'update' if apply else 'would update'} {attrs}")
                if apply:
                    api.call("PATCH", f"/appInfoLocalizations/{locs[locale]['id']}", body={"data": {
                        "type": "appInfoLocalizations", "id": locs[locale]["id"], "attributes": attrs}})
            else:
                print(f"app info {locale}: {'create' if apply else 'would create'} {attrs}")
                if apply:
                    api.call("POST", "/appInfoLocalizations", body={"data": {
                        "type": "appInfoLocalizations", "attributes": {"locale": locale, **attrs},
                        "relationships": {"appInfo": {"data": {"type": "appInfos", "id": info["id"]}}}}})
    if version and apply and screenshots:
        upload_screenshots(api, version, screenshots)
    if version:
        print("\nScreenshots in this version:")
        for loc in api.call("GET", f"/appStoreVersions/{version['id']}/appStoreVersionLocalizations",
                            query={"limit": "50"})["data"]:
            sets = api.call("GET", f"/appStoreVersionLocalizations/{loc['id']}/appScreenshotSets")["data"]
            if not sets:
                print(f"  {loc['attributes']['locale']}: none")
            for st in sets:
                shots = api.call("GET", f"/appScreenshotSets/{st['id']}/appScreenshots")["data"]
                print(f"  {loc['attributes']['locale']}: {st['attributes']['screenshotDisplayType']} x{len(shots)}")
    print("Done." if apply else "Plan only; nothing changed.")


if __name__ == "__main__":
    main()
