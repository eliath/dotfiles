#!/usr/bin/env bash
set -e

# Detect system architecture
ARCH=$(uname -m)
case $ARCH in
    x86_64) FILENAME_ARCH="amd64" ;;
    aarch64) FILENAME_ARCH="arm64" ;;
    *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

# Get latest release data from GitHub API
API_RESPONSE=$(curl -s https://api.github.com/repos/asdf-vm/asdf/releases/latest)

# Extract download URL for matching asset
DOWNLOAD_URL=$(echo "$API_RESPONSE" | jq -r --arg arch "$FILENAME_ARCH" '.assets[] | select(.name | contains($arch)).browser_download_url | select(contains("linux") and endswith(".tar.gz"))')

# Download and extract
if ! [ -n "$DOWNLOAD_URL" ]; then
    echo "Error: Could not find matching asset for architecture $FILENAME_ARCH"
    exit 1
fi

echo "Downloading asdf from: $DOWNLOAD_URL"
TEMP_FILE=$(mktemp)
curl -L --progress-bar "$DOWNLOAD_URL" -o "$TEMP_FILE";
TEMP_DIR=$(mktemp -d)
tar -xzf ${TEMP_FILE} -C ${TEMP_DIR}

ASDF_SRC_BINARY="${TEMP_DIR}/asdf"
mkdir -p ${HOME}/local/bin
ASDF_DEST_BINARY="${HOME}/local/bin/asdf"

echo "Moving downloaded binary from $ASDF_SRC_BINARY -> $ASDF_DEST_BINARY"
mv $ASDF_SRC_BINARY $ASDF_DEST_BINARY
rm -rf $TEMP_DIR
rm -f $TEMP_FILE
