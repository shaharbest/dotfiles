export VISUAL=nvim
export EDITOR="$VISUAL"

alias v=nvim
alias calc='bc -lq'
alias fuzzword='fzf < /usr/share/dict/words | tr -d "\n" | pbcopy'

bindkey -v

# Completions
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit

# PATH additions
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
