---
name: gtm-handoff
description: "Draft a structured handoff for a GTM work item (dev to QA, QA to UAT, UAT to Release Manager, or person to person) from ADO evidence, ready to paste as a comment."
argument-hint: "ADO work item ID and who it is handing off to"
user-invocable: true
---

# GTM handoff

Read-only. Follow the GTM team context instructions. A board column change is not a handoff; this skill drafts the handoff note. Posting it as a comment uses `gtm-update` after the user confirms.

## Steps

1. Retrieve the work item, parent, linked items, attachments list, and the latest 1-3 comments (cite author and date).
2. Identify the current owner and incoming owner (ask if unclear; do not guess names). Use exact ADO display names from the roster.
3. Draft the handoff from evidence only. Mark anything not found as "Not stated".

## Output

```
Handoff: <ID> <title> (IR # verbatim if present)
From: <current owner>   To: <incoming owner>   Date: <today>
Current board column / lane: <column>

Context: what this item delivers and why (business problem, verbatim where practical)
Done so far: items with source (comment author/date, link)
Decisions made: decision and rationale, with source
Remaining work / next steps: numbered, each with owner and testable outcome
Readiness evidence: what proves the incoming owner can start (environment, test data, build, QA/UAT status)
Blockers and open questions: each with owner
Links: parent Feature, related PBIs/Bugs, PRs, UAT guide, Confluence pages
Timing: sprint, dates, dependencies
```

Keep it to one page. Do not infer completion, intent, or deployment timing. Do not change any field.
