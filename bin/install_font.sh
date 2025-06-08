#!/usr/bin/env bash
set -e

FONT_NAME="Departure Mono Nerd Font"
FONT_DIR="$HOME/.local/share/fonts"
TMP_DIR="$(mktemp -d)"

echo "📦 Installing $FONT_NAME..."

# Download the zip from Nerd Fonts
cd "$TMP_DIR"
curl -LO https://github.com/rektdeckard/departure-mono/releases/download/v1.500/DepartureMono-1.500.zip

# Unzip and install
unzip -o DepartureMono-1.500.zip -d "$FONT_DIR"
fc-cache -fv

echo "$FONT_NAME installed in $FONT_DIR"

# Clean up
rm -rf "$TMP_DIR"
