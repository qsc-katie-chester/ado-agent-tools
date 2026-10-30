---
name: bpe-ingest-transcript
description: "Take a meeting, workshop, or training transcript (pasted, file path, or M365 export) and produce a proposed update to specific process pages: new or changed steps, owners, rules, decisions, and answers to open questions, each with a quote and timestamp."
argument-hint: "Transcript text or file path, plus meeting title, date, attendees, and the sub-process page(s) it relates to (optional)"
user-invocable: true
disable-model-invocation: true
---

# Ingest a transcript into process pages

Read-only until the user approves. Follow `bpe-process-documentation.instructions.md`.

## Steps
1. Record source metadata: title, date, type (meeting, workshop, training), attendees, and who is speaking when known. Transcripts are source type "spoken, unreviewed".
2. Map each relevant segment to a sub-process page (use the Quote to Cash index). Park off-topic content; route decisions that belong to another page instead of discarding them.
3. Extract, each with a short verbatim quote and timestamp or line reference:
   - steps, actors, systems, inputs/outputs, handoffs
   - business rules, thresholds, regional differences
   - exceptions and workarounds (flag workarounds vs intentional controls)
   - owners named for processes, systems, decisions
   - explicit decisions vs questions vs opinions (questions are not decisions)
   - terms defined (for example, "CMA")
4. Compare to the current page and produce a change list per page: **Add**, **Change**, **Confirm** (upgrade Inferred/Gap to Confirmed), **Contradict** (conflicts with an existing source: cite both, do not overwrite).
5. Mark speaker authority: statements by the process owner or system owner carry more weight; a single attendee's recollection stays "Confirmed (spoken, single source)" until corroborated.
6. Flag sensitive content (personal data, pricing, customer names) and exclude it from page text.
7. Output a preview: per page, the exact rows or sentences to add or change, plus open questions answered and new questions raised. Wait for approval, then update the draft; publish only via `bpe-publish-process-doc`.

## Meeting recap output
When the user wants a recap (not only page updates), also produce:
- **Decisions** (explicit only), **Open questions** (questions are not decisions), **Actions** (owner and date only if stated, otherwise "Owner not stated"), **Facts/clarifications**, **Risks**.
- Cross-reference ADO IDs and IR numbers verbatim; do not infer priority, scope, or sprint commitment.
- Proposed updates: process page changes (Add/Change/Confirm/Contradict), Open Gaps Register rows to close (G01-G23, page 5057904674), and ADO comments. Preview each; write only after approval, via `bpe-publish-process-doc` for pages.

## Rules
- Never infer steps from tone or implication. Mark unclear audio or ambiguous references as Gap.
- Keep the transcript out of Confluence; cite it in the source map by title and date.
- Multiple transcripts: process in date order; later statements do not silently override earlier ones, list as Conflicting.
