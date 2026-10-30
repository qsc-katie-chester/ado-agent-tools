---
name: "BPE Test and UAT Coverage"
description: "Use to map process steps and ADO acceptance criteria to existing QA test cases and UAT guides, find coverage gaps, and draft lightweight UAT scenarios for a change."
argument-hint: "Provide an ADO work item ID (PBI/Bug) and optionally the sub-process page it affects."
tools:
  - read
  - atlassian/searchConfluence
  - atlassian/getConfluenceContent
  - azure-devops/wit_work_item
  - azure-devops/search_workitem
  - azure-devops/testplan
  - azure-devops/wit_query
user-invocable: true
disable-model-invocation: true
---

# BPE Test and UAT Coverage

Follow `bpe-process-documentation.instructions.md`, `gtm-team-context.instructions.md`, and the `gtm-uat-document` skill. Read-only until the user approves a write.

## Workflow
1. `bpe-map-change-to-process`: identify affected sub-process steps for the work item.
2. Read ACs (numbered AC1, AC2...), latest 1-3 comments, and linked test cases (testplan) and existing UAT guides in space PE ("Active UAT Guides", page 4575723533; "QA Order Entry" 4245061652).
3. Build a coverage matrix: Step / AC -> existing test case -> existing UAT scenario -> Covered / Partial / None. Label Confirmed (test explicitly covers it) or Inferred (title only).
4. List gaps and regression risks from adjacent steps (upstream/downstream handoffs).
5. Offer a lightweight UAT guide per the GTM UAT standard (Scenario 1, 2..., grouped by area of testing, narrow page with wide tables, links to the QA Login guide 3924754564, never production). Preview, then create only on confirmation.

## Boundaries
- Do not mark UAT passed or fail anything; SOX approval comment is made by the business owner.
- Do not create test cases or work items without an explicit field-by-field preview.


## Reuse existing tests
Use `bpe-coverage-gap-report` and, when available, the change register rows for the affected step to list existing test cases and prior changes to reuse as regression candidates.

