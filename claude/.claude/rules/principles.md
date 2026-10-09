## Principles

Apply these whenever setting up, designing or developing:

- **UNIX philosophy**: small tools that do one thing well; text in, text out; compose them rather than building monoliths.
- **Simplicity first**: prefer the least machinery that solves the problem. Add structure only when a real, second need appears, not in anticipation.
- **Single source of truth / DRY**: each fact, config value or rule lives in exactly one place. Point to it; don't copy it. Prefer asking the authoritative tool (e.g. `/context`) over re-implementing its logic.
- **Concise**: in code, docs and answers. Cut what doesn't earn its place.
- **Portable and plain**: plain files (Markdown, shell) over tool-specific formats. Keep things easy to move between machines and tools.
