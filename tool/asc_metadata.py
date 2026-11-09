#!/usr/bin/env python3
"""Shows or updates the App Store text of the version that is being edited.

  asc_metadata.py show          print description, keywords and promo text
  asc_metadata.py fix FILE      apply {locale: {field: text}} from a JSON file

Only the version that is not yet live (prepare / rejected) is touched.
"""
import json
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))
from asc_provision import Api  # noqa: E402

FIELDS = ("description", "keywords", "promotionalText", "whatsNew")
LIVE = {"READY_FOR_SALE", "READY_FOR_DISTRIBUTION", "REPLACED_WITH_NEW_VERSION",
        "REMOVED_FROM_SALE", "DEVELOPER_REMOVED_FROM_SALE"}


def editable_version(api, bundle_id):
    apps = api.call("GET", "/apps", query={"filter[bundleId]": bundle_id})["data"]
    if not apps:
        raise SystemExit("::error::App not found")
    versions = api.call("GET", f"/apps/{apps[0]['id']}/appStoreVersions",
                        query={"limit": "10"})["data"]
    for v in versions:
        a = v["attributes"]
        if (a.get("appVersionState") or a.get("appStoreState")) not in LIVE:
            return v
    return None


def show_all(api, bundle_id):
    """Every version with its state, and the text of the newest one (live or not)."""
    app = api.call("GET", "/apps", query={"filter[bundleId]": bundle_id})["data"][0]
    print(f"App name in App Store Connect: {app['attributes'].get('name')}")
    versions = api.call("GET", f"/apps/{app['id']}/appStoreVersions",
                        query={"limit": "10"})["data"]
    for v in versions:
        a = v["attributes"]
        print(f"  {a['versionString']}: {a.get('appVersionState') or a.get('appStoreState')}")
    newest = versions[0]
    infos = api.call("GET", f"/apps/{app['id']}/appInfos")["data"]
    for info in infos:
        for loc in api.call("GET", f"/appInfos/{info['id']}/appInfoLocalizations",
                            query={"limit": "50"})["data"]:
            a = loc["attributes"]
            print(f"\n== app info {a['locale']}: name={a.get('name')!r} subtitle={a.get('subtitle')!r}")
    for loc in api.call("GET", f"/appStoreVersions/{newest['id']}/appStoreVersionLocalizations",
                        query={"limit": "50"})["data"]:
        a = loc["attributes"]
        print(f"\n===== {newest['attributes']['versionString']} {a['locale']} =====")
        for field in FIELDS:
            if a.get(field):
                print(f"--- {field}\n{a[field]}")


def main():
    env = os.environ
    api = Api(env["ASC_API_KEY_ID"], env["ASC_API_ISSUER_ID"], env["ASC_API_PRIVATE_KEY_PATH"])
    if len(sys.argv) > 1 and sys.argv[1] == "all":
        show_all(api, env["IOS_BUNDLE_ID"])
        return
    version = editable_version(api, env["IOS_BUNDLE_ID"])
    mode = sys.argv[1] if len(sys.argv) > 1 else "show"
    if version is None:
        # Every version is live: there is nothing to show or change until
        # a new version is created in App Store Connect.
        if mode == "fix":
            raise SystemExit("::error::No editable version; create a new version first")
        print("No version is being edited (all versions are live).")
        return
    print(f"Version {version['attributes']['versionString']} "
          f"({version['attributes'].get('appVersionState')})")
    locs = api.call("GET", f"/appStoreVersions/{version['id']}/appStoreVersionLocalizations",
                    query={"limit": "50"})["data"]
    if mode == "show":
        for loc in locs:
            a = loc["attributes"]
            print(f"\n===== {a['locale']} =====")
            for field in FIELDS:
                if a.get(field):
                    print(f"--- {field}\n{a[field]}")
        return
    with open(sys.argv[2], encoding="utf-8") as f:
        changes = json.load(f)
    for loc in locs:
        locale = loc["attributes"]["locale"]
        attrs = changes.get(locale) or changes.get(locale.split("-")[0])
        if not attrs:
            print(f"{locale}: no change")
            continue
        api.call("PATCH", f"/appStoreVersionLocalizations/{loc['id']}", body={
            "data": {"type": "appStoreVersionLocalizations", "id": loc["id"],
                     "attributes": attrs}})
        print(f"{locale}: updated {', '.join(attrs)}")


if __name__ == "__main__":
    main()
