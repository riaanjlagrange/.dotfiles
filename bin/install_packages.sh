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
  swww
  blueman
  networkmanager
  pavucontrol
  emptty
  sl
  tealdeer
  wl-clipboard
  cliphist
  earlyoom
  inotify-tools
  udiskie
  udisks2
  gvfs
  dosfstools

  # --- Terminal tools ---
  htop
  fzf
  ripgrep
  zoxide
  hypridle
  bat
  exa
  fd
  tree
  fastfetch
  rsync
  openssh
  ffmpeg
  thefuck
  mpv
  lazygit
  jq

  # --- GUI apps & environment ---
  kitty
  flameshot
  firefox
  waybar
  wofi
  vlc
  audacity
  spotify-launcher
  libreoffice-fresh

  # --- Dev tools ---
  gcc
  make
  python
  nodejs
  npm
  docker
  docker-compose
  github-cli

  # --- hacker stuff ---
  john
  nmap
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

enable_earlyoom() {
  sudo systemctl enable --now earlyoom
}

enable_udisks2 () {
  sudo systemctl enable --now udisks2
}

install_aur_packages() {
    echo "📦 Installing extra AUR packages..."
    yay -S --noconfirm --needed \
      ttf-joypixels \
      ttf-firacode-nerd \
      google-chrome \
      zen-browser-bin \
      wofi-emoji \
      anki-bin
}

# === MAIN ===
echo "Arch Linux setup — base system configuration"
sleep 1

install_packages
install_yay
setup_docker
setup_ssh
enable_earlyoom
install_aur_packages


echo "packages installed..."
