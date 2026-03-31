#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

if ! command -v stow &>/dev/null; then
  echo "stow not found. Install it first:"
  echo "  brew install stow"
  exit 1
fi

cd "$DOTFILES_DIR"
stow -v --target="$HOME" nvim tmux zsh wezterm bin
echo "Done. Symlinks created."
