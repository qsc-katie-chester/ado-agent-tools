---
name: gtm-prioritize
description: "Rank GTM backlog items by priority, severity, council, age, and stated business impact, with the evidence for each rank. Proposal only."
argument-hint: "Optional: board column, council tag, or sprint scope (default: Ready and In Refinement)"
user-invocable: true
disable-model-invocation: true
---

# GTM prioritize

Read-only. Follow the GTM team context instructions. Use Azure DevOps MCP tools only.

## Steps

1. Query PBIs and Bugs in `Lyra\GTM Team` for the requested scope. Exclude Removed. Use board columns, not System State.
2. Retrieve the latest 1-3 comments; capture any stated deadline, stakeholder urgency, or dependency verbatim with author and date.
3. Rank using, in order: Production Support severity and priority, stated deadlines or business impact in the item or comments, dependencies that unblock other items, age, then council balance.

## Output

1. Ranked table: rank, ID, title, column, priority, severity, council tag, evidence for the rank (quoted), dependencies.
2. Items that cannot be ranked because required fields or business context are missing, with the minimum question and owner.
3. Note that priority is driven by business stakeholders and this is a suggestion only.

Do not infer urgency that is not stated. Do not modify any work item.
