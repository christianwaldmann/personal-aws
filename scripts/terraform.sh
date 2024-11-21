#!/usr/bin/env bash
set -euo pipefail

HERE=$(dirname "$0")
cd "${HERE}/../terraform"

terraform "$@"
