---
name: gtm-work-lookup
description: "Look up GTM work: one person's assigned work with blockers and best next action, or a summary of a single work item or IR # (description, ACs, links, latest status)."
argument-hint: "A person name (default: the signed-in user) or a work item ID / IR # (several allowed)"
user-invocable: true
---

# GTM work lookup

Read-only. Follow the GTM team context instructions. Use Azure DevOps MCP tools only. Do not modify any work item. Mode: a person or "my work" -> **My work**; an ID or IR # -> **Item summary**. The team-wide view is `gtm-daily-standup`.

## Mode 1: My work

"My work" means the signed-in user's assigned items (or the supplied roster name).

1. Identify the person and resolve the current sprint.
2. Query items assigned to that person in `Lyra\GTM Team` across the current sprint and open Production Support. Exclude Removed and Done. Use board columns, not System State.
3. Retrieve the latest 1-3 comments for each item; flag who is being waited on and any comment/column contradiction.

Output:
1. Items grouped by board column (ID, title, lane, priority/severity, age in column if known).
2. Blocked or waiting items, with the person waited on and the smallest unblock action (stated in comments only).
3. Recommended next action with the reason (priority, severity, sprint timing). Label it a suggestion.

Preserve IR # verbatim.

## Mode 2: Item summary

1. Retrieve the item with fields, board column, parent, children, related links, and the full comment thread. For an IR #, search work items for it first and list all matches.
2. Summarize without paraphrasing business wording unnecessarily; quote key statements verbatim.

Output:
1. Header: ID, type, title, board column and lane, priority/severity, assignee, iteration, council tag.
2. User story and business problem (verbatim where short).
3. Acceptance criteria as written; note any that are missing or not verifiable.
4. Latest status from the most recent 1-3 comments (author, date); state any contradiction with the board column.
5. Decisions explicitly stated, open questions, blockers, and dependencies. Do not treat questions as decisions or infer commitments.
6. Linked parent and child items with their columns.
