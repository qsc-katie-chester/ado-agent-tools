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
1. Fill every template section; mark unknown owners and approvers as unverified rather than guessing.
2. Keep the confidence label on every step row and include the source map, including unreadable sources.
3. Add a placeholder for the process flow diagram.
4. Save the draft as a local Markdown file in the session files folder and summarize: step count, conflicts, gaps, open questions.

## Output
Draft file path plus summary. Ask the user to review. Do not publish.
