# dotfiles

My dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's included

| Package | Path | Description |
|---------|------|-------------|
| `nvim` | `~/.config/nvim` | Neovim config — lazy.nvim, LSP via Mason, Telescope, Harpoon |
| `tmux` | `~/.config/tmux` | tmux config — tpm, catppuccin, sessionx, fzf |
| `zsh` | `~/.zshrc` | Zsh config — aliases, vi mode, PATH setup |
| `hypr` | `~/.config/hypr` | Hyprland keybinding overrides |
| `omarchy` | `~/.config/omarchy` | Omarchy shell config — bar layout, widgets |
| `bin` | `~/.local/bin` | Personal scripts |
| `aerc` | `~/.config/aerc` | aerc email client — UI settings (`aerc.conf`) and keybinds (`binds.conf`); account config with real addresses lives in `sensitive-dotfiles` |
| `pacman` | `/etc/pacman.d/hooks` | Pacman hooks — `espanso-restart.hook` restarts espanso after upgrades (otherwise its search UI breaks). **Not stowed** — see below |

## Setup

```bash
git clone git@github.com:shaharbest/dotfiles.git ~/dev/dotfiles
cd ~/dev/dotfiles
./setup.sh
```

Requires `stow` — install with `brew install stow`.

### Pacman hooks (`pacman` package)

These run as root, so they're **copied** into `/etc`, not stowed — a root-run
hook must not be a symlink into a user-writable directory. `setup.sh` skips
them; install (and re-install after editing) with:

```bash
sudo install -Dm644 -t /etc/pacman.d/hooks pacman/etc/pacman.d/hooks/*.hook
```

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
