#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
export GOTOOLCHAIN=auto
GOBIN="$PWD" go install github.com/caddyserver/xcaddy/cmd/xcaddy@v0.4.7
GOMAXPROCS=4 GOFLAGS=-p=4 ./xcaddy build v2.11.7 --with github.com/imgk/caddy-trojan@v0.2.11-4 --output "$PWD/versions/caddy-2.11.7-trojan-0.2.11-4-linux-amd64"
sha256sum versions/caddy-2.11.7-trojan-0.2.11-4-linux-amd64 > versions/SHA256SUMS
