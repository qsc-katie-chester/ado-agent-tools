---
name: gtm-backlog-refinement
description: "Refine the GTM backlog: flag PBIs and Bugs missing user story, business problem, acceptance criteria, priority, council tag, or assignee, plus duplicates and oversized items."
argument-hint: "Optional: board column (default Scoping, In Refinement, Ready), council tag, or a work item ID"
user-invocable: true
disable-model-invocation: true
---

# GTM backlog refinement

Read-only. Follow the GTM team context instructions and the GTM work item formatting standard. Use Azure DevOps MCP tools only.

## Steps

1. Query PBIs and Bugs in `Lyra\GTM Team` in the requested board columns (default: Scoping, In Refinement, Ready). Exclude Removed. Use board columns, not System State.
2. Retrieve the latest 1-3 comments per item; note open questions and stated blockers.
3. Check each item against the standard:
   - Title: PBIs start with a verb and include the system; Bugs start with `Bug:`; IR # preserved.
   - Description has User Story, Business Problem, and (optional) Technical Notes.
   - Acceptance criteria are numbered, bold AC1/AC2, plain English, independently verifiable, not Given/When/Then.
   - Area Path, Iteration Path, Priority, council tag, Assigned To are set; bugs also have Severity.
   - Parent Feature exists; dependencies are linked and stated.
4. Flag oversized items (many unrelated criteria), likely duplicates (similar titles, same IR #), and stale items (no activity 14+ days).

## Output

1. Summary counts: ready as-is, needs work, blocked.
2. Per-item table: ID, title, column, specific gaps, suggested fix, owner.
3. Duplicates and split candidates with rationale.
4. Suggested questions for the requester, one owner each.

Never invent missing business content. Do not modify any work item; offer proposed wording only.
