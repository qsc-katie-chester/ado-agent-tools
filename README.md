# ado-agent-tools

Shared GitHub Copilot agents, skills and instructions for the GTM / Business Process Engineering (BPE) team.

## Start here

There are only **two agents**. Pick one in the agent picker of GitHub Copilot and describe the task in plain English; the agent selects the matching skill. You can also call any workflow directly with its `/skill-name` command. If you are unsure, type `/gtm-help` or `/bpe-help` for a menu.

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

Skills are the workflows behind each agent. Plain-English routing and direct `/skill-name` invocation are both supported. Write-capable skills must show the exact content, target, and fields before asking for explicit approval; no preview means no write.

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

`.github/instructions/` holds shared rules: `gtm-team-context` (project, board columns, roster, guardrails), `work-item-formatting` (titles, user story, AC format), and `bpe-process-documentation` (evidence rules, page template). They are not automatically attached to every chat; each agent is instructed to read the relevant files at the start of a task.

## Install

Full walkthrough: [docs/training/](docs/training/00-start-here.md). Short version:

1. Get access to this repo with your existing GitHub login.
2. Add (clone) the repo in the GitHub Copilot desktop app.
3. Open the cloned repo in the app. The agents, skills and instructions in `.github/` are found automatically; no install step is needed.
4. Connect the MCP servers below.
5. Pick **GTM Agent** or **BPE Agent**, and type `/gtm-help` or `/bpe-help`.

To update later, use the **Update repo and Copilot** steps below. Existing conversations keep their loaded context; start a new session after updating to use the refreshed agent and skill files.

### Update the repo and your Copilot sessions

After an approved change is merged, open a clean checkout of this repo on `main` (or the branch that receives the merged updates) and run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\update.ps1
```

The script fast-forwards the current branch, validates the configuration, then copies the agents, skills, and instructions to `C:\Users\<you>\.copilot\`. It refuses to pull if the working tree has uncommitted changes. Restart Copilot and start a **new session** to load the update. If you only want to copy the current checkout without pulling, pass `-SkipPull`. To keep the agents available in the repository only, pull the merged changes and start a new session in that repo; the personal install is not needed.

The lower-level `scripts\install.ps1` remains available to copy a checkout without pulling. Existing same-name files are replaced; unrelated personal files are left alone, and listed retired agents/skills are moved to `backup-retired`.

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
- Machine-specific server IDs were converted to the generic names above. The Salesforce connector's configured server name must be `salesforce`, matching the tools in agent frontmatter.
- Tool names inside each server (for example `searchConfluence`, `wit_work_item`) depend on the MCP server product you install. If your Atlassian or Salesforce server exposes different tool names, update the `tools:` list in the agent file.
- The monthly leadership report no longer has its own agent; it is the `gtm-monthly-report` skill run by the GTM Agent.
- The tool names shown are the repository's contract; verify the installed connector exposes them with Exercise 1. If a connector uses different names, update its configuration or the agent allowlist together and include that change in the same PR.

## What changed (consolidation)

Eight agents became two. Retired agents: BPE Change Impact Analyst, Readiness Checker, Test and UAT Coverage, Process Cartographer, Meeting Recap, Process Flow Builder (all now **BPE Agent**), GTM ADO Agent (now **GTM Agent**) and GTM Monthly Leadership Report (now the `gtm-monthly-report` skill). Merged skills: `gtm-my-work` + `gtm-work-item-summary` -> `gtm-work-lookup`; `gtm-bug-triage` + `gtm-bug-report` -> `gtm-bugs`; `bpe-find-process-sources` + `bpe-mine-ado-for-process` + `bpe-m365-research-prompt` -> `bpe-gather-sources`.

## Privacy

`.github/instructions/gtm-team-context.instructions.md` contains a team roster (names and roles) and the ADO organization and project names. Keep this repository **private** and share it only with the team.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).
