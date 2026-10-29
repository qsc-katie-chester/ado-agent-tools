---
name: gtm-help
description: "List the GTM Team Azure DevOps skills and agent, what each does, and example prompts."
user-invocable: true
disable-model-invocation: true
---

# GTM help

Show this list, then ask which workflow the user wants. Do not call any tools unless the user picks one.

| Command | What it does |
|---|---|
| `/gtm-daily-standup` | Team standup for the current sprint |
| `/gtm-scrum-master` | Sprint health, blockers, flow, hygiene, capacity |
| `/gtm-sprint-planning` | Candidates, carryover, capacity, proposed commitment |
| `/gtm-sprint-retro` | Delivered vs. committed, carryover, discussion prompts |
| `/gtm-backlog-refinement` | Readiness gaps against the GTM formatting standard |
| `/gtm-bug-triage` | Severity, priority, duplicates, owner suggestions |
| `/gtm-bug-report` | Stakeholder bug report by Functional Council |
| `/gtm-work-item-author` | Draft, split, or decompose work items (preview first) |
| `/gtm-my-work` | A person's assigned work and next action |
| `/gtm-work-item-summary` | Summary of one work item or IR # |
| `/gtm-update` | Confirmed field updates or comments |
| `/gtm-prioritize` | Evidence-based backlog ranking |
| `/gtm-docs` | Wiki and work item search |
| `/gtm-monthly-report` | Monthly GTM leadership report |

The **GTM ADO Agent** handles any other Azure DevOps request for `Lyra\GTM Team` and routes to these skills. All skills are read-only except `/gtm-update` and `/gtm-work-item-author`, which preview and require confirmation before writing.
