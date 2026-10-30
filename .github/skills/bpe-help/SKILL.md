---
name: bpe-help
description: "Menu of what the BPE Agent can do: the bpe-* skills with example prompts. Start here if you are unsure what to ask."
user-invocable: true
disable-model-invocation: true
---

# BPE help

Show this list, then ask which job the user wants. Do not call tools unless they pick one. You do not need to remember commands: pick the **BPE Agent** and say what you need in plain English.

| Say something like | Command | Who benefits |
|---|---|---|
| "PBI 12345 just arrived. What process steps change and what is impacted?" | `/bpe-map-change-to-process`, `/bpe-assess-change-impact`, `/bpe-create-change-brief` | Dev, QA, PM |
| "Is PBI 12345 ready for refinement?" | `/bpe-definition-of-ready-check` | PM, Scrum Master |
| "What should QA/UAT cover for PBI 12345?" | `/bpe-coverage-gap-report` | QA, PM |
| "Document the Quote to Cash process" | `/bpe-gather-sources`, `/bpe-extract-process-steps`, `/bpe-reconcile-process-conflicts`, `/bpe-draft-process-doc`, `/bpe-publish-process-doc` | PM, process owners |
| "Here is a meeting or training transcript" (recap) | `/bpe-ingest-transcript` | PM |
| "Draw the flow for this process page" | `/bpe-process-doc-to-diagram` | Everyone |
| "I need facts from Teams, email, or recordings" | `/bpe-gather-sources` (M365 prompt mode) | PM |
| "Mine ADO for process facts" (on request only) | `/bpe-gather-sources` (ADO mode), `/bpe-build-change-register`, `/bpe-tag-work-items-with-process` | PM |

Everyday ADO work (standup, sprint, bugs, work items, reports) belongs to the **GTM Agent** (`/gtm-help`).

All BPE tools are read-only until you approve a previewed write. Every statement is labeled Confirmed, Conflicting, Inferred, or Gap with its source.
