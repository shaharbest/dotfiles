function yazi() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    command yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

function phone() {
  # cd is a shell builtin — can't run inside a subprocess script.
  # The script prints the path; this function does the cd.
  local target
  target=$(command phone) || return 1
  cd "$target"
}
