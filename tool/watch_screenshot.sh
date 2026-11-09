#!/bin/bash
# Builds the Watch app for the simulator, fills it with sample data and
# saves a screenshot to build/watch/watch.png.
set -euo pipefail
cd "$(dirname "$0")/.."
BUNDLE=com.bluetwinklez.nfctagmaster.watchkitapp
OUT="$PWD/build/watch"
mkdir -p "$OUT"

echo "== Available watch simulators"
xcrun simctl list devices available | grep -i "watch" || true
xcrun simctl list runtimes | grep -i watch || true

xcodebuild -project ios/Runner.xcodeproj -target NfcWatch -configuration Release \
  -sdk watchsimulator ARCHS=arm64 ONLY_ACTIVE_ARCH=YES \
  CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO \
  CONFIGURATION_BUILD_DIR="$OUT/products" build | tail -5
APP="$OUT/products/NfcWatch.app"
test -d "$APP"

pick() { xcrun simctl list devices available | grep -E "$1" | head -1 | grep -oE '[0-9A-F]{8}(-[0-9A-F]{4}){3}-[0-9A-F]{12}' || true; }
UDID="$(pick 'Apple Watch Ultra')"
[ -n "$UDID" ] || UDID="$(pick 'Apple Watch Series 1[0-9]')"
[ -n "$UDID" ] || UDID="$(pick 'Apple Watch')"
if [ -z "$UDID" ]; then
  RUNTIME="$(xcrun simctl list runtimes | grep -i 'watchOS' | tail -1 | grep -oE 'com\.apple\.CoreSimulator\.SimRuntime\.[A-Za-z0-9-]+')"
  TYPE="$(xcrun simctl list devicetypes | grep -i 'Apple Watch Ultra' | tail -1 | grep -oE 'com\.apple\.CoreSimulator\.SimDeviceType\.[A-Za-z0-9-]+')"
  UDID="$(xcrun simctl create 'Shot Watch' "$TYPE" "$RUNTIME")"
fi
echo "Using simulator $UDID"
xcrun simctl boot "$UDID" || true
xcrun simctl bootstatus "$UDID" -b
xcrun simctl install "$UDID" "$APP"

python3 - "$OUT/seed.plist" <<'PY'
import plistlib, sys, time
now = time.time()
ctx = {
  "sentAt": now,
  "books": [
    {"id": "1", "name": "Medication", "kind": "medication", "today": 2, "last": now - 3600},
    {"id": "2", "name": "Water habit", "kind": "habit", "today": 5, "last": now - 1800},
    {"id": "3", "name": "Visitors", "kind": "visitors", "today": 1, "last": now - 7200},
  ],
  "scans": [
    {"title": "Guest Wi-Fi", "uid": "04:A1:B2:C3:D4:E5:F6", "at": now - 300},
    {"title": "Business card", "uid": "04:A1:B2:C3:D4:E5:F7", "at": now - 5400},
    {"title": "Pet tag: Luna", "uid": "04:A1:B2:C3:D4:E5:F8", "at": now - 86400},
  ],
}
plistlib.dump({"context": ctx}, open(sys.argv[1], "wb"))
PY
xcrun simctl spawn "$UDID" defaults import "$BUNDLE" "$OUT/seed.plist"
xcrun simctl launch "$UDID" "$BUNDLE"
sleep 12
xcrun simctl io "$UDID" screenshot "$OUT/watch.png"
file "$OUT/watch.png"
