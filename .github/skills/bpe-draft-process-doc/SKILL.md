---
name: bpe-draft-process-doc
description: "Draft the business process document in the standard BPE template from reconciled steps, including source map and open questions. Draft only; does not publish."
argument-hint: "Process name plus reconciled output"
user-invocable: true
disable-model-invocation: true
---

# Draft process document

Follow the template in `bpe-process-documentation.instructions.md`. Business-friendly, direct, no filler.

## Steps
0. First propose the sub-process breakdown (overview + one page per sub-process, per the page hierarchy rule) and get it confirmed. Then draft the overview and ONE sub-process page at a time, showing each to the user first.
1. Fill every template section; mark unknown owners and approvers as unverified rather than guessing.
2. Keep the confidence label on every step row and include the source map, including unreadable sources.
3. Add a placeholder for the process flow diagram.
4. Save the draft as a local Markdown file in the session files folder and summarize: step count, conflicts, gaps, open questions.

## Output
Draft file path plus summary. Ask the user to review. Do not publish, update ADO, or notify anyone without confirmation; stop here until the user reviews. Do not invent steps, owners, or rules, and do not assume the first described solution is correct. List gaps with a suggested owner type for the user to decide. Images and Miro/Figma boards cannot be created by these tools; leave placeholders and say so.

## Whole-process pipeline
Typical order: `bpe-gather-sources` (find, optional M365 prompt) -> `bpe-extract-process-steps` -> `bpe-reconcile-process-conflicts` -> this skill -> `bpe-publish-process-doc` (after approval). Transcripts go through `bpe-ingest-transcript`.
