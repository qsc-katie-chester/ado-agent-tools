---
description: "Use when documenting, reviewing, or analyzing business processes (BPE): shared evidence rules, process document template, and source-map format for BPE process documentation agents and skills."
---

# BPE Process Documentation Standards

Applies to the BPE Agent and the `bpe-*` skills.

## Evidence rules
- Read-only by default. Preview exact changes and get confirmation before any write or publish.
- Use MCP tools (ADO, Atlassian, Salesforce), never browser substitution. Verify Salesforce org identity and IsSandbox before production analysis.
- Every step, owner, system, and rule cites a source: title, ID/URL, author, last-modified date. Quote verbatim where practical.
- Label each statement: **Confirmed** (explicit in a source), **Conflicting** (sources disagree; cite both), **Inferred** (reasoned, say why), **Gap** (not found). Never present Inferred or Gap as Confirmed.
- Questions are not decisions. Board status is not process fact. Development Complete, QA Passed, UAT Accepted, and Production Validated are distinct.
- Preserve exact terms: SKUs, field names, IR references, system names.
- Failed or partial retrieval is stated, never treated as empty.

## Page hierarchy (one page per sub-process)
Never document an end-to-end process on a single page. Use three levels under the Business Process Documentation parent (page 4575723523):
1. **Process overview page** (e.g., Quote to Cash): purpose, scope, end-to-end flow diagram, a sub-process index table (# | Sub-process | Owner | Systems | Status | Link), cross-sub-process handoffs, shared systems/identifiers, and consolidated open questions. No step-level detail.
2. **Sub-process pages** (e.g., Quote Creation, PO Receipt and Matching, Oracle Order Creation, Booking and Ship Date, Fulfillment and Shipment, Invoicing): one page each using the template below. Each states inputs from the previous sub-process and outputs to the next.
3. **Detail pages** (only when a sub-process is too large, e.g., partial-order rules, EDI by partner, regional variants): child of the sub-process page.
Rules: each page has its own status banner, owner, and source map. Change-impact analysis maps an enhancement to the specific sub-process page(s). Cross-link neighbours both ways. Build and review one sub-process at a time; publish the overview with placeholder rows (status "Not started") for undocumented sub-processes.

## Ownership and review cadence
- Each process page is owned by the product owner for that area (a member of Katie's team; name recorded on the page, never guessed). The owner approves status changes (Draft / In Review / Approved).
- Review at least monthly. Each page shows Last reviewed and Next review due. A page past its due date is flagged "Review overdue" by the agent when read.
- Any enhancement that changes a sub-process triggers an out-of-cycle update of that page.

## Process document template (Confluence, narrow width, wide tables; applies to each sub-process page)
1. Purpose and scope (business outcome, in/out of scope)
2. Status banner: Draft / In Review / Approved, approver, last reviewed date
3. Owners and roles (business owner, process owner, system owners; mark unverified)
4. Systems of record and key identifiers (what owns each data element, how records match)
5. Process steps table: # | Step | Actor | System | Input | Output | Handoff | Source | Confidence label
6. Exceptions and failure paths (who owns, how recovered)
7. Controls and manual steps (intentional control vs workaround)
8. Reporting and observability
9. Related ADO items, intake requests, UAT/QA guides
10. Conflicts and open questions
11. Source map (every source read, plus sources that could not be read)

## Handoffs
A board change is not a handoff. Record current owner, incoming owner, required action, readiness evidence, and timing.
