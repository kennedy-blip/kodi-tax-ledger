#!/usr/bin/env bash
set -euo pipefail
command -v tinygo >/dev/null || { echo "Install TinyGo 0.34+ first" >&2; exit 1; }
mkdir -p public/wasm
(cd go-core && tinygo build -o ../public/wasm/kodiledger.wasm -target wasm -no-debug .)
GOROOT="$(go env GOROOT)"
RUNTIME="$GOROOT/lib/wasm/wasm_exec.js"
if [ ! -f "$RUNTIME" ]; then RUNTIME="$GOROOT/misc/wasm/wasm_exec.js"; fi
if [ ! -f "$RUNTIME" ]; then echo "wasm_exec.js was not found in GOROOT=$GOROOT" >&2; exit 1; fi
cp "$RUNTIME" public/wasm/wasm_exec.js
