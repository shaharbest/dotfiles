#!/bin/bash
# PreToolUse hook: ask the user before any edit to a Hugo site's
# assets/css/custom.css. Theme config and supported overrides come first;
# custom.css is the last resort. Covers Edit/Write and shell writes (sed -i,
# redirects, scripts), since agents also edit files through Bash.
input=$(cat)
tool=$(jq -r '.tool_name // empty' <<<"$input")

case "$tool" in
  Edit|Write)
    path=$(jq -r '.tool_input.file_path // empty' <<<"$input")
    [[ "$path" == */assets/css/custom.css ]] || exit 0
    ;;
  Bash)
    cmd=$(jq -r '.tool_input.command // empty' <<<"$input")
    [[ "$cmd" == *custom.css* ]] || exit 0
    # Ignore harmless redirects (2>&1, >/dev/null) before looking for a write
    cmd=$(sed -E 's#[0-9]?>&[0-9]|[0-9]?>/dev/null##g' <<<"$cmd")
    grep -qE 'sed -i|>|\btee\b|python|perl|\bcp\b|\bmv\b|\brm\b' <<<"$cmd" || exit 0
    ;;
  *) exit 0 ;;
esac

jq -n '{hookSpecificOutput: {
  hookEventName: "PreToolUse",
  permissionDecision: "ask",
  permissionDecisionReason: "custom.css is the last resort: theme config, then a template the site owns, then a supported override (see the project CLAUDE.md). Approve only if the agent named the options it checked and why they do not work."
}}'
