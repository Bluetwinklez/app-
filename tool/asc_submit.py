#!/usr/bin/env python3
"""Attaches the newest processed build to the editable App Store version and
(with SUBMIT=1) sends the version to App Review.

Waits up to WAIT_MINUTES (default 45) for the build to finish processing.
"""
import os
import sys
import time

sys.path.insert(0, os.path.dirname(__file__))
from asc_provision import Api  # noqa: E402
from asc_store_page import LIVE, state  # noqa: E402


def newest_valid_build(api, app_id, version_string, wait_minutes, minimum=0):
    deadline = time.time() + wait_minutes * 60
    while True:
        builds = api.call("GET", "/builds", query={
            "filter[app]": app_id, "filter[preReleaseVersion.version]": version_string,
            "sort": "-uploadedDate", "limit": "5"})["data"]
        for b in builds:
            a = b["attributes"]
            print(f"  build {a.get('version')}: {a.get('processingState')}"
                  f"{' (expired)' if a.get('expired') else ''}")
        valid = next((b for b in builds if b["attributes"].get("processingState") == "VALID"
                      and not b["attributes"].get("expired")
                      and int(b["attributes"].get("version") or 0) >= minimum), None)
        if valid:
            return valid
        if time.time() > deadline:
            raise SystemExit("::error::No processed build arrived in time")
        time.sleep(60)


def main():
    env = os.environ
    api = Api(env["ASC_API_KEY_ID"], env["ASC_API_ISSUER_ID"], env["ASC_API_PRIVATE_KEY_PATH"])
    app = api.call("GET", "/apps", query={"filter[bundleId]": env["IOS_BUNDLE_ID"]})["data"][0]
    versions = api.call("GET", f"/apps/{app['id']}/appStoreVersions", query={"limit": "10"})["data"]
    version = next((v for v in versions if state(v) not in LIVE), None)
    if not version:
        raise SystemExit("::error::No editable version")
    vs = version["attributes"]["versionString"]
    print(f"Version {vs} ({state(version)})")

    build = newest_valid_build(api, app["id"], vs, int(env.get("WAIT_MINUTES", "45")),
                             int(env.get("MIN_BUILD") or 0))
    print(f"Using build {build['attributes']['version']}")
    api.call("PATCH", f"/appStoreVersions/{version['id']}/relationships/build",
             body={"data": {"type": "builds", "id": build["id"]}})

    # App Review contact details: reuse the ones from the live version.
    detail = api.call("GET", f"/appStoreVersions/{version['id']}/appStoreReviewDetail").get("data")
    if not detail:
        live = next((v for v in versions if state(v) in LIVE), None)
        old = api.call("GET", f"/appStoreVersions/{live['id']}/appStoreReviewDetail").get("data") if live else None
        if old:
            keep = {k: v for k, v in old["attributes"].items() if v is not None}
            api.call("POST", "/appStoreReviewDetails", body={"data": {
                "type": "appStoreReviewDetails", "attributes": keep,
                "relationships": {"appStoreVersion": {
                    "data": {"type": "appStoreVersions", "id": version["id"]}}}}})
            print("Copied App Review contact details from the live version")
        else:
            print("::warning::No App Review details found; add them in App Store Connect")

    if env.get("SUBMIT") != "1":
        print("Build attached. Not submitted (SUBMIT is not 1).")
        return
    sub = api.call("POST", "/reviewSubmissions", body={"data": {
        "type": "reviewSubmissions", "attributes": {"platform": "IOS"},
        "relationships": {"app": {"data": {"type": "apps", "id": app["id"]}}}}})["data"]
    api.call("POST", "/reviewSubmissionItems", body={"data": {
        "type": "reviewSubmissionItems",
        "relationships": {
            "reviewSubmission": {"data": {"type": "reviewSubmissions", "id": sub["id"]}},
            "appStoreVersion": {"data": {"type": "appStoreVersions", "id": version["id"]}}}}})
    done = api.call("PATCH", f"/reviewSubmissions/{sub['id']}", body={"data": {
        "type": "reviewSubmissions", "id": sub["id"], "attributes": {"submitted": True}}})
    print(f"Submitted for review: {done['data']['attributes'].get('state')}")


if __name__ == "__main__":
    main()
