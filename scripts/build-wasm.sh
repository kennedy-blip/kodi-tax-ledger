#!/usr/bin/env bash
set -euo pipefail
command -v tinygo >/dev/null || { echo "Install TinyGo 0.34+ first" >&2; exit 1; }
mkdir -p public/wasm
tinygo build -o public/wasm/kodiledger.wasm -target wasm -no-debug ./go-core
GOROOT="$(go env GOROOT)"
cp "$GOROOT/lib/wasm/wasm_exec.js" public/wasm/wasm_exec.js
