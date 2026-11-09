#!/usr/bin/env python3
"""Uploads one Apple Watch screenshot to every locale of the editable version."""
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(__file__))
from asc_provision import Api  # noqa: E402
from asc_store_page import LIVE, state, upload_one  # noqa: E402

TYPES = {(410, 502): "APP_WATCH_ULTRA", (422, 514): "APP_WATCH_ULTRA", (416, 496): "APP_WATCH_SERIES_10",
         (396, 484): "APP_WATCH_SERIES_7", (368, 448): "APP_WATCH_SERIES_4",
         (312, 390): "APP_WATCH_SERIES_3"}


def main():
    path = sys.argv[1]
    with open(path, "rb") as f:
        head = f.read(24)
    size = struct.unpack(">II", head[16:24])
    display_type = TYPES.get(size)
    print(f"Screenshot {size[0]}x{size[1]} -> {display_type}")
    if not display_type:
        raise SystemExit("::error::Size is not an accepted Apple Watch screenshot size")
    env = os.environ
    api = Api(env["ASC_API_KEY_ID"], env["ASC_API_ISSUER_ID"], env["ASC_API_PRIVATE_KEY_PATH"])
    app = api.call("GET", "/apps", query={"filter[bundleId]": env["IOS_BUNDLE_ID"]})["data"][0]
    versions = api.call("GET", f"/apps/{app['id']}/appStoreVersions", query={"limit": "10"})["data"]
    version = next(v for v in versions if state(v) not in LIVE)
    for loc in api.call("GET", f"/appStoreVersions/{version['id']}/appStoreVersionLocalizations",
                        query={"limit": "50"})["data"]:
        locale = loc["attributes"]["locale"]
        sets = {s["attributes"]["screenshotDisplayType"]: s for s in api.call(
            "GET", f"/appStoreVersionLocalizations/{loc['id']}/appScreenshotSets")["data"]}
        st = sets.get(display_type) or api.call("POST", "/appScreenshotSets", body={"data": {
            "type": "appScreenshotSets", "attributes": {"screenshotDisplayType": display_type},
            "relationships": {"appStoreVersionLocalization": {"data": {
                "type": "appStoreVersionLocalizations", "id": loc["id"]}}}}})["data"]
        if api.call("GET", f"/appScreenshotSets/{st['id']}/appScreenshots")["data"]:
            print(f"{locale}: already has Watch screenshots, kept")
            continue
        upload_one(api, st["id"], path)
        print(f"{locale}: uploaded the Watch screenshot")


if __name__ == "__main__":
    main()
