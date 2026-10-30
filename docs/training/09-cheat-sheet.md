# 9. Cheat sheet

**Update toolkit:** `cd $HOME\source\ado-agent-tools` then `git pull` then `powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1`, restart Copilot.

| I want to... | Use |
|---|---|
| See what is available | `/bpe-help`, `/gtm-help` |
| Summarize one item | `/gtm-work-item-summary <ID>` |
| Daily standup / sprint health | `/gtm-daily-standup`, `/gtm-scrum-master` |
| Is a PBI ready? | BPE Readiness Checker, `/bpe-definition-of-ready-check` |
| What does an enhancement change? | BPE Change Impact Analyst |
| What should QA/UAT cover? | BPE Test and UAT Coverage, `/bpe-coverage-gap-report` |
| Recap a meeting | BPE Meeting Recap, `/bpe-ingest-transcript` |
| Document a process | BPE Process Cartographer |
| Draw a process flow | BPE Process Flow Builder |
| Draft a work item or UAT guide | `/gtm-work-item-author`, `/gtm-uat-document` |
| Bug triage / report | `/gtm-bug-triage`, `/gtm-bug-report` |

**Evidence labels:** Confirmed (in a source) · Conflicting (sources disagree) · Inferred (reasoned) · Gap (not found).

**Safety:** read-only until you approve a preview. Never test in production. No secrets in chat.

**Good prompts:** include the ID (PBI, IR number), the process name, and what you want back (table, summary, gaps).

**Always check:** sources cited? labels present? preview before any write?

**Stuck?** Page 10 of the training guide, then ask the facilitator. **Improve a skill?** Open a pull request; Katie approves.
