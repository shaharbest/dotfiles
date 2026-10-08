#!/bin/bash
input=$(cat)
if echo "$input" | grep -qi "pdf"; then
  printf '{"hookSpecificOutput":{"hookEventName":"UserPromptSubmit","additionalContext":"For PDF files, always use `pdftotext <file> -` via Bash to read content. Never use the Read tool on .pdf files — it renders pages as images and wastes tokens."}}\n'
fi
