---
name: bpe-extract-process-steps
description: "Read selected sources and extract process steps, actors, systems, inputs/outputs, handoffs, exceptions, and controls with a citation for each."
argument-hint: "List of source IDs/URLs from bpe-gather-sources"
user-invocable: true
---

# Extract process steps

Read-only. Follow `bpe-process-documentation.instructions.md`.

## Steps
1. Read each source fully (Confluence via `getConfluenceContent` detail full; use outline first for long pages; ADO description, ACs, latest 1-3 comments, linked test cases).
2. For each source, record: step, actor, system, input, output, handoff, exception, control, identifier used for matching.
3. Record source title/ID, author, last-modified date for every row.
4. Note unreadable attachments, images, or recordings.

## Output
Per-source extraction table. No merging or judgment yet.
