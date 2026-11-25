#!/usr/bin/env bash
set -euo pipefail
mkdir -p public/wasm
if command -v tinygo >/dev/null 2>&1; then
  (cd go-core && tinygo build -o ../public/wasm/kodiledger.wasm -target wasm -no-debug .)
  GOROOT="$(go env GOROOT)"
  RUNTIME="$GOROOT/lib/wasm/wasm_exec.js"
  if [ ! -f "$RUNTIME" ]; then RUNTIME="$GOROOT/misc/wasm/wasm_exec.js"; fi
  if [ ! -f "$RUNTIME" ]; then echo "wasm_exec.js was not found in GOROOT=$GOROOT" >&2; exit 1; fi
  cp "$RUNTIME" public/wasm/wasm_exec.js
elif [ -s public/wasm/kodiledger.wasm ] && [ -s public/wasm/wasm_exec.js ]; then
  echo "TinyGo unavailable; using checked-in, CI-built WebAssembly assets."
else
  echo "TinyGo is required for the first WASM build. Install TinyGo 0.34+." >&2
  exit 1
fi
