## Context economy

Every tool call re-sends the whole session, so whatever enters it is paid for
again on every later step.

- **Small tool output**: `grep -n` or a `sed -n` range, not `cat` of a whole
  file; `diff --stat` before a full diff, and one example diff, not one per
  repo; `| head` on anything unbounded; `curl | grep` before a screenshot.
  Batch related steps into one command.
- **One task per session**: when the user turns to an unrelated task, say so
  before starting, and offer a short handoff note (what's done, what's open,
  where it's recorded) to paste after `/clear`.
