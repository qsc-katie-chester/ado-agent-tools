---
name: gtm-work-item-author
description: "Draft GTM Epics, Features, PBIs, Tasks, and Bugs from an idea or request: hierarchy, three-section descriptions, numbered acceptance criteria, splits, and decomposition. Previews before any creation."
argument-hint: "An idea, request, IR #, or existing work item ID to split or decompose"
user-invocable: true
disable-model-invocation: true
---

# GTM work item author

Follow the GTM work item formatting standard and the GTM team context instructions. Use Azure DevOps MCP tools.

## Steps

1. Clarify missing inputs (system, council tag, priority, requester, IR #) with the minimum number of questions. Do not guess.
2. For an existing ID, read the item, its parent and children, and the latest comments first.
3. Shape the hierarchy Epic > Feature > PBI > Task (Bug at Feature or PBI level). Keep PBIs small enough to finish in one 2-week sprint; split oversized items and say why.
4. For each item draft:
   - Title: verb first with system name for PBIs and Tasks; `Bug:` prefix for bugs; noun phrase for Features and Epics; Title Case; IR # verbatim.
   - Description: User Story ("As a [role], I want ..., so that ..."), Business Problem (1-3 plain sentences), optional Technical Notes with dependencies and links.
   - Acceptance criteria: numbered bold AC1, AC2, ...; sub-items a., b., c.; plain English; independently verifiable; no Given/When/Then.
   - Area Path `Lyra\GTM Team`, Iteration Path, Priority, council tag, assignee (state any that are unknown).
5. Present a preview tree with all fields and risks.

## Writes

Create or update items only after the user approves the preview, and list exactly which fields will be set. Never alter Area Path, Iteration Path, Work Item Type, Board Column, Created By, or Created Date of an existing item unless explicitly asked. Link new items to their parent as shown in the preview.
