# claude

Global [Claude Code](https://claude.com/claude-code) config, stowed into
`~/.claude`. Only hand-written config lives here. `~/.claude` itself is
Claude Code's runtime directory (sessions, history, caches, credentials,
project memory) and is not a git repo.

This repo is **public**. Nothing personal goes in this package. Review the
`settings.json` diff before every commit, because Claude Code writes to it too.

## Install

Stowed with `--no-folding`, so each file gets its own symlink and stow never
links a whole directory. Claude Code, Omarchy, and other repos can then add
their own files to `~/.claude/skills/`, `rules/` and the rest without those
files landing in this repo:

```bash
stow -v --no-folding --target="$HOME" claude
```

`setup.sh` runs this. Re-run it after adding a new file to the package.

## Adding a new preference: decision guide

When you tell your agent to remember or always do something, it should go
through this table before editing anything. The most specific match wins:

| This is true of the preference... | ...goes here |
|---|---|
| Applies in every session, every project, forever | A bullet in the right file under `.claude/rules/`, or a new `rules/<topic>.md` if nothing fits |
| ...but only when editing a specific file type (e.g. Python, Terraform) | `rules/<topic>.md` with `paths: ["**/*.py"]` frontmatter. It loads only when Claude touches a matching file, so this is real lazy loading. |
| Only matters for a specific *kind of task* (e.g. writing commits, reviewing PRs), not every session | A skill under `.claude/skills/`: a `SKILL.md` with a clear one-line description, so it's picked up only when relevant |
| Must happen no matter what Claude decides, not just "please remember" | A hook under `.claude/hooks/`, wired into `settings.json`'s `hooks` block. See `hooks/pdf-hint.sh` for the pattern (a `UserPromptSubmit` hook that injects `additionalContext` when it matches) |
| True only on *this* machine (OS, local paths, hardware) | `~/.claude/rules/local.md`, a plain local file that isn't in any repo |
| Personal or sensitive (PII, client details) | Not here. Use `~/Projects/system/sensitive-dotfiles` (local-only), or `pass` for secrets |

### Why not just one big CLAUDE.md?
`CLAUDE.md` and every file in `rules/` without `paths:` frontmatter load in
full, every session, everywhere. The token cost is the same no matter which
file the content lives in, so splitting into `rules/*.md` is for
editability, not for saving tokens. Real lazy loading only happens two ways:
`rules/*.md` with `paths:` frontmatter (loads only for matching files), and
`skills/` (loads only when a task matches its description). `@import` inside
`CLAUDE.md` is **not** lazy: an imported file still loads in full at
session start.

## Not in this package, on purpose

- **Credentials, sessions, history, caches, telemetry**: Claude Code's runtime state.
- **Project memory** (`~/.claude/projects/*/memory/`): keyed to paths on this machine, and often personal.
- **`settings.local.json`**: machine-local by definition, so it's a plain file in `~/.claude`.
- **Vendor skills** (Cloudflare etc.): reinstall them from their source instead of copying them in.
- **Omarchy skills** (`omarchy`, `diagnose-crash`): symlinks that `omarchy migrate` recreates.

## Known issues

These live here, not in a separate file, because stow would link any other
top-level file in the package into `~`. Only `README*` is skipped.

- **Auto mode's "Teach auto mode about your environment?" wizard** writes a
  description of the *current project* into `settings.json`
  (`autoMode.environment`), and that file is public through this repo. Avoid
  the wizard, or remove the block from the diff before pushing.
- **Vendor skills aren't restored on a new machine.** The Cloudflare/sandbox
  skills in `~/.claude/skills/` were installed by hand from a source that was
  never recorded, so there's no reinstall command yet. Record the command
  here the next time they're installed. They also cost about 1k tokens of
  context in every session, so consider removing them when they're not
  needed.
