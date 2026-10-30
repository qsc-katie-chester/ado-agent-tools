---
name: gtm-sprint-retro
description: "Prepare GTM Team sprint review and retrospective data from Azure DevOps: delivered vs. committed, carryover, bugs, flow, and discussion prompts."
argument-hint: "Sprint name, for example Sprint 24 (defaults to the most recently completed sprint)"
user-invocable: true
disable-model-invocation: true
---

# GTM sprint retro

Read-only. Follow the GTM team context instructions (org `ablcode`, project `Lyra`, team `GTM Team`, area `Lyra\GTM Team`). Use Azure DevOps MCP tools only.

## Steps

1. Resolve the sprint (supplied, otherwise the most recently completed GTM iteration) and its dates.
2. Query all items by Iteration Path in the exact GTM area; exclude Removed. Use board columns, not System State. Do not assume Done means completed within the sprint; check the dates and comments.
3. Retrieve the latest 1-3 comments for carryover items, bugs, and Production Support items.
4. Compute: items per final board column, delivered (Deployed or Done) vs. not delivered, carryover with reason when a comment states one, bugs opened and closed during the sprint by council tag, and items that spent long periods in In QA, In UAT, or Ready to Deploy where history is available.

## Output

1. **Sprint review**: delivered items grouped by council tag (IDs, titles, IR # verbatim).
2. **Metrics**: committed vs. delivered counts, carryover count, bugs opened/closed, Production Support volume.
3. **Carryover**: ID, title, column, stated reason (verbatim with author/date) or "no reason stated".
4. **What went well / what to improve**: only points supported by evidence from items or comments; label anything else as a discussion prompt.
5. **Perspective prompts**: evidence-backed questions per lens for the team to answer: Product (were requirements and acceptance criteria clear, were priorities right), Technical (estimates, rework, bugs introduced), Quality (bugs found late vs. early, QA/UAT queue time), Process (blockers and how fast they cleared, sprint goal met).
6. **Carry-forward**: open action items from the previous retro, if documented in the wiki or Confluence, with status; otherwise state none found.
7. **Discussion prompts and proposed action items**: each with a suggested owner and a testable outcome, for team confirmation.

Do not infer causes or intent. Do not modify any work item.
