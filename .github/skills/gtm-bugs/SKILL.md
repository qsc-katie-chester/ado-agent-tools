---
name: gtm-bugs
description: "GTM bugs: triage untriaged bugs (severity, priority, duplicates, owner, council tag) or produce the stakeholder bug report by Functional Council."
argument-hint: "'triage' (optional bug ID, council tag, or 'new bugs') or 'report' (optional period or 'since last update' date)"
user-invocable: true
---

# GTM bugs

Read-only unless the user confirms exact field changes. Follow the GTM team context instructions (severity and priority definitions, council tags, roster, "GTM bug report standard"). Use Azure DevOps MCP tools only; no browser or GitHub tools. Choose the mode from the request: **triage** for new/untriaged bugs, **report** for the stakeholder update. If unclear, ask which.

## Mode 1: Triage

Proposals only; apply changes solely after the user confirms the exact fields.

1. Select bugs in `Lyra\GTM Team` that are in the New or Scoping columns, or missing Severity, Priority, council tag, or assignee. Exclude Removed, Done, Deployed.
2. For each bug, retrieve fields and the latest 1-3 comments.
3. Check completeness: impacted system (Salesforce, Oracle, Five9), reproduction steps, expected vs. actual result, environment, impact. List what is missing; do not guess.
4. Propose Severity (1-4, team-determined) using the definitions in the context file, with the evidence. Priority comes from business stakeholders; show a suggestion only if the bug states business impact, otherwise mark it as needed from the stakeholder.
5. Detect likely duplicates by title, IR #, error text, and area; cite the IDs.
6. Suggest a council tag and owner (by role from the roster) with the reason.

Output:
1. Table: ID, title, column, proposed severity, priority (suggested or needed), council tag, suggested owner, duplicates, missing info.
2. Bugs ready to move forward vs. bugs to return for more information.
3. Exact field changes that would be applied, listed for confirmation. Never change Board Column, Area Path, or Iteration Path unless explicitly asked.

## Mode 2: Stakeholder report

Read-only. Apply the "GTM bug report standard" exactly.

1. Query Bugs with Area Path under `Lyra\GTM Team`. Exclude State `Closed`, `Done`, `Removed` and Board Column `Deployed`.
2. For every in-scope bug, retrieve the latest 1-3 comments (author and date). Compute Age (days), Last Activity Date (latest comment, fallback Changed Date), and Days Since Activity.
3. Group each bug into exactly one section: Technical Support, Technical Services, Sales Ops + Enablement, SAT, Customer Experience, Marketing, or Unassigned Council. Use tags exactly as written.
4. Collect Closed This Week count in total and by council (summary only).
5. Resolve status from comments first; state any comment/column mismatch explicitly.

Output order:
1. Report Metadata
2. Executive Summary
3. Functional Council Snapshot
4. Functional Council Detail Tables (all required bug-level fields, including a concrete next step, action owner, target date if available)
5. Aging and Escalation View
6. Board Column Distribution
7. Action Register

Include the required summary metrics (total active, new since last update, aging >= 14 and >= 30 days, stale >= 7 days, In QA / In UAT / Ready to Deploy counts, top 3 business risks). Write concisely for business stakeholders. Do not modify any work item.
