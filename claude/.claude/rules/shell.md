## Shell commands

Combine multiple related commands into one copyable block: wrap in `{ }`, echo labels between sections, pipe to `nvim -`:
```
{ echo '=== git status ==='; git status; echo '=== git log ==='; git log --oneline -10; } 2>&1 | nvim -
```
