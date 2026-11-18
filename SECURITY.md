# Security policy

## Supported versions

Security fixes are developed against the current maintained code on `main`. Older app builds may not receive fixes; upgrade to a current, verified release when one is available.

## Reporting a vulnerability

**Do not disclose exploitable details, credentials, private NFC tag contents or personal data in a public issue.**

Use [GitHub private vulnerability reporting](https://github.com/Bluetwinklez/app-/security/advisories/new) if it is enabled for this repository. If that option is unavailable, open a general issue requesting a private reporting channel **without describing the exploit or posting sensitive data**. Never attach real backups, access tokens or NFC tag dumps.

Please include affected app version, operating system, reproduction steps using synthetic data, observed impact and a proposed mitigation when possible. Do not test against devices, tags, accounts or systems you do not control.

## NFC and backup precautions

- NFC tag locking and formatting can be irreversible; test only on disposable tags that you own.
- Exported backups and tag contents can contain credentials, Wi-Fi passwords, contact information or URLs. Keep them encrypted and avoid attaching real data to reports.
- The iOS and Android NFC APIs have different capabilities. A successful simulator test is not hardware verification.
- Review GitHub Actions and dependency-update pull requests before merging; security scans and automated checks do not replace device testing.

See [README.md](README.md) for current supported operations and [docs/PRIVACY.md](docs/PRIVACY.md) for data-handling information.
