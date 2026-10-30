---
name: bpe-coverage-gap-report
description: "Map process steps and work item acceptance criteria to existing test cases and UAT guides; report Covered/Partial/None with evidence."
argument-hint: "ADO work item ID and optional sub-process page"
user-invocable: true
disable-model-invocation: true
---

# Coverage gap report

Follow `bpe-process-documentation.instructions.md` and `gtm-team-context.instructions.md`. Read-only until the user approves a write.

1. Identify affected steps with `bpe-map-change-to-process`. Collect ACs (AC1..), latest 1-3 comments, linked test cases (`testplan`), and existing UAT guides in space PE ("Active UAT Guides" page 4575723533; "QA Order Entry" 4245061652).
2. Matrix columns: Step/AC | Test case ID | UAT scenario | Coverage (Covered/Partial/None) | Evidence | Label (Confirmed = test explicitly covers it; Inferred = title only).
3. Add regression candidates from upstream/downstream handoffs. When the change register has rows for the affected step, list existing test cases and prior changes to reuse.
4. Summarize gaps and suggested scenarios.
5. Offer a lightweight UAT guide using `gtm-uat-document` (Scenario 1, 2..., narrow page with wide tables, links to the QA Login guide 3924754564, never production). Preview, then create only on confirmation.

## Boundaries
- Do not mark UAT passed or fail anything; the SOX approval comment is made by the business owner.
- Do not create test cases, guides, or work items without an explicit field-by-field preview and approval.
