---
name: gtm-bug-report
description: "Produce the GTM stakeholder bug report (weekly, twice-weekly, or biweekly) by Functional Council from Azure DevOps."
argument-hint: "Optional: reporting period or 'since last update' date"
user-invocable: true
disable-model-invocation: true
---

# GTM bug report

Read-only. Apply the "GTM bug report standard" in the GTM team context instructions exactly. Use Azure DevOps MCP tools only; no browser or GitHub tools.

## Steps

1. Query Bugs with Area Path under `Lyra\GTM Team`. Exclude State `Closed`, `Done`, `Removed` and Board Column `Deployed`.
2. For every in-scope bug, retrieve the latest 1-3 comments (author and date). Compute Age (days), Last Activity Date (latest comment, fallback Changed Date), and Days Since Activity.
3. Group each bug into exactly one section: Technical Support, Technical Services, Sales Ops + Enablement, SAT, Customer Experience, Marketing, or Unassigned Council. Use tags exactly as written.
4. Collect Closed This Week count in total and by council (summary only).
5. Resolve status from comments first; state any comment/column mismatch explicitly.

## Output order

1. Report Metadata
2. Executive Summary
3. Functional Council Snapshot
4. Functional Council Detail Tables (all required bug-level fields, including a concrete next step, action owner, target date if available)
5. Aging and Escalation View
6. Board Column Distribution
7. Action Register

Include the required summary metrics (total active, new since last update, aging >= 14 and >= 30 days, stale >= 7 days, In QA / In UAT / Ready to Deploy counts, top 3 business risks). Write concisely for business stakeholders. Do not modify any work item.
