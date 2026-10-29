---
name: gtm-work-item-summary
description: "Summarize a GTM work item: description, acceptance criteria, linked items, and the discussion with latest status, decisions, and open questions."
argument-hint: "Work item ID or IR # (several IDs allowed)"
user-invocable: true
disable-model-invocation: true
---

# GTM work item summary

Read-only. Follow the GTM team context instructions. Use Azure DevOps MCP tools only.

## Steps

1. Retrieve the item with fields, board column, parent, children, related links, and the full comment thread. For an IR #, search work items for it first and list all matches.
2. Summarize without paraphrasing business wording unnecessarily; quote key statements verbatim.

## Output

1. Header: ID, type, title, board column and lane, priority/severity, assignee, iteration, council tag.
2. User story and business problem (verbatim where short).
3. Acceptance criteria as written; note any that are missing or not verifiable.
4. Latest status from the most recent 1-3 comments (author, date); state any contradiction with the board column.
5. Decisions explicitly stated, open questions, blockers, and dependencies. Do not treat questions as decisions or infer commitments.
6. Linked parent and child items with their columns.

Do not modify any work item.
