#!/usr/bin/env bash
set -Eeuo pipefail

DEFAULT_BUCKET="${DEFAULT_BUCKET:-jresendiz27-personal-code-projects}"
ACTION="${1:-}"
EXTRA_ARGS=("${@:2}")  # forward all flags after the action

usage() {
  echo "Usage: $0 upload|download [aws s3 sync flags]"
  echo "ex: $0 upload --delete --exact-timestamps --sse AES256"
  exit 1
}

case "$ACTION" in
  upload)
    echo "Uploading datasets and models to s3://$DEFAULT_BUCKET/"
    aws s3 sync "datasets/raw" "s3://${DEFAULT_BUCKET}/datasets/raw/" "${EXTRA_ARGS[@]}"
    aws s3 sync "models"       "s3://${DEFAULT_BUCKET}/models/"       "${EXTRA_ARGS[@]}"
    ;;
  download)
    echo "Downloading from s3://$DEFAULT_BUCKET/"
    aws s3 sync "s3://${DEFAULT_BUCKET}/datasets/raw/" "datasets/raw" "${EXTRA_ARGS[@]}"
    aws s3 sync "s3://${DEFAULT_BUCKET}/models/"       "models"       "${EXTRA_ARGS[@]}"
    ;;
  *)
    usage
    ;;
esac
