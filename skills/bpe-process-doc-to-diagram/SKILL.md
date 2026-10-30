---
name: bpe-process-doc-to-diagram
description: "Convert a BPE sub-process page's steps table into a swimlane flow (Mermaid, optionally Miro/FigJam), styled by Confirmed/Conflicting/Inferred/Gap."
argument-hint: "Confluence page URL/ID and target (Mermaid, Miro, FigJam)"
user-invocable: true
disable-model-invocation: true
---

# Process doc to diagram

1. Read the page steps table and exceptions section. Never add steps not on the page.
2. Lanes = Actor/System; node = `#. Step`; edges = Handoff column.
3. Style: Confirmed solid, Conflicting dashed with warning, Inferred dotted, Gap grey "?".
4. Emit a Mermaid `flowchart LR` with subgraph per lane, titled with page name and status banner.
5. List each Gap/Conflicting node below the diagram with its register ID (G01-G23) when one exists.
6. Miro/FigJam creation only after user confirms destination (preview first).
