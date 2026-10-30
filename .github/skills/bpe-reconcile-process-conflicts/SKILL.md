---
name: bpe-reconcile-process-conflicts
description: "Merge per-source process extractions into one sequence, labeling each step Confirmed, Conflicting, Inferred, or Gap, and produce an open-questions list."
argument-hint: "Extraction tables from bpe-extract-process-steps"
user-invocable: true
---

# Reconcile process conflicts

Read-only. Follow `bpe-process-documentation.instructions.md`.

## Steps
1. Align steps across sources into one ordered flow; keep regional or system variants as branches.
2. Label each step: Confirmed (explicit), Conflicting (cite each source), Inferred (state reasoning), Gap (missing step, owner, or rule).
3. Prefer newer and more authoritative sources but never silently choose; show the disagreement.
4. Trace data: source record, integration, transformation, destination, reporting. Flag unclear systems of record and matching identifiers.
5. Identify manual steps and whether each is stated as an intentional control or a workaround; do not assume.

## Output
Merged step list with labels, conflicts table, gaps, and open questions, each with a suggested owner type (business, Salesforce, Oracle, integration, QA).
