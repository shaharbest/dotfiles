# dotfiles

My dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's included

| Package | Path | Description |
|---------|------|-------------|
| `nvim` | `~/.config/nvim` | Neovim config — lazy.nvim, LSP via Mason, Telescope, Harpoon |
| `tmux` | `~/.config/tmux` | tmux config — tpm, catppuccin, sessionx, fzf |

## Setup

```bash
git clone <repo-url> ~/dev/dotfiles
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
stow -D nvim tmux
```
