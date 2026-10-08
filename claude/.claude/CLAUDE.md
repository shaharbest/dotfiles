<!-- Maintainer note (stripped from context; visible only via the Read tool,
e.g. right before an agent edits this file): this file is stowed from the
`claude` package of the dotfiles repo. The full mechanism guide (rules/ vs
skills/ vs hooks/ vs why @import isn't lazy loading) lives in that package's
README.md -- keep that as the one source of truth instead of duplicating it
here. Keep this file under ~60 lines. Machine-specific facts go in
~/.claude/rules/local.md, a plain local file that isn't in any repo. -->

# Claude Code config

New preference to add? First read the README next to this file's source:
`$(dirname "$(readlink -f ~/.claude/CLAUDE.md)")/../README.md`. It says
whether the preference belongs in `rules/`, a skill, or a hook, and which
repo it belongs in, before you edit anything.
