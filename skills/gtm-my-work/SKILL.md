---
name: gtm-my-work
description: "Show a prioritized view of work assigned to the user in the current GTM sprint, what is blocked, and the best next action."
argument-hint: "Optional: person name (default: the signed-in user)"
user-invocable: true
disable-model-invocation: true
---

# GTM my work

Read-only. Follow the GTM team context instructions. Use Azure DevOps MCP tools only. Here "my work" means the signed-in user's assigned items; the team-wide view is `gtm-daily-standup`.

## Steps

1. Identify the user (or the supplied roster name) and resolve the current sprint.
2. Query items assigned to that person in `Lyra\GTM Team` across the current sprint and open Production Support. Exclude Removed and Done. Use board columns, not System State.
3. Retrieve the latest 1-3 comments for each item; flag who is being waited on and any comment/column contradiction.

## Output

1. Items grouped by board column (ID, title, lane, priority/severity, age in column if known).
2. Blocked or waiting items, with the person waited on and the smallest unblock action (stated in comments only).
3. Recommended next action with the reason (priority, severity, sprint timing). Label it a suggestion.

Preserve IR # verbatim. Do not modify any work item.
