---
name: gtm-sprint-planning
description: "Prepare GTM Team sprint planning from Azure DevOps: ready backlog candidates, carryover, production support load, capacity, and a proposed commitment."
argument-hint: "Optional: target sprint name, for example Sprint 25"
user-invocable: true
---

# GTM sprint planning

Read-only. Follow the GTM team context instructions (org `ablcode`, project `Lyra`, team `GTM Team`, area `Lyra\GTM Team`). Use Azure DevOps MCP tools only. Never change Iteration Path or Board Column; present a proposal only.

## Steps

1. Identify the target sprint (supplied, otherwise the next iteration after the current one via `work` list_team_iterations) and the sprint dates; if ambiguous, ask.
2. Gather capacity per person (`work` get_team_capacity) including days off. If none is configured, say so.
3. Collect candidates by board column: carryover from the current sprint (Committed, In Dev, In QA, In UAT), then Ready, then In Refinement items close to Ready.
4. Collect open Production Support/bugs with severity, priority, and age.
5. Retrieve the latest 1-3 comments for every candidate and flag blockers, missing information, or contradictions with the column.
6. Check readiness for each candidate: description with user story, business problem, numbered acceptance criteria, area and iteration path, priority, tag/council, assignee, IR # when applicable. List exactly what is missing.

## Output

1. Sprint and capacity summary.
2. Carryover table (ID, title, column, remaining work, latest comment).
3. Ready candidates ranked by priority, then council tag; note dependencies.
4. Production Support load (severity, priority, age).
5. Not-ready items with specific gaps and an owner to resolve each.
6. Proposed commitment that fits stated capacity, with rationale. State that effort estimates are missing wherever they are.
7. Risks and dependencies: for each, likelihood and impact as stated in comments or links (otherwise "not assessed"), an owner, and a proposed mitigation.
8. Decomposition candidates: committed PBIs with no child Tasks or with many unrelated acceptance criteria, with a suggested split by role (dev, QA, UAT, release). Offer `gtm-work-item-author` to draft them.
9. Suggested sprint goal as one sentence, for the team to confirm.

Do not infer sprint commitment from comments. Do not update any work item unless the user explicitly asks, and list exact fields first.
