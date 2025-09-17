#!/usr/bin/env bash
set -Eeuo pipefail

echo "Installing common dependencies"

if command -v apt >&2; then
  echo "Apt is available! installing dependencies"
  sudo apt install build-essential git curl openssl unzip
else
  echo "Apt not available, install build-essential, git, curl, openssl and unzip based on your distro!!!"
fi

if ! command -v aws >&2 ; then
  echo "Installing AWS CLI"
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  rm awscliv2.zip
  rm -rfv ./aws/
else
  echo "AWS cli is installed"
fi
