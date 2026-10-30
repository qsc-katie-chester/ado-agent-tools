---
name: bpe-help
description: "List the BPE agents and skills (process documentation, change impact, readiness, UAT coverage, meeting recap, flows), what each is for, and when to use it."
user-invocable: true
disable-model-invocation: true
---

# BPE help

Show this list, then ask which job the user wants. Do not call tools unless they pick one.

| Job | Use | Who benefits |
|---|---|---|
| "A new enhancement arrived. What process steps change and what is impacted?" | **BPE Change Impact Analyst** | Dev, QA, PM |
| "Is this PBI/bug ready for refinement?" | **BPE Readiness Checker** (`/bpe-definition-of-ready-check`) | PM, Scrum Master |
| "What should QA/UAT cover for this item?" | **BPE Test and UAT Coverage** (`/bpe-coverage-gap-report`) | QA, PM |
| "Document or update a process" | **BPE Process Cartographer** (`/bpe-find-process-sources`, `/bpe-extract-process-steps`, `/bpe-draft-process-doc`, `/bpe-publish-process-doc`) | PM, process owners |
| "Here is a meeting or training transcript" | **BPE Meeting Recap** (`/bpe-ingest-transcript`) | PM |
| "Draw the flow for this process page" | **BPE Process Flow Builder** (`/bpe-process-doc-to-diagram`) | Everyone |
| "I need facts from Teams, email, or recordings" | `/bpe-m365-research-prompt` (prompt to paste into M365 Researcher) | PM |
| "Sources disagree" | `/bpe-reconcile-process-conflicts` | PM, process owners |
| "Mine ADO items/tests for process facts" (on request only) | `/bpe-mine-ado-for-process`, `/bpe-build-change-register`, `/bpe-tag-work-items-with-process` | PM |

Everyday ADO work (standup, sprint, bugs, work items, reports) stays with `/gtm-help` and the GTM ADO Agent.

All BPE tools are read-only until you approve a previewed write. Every statement is labeled Confirmed, Conflicting, Inferred, or Gap with its source.
