#!/bin/bash
# Installs the release APK, opens the app and checks it is still running.
set -u
PKG=com.bluetwinklez.nfctagmaster
adb install -r build/app/outputs/flutter-apk/app-release.apk
adb logcat -c
adb shell monkey -p "$PKG" -c android.intent.category.LAUNCHER 1
sleep 25
adb exec-out screencap -p > launch.png
adb logcat -d > logcat.txt
if adb shell pidof "$PKG" >/dev/null; then
  echo "App is running"
  grep -E "FATAL EXCEPTION|AndroidRuntime" logcat.txt && exit 1
  exit 0
fi
echo "::error::App is not running after launch"
grep -A 30 -E "FATAL EXCEPTION|AndroidRuntime|flutter.*Error" logcat.txt | head -80
exit 1
