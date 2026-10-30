---
name: bpe-create-change-brief
description: "Produce a one-page change brief for Dev and QA: where the process changes, before/after, why, impact, test focus, risks, and open questions. Draft only."
argument-hint: "Mapping and impact outputs for a work item"
user-invocable: true
disable-model-invocation: true
---

# Create change brief

Business-friendly, concise, source-cited. Read-only; draft in chat and optionally save to the session files folder. Do not publish or comment on ADO unless the user asks and confirms.

## Full change-impact flow
Run `bpe-map-change-to-process`, then `bpe-assess-change-impact`, then this skill. Separate what the request states from what you reason; label Confirmed / Inferred / Gap. Do not assign owners, estimates, or priority.

## Format
1. **Change** : work item ID/IR, title, one-line summary, board column.
2. **Why** : verbatim stated reason with source, or "Not stated".
3. **Process changes** : per step: before | after | change type | label.
4. **Impact** : systems, data/identifiers, integrations, exceptions, reports, related ADO items.
5. **Dev focus** : steps/handoffs and dependencies to handle; no implementation design unless requested.
6. **QA focus** : scenarios to cover, existing tests to reuse or update, uncovered gaps, regression areas.
7. **UAT and documentation** : guides and process steps needing updates.
8. **Risks and open questions** : with suggested owner type.
9. **Sources** : list, including anything unreadable or missing (process doc status, missing IR, etc.).
