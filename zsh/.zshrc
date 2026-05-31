zmodload zsh/zprof
zmodload zsh/datetime
_zsh_start=$EPOCHREALTIME

export VISUAL=nvim
export EDITOR="$VISUAL"

alias v=nvim
alias calc='bc -lq'
alias fuzzword='fzf < /usr/share/dict/words | tr -d "\n" | pbcopy'

bindkey -v
KEYTIMEOUT=1

# Completions
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
autoload -Uz compinit
# always load from cache for fast startup; rebuild dump in background once a day
compinit -C
[[ -n ~/.zcompdump(#qN.mh+24) ]] && (compinit -d ~/.zcompdump &) 2>/dev/null

# PATH additions
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

eval "$(starship init zsh)"

{
  printf "=== %s | elapsed: %.3fs ===\n" "$(date)" "$(( EPOCHREALTIME - _zsh_start ))"
  zprof
} >> /tmp/zsh_startup.log
