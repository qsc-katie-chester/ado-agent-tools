---
name: gtm-bug-triage
description: "Triage new or untriaged GTM bugs: propose severity and priority, detect duplicates, flag missing information, and suggest owner and council tag."
argument-hint: "Optional: bug ID, council tag, or 'new bugs' (default: untriaged bugs)"
user-invocable: true
disable-model-invocation: true
---

# GTM bug triage

Follow the GTM team context instructions (severity and priority definitions, council tags, roster). Use Azure DevOps MCP tools only. Proposals only; apply changes solely after the user confirms the exact fields.

## Steps

1. Select bugs in `Lyra\GTM Team` that are in the New or Scoping columns, or missing Severity, Priority, council tag, or assignee. Exclude Removed, Done, Deployed.
2. For each bug, retrieve fields and the latest 1-3 comments.
3. Check completeness: impacted system (Salesforce, Oracle, Five9), reproduction steps, expected vs. actual result, environment, impact. List what is missing; do not guess.
4. Propose Severity (1-4, team-determined) using the definitions in the context file, with the evidence. Priority comes from business stakeholders; show a suggestion only if the bug states business impact, otherwise mark it as needed from the stakeholder.
5. Detect likely duplicates by title, IR #, error text, and area; cite the IDs.
6. Suggest a council tag and owner (by role from the roster) with the reason.

## Output

1. Table: ID, title, column, proposed severity, priority (suggested or needed), council tag, suggested owner, duplicates, missing info.
2. Bugs ready to move forward vs. bugs to return for more information.
3. Exact field changes that would be applied, listed for confirmation. Never change Board Column, Area Path, or Iteration Path unless explicitly asked.
