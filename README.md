# ado-agent-tools

Shared GitHub Copilot agents, skills and instructions for the GTM / Business Process Engineering (BPE) team.

## Goal

Repeatable assistants that cut manual workload and keep answers evidence-based:

- **Process documentation**: find sources, extract steps, draft and publish process pages in Confluence.
- **Change impact for Dev and QA**: which process steps, systems and tests an enhancement touches.
- **Readiness**: check PBIs and bugs against the Definition of Ready before refinement.
- **UAT and test coverage**: map acceptance criteria to existing QA cases and UAT guides, find gaps.
- **Meeting recaps**: turn transcripts into facts, decisions, open questions and actions.
- **ADO authoring and scrum**: standups, sprint planning, bug triage and reports, work item drafting.

New to GitHub and Copilot? Start with [docs/training/](docs/training/00-start-here.md).

## Safety rules

- **Read-only by default.** Agents never change ADO, Confluence or Salesforce until you approve a previewed change.
- **Evidence labels.** Every statement is **Confirmed** (explicit in a source), **Conflicting** (sources disagree), **Inferred** (reasoned, with why) or **Gap** (not found), with its source.
- **Production Salesforce is read-only.** Agents verify org identity first. Never test in production.
- Board column is the status signal. Recent comments win over the column, and the agent states any discrepancy.
- Do not paste passwords, tokens or customer data into a chat.

## Agents

Pick an agent from the agent list in the Copilot app, or in the CLI use `/agent`.

| Agent | Use it when | Who |
|---|---|---|
| BPE Change Impact Analyst | A new enhancement, intake request, PBI or bug arrives and you need the process steps changed and impacted | Dev, QA, PM |
| BPE Readiness Checker | Before refinement or commitment: is this item ready? | PM, Scrum Master |
| BPE Test and UAT Coverage | What should QA/UAT cover; find coverage gaps | QA, PM |
| BPE Process Cartographer | Document or update an end-to-end process | PM, process owners |
| BPE Meeting Recap | You have a meeting, workshop or training transcript | PM |
| BPE Process Flow Builder | Draw the flow (Mermaid, Miro or Figma) for a process page | Everyone |
| GTM ADO Agent | Any Azure DevOps work for `Lyra\GTM Team`; routes to the GTM skills | Everyone |
| GTM Monthly Leadership Report | Monthly leadership report (deployed PBIs, bugs by council) | PM |

## Skills (slash commands)

Type `/` followed by the name. `/bpe-help` and `/gtm-help` list everything.

| Command | What it does |
|---|---|
| `/bpe-help` | Lists BPE agents and skills and when to use each |
| `/bpe-assess-change-impact`, `/bpe-map-change-to-process`, `/bpe-create-change-brief` | Change impact work for an enhancement |
| `/bpe-definition-of-ready-check` | Definition of Ready check |
| `/bpe-coverage-gap-report` | QA/UAT coverage gaps |
| `/bpe-find-process-sources`, `/bpe-extract-process-steps`, `/bpe-draft-process-doc`, `/bpe-publish-process-doc` | Process documentation pipeline (publish needs approval) |
| `/bpe-ingest-transcript` | Meeting or training transcript recap |
| `/bpe-process-doc-to-diagram` | Process page to flow diagram |
| `/bpe-m365-research-prompt` | Prompt to paste into M365 Researcher for Teams, email, recordings |
| `/bpe-reconcile-process-conflicts` | Sources disagree |
| `/bpe-mine-ado-for-process`, `/bpe-build-change-register`, `/bpe-tag-work-items-with-process` | Mine ADO for process facts, change register, tag items (on request only) |
| `/gtm-help` | Lists GTM skills |
| `/gtm-daily-standup`, `/gtm-scrum-master`, `/gtm-sprint-planning`, `/gtm-sprint-retro` | Scrum ceremonies and sprint health |
| `/gtm-backlog-refinement`, `/gtm-prioritize` | Refinement gaps and ranking |
| `/gtm-bug-triage`, `/gtm-bug-report` | Bug triage and stakeholder report |
| `/gtm-work-item-author`, `/gtm-update` | Draft or update work items (preview, then confirm) |
| `/gtm-my-work`, `/gtm-work-item-summary`, `/gtm-docs` | Assigned work, one-item summary, wiki and work item search |
| `/gtm-uat-document` | Lightweight UAT guide in Confluence |
| `/gtm-monthly-report` | Monthly GTM report |
| `/new-product-launch` | Product launch workflow |

## Instructions

`instructions/` holds shared rules the agents follow: `gtm-team-context` (project, board columns, roster, guardrails), `work-item-formatting` (titles, user story, AC format), `bpe-process-documentation` (evidence rules, page template). They have no `applyTo: "**"` pattern, so they are not forced into every chat; they load when relevant and agents reference them by name.

## Setup

Full walkthrough: [docs/training/](docs/training/00-start-here.md). Short version:

1. Get a GitHub account and access to this repo (training page 01).
2. Install Git and the GitHub Copilot app or CLI (page 02).
3. Clone the repo (page 03), then from the repo folder run:
   `powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1`
   This copies `agents`, `skills` and `instructions` to `C:\Users\<you>\.copilot\`.
4. Connect the MCP servers below (page 05).
5. Restart Copilot and type `/bpe-help`.

To update later: `git pull`, then run the install script again.

## MCP servers each teammate must connect

Agent tool lists use these **exact server names**. Name each server in your Copilot MCP settings exactly as shown, or the agent cannot call its tools.

| Server name | Needed for | Required? |
|---|---|---|
| `azure-devops` | All ADO work (organization `ablcode`, project `Lyra`) | Yes |
| `atlassian` | Confluence and Jira: process pages, UAT guides, publishing | Yes for BPE agents |
| `salesforce` | Read-only Salesforce queries (intake requests, cases, org verification) | Yes for change impact, process cartographer, monthly report |
| `miro` | Process flow diagrams on Miro boards | Optional |
| `figma` | Process flow diagrams in FigJam | Optional |

**Portability notes**
- Machine-specific server IDs were converted to the generic names above. Skill text refers to `salesforce/...` tools; agent frontmatter was updated to match.
- Tool names inside each server (for example `searchConfluence`, `wit_work_item`) depend on the MCP server product you install. If your Atlassian or Salesforce server exposes different tool names, update the `tools:` list in the agent file.
- `gtm-monthly-leadership` previously listed a VS Code extension (`MS-DAW-TCA.ado-productivity-copilot`). It was removed because it is optional and not portable; the agent works without it.
- Not verified on a second machine: that `server/tool` names resolve for your Copilot client. Test with Exercise 1.

## Privacy

`instructions/gtm-team-context.instructions.md` contains a team roster (names and roles) and the ADO organization and project names. Keep this repository **private** and share it only with the team.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).
