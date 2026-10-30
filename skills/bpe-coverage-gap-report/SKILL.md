---
name: bpe-coverage-gap-report
description: "Map process steps and work item acceptance criteria to existing test cases and UAT guides; report Covered/Partial/None with evidence."
argument-hint: "ADO work item ID and optional sub-process page"
user-invocable: true
disable-model-invocation: true
---

# Coverage gap report

1. Collect ACs (AC1..), affected steps, linked test cases, and UAT guides (space PE).
2. Matrix columns: Step/AC | Test case ID | UAT scenario | Coverage (Covered/Partial/None) | Evidence | Label (Confirmed/Inferred).
3. Add regression candidates from upstream/downstream handoffs.
4. Summarize gaps and suggested scenarios. Do not create test cases or guides without a preview and approval.
