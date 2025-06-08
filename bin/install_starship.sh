#!/usr/bin/env bash

set -e

echo "Installing Starship prompt..."

if command -v starship &> /dev/null; then
  echo "Starship is already installed."
else
  curl -sS https://starship.rs/install.sh | sh -s -- -y echo "Starship installed."
fi
