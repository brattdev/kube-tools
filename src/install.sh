#!/usr/bin/env bash

set -o errexit

echo "downloading zip"
apt update
apt install -y zip
apt install -y curl

echo "downloading jq"
curl -sL https://github.com/stedolan/jq/releases/latest/download/jq-linux64 \
-o /usr/local/bin/jq && chmod +x /usr/local/bin/jq
jq --version

echo "downloading grep"
apt install -y grep
grep --version
