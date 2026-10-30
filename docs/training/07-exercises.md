# 7. Five hands-on exercises

All five are **read-only**. Use a real but non-sensitive work item. Replace `<ID>` with your own number. [PLACEHOLDER: facilitator inserts a safe sample PBI, enhancement and transcript before the session.]

## Exercise 1: Summarize a work item (about 5 minutes)

**Agent/skill:** GTM ADO Agent, `/gtm-work-item-summary`

**Prompt:** `/gtm-work-item-summary <ID>`

**Expected result:** title, board column, assignee, description, acceptance criteria, and the latest 1-3 comments with author and date. Board column (not System State) is used as status. Any mismatch between a comment and the column is called out. Nothing is changed.

**Success check:** you can name the item's current board column and its latest comment author.

## Exercise 2: Readiness check on a PBI (about 10 minutes)

**Agent/skill:** BPE Readiness Checker, `/bpe-definition-of-ready-check`

**Prompt:** `Check PBI <ID> against the Definition of Ready.`

**Expected result:** a table of checks (title, user story, numbered bold ACs, required fields, IR number, affected process page, dependencies, comments, UAT approach), each Pass, Fail or Unknown with evidence, plus the minimum questions to resolve. It suggests fixes but does not apply them.

**Success check:** you can list at least one Fail or Unknown and its evidence.

## Exercise 3: Change impact for an enhancement (about 15 minutes)

**Agent:** BPE Change Impact Analyst

**Prompt:** `Enhancement <ID> (IR <number>). Which process steps change, what systems and teams are impacted, and what should Dev and QA look at? Process: <name>.`

**Expected result:** the affected sub-process page(s), the specific steps changing, systems and owners, downstream handoffs, Dev and QA focus areas, and open questions. Each statement is labeled Confirmed, Conflicting, Inferred or Gap. If no process page exists, it says Gap rather than guessing.

**Success check:** you can point to one step it marked Inferred or Gap and read why.

## Exercise 4: UAT and test coverage (about 15 minutes)

**Agent/skill:** BPE Test and UAT Coverage, `/bpe-coverage-gap-report`

**Prompt:** `Map the acceptance criteria of PBI <ID> to existing QA test cases and UAT guides and show gaps.`

**Expected result:** a table of each AC against matching test cases or UAT scenarios, with uncovered ACs listed as gaps and a suggested next step. Testing is never done in production.

**Success check:** you can name one AC with no coverage, or confirm all are covered with a source.

## Exercise 5: Meeting transcript recap (about 10 minutes)

**Agent/skill:** BPE Meeting Recap, `/bpe-ingest-transcript`

**Prompt:** paste or point to a transcript, then: `Title: <title>. Date: <date>. Attendees: <names>. Related ADO items: <IDs>. Recap this.`

**Expected result:** separate sections for facts, decisions, open questions and action items (owner and date where stated), each with the source quote. Questions are not recorded as decisions. Nothing is published unless you approve a preview.

**Success check:** the decisions list contains only things someone actually decided.

## Optional: a safe write

Ask `/gtm-work-item-author` to draft a PBI. It shows a **preview**; answer "no" to cancel. Writes only happen after you say yes.

Next: [Feedback and changes](08-feedback-and-changes.md)
