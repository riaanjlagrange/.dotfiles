#!/usr/bin/env bash

# Arch Linux setup script
# Installs essential packages and tools needed for your environment.
# Run this right after a clean Arch install.

set -e  # stop if any command fails

# === CONFIG ===
PKGS=(
  # --- Core essentials ---
  base-devel
  git
  stow
  wget
  curl
  unzip
  zip
  neovim
  zsh
  tmux
  starship

  # --- Terminal tools ---
  htop
  fzf
  ripgrep
  bat
  exa
  fd
  tldr
  tree
  fastfetch
  rsync
  openssh
  lazygit

  # --- GUI apps & environment ---
  kitty
  flameshot
  firefox
  waybar
  wofi

  # --- Dev tools ---
  gcc
  make
  python
  nodejs
  npm
  docker
  docker-compose
  github-cli
)

# === FUNCTIONS ===

install_yay() {
  if ! command -v yay &>/dev/null; then
    echo "🚀 Installing yay (AUR helper)..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
  else
    echo "✅ yay already installed"
  fi
}

install_packages() {
  echo "📦 Installing base packages with pacman..."
  sudo pacman -Syu --noconfirm --needed "${PKGS[@]}"
}

setup_docker() {
  echo "🐳 Setting up Docker..."
  sudo systemctl enable --now docker.service
  sudo usermod -aG docker "$USER"
}

setup_ssh() {
    if ! systemctl is-enabled sshd &>/dev/null; then
      echo "🔐 Enabling SSH service..."
      sudo systemctl enable sshd
      sudo systemctl start sshd
      echo "✅ SSH service started and enabled."
    else
      echo "✅ SSH service already enabled."
    fi
}

install_aur_packages() {
    echo "📦 Installing extra AUR packages..."
    yay -S --noconfirm --needed \
      ttf-joypixels
}

# === MAIN ===
echo "Arch Linux setup — base system configuration"
sleep 1

install_yay
install_packages
setup_docker
setup_ssh
install_aur_packages



echo "packages installed..."
