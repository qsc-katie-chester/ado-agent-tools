---
name: gtm-monthly-report
description: "Run the monthly GTM leadership report for a supplied month or date range using ADO and production Salesforce Intake Request evidence."
argument-hint: "Month and year or inclusive start/end dates, for example September 2026"
user-invocable: true
disable-model-invocation: true
---

# Monthly GTM leadership report

This is the explicitly invoked slash-command entry point for the personal GTM Monthly Leadership Report agent. A skill does not automatically change the selected agent or its tool permissions.

## Azure DevOps MCP instructions

- Use the Azure DevOps MCP tools provided by Git DevOps Assistant (MCP Powered). Organization: `ablcode`; project: `Lyra`; team: `GTM Team`; exact area: `Lyra\GTM Team`. Follow the workspace's `.github/copilot-instructions.md` when available and the agent's self-contained GTM reporting rules.
- `adoContext`, `adoMyWorkItems`, and the `/ado` companion command are optional. Do not stop because they are absent. Verify the established context through enabled MCP reads instead.
- Monthly deployment and creation metrics span the supplied dates across all relevant GTM sprints. The current-sprint default applies only to the current-sprint outlook, not to historical metrics or the entire backlog.
- Read-only team/iteration discovery is allowed to resolve GTM context. Keep report records in the exact GTM area; do not expand to other teams. Project-level WIQL is valid when a team-specific endpoint is unavailable.
- Use board columns, not System State, for reporting. Retrieve recent comments and disclose contradictions. Preserve IR references verbatim. Never change external records or configuration.
- Missing optional helpers or a cross-sprint reporting period do not imply denied authorization. Attempt the enabled scoped MCP reads; report actual permission errors without bypassing them.

## Salesforce MCP instructions

- Use `salesforce/get_username` to resolve the current workspace's target-org when the user has not supplied a production alias. Disclose the returned setting type, location, and value. Do not assume that a local default such as QA is production.
- Use `salesforce/run_soql_query` to verify the intended org through `Organization` identity and `IsSandbox`, then inspect object/field metadata before business queries. Reuse the verified production alias and absolute workspace directory.
- Analyze `Intake_Request__c` across all councils, excluding current `Closed` and `On Hold` statuses using metadata-verified field names. Include missing status/priority as data-quality gaps.
- Query current status/priority distributions and in-period history or substantive dated activity for movement, prioritization, and blockers. LastModifiedDate alone is not progress. Use only verified ADO/IR relationships.
- Exhaust all result pages. If a read query returns a pending operation, use `salesforce/resume_tool_operation` with its returned identifier; never resume a write/deployment operation.
- Do not use Salesforce CLI, browser, direct API calls, sandbox data, or cached exports as substitutes. If production access, required metadata, or historical coverage actually fails, state the precise blocker and save no partial report.

1. Read the complete [GTM Monthly Leadership Report workflow](../../agents/gtm-monthly-leadership.agent.md). Follow its body instructions for this run, including evidence, read-only external access, production verification, reporting scope, completeness, and publication rules.
2. Use the timeframe supplied with this command. If absent or ambiguous, ask for a month/year or inclusive start/end dates. Do not infer the timeframe from examples.
3. Use the selected agent's enabled MCP read tools to verify access. If required data operations are unavailable after checking supported equivalents, or the workflow cannot be read, explain the exact prerequisite and save no report. Missing optional helpers alone must not block the run. Do not broaden permissions, delegate, or use alternate data sources.
4. Run the workflow using the current agent. Do not execute tool calls from the example invocations or treat frontmatter in the referenced file as a tool invocation.
5. Save only the complete, verified report to the destination specified in the workflow. Return its link, a concise executive summary, and prioritized actions. A required-data failure must produce only an actionable blocker, not a partial report file.

Examples:
- `/gtm-monthly-report September 2026`
- `/gtm-monthly-report 2026-09-01 through 2026-09-30`
