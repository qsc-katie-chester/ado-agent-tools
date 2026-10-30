---
name: gtm-daily-standup
description: "Prepare a concise, action-oriented GTM Team daily standup summary from Azure DevOps."
user-invocable: true
---

# GTM daily standup

Read-only. Use Azure DevOps MCP tools only. Scope: organization `ablcode`, project `Lyra`, team `GTM Team`, exact area path `Lyra\GTM Team`.

## Steps

1. Resolve the current sprint with `work` list_team_iterations, timeframe `current`. Include its name and dates in the summary.
2. Query current-sprint items and active Production Support items in the exact area path. Exclude Removed. Use board columns and lane information; never use System State. Do not report board-column counts.
3. Review meaningful changes from the last 24 hours: comments, assignments, child tasks, dependencies, priority, sprint, and board-column changes.
4. For items in Committed, In Dev, In QA, In UAT, Ready to Deploy, and all Production Support items, retrieve the latest 1-3 comments. Compare comments with board columns and surface relevant mismatches.

## Output

Use these sections in this order:

1. **Last 24 Hours** — material changes only.
2. **Risks / Needs Attention** — evidence-backed risks only.
3. **Handoffs / Next Actions** — concrete next steps and handoffs.
4. **Today** — specific outcomes for today.
5. **Decisions / Follow-ups** — one owner per line; write `None` if empty.

Target 10–15 lines total, exceeding that only for material updates. Use one line per item and no paragraphs. Omit routine comments, admin edits, unchanged work, ticket history, generic commentary, and filler. Avoid repeating an item unless necessary. Cite author and date for comment-based updates; quote risk or blocker text verbatim where practical. Preserve `IR #` references verbatim.

Suggested line formats:

- `#ID | Title | What happened -> NEXT: @owner -> action`
- `RISK | What is happening | NEXT: @owner -> action`
- `#ID | Current -> Next | NEXT: @owner -> action`
- `@owner | #ID | Expected action/outcome`
- `@owner | What is needed`

Never invent owners, blockers, status, commitments, dates, or next steps. Never modify work items.
