---
name: bpe-build-change-register
description: "Build Process Change Register entries (what changed in which process step, when, why, evidence) from mined ADO items, for the Confluence register page and sub-process step history."
argument-hint: "Mining output or work item IDs; target register page"
user-invocable: true
disable-model-invocation: true
---

# Build the process change register

Entry fields: Register ID (R-###) | Sub-process page | Step # | Change type (Add/Change/Remove/Fix) | What changed (before/after, quoted) | Why (quoted from item/IR; "not stated" if absent) | Work item ID | IR # (verbatim) | Test case IDs | Sprint (Iteration Path) | Deployed date | Evidence label | Last verified.

Rules:
- Deployed date comes from the revision history (board column became Deployed) or a Release Manager comment, cited. Otherwise "date not found"; never use Changed Date as the deploy date.
- One row per item per step. Items touching several steps get several rows.
- Before/after comes only from the item text, ACs, comments, or test cases; otherwise write "before not documented".
- Newest first. Preview rows before any publish; publish via `bpe-publish-process-doc`. Also propose a "Step change history" row set for each sub-process page.
- Keep a Conflicts/Unmapped section for items without clear evidence.
