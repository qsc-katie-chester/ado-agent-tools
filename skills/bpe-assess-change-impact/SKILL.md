---
name: bpe-assess-change-impact
description: "For the process steps a change touches, identify upstream/downstream steps, systems, data, integrations, exceptions, reports, existing tests and UAT, related ADO items, and documentation that becomes stale."
argument-hint: "Output of bpe-map-change-to-process"
user-invocable: true
disable-model-invocation: true
---

# Assess change impact

Read-only. Follow `bpe-process-documentation.instructions.md`.

## Steps
1. For each affected step, list the steps immediately before and after and the handoffs between them.
2. Check, from the process doc and sources: systems and owners, systems of record, identifiers and matching, integrations and latency/failure recovery, exceptions and manual controls, regional differences, reports and observability.
3. Find related ADO items (open and recent) touching the same steps or objects; note possible conflicts or duplicates; do not merge or link anything.
4. Find existing test cases/suites and UAT guides covering those steps; list uncovered ACs or steps.
5. List documents that would become stale (process doc steps, UAT/QA guides, training).
6. Rate nothing as high/low unless a source states it. List the facts that drive concern (for example, a changed identifier used downstream).

## Change history
When the Q2C Process Change Register exists, read it (and the `proc:` tag via WIQL, on request) to show when each affected step last changed and which items and test cases touched it. Propose the `proc:` tag with `bpe-tag-work-items-with-process` (preview only).

## Output
Impact table by area (process, systems, data, integration, tests/UAT, reports, documentation, related work) with label and source. Then risks and open questions.
