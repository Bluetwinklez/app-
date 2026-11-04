# Release risk audit — 2026-10-22

This document separates verified repository facts from checks that require external credentials or real devices.

## Confirmed repository observations
- Flutter application version in pubspec.yaml: 1.6.0+1.
- CI runs localization generation, static analysis and unit/widget tests.
- App Store subtitles exist in docs/STORE_LISTING.md; this does **not** establish that they are configured in App Store Connect.
- The privacy policy documents optional iCloud, OpenStreetMap tiles and platform geocoding; marketing claims that *everything* stays on-device need these exceptions.
- The release guide currently makes categorical statements about App Privacy and export compliance. These must be verified against Apple's current definitions and the actual binary before submission.
- A real-device NFC acceptance pass remains necessary; automated Flutter tests do not emulate Core NFC / Android NFC hardware.

## Required release gates
1. Confirm the US English localization in App Store Connect has a subtitle (maximum 30 characters); compare against the live storefront after approval.
2. Run flutter pub get, flutter gen-l10n, flutter analyze, flutter test and both platform builds; record commit SHA and results.
3. Test NTAG213, NTAG215 and NTAG216 on physical supported iPhone and Android devices, including cancellation, tag removal, capacity overflow, read-back verification, read-only tags and destructive lock confirmation.
4. Review App Privacy disclosures against actual network requests, third-party services and current Apple policy. Avoid asserting zero data collection solely from the absence of a proprietary server.
5. Review export-compliance questionnaire and ITSAppUsesNonExemptEncryption with an appropriately qualified reviewer; AES usage alone is not sufficient to determine the answer.
6. Confirm the displayed feature list matches the shipping binary (widgets, Control Center, Apple Watch, iCloud) in each supported OS version.
7. Validate localizations and accessibility with large text, VoiceOver/TalkBack and RTL layout.
8. Obtain backups and test recovery before changing storage formats.

## Suggested engineering follow-ups
- Guard NFC controller operations against overlapping scans and writes; test concurrent calls and cancellation races.
- Add method-channel contract tests for malformed responses and native exceptions.
- Add explicit UI warning when read-back verification is disabled in compatibility mode.
- Capture CI artifacts and test reports; enforce release gates on protected branches.
- Add a lightweight store-metadata checklist for every locale.

No performance, crash-free or ASO ranking improvement is claimed without measurement.
