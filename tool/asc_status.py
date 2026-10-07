#!/usr/bin/env python3
"""Prints the App Store review / release state of the app (read-only)."""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))
from asc_provision import Api  # noqa: E402


def main():
    env = os.environ
    api = Api(env["ASC_API_KEY_ID"], env["ASC_API_ISSUER_ID"], env["ASC_API_PRIVATE_KEY_PATH"])
    apps = api.call("GET", "/apps", query={"filter[bundleId]": env["IOS_BUNDLE_ID"]})
    for app in apps.get("data", []):
        print(f"App: {app['attributes'].get('name')}")
        versions = api.call("GET", f"/apps/{app['id']}/appStoreVersions",
                            query={"limit": "5"})
        for v in versions.get("data", []):
            a = v["attributes"]
            state = a.get("appVersionState") or a.get("appStoreState")
            print(f"  Version {a.get('versionString')}: {state} (created {a.get('createdDate', '')[:10]})")
        subs = api.call("GET", "/reviewSubmissions",
                        query={"filter[app]": app["id"], "limit": "5"})
        for s in subs.get("data", []):
            a = s["attributes"]
            print(f"  Review submission: {a.get('state')} (submitted {str(a.get('submittedDate', ''))[:16]})")


if __name__ == "__main__":
    main()
