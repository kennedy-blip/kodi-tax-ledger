# KodiTaxLedger

Offline-first cash-flow, deductible-expense and configurable tax-reserve workspace. Domain calculations live in Go and are exposed to the React shell through TinyGo WebAssembly.

## Requirements
- Node.js 20+
- Go 1.22+ for native tests
- TinyGo 0.34+ for the browser WASM build
- Android Studio / Android SDK for local APK packaging

## Quick start
```bash
npm install
npm run dev
```

Build the Go engine and web app:
```bash
npm run build:wasm
npm run build
```

Run native engine tests: `cd go-core && go test ./...`

## Android
```bash
npm run build:android
npx cap open android
```
The APK workflow builds a signed-by-GitHub unsigned debug APK and attaches it to a GitHub Release. Install only on devices where sideloading is permitted. A production Play Store release should use your own signing key and secrets.

## Tax and accounting notice
Tax estimates are planning aids, not tax advice, tax returns, or an official KRA computation. Configure the applicable jurisdiction, tax year, thresholds, rates, and deductibility treatment with a qualified Kenyan tax professional. The included Kenya starter profile is illustrative and deliberately not represented as current official tax law. VAT, withholding tax, PAYE, turnover-tax eligibility and statutory exemptions are not inferred automatically.

## Privacy
Transactions and settings are stored locally in IndexedDB. There is no remote accounting API, analytics collection, or account sync in this starter. Export your data regularly. Clearing browser/app storage can permanently remove local records.
