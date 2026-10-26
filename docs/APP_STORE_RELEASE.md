# App Store Release Guide — NFC Tools: Read & Write

## Store metadata

The complete, English-language copy for App Store and Google Play is maintained in [STORE_LISTING.md](STORE_LISTING.md). Use that document for the app name, subtitle, keywords, promotional text, long description, release notes and screenshot captions.

The iOS and Android application interfaces support 14 languages. Preparing English store copy does not automatically change storefront localizations or in-app translations.

## Listing information

| Field | Intended value |
|---|---|
| App name | NFC Tools: Read & Write |
| Primary category | Utilities |
| Suggested secondary category | Productivity |
| Privacy policy | https://github.com/Bluetwinklez/app-/blob/main/docs/PRIVACY.md |
| Support | https://github.com/Bluetwinklez/app- |
| Copyright | 2026 Bluetwinklez |
| Pricing | Free — confirm in App Store Connect |
| Minimum iOS | 16.0 |
| Age rating | Complete Apple's current age-rating questionnaire accurately; do not assume a specific rating |

## Before publishing

1. Build and test the release candidate. CI analysis and unit tests do not certify actual NFC behavior.
2. Run physical iPhone NFC tests with compatible writable and read-only tags. Check reads, writes, verification, cancelled scans, unsupported tags, storage recovery, lock confirmations, QR scanning and platform-specific extensions.
3. Verify screenshot captures from the shipping build in `docs/store_screenshots/` on the required device sizes. Update any captures that show outdated UI or branding.
4. Review the actual data flows, network calls, third-party SDK behavior and Apple's current App Privacy definitions before completing the privacy questionnaire. Maps, geocoding, sharing and optional iCloud features can involve external services.
5. Review encryption/export-compliance responses against the shipped binary, its encryption features and Apple's current requirements.
6. In App Store Connect, edit the appropriate version/localization, paste the English listing fields from `STORE_LISTING.md`, select the correct build, and enter reviewer contact details and review notes.
7. Submit for Apple's review. Publishing happens only after Apple approves the submitted changes and the selected release option takes effect.

## App Review Notes

See the full review notes in [STORE_LISTING.md](STORE_LISTING.md). NFC Tools: Read & Write does not require an account. Reviewers can explore the tag library, templates, composer previews and several tools without physical NFC hardware; actual NFC read/write requires compatible tags and a supported device.

## Distribution and verification

Store copy in GitHub is a draft source, not a live App Store Connect update. Do not report an App Store rename or release as complete until verified on the public storefront. TestFlight uploads require valid Apple credentials, signing assets, provisioning and successful upload workflows; an unsigned iOS compile check alone is not sufficient.

Use the existing TestFlight setup documentation for credentials and submission steps, and document the exact build number and App Store Connect status in the release notes.
