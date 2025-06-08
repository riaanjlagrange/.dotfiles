#!/usr/bin/env bash

set -e

TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ -d "$TPM_DIR" ]; then
  echo "TPM already installed at $TPM_DIR"
else
  echo "Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

echo "Installing TPM plugins..."

"$TPM_DIR/bin/install_plugins"

