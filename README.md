# KodiTaxLedger

Offline-first business ledger and configurable tax-reserve planner. Go/TinyGo WebAssembly owns validation, progressive tax estimates, net cash flow and safe-to-spend calculations. React is the presentation shell; Dexie stores records locally.

## Run
Requires Node 20+, Go 1.22+ and TinyGo 0.34+.

- npm install
- npm run dev
- npm run test:go
- npm run build

## Android
Run npm run build:android after installing Android Studio and the Android SDK. The GitHub Android workflow builds a debug APK. Configure your own signing key for production distribution.

## Tax notice
Default brackets are illustrative placeholders, not official KRA tax rates. This tool is not tax advice, a tax return, or an official KRA computation. Confirm tax year, thresholds, deductibility, VAT, PAYE, withholding and other obligations with a qualified Kenyan tax professional.

## Privacy
Transactions and settings are stored in local IndexedDB. No cloud sync or remote accounting service is included. Export backups regularly; clearing app data deletes local records.
