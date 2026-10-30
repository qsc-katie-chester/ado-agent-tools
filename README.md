# ado-agent-tools

Shared GitHub Copilot agents, skills and instructions for the GTM / Business Process Engineering (BPE) team.

## Start here

There are only **two agents**. Pick one in the agent picker of the GitHub Copilot desktop app and type what you need in plain English. You do not need to remember any skill names; the agent chooses the right skill. If you are unsure, type `/gtm-help` or `/bpe-help` for a menu.

| Agent | Use it for | Example prompts |
|---|---|---|
| **GTM Agent** | Everyday Azure DevOps work for `Lyra\GTM Team`: standups, sprints, backlog, bugs, work items, UAT guides, reports | `Daily standup` · `Triage new bugs` · `Bug report for stakeholders` · `Summarize PBI 12345` · `What is on my plate?` · `Draft a PBI for IR 24718` · `Plan the next sprint` · `Monthly leadership report for September 2026` |
| **BPE Agent** | Business process documentation, change impact, readiness, UAT coverage, flows, meeting recaps | `PBI 12345 just arrived: what process steps change and what is impacted?` · `Is PBI 12345 ready for refinement?` · `What should QA/UAT cover for PBI 12345?` · `Document the Quote to Cash process` · `Recap this transcript` · `Draw the flow for this process page` |

Not sure which agent? Anything about sprints, boards, bugs, and reports goes to GTM. Anything about "how the process works" or "what does this change affect" goes to BPE.

## Safety rules

- **Read-only by default.** Agents never change ADO, Confluence or Salesforce until you approve a previewed change.
- **Evidence labels.** Every statement is **Confirmed** (explicit in a source), **Conflicting** (sources disagree), **Inferred** (reasoned, with why) or **Gap** (not found), with its source.
- **Production Salesforce is read-only.** Agents verify org identity first. Never test in production.
- Board column is the status signal. Recent comments win over the column, and the agent states any discrepancy.
- Do not paste passwords, tokens or customer data into a chat.

New to GitHub and Copilot? See [docs/training/](docs/training/00-start-here.md).

## Skills (slash commands)

Skills are the steps behind each agent. You can type `/` plus the name directly, but you never have to.

**GTM Agent skills**

| Command | What it does |
|---|---|
| `/gtm-help` | Menu |
| `/gtm-daily-standup`, `/gtm-scrum-master`, `/gtm-sprint-planning`, `/gtm-sprint-retro` | Scrum ceremonies and sprint health |
| `/gtm-backlog-refinement`, `/gtm-prioritize` | Refinement gaps and ranking |
| `/gtm-bugs` | Bug triage, or stakeholder bug report by Functional Council |
| `/gtm-work-lookup` | A person's assigned work, or a one-item / IR # summary |
| `/gtm-work-item-author`, `/gtm-update` | Draft or update work items (preview, then confirm) |
| `/gtm-definition-of-done` | Check whether an item is truly done (AC, QA, UAT, SOX comment, release) |
| `/gtm-handoff` | Draft a structured handoff note for a work item |
| `/gtm-uat-document` | Lightweight UAT guide in Confluence |
| `/gtm-docs` | Wiki and work item search |
| `/gtm-monthly-report` | Monthly GTM leadership report |
| `/new-product-launch` | Product launch workflow |

**BPE Agent skills**

| Command | What it does |
|---|---|
| `/bpe-help` | Menu |
| `/bpe-map-change-to-process`, `/bpe-assess-change-impact`, `/bpe-create-change-brief` | Change impact for an enhancement |
| `/bpe-definition-of-ready-check` | Definition of Ready check |
| `/bpe-coverage-gap-report` | QA/UAT coverage gaps |
| `/bpe-gather-sources` | Find sources, mine ADO for process facts, or build an M365 Researcher prompt |
| `/bpe-extract-process-steps`, `/bpe-reconcile-process-conflicts`, `/bpe-draft-process-doc`, `/bpe-publish-process-doc` | Process documentation pipeline (publish needs approval) |
| `/bpe-ingest-transcript` | Transcript recap and proposed page updates |
| `/bpe-process-doc-to-diagram` | Process page to flow diagram |
| `/bpe-build-change-register`, `/bpe-tag-work-items-with-process` | Change register and `proc:` tags (on request only) |

## Instructions

`.github/instructions/` holds shared rules the agents follow: `gtm-team-context` (project, board columns, roster, guardrails), `work-item-formatting` (titles, user story, AC format), `bpe-process-documentation` (evidence rules, page template). They have no `applyTo: "**"` pattern, so they are not forced into every chat; agents reference them by name.

## Install

Full walkthrough: [docs/training/](docs/training/00-start-here.md). Short version:

1. Get access to this repo with your existing GitHub login.
2. Add (clone) the repo in the GitHub Copilot desktop app.
3. Open the cloned repo in the app. The agents, skills and instructions in `.github/` are found automatically; no install step is needed.
4. Connect the MCP servers below.
5. Pick **GTM Agent** or **BPE Agent**, and type `/gtm-help` or `/bpe-help`.

To update later: `git pull`, then start a new session.

### Optional: use the agents outside this repo

To have the agents available in every project, run from the repo folder:
`powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1`
This copies `.github/agents`, `.github/skills` and `.github/instructions` to `C:\Users\<you>\.copilot\` and moves any retired agent and skill files from earlier versions into `C:\Users\<you>\.copilot\backup-retired\`. Run it again after each `git pull`.

## MCP servers each teammate must connect

Agent tool lists use these **exact server names**. Name each server in your Copilot MCP settings exactly as shown, or the agent cannot call its tools.

| Server name | Needed for | Required? |
|---|---|---|
| `azure-devops` | All ADO work (organization `ablcode`, project `Lyra`) | Yes |
| `atlassian` | Confluence and Jira: process pages, UAT guides, publishing | Yes for BPE Agent and UAT guides |
| `salesforce` | Read-only Salesforce queries (intake requests, org verification) | Yes for change impact, process mapping, monthly report |
| `miro` | Process flow diagrams on Miro boards | Optional |
| `figma` | Process flow diagrams in FigJam | Optional |

**Portability notes**
- Machine-specific server IDs were converted to the generic names above. Skill text refers to `salesforce/...` tools; agent frontmatter matches.
- Tool names inside each server (for example `searchConfluence`, `wit_work_item`) depend on the MCP server product you install. If your Atlassian or Salesforce server exposes different tool names, update the `tools:` list in the agent file.
- The monthly leadership report no longer has its own agent; it is the `gtm-monthly-report` skill run by the GTM Agent.
- Not verified on a second machine: that `server/tool` names resolve for your Copilot client. Test with Exercise 1.

## What changed (consolidation)

Eight agents became two. Retired agents: BPE Change Impact Analyst, Readiness Checker, Test and UAT Coverage, Process Cartographer, Meeting Recap, Process Flow Builder (all now **BPE Agent**), GTM ADO Agent (now **GTM Agent**) and GTM Monthly Leadership Report (now the `gtm-monthly-report` skill). Merged skills: `gtm-my-work` + `gtm-work-item-summary` -> `gtm-work-lookup`; `gtm-bug-triage` + `gtm-bug-report` -> `gtm-bugs`; `bpe-find-process-sources` + `bpe-mine-ado-for-process` + `bpe-m365-research-prompt` -> `bpe-gather-sources`.

## Privacy

`.github/instructions/gtm-team-context.instructions.md` contains a team roster (names and roles) and the ADO organization and project names. Keep this repository **private** and share it only with the team.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).
