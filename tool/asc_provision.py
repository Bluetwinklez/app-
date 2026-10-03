#!/usr/bin/env python3
"""Creates the App Store signing setup for every iOS target, unattended.

Runs on the TestFlight runner with the App Store Connect API key. For each
target it makes sure the bundle ID exists with the capabilities it needs,
then creates a fresh App Store provisioning profile signed by the
distribution certificate from the P12 and installs it, so the developer
never has to open the Apple Developer website.

Environment:
  ASC_API_KEY_ID, ASC_API_ISSUER_ID, ASC_API_PRIVATE_KEY_PATH
  IOS_BUNDLE_ID          main app bundle ID
  CERT_SERIAL            serial number of the distribution certificate (hex)
  PROFILE_DIR            where to install the profiles (several may be
                         given, separated by ':')
  DRY_RUN=1              only report what exists, change nothing
"""

import base64
import json
import os
import plistlib
import subprocess
import sys
import tempfile
import time
import urllib.error
import urllib.parse
import urllib.request

import jwt  # PyJWT

API = "https://api.appstoreconnect.apple.com/v1"
OPTIONAL = {"ICLOUD"}


def targets(main_id):
    """Bundle ID, display name, profile name and capabilities per target."""
    return [
        {
            "identifier": main_id,
            "name": "NFC Tag Master",
            "profile": "NFCTM CI App",
            "capabilities": [
                ("NFC_TAG_READING", None),
                ("ICLOUD", [{"key": "ICLOUD_VERSION",
                             "options": [{"key": "XCODE_6"}]}]),
            ],
        },
        {
            "identifier": main_id + ".widgets",
            "name": "NFC Tag Master Widgets",
            "profile": "NFCTM CI Widgets",
            "capabilities": [],
        },
        {
            "identifier": main_id + ".watchkitapp",
            "name": "NFC Tag Master Watch",
            "profile": "NFCTM CI Watch",
            "capabilities": [],
        },
    ]


class Api:
    def __init__(self, key_id, issuer, key_path):
        self.key_id = key_id
        self.issuer = issuer
        with open(key_path, "r", encoding="utf-8") as f:
            self.key = f.read()

    def _token(self):
        now = int(time.time())
        return jwt.encode(
            {"iss": self.issuer, "iat": now, "exp": now + 900,
             "aud": "appstoreconnect-v1"},
            self.key, algorithm="ES256",
            headers={"kid": self.key_id, "typ": "JWT"})

    def call(self, method, path, body=None, query=None, allow_forbidden=False):
        url = API + path
        if query:
            url += "?" + urllib.parse.urlencode(query)
        data = json.dumps(body).encode() if body is not None else None
        req = urllib.request.Request(url, data=data, method=method)
        req.add_header("Authorization", "Bearer " + self._token())
        if data is not None:
            req.add_header("Content-Type", "application/json")
        try:
            with urllib.request.urlopen(req, timeout=60) as resp:
                raw = resp.read()
                return json.loads(raw) if raw else {}
        except urllib.error.HTTPError as e:
            detail = e.read().decode(errors="replace")
            if e.code == 403 and allow_forbidden:
                print(f"::warning::{method} {path} is not allowed for this API key")
                return None
            raise SystemExit(
                f"::error::App Store Connect {method} {path} failed "
                f"({e.code}): {detail}")


def find_bundle(api, identifier):
    res = api.call("GET", "/bundleIds",
                   query={"filter[identifier]": identifier, "limit": "200"})
    for item in res.get("data", []):
        if item["attributes"]["identifier"] == identifier:
            return item
    return None


def ensure_bundle(api, target, dry):
    item = find_bundle(api, target["identifier"])
    if item:
        print(f"Bundle ID {target['identifier']} exists")
        return item["id"]
    if dry:
        print(f"Bundle ID {target['identifier']} would be created")
        return None
    res = api.call("POST", "/bundleIds", {"data": {
        "type": "bundleIds",
        "attributes": {"identifier": target["identifier"],
                       "name": target["name"], "platform": "IOS"}}})
    print(f"Created bundle ID {target['identifier']}")
    return res["data"]["id"]


def ensure_capabilities(api, bundle_id, target, dry):
    """Enables what it can; returns the capabilities that are on."""
    if not target["capabilities"]:
        return set()
    present = set()
    if bundle_id:
        res = api.call("GET", f"/bundleIds/{bundle_id}/bundleIdCapabilities")
        present = {c["attributes"]["capabilityType"]
                   for c in res.get("data", [])}
    for cap, settings in target["capabilities"]:
        if cap in present:
            print(f"  {cap} already enabled")
            continue
        if dry:
            print(f"  {cap} would be enabled")
            continue
        attributes = {"capabilityType": cap}
        if settings:
            attributes["settings"] = settings
        # Optional capabilities (iCloud) need an Admin key; without one the
        # app is built without them.
        res = api.call("POST", "/bundleIdCapabilities", {"data": {
            "type": "bundleIdCapabilities",
            "attributes": attributes,
            "relationships": {"bundleId": {"data": {
                "type": "bundleIds", "id": bundle_id}}}}},
            allow_forbidden=(cap in OPTIONAL))
        if res is None:
            print(f"  {cap} left off")
            continue
        present.add(cap)
        print(f"  enabled {cap}")
    return present


def find_certificate(api, serial):
    want = serial.upper().lstrip("0")
    res = api.call("GET", "/certificates", query={"limit": "200"})
    for item in res.get("data", []):
        attrs = item["attributes"]
        if attrs.get("certificateType") not in (
                "DISTRIBUTION", "IOS_DISTRIBUTION"):
            continue
        if (attrs.get("serialNumber") or "").upper().lstrip("0") == want:
            return item["id"]
    raise SystemExit(
        "::error::The distribution certificate in the P12 was not found in "
        "the Apple Developer account")


def recreate_profile(api, bundle_id, cert_id, target, dirs):
    res = api.call("GET", "/profiles",
                   query={"filter[name]": target["profile"], "limit": "200"})
    for item in res.get("data", []):
        if item["attributes"]["name"] == target["profile"]:
            api.call("DELETE", f"/profiles/{item['id']}")
            print(f"  removed old profile {target['profile']}")
    res = api.call("POST", "/profiles", {"data": {
        "type": "profiles",
        "attributes": {"name": target["profile"],
                       "profileType": "IOS_APP_STORE"},
        "relationships": {
            "bundleId": {"data": {"type": "bundleIds", "id": bundle_id}},
            "certificates": {"data": [
                {"type": "certificates", "id": cert_id}]}}}})
    content = base64.b64decode(res["data"]["attributes"]["profileContent"])
    uuid = res["data"]["attributes"]["uuid"]
    for d in dirs:
        os.makedirs(d, exist_ok=True)
        with open(os.path.join(d, uuid + ".mobileprovision"), "wb") as f:
            f.write(content)
    print(f"  installed profile {target['profile']} ({uuid})")
    return content


def entitlements_of(profile_bytes):
    with tempfile.NamedTemporaryFile(suffix=".mobileprovision") as f:
        f.write(profile_bytes)
        f.flush()
        out = subprocess.run(["security", "cms", "-D", "-i", f.name],
                             check=True, capture_output=True).stdout
    return plistlib.loads(out).get("Entitlements", {})


def main():
    env = os.environ
    dry = env.get("DRY_RUN") == "1"
    api = Api(env["ASC_API_KEY_ID"], env["ASC_API_ISSUER_ID"],
              env["ASC_API_PRIVATE_KEY_PATH"])
    dirs = [d for d in env.get("PROFILE_DIR", "").split(":") if d]
    cert_id = None if dry else find_certificate(api, env["CERT_SERIAL"])
    for target in targets(env["IOS_BUNDLE_ID"]):
        bundle_id = ensure_bundle(api, target, dry)
        enabled = ensure_capabilities(api, bundle_id, target, dry)
        if dry:
            continue
        content = recreate_profile(api, bundle_id, cert_id, target, dirs)
        ents = entitlements_of(content)
        if "NFC_TAG_READING" in enabled and \
                "com.apple.developer.nfc.readersession.formats" not in ents:
            raise SystemExit("::error::App profile lacks NFC tag reading")
        if target["identifier"] == env["IOS_BUNDLE_ID"]:
            icloud = "com.apple.developer.ubiquity-kvstore-identifier" in ents
            print(f"iCloud backup {'on' if icloud else 'off'}")
            if env.get("GITHUB_ENV"):
                with open(env["GITHUB_ENV"], "a", encoding="utf-8") as f:
                    f.write(f"ICLOUD_ENABLED={1 if icloud else 0}\n")
    print("Signing setup complete")


if __name__ == "__main__":
    sys.exit(main())
