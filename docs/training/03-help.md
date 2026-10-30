# 3. Cheat sheet, feedback and troubleshooting

## Cheat sheet

| I want to... | Use |
|---|---|
| See what is available | `/bpe-help`, `/gtm-help` |
| Summarize one item | GTM Agent, `/gtm-work-lookup <ID>` |
| Standup / sprint health | `/gtm-daily-standup`, `/gtm-scrum-master` |
| Is a PBI ready? | BPE Agent, `/bpe-definition-of-ready-check` |
| What does an enhancement change? | BPE Agent, `/bpe-assess-change-impact` |
| What should QA/UAT cover? | BPE Agent, `/bpe-coverage-gap-report` |
| Recap a meeting | BPE Agent, `/bpe-ingest-transcript` |
| Document a process | BPE Agent, `/bpe-gather-sources` then `/bpe-draft-process-doc` |
| Draw a process flow | BPE Agent, `/bpe-process-doc-to-diagram` |
| Draft a work item or UAT guide | `/gtm-work-item-author`, `/gtm-uat-document` |
| Bug triage / report | `/gtm-bugs` |

**Labels:** Confirmed (in a source) · Conflicting (sources disagree) · Inferred (reasoned) · Gap (not found).
**Safety:** read-only until you approve a preview. Never test in production. No secrets in chat.
**Good prompts:** include the ID (PBI, IR number), the process name, and the output you want.

## Give feedback or propose a change

- **Something was wrong:** on github.com open the repo > **Issues** > **New issue**. Say what you asked, expected, and got. Remove confidential data.
- **Improve a skill or agent:** open the file on github.com, click the pencil, make one small change, choose **Create a new branch and start a pull request**, and describe how you tested it. Katie reviews and approves. See [CONTRIBUTING.md](../../CONTRIBUTING.md).
- Never remove the read-only rules or rename MCP servers.

## Troubleshooting

| Problem | Try this |
|---|---|
| Repo shows 404 | Not invited yet, or wrong GitHub account. Check with Katie. |
| `/bpe-help` missing | Check `C:\Users\<you>\.copilot\skills\bpe-help` exists, then fully reopen the app. |
| Install script blocked | Run it exactly as written. If IT blocks it, copy the `agents`, `skills` and `instructions` folders into `C:\Users\<you>\.copilot\` by hand. |
| Cannot reach Azure DevOps, Confluence or Salesforce | Check the server is signed in and its name matches the setup table exactly. |
| "Tool not found" | The server may name tools differently. Tell Katie. |
| Salesforce production not verified | Ask Katie for the production alias. |
| No sources or labels in an answer | Re-ask: "Cite sources and label each statement Confirmed, Conflicting, Inferred or Gap." Report it. |
| Answer looks wrong | Do not use it. Check the source and file an issue. |
| Agent wants to change something | Read the preview. Say "no" unless you meant it. |
| Anything else | Send Katie the exact error text, minus confidential data. |
