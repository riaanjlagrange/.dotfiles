#!/usr/bin/env bash

set -e

DOTFILES="$HOME/.dotfiles"
BIN="$DOTFILES/bin"

echo "Stowing dotfiles..."
cd "$DOTFILES"
for dir in */; do
  [[ "$dir" == "bin/" ]] && continue
  echo "→ Stowing $dir"
  stow "$dir"
done

echo "Installing Departure Mono Font..."
"$BIN/install_font.sh"

echo "Installing Kitty Themes..."
"$BIN/install_kitty_themes.sh"

echo "Installing Oh My Zsh..."
"$BIN/install_ohmyzsh.sh"

echo "Installing Oh My Zsh plugins..."
"$BIN/install_ohmyzsh_plugins.sh"

echo "Installing Starship Prompt..."
"$BIN/install_starship.sh"

echo "Installing TPM (Tmux Plugin Manager)..."
"$BIN/install_tmux_plugins.sh"

echo "All done!"
