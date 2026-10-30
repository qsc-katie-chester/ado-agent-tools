---
description: "Work item formatting standards for GTM Team ADO work items (Epics, Features, PBIs, Tasks, Bugs). Apply whenever writing or reviewing descriptions, acceptance criteria, or titles."
---

# GTM Team — Work Item Formatting Standards

These rules apply to all work item types: Epics, Features, Product Backlog Items (PBIs), Tasks, and Bugs.

---

## Description Format

Every work item description must include all three of the following sections, in this order:

### 1. User Story
State who wants something, what they want, and why. Use this exact format:

```
As a [role],
I want [goal or capability],
so that [business benefit or outcome].
```

**Roles to use** (choose the most accurate):
- CPQ administrator
- Sales Operations user
- Oracle administrator
- Order Management user
- Finance analyst
- Customer / End user

### 2. Business Problem
One to three sentences in plain English explaining **why this work matters** — what problem exists today, what gap is being filled, or what business outcome depends on this item. Write it so that anyone on the team (including non-technical stakeholders) can understand it without context.

**Example:**
> Currently, RoomSuite products do not exist in Salesforce CPQ, which means sales reps cannot quote the bundle. This work establishes the product records needed before bundling configuration can begin.

### 3. Technical Notes / Additional Context
Optional. Use for implementation details, dependencies, attachments, regional notes, or links to related items. Keep this section factual and specific.

---

## Acceptance Criteria Format

- Each criterion is numbered: **AC1:**, **AC2:**, **AC3:**, etc. — the label must be **bold**.
- Sub-items use lowercase alpha bullets: a., b., c.
- Sub-sub-items use roman numerals: i., ii., iii.
- Write in plain English — avoid jargon where possible. A non-technical reader should understand what "done" looks like.
- Each AC should be independently verifiable (testable on its own).
- Do NOT use Given/When/Then format — use direct declarative statements.

**Correct format:**
```
AC1: [BUNDLE_SKU] exists as a product record in the QA environment.
AC2: The following component products exist as product records in QA:
  a. [COMPONENT_1]
  b. [COMPONENT_2]
AC3: When the Salesforce user language is set to German, translated product values display correctly.
```

**Incorrect format (avoid):**
```
- Product record exists ✗ (no numbering, no bold label)
Given a CPQ admin, when they search... ✗ (Given/When/Then)
AC1: make sure products are in QA ✗ (vague, not verifiable)
```

---

## Title Conventions

| Work Item Type | Rule | Example |
|---|---|---|
| PBI | Start with a verb. Include system name when relevant. | `Create RoomSuite Products & Pricebook Entries in QA - CPQ` |
| Bug | Start with `Bug:`. Include system + symptom. | `Bug: RS-MOD-BB Bundle Park Date Causes Auto-Book Failure - Oracle` |
| Feature | Noun phrase describing the capability. Include system. | `RoomSuite CPQ Bundling` |
| Epic | Noun phrase describing the business outcome. Include product name. | `RoomSuite - Quoting Enablement` |
| Task | Start with a verb. Be specific. | `Configure bundle options for RS-MOD-BB-NA in QA` |

**Title casing:** Title Case for all work items (capitalize each major word).

---

## General Writing Rules

- Write for **all audiences** — descriptions must be understandable without prior context.
- Use **exact SKU and part number names** as provided (e.g., `RS-MOD-BB-NA`, not "the NA variant").
- Avoid vague words: "handle", "manage", "fix", "address", "deal with" — be specific about what must happen.
- If a dependency exists, state it explicitly in Technical Notes with a work item link.
- Do not use ALL CAPS for emphasis — use **bold** instead.
- Keep sentences short. One idea per sentence.

---

## Required Fields by Work Item Type

| Field | PBI | Feature | Epic | Bug | Task |
|---|---|---|---|---|---|
| Title | ✅ | ✅ | ✅ | ✅ | ✅ |
| Description (all 3 sections) | ✅ | ✅ | ✅ | ✅ | — |
| Acceptance Criteria | ✅ | ✅ | — | ✅ | — |
| Area Path | ✅ | ✅ | ✅ | ✅ | ✅ |
| Iteration Path | ✅ | ✅ | ✅ | ✅ | ✅ |
| Tags | ✅ | ✅ | ✅ | ✅ | — |
| Assigned To | ✅ | ✅ | ✅ | ✅ | ✅ |
| Priority | ✅ | ✅ | ✅ | ✅ | — |
