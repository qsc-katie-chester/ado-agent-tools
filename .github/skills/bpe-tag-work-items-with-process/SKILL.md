---
name: bpe-tag-work-items-with-process
description: "Propose and, on approval, add proc: tags (sub-process page) to ADO work items so the change register can be queried. Tags only; no other field changes."
argument-hint: "Work item IDs or mining output; tag convention"
user-invocable: true
---

# Tag work items with process

Convention (confirm with Michelle Flynn and Will Folz first): `proc:Q2C-1` ... `proc:Q2C-8` matching sub-process page numbers (1 Quote Intake, 2 Quote Creation, 3 PO Receipt, 4 Oracle Order Creation, 5 Ship Date/Changes, 6 Reservation/Pick/Ship, 7 Tracking/Invoicing, 8 Returns/RMAs). Optional `step:` tag is not used initially.

1. Show a preview table: ID | Title | Existing tags | Tag to add | Evidence. Keep every existing tag.
2. Change only Tags. Never touch Area Path, Iteration Path, type, board column/State, created fields.
3. Apply only after explicit approval of the exact list, in batches, then re-read to verify.
4. Saved WIQL for the register: Tags Contains 'proc:Q2C-N'.
