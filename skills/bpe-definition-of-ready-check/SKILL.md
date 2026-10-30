---
name: bpe-definition-of-ready-check
description: "Check a PBI/Bug or IR against GTM formatting, required fields, process mapping, and dependencies; return Pass/Fail/Unknown with evidence."
argument-hint: "ADO work item ID(s) or IR number(s)"
user-invocable: true
disable-model-invocation: true
---

# Definition of Ready check

1. Retrieve fields, description, ACs, links, and latest 1-3 comments (newest first, cite author/date).
2. Check (each Pass / Fail / Unknown, with evidence), following `gtm-team-context` and `work-item-formatting` instructions:
   - title convention; user story, business problem; ACs numbered/bold/verifiable
   - Area, Iteration, Tags (council), Assigned To, Priority (Severity for bugs); list missing ones, do not guess
   - IR verbatim and matched to the PBI
   - affected sub-process page identified (`bpe-map-change-to-process`), process owner named, page not "Review overdue"
   - `proc:Q2C-N` tag matching the affected sub-process page (report only; tagging uses `bpe-tag-work-items-with-process` after approval)
   - dependencies and linked items; duplicates via search
   - latest 1-3 comments; comment/board-column contradictions
   - UAT/QA approach identified (suggest `bpe-coverage-gap-report`)
3. Output a table (Check | Result | Evidence) and the minimum clarifications required. Suggest, never apply, fixes; offer `gtm-work-item-author` for rewrites.
4. Read-only. Do not change fields, board column, or sprint.
