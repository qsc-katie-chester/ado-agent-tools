---
name: bpe-process-doc-to-diagram
description: "Convert a BPE sub-process page's steps table into a swimlane flow (Mermaid, optionally Miro/FigJam), styled by Confirmed/Conflicting/Inferred/Gap."
argument-hint: "Confluence page URL/ID and target (Mermaid, Miro, FigJam)"
user-invocable: true
---

# Process doc to diagram

1. Read the page steps table and exceptions section. Never add steps not on the page.
2. Lanes = Actor/System; node = `#. Step`; edges = Handoff column.
3. Style: Confirmed solid, Conflicting dashed with warning, Inferred dotted, Gap grey "?".
4. Emit a Mermaid `flowchart LR` with subgraph per lane, titled with page name and status banner.
5. List each Gap/Conflicting node below the diagram with its register ID (G01-G23) when one exists.
6. Miro (`canvas_create_from_svg`) or FigJam (`generate_diagram`) creation only after the user confirms the board or file; creating boards is a write, so preview first.
7. The diagram is a view of the page, not new analysis: never invent steps. Overview diagrams show the 8 sub-processes and handoffs only; step-level diagrams are per page. Show exception paths from section 6 as branches, and print the page's status banner (Draft/In Review/Approved) in the title.
8. Give the Mermaid or diagram link plus a one-line note per gap node. Suggest the user embed it in the page; do not edit the page unless asked.
