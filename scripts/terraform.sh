#!/usr/bin/env bash
set -euo pipefail

HERE=$(dirname "$0")
cd "${HERE}/../terraform"

if [ -z "${AWS_ACCESS_KEY_ID:-}" ]; then
  echo >&2 "Error: AWS_ACCESS_KEY_ID is not set. Please export it before running this script."
  exit 1
fi

if [ -z "${AWS_SECRET_ACCESS_KEY:-}" ]; then
  echo >&2 "Error: AWS_SECRET_ACCESS_KEY is not set. Please export it before running this script."
  exit 1
fi

terraform "$@"
