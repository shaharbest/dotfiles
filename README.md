# dotfiles

My dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's included

| Package | Path | Description |
|---------|------|-------------|
| `nvim` | `~/.config/nvim` | Neovim config — lazy.nvim, LSP via Mason, Telescope, Harpoon |
| `tmux` | `~/.config/tmux` | tmux config — tpm, catppuccin, sessionx, fzf |
| `zsh` | `~/.zshrc` | Zsh config — aliases, vi mode, PATH setup |

## Setup

```bash
git clone git@github.com:shaharbest/dotfiles.git ~/dev/dotfiles
cd ~/dev/dotfiles
./setup.sh
```

Requires `stow` — install with `brew install stow`.

## Adding a new package

1. Create the directory mirroring the path from `~`:
   ```
   pkg/.config/pkg/config-file
   ```
2. Add the package name to the `stow` command in `setup.sh`.

## Removing symlinks

```bash
cd ~/dev/dotfiles
stow -D nvim tmux zsh
```
