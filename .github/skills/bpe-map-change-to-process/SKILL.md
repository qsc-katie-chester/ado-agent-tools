---
name: bpe-map-change-to-process
description: "Read a new enhancement (ADO item and/or Intake Request) and locate the affected steps in the approved business process document, with the stated reason for the change."
argument-hint: "ADO work item ID and/or IR number, optional process name or process doc URL"
user-invocable: true
disable-model-invocation: true
---

# Map change to process

Read-only. Follow `bpe-process-documentation.instructions.md`.

## Steps
1. Read the ADO item fully: title, description, ACs, board column, linked items, latest 1-3 comments (author, date). Read the IR if supplied (inspect Salesforce metadata first; verify production org identity and IsSandbox).
2. Capture the stated reason ("why") verbatim from the description, Business Problem, IR, or comments. If none, record Gap.
3. Find the process document in Confluence space PE (or the URL given). Note its status (Draft/In Review/Approved) and last reviewed date.
4. Map each requested behavior or AC to the process step(s) it changes, adds, removes, or leaves unchanged. Cite step numbers and source text.

## Output
Table: AC/requirement | process step(s) | change type (new/modified/removed/none) | stated reason | label (Confirmed/Inferred/Gap). Also: process doc used and status, or "no process doc found".

## Boundaries
- The "why" comes only from the request, IR, and comments, quoted and cited; if absent, say so. Do not infer intent, priority, or scope.
- If no approved process document exists, say so, mark steps Inferred or Gap, and suggest documenting the process first (`bpe-gather-sources`). Never present Inferred impacts as Confirmed.
- Do not assign owners, estimates, or priority; list owner types for the user to decide.
