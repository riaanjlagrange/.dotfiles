#!/usr/bin/env bash

# exit immediately if command fails
set -e

# paths
DOTFILES="$HOME/.dotfiles"
BIN="$DOTFILES/bin"


# install packages
if [[ -x "$BIN/install_packages.sh" ]]; then
  echo "📦 Installing base packages and dependencies..."
  "$BIN/install_packages.sh"
  echo "✅ Packages installed successfully!"
  echo
else
  echo "⚠️  Skipping package installation — $BIN/install_packages.sh not found or not executable."
  echo
fi

# stow all dotfiles
echo "Stowing dotfiles..."
# navigate to dotfiles
cd "$DOTFILES"

# Use .stowrc settings automatically (--target=$HOME, etc.)
for dir in */; do
  # Skip non-stowable directories
  case "$dir" in
    bin/|.git/|.github/|__pycache__/)
      continue
      ;;
  esac

  echo "→ Stowing $dir"
  stow "$dir"
done

# helper function to run install scripts
run_if_exists() {
  local script="$1"
  local description="$2"

  if [[ -x "$script" ]]; then
    echo "⚙️  $description..."
    "$script"
    echo "✅ $description complete!"
    echo
  else
    echo "⚠️  Skipping $description — script not found or not executable: $script"
    echo
  fi
}

# fonts, themes, tools
run_if_exists "$BIN/install_font.sh" "Installing Nerd Font"
run_if_exists "$BIN/install_kitty_themes.sh" "Installing Kitty Themes"
run_if_exists "$BIN/install_ohmyzsh.sh" "Installing Oh My Zsh"
run_if_exists "$BIN/install_ohmyzsh_plugins.sh" "Installing Oh My Zsh plugins"
run_if_exists "$BIN/install_starship.sh" "Installing Starship Prompt"
run_if_exists "$BIN/install_tmux_plugins.sh" "Installing TPM (Tmux Plugin Manager)"

echo "🎉 All done! Your environment is ready."
