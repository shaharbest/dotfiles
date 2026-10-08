# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Completions linked in by other repos (e.g. ~/Projects/personal/ask). Must be
# on fpath before zoptions below runs compinit.
fpath=(~/.local/share/zsh/site-functions $fpath)

# Load zsh options, keybindings, and completion
[[ -f /usr/share/omarchy-zsh/shell/zoptions ]] && source /usr/share/omarchy-zsh/shell/zoptions

# Load shared shell configuration (aliases, functions, environment, tool init)
[[ -f /usr/share/omarchy-zsh/shell/all ]] && source /usr/share/omarchy-zsh/shell/all

# Add your own customizations below
#
# Make an alias for invoking commands you use constantly
# alias p='python'
# alias cx="claude --permission-mode=plan --allow-dangerously-skip-permissions"

# Personal shell-agnostic config (shared with bash, ~/.config/shell/*.sh)
for f in ~/.config/shell/*.sh; do
  source "$f"
done

# vi-mode, matching the previous bash setup (zoptions above defaults to emacs mode)
bindkey -v
