#!/usr/bin/env bash

set -e

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom/plugins"

declare -A plugins=(
  [zsh-autosuggestions]="https://github.com/zsh-users/zsh-autosuggestions.git"
  [zsh-syntax-highlighting]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
  [zsh-completions]="https://github.com/zsh-users/zsh-completions.git"
)

mkdir -p "$ZSH_CUSTOM"

for name in "${!plugins[@]}"; do
  target="$ZSH_CUSTOM/$name"
  repo="${plugins[$name]}"

  if [ -d "$target" ]; then
    echo "Plugin '$name' already installed."
  else
    echo "Cloning '$name' from $repo..."
    git clone --depth=1 "$repo" "$target"
  fi
done
