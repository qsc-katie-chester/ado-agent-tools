---
name: bpe-definition-of-ready-check
description: "Check a PBI/Bug or IR against GTM formatting, required fields, process mapping, and dependencies; return Pass/Fail/Unknown with evidence."
argument-hint: "ADO work item ID(s) or IR number(s)"
user-invocable: true
disable-model-invocation: true
---

# Definition of Ready check

1. Retrieve fields, description, ACs, links, and latest 1-3 comments (newest first, cite author/date).
2. Check: title convention; user story, business problem; ACs numbered/bold/verifiable; Area, Iteration, Tags, Assigned To, Priority (Severity for bugs); IR verbatim; affected sub-process and owner; dependencies; duplicates; comment/board-column contradictions.
3. Output a table (Check | Result | Evidence) and the minimum clarifications required.
4. Read-only. Do not change fields, board column, or sprint.
