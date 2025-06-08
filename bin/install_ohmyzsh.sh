#!/usr/bin/env bash

set -e

if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh already installed."
else
  echo "Installing Oh My Zsh..."
  RUNZSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

"$HOME/.dotfiles/bin/install_ohmyzsh_plugins.sh"

