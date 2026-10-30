# 2. Five exercises

All are **read-only**. Use a real, non-sensitive work item and replace `<ID>`. [PLACEHOLDER: facilitator adds a sample PBI, enhancement and transcript.]

## 1. Summarize a work item (5 min)
**Use:** `/gtm-work-item-summary <ID>`
**Expect:** title, board column, assignee, description, acceptance criteria, latest 1-3 comments with author and date. Any mismatch between a comment and the board column is called out.
**Done when:** you can name the board column and latest commenter.

## 2. Readiness check on a PBI (10 min)
**Use:** BPE Readiness Checker. Prompt: `Check PBI <ID> against the Definition of Ready.`
**Expect:** a table of checks, each Pass, Fail or Unknown with evidence, and the questions to resolve. It suggests fixes but applies none.
**Done when:** you can name one Fail or Unknown and its evidence.

## 3. Change impact for an enhancement (15 min)
**Use:** BPE Change Impact Analyst. Prompt: `Enhancement <ID> (IR <number>): which process steps change, what is impacted, and what should Dev and QA look at? Process: <name>.`
**Expect:** affected process page and steps, systems and owners, handoffs, Dev and QA focus areas, open questions, all labeled. A missing process page is shown as Gap.
**Done when:** you can find one Inferred or Gap item and read why.

## 4. UAT and test coverage (15 min)
**Use:** BPE Test and UAT Coverage. Prompt: `Map the acceptance criteria of PBI <ID> to QA test cases and UAT guides and show gaps.`
**Expect:** each acceptance criterion against matching tests or UAT scenarios, with uncovered ones listed as gaps.
**Done when:** you can name one uncovered criterion, or confirm all are covered with a source.

## 5. Meeting transcript recap (10 min)
**Use:** BPE Meeting Recap. Prompt: paste the transcript, then `Title: <title>. Date: <date>. Attendees: <names>. Related ADO items: <IDs>. Recap this.`
**Expect:** separate facts, decisions, open questions and actions, each with a source quote. Questions are not recorded as decisions. Nothing is published without your approval.
**Done when:** the decisions list contains only things someone actually decided.

## Optional: a safe write
Ask `/gtm-work-item-author` to draft a PBI. It shows a preview. Say "no" to cancel.
