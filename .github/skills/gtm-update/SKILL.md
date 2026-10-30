---
name: gtm-update
description: "Update GTM work item fields or add a comment after showing the exact changes and getting confirmation."
argument-hint: "Work item ID and the changes, for example 1234 priority=2 or 1234 comment=\"text\""
user-invocable: true
---

# GTM update

Follow the GTM team context instructions (field modification guardrails) and the GTM work item formatting standard. Use Azure DevOps MCP tools.

## Steps

1. Read the work item (fields, board column, latest 1-3 comments) to confirm it exists and is in `Lyra\GTM Team`.
2. List exactly which fields will change, from current value to new value, and any comment text. Make no other implicit or inferred changes.
3. Stop and wait for the user to confirm.
4. After confirmation, apply only the listed changes, then re-read the item and report the resulting values.

## Guardrails

- Never change Area Path, Iteration Path, Work Item Type, Board Column or State, Created By, or Created Date unless the user explicitly asks for that field by name.
- If a required value is missing or ambiguous (assignee name, priority, severity), ask; do not guess. Use exact roster display names.
- New or rewritten titles, descriptions, and acceptance criteria follow the GTM formatting standard.
