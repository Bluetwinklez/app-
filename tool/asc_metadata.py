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


def main():
    env = os.environ
    api = Api(env["ASC_API_KEY_ID"], env["ASC_API_ISSUER_ID"], env["ASC_API_PRIVATE_KEY_PATH"])
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
