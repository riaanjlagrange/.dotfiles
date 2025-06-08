#!/usr/bin/env bash

set -e

THEMES_DIR="$HOME/.config/kitty/kitty-themes"
REPO_URL="https://github.com/dexpota/kitty-themes.git"

echo "Installing Kitty themes..."

# Create parent config directory if needed
mkdir -p "$(dirname "$THEMES_DIR")"

# Clone or update the themes repo
if [ -d "$THEMES_DIR/.git" ]; then
  echo "Updating existing kitty-themes repo..."
  git -C "$THEMES_DIR" pull --quiet
else
  echo "Cloning kitty-themes into $THEMES_DIR..."
  git clone --depth 1 "$REPO_URL" "$THEMES_DIR"
fi

echo "Kitty themes are installed at $THEMES_DIR"
