---
name: gtm-help
description: "Menu of what the GTM Agent can do: the gtm-* skills with example prompts. Start here if you are unsure what to ask."
user-invocable: true
disable-model-invocation: true
---

# GTM help

Show this list, then ask which workflow the user wants. Do not call any tools unless the user picks one. You do not need to remember commands: pick the **GTM Agent** and say what you need in plain English.

| Say something like | Command |
|---|---|
| "Daily standup" | `/gtm-daily-standup` |
| "How is the sprint? Any blockers?" | `/gtm-scrum-master` |
| "Plan the next sprint" | `/gtm-sprint-planning` |
| "Sprint retro" | `/gtm-sprint-retro` |
| "Is the backlog ready for refinement?" | `/gtm-backlog-refinement` |
| "Rank the backlog" | `/gtm-prioritize` |
| "Triage new bugs" / "Bug report for stakeholders" | `/gtm-bugs` |
| "Draft or split a work item" | `/gtm-work-item-author` |
| "What is on my plate?" / "Summarize PBI 12345" | `/gtm-work-lookup` |
| "Update PBI 12345" (previews first) | `/gtm-update` |
| "Is PBI 12345 really done?" | `/gtm-definition-of-done` |
| "Handoff note for PBI 12345 to QA" | `/gtm-handoff` |
| "UAT guide for PBI 12345" | `/gtm-uat-document` |
| "Search the wiki" | `/gtm-docs` |
| "Monthly leadership report for September 2026" | `/gtm-monthly-report` |
| "Plan a product launch" | `/new-product-launch` |

Process documentation, change impact, readiness and meeting recaps are handled by the **BPE Agent** (`/bpe-help`).

All skills are read-only except `/gtm-update` and `/gtm-work-item-author`, which preview and require confirmation before writing.
