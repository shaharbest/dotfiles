#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

if ! command -v stow &>/dev/null; then
  echo "stow not found. Install it first:"
  echo "  brew install stow"
  exit 1
fi

cd "$DOTFILES_DIR"
# stow -v --target="$HOME" nvim tmux zsh wezterm bin hypr omarchy
stow -v --target="$HOME" nvim hypr omarchy bin zsh aerc
# claude: per-file links so ~/.claude (Claude Code's runtime dir) never folds into this repo
stow -v --no-folding --target="$HOME" claude
echo "Done. Symlinks created."
