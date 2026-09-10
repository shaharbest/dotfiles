# Keeps .zshrc (and .zprofile/.zlogin if ever added) out of $HOME. This file
# itself can't move — zsh always reads ~/.zshenv first, before it knows
# ZDOTDIR exists, to bootstrap this setting.
#
# Gotcha: `omarchy-setup-zsh` hardcodes ~/.zshrc and isn't ZDOTDIR-aware. If
# it's ever re-run (e.g. `omarchy setup zsh`), it'll write a fresh stock
# .zshrc back at $HOME, orphaned from this ZDOTDIR setup — move its content
# into .config/zsh/.zshrc and delete the stray $HOME copy if that happens.
export ZDOTDIR="$HOME/.config/zsh"
