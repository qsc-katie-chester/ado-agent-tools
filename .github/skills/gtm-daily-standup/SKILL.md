---
name: gtm-daily-standup
description: "Prepare the GTM Team daily standup summary for the current sprint from Azure DevOps: progress, in-flight work, blockers, and stale items."
argument-hint: "Optional: sprint name or person to focus on"
user-invocable: true
disable-model-invocation: true
---

# GTM daily standup

Read-only. Follow the GTM team context instructions (org `ablcode`, project `Lyra`, team `GTM Team`, area `Lyra\GTM Team`). Use Azure DevOps MCP tools only.

## Steps

1. Resolve the current sprint (`work` list_team_iterations, timeframe current). State sprint name and dates.
2. Query all sprint work items in the exact GTM area path (WIQL, project level is fine). Exclude Removed. Use board columns, never System State.
3. For every item in Committed, In Dev, In QA, In UAT, Ready to Deploy, and all Production Support items, retrieve the latest 1-3 comments.
4. Compare comments with the board column and disclose every contradiction.

## Output

1. **Sprint header**: sprint, day X of 10, counts per board column.
2. **Since yesterday**: items that moved or have new comments in the last working day (author, date).
3. **By person** (roster display names): in-flight items with ID, title, column, lane, latest comment gist. Include an "Unassigned" group.
4. **Blockers and risks**: only those stated in comments or fields; quote verbatim with author/date.
5. **Stale items**: in-flight items with no activity for 3 or more days.
6. **Mismatches**: comment vs. board column.
7. **Questions for the team**: concrete, one owner each.

Preserve IR # references verbatim. Do not infer commitments, dates, or intent. Do not modify any work item.
