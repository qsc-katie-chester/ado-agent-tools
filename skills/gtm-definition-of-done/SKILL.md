---
name: gtm-definition-of-done
description: "Check whether a GTM PBI or Bug is actually done: acceptance criteria evidence, QA, UAT, SOX comment, release readiness. Returns Pass/Fail/Unknown with evidence."
argument-hint: "ADO work item ID(s)"
user-invocable: true
disable-model-invocation: true
---

# GTM definition of done check

Read-only. Follow the GTM team context and work item formatting instructions. Use Azure DevOps MCP tools only. Development Complete, QA Passed, UAT Accepted, Deployed, and Production Validated are distinct; never treat one as another, and never treat a board column as proof.

## Steps

1. Retrieve fields, description, acceptance criteria, links (parent, tests, bugs, PRs), and the latest 1-3 comments (newest first, cite author and date).
2. Check each item and return Pass / Fail / Unknown with evidence:
   - **Acceptance criteria**: each AC1, AC2... has evidence (comment, linked test result, or attachment) that it was verified.
   - **QA**: a QA Engineer or QA Lead (Amita Kulkarni, Isha Saxena, Jyoti Behura) comment or linked test result states QA passed, in a non-production environment.
   - **UAT**: a UAT guide exists (`gtm-uat-document`) and the business owner commented on the work item that UAT passed (SOX requirement).
   - **Defects**: linked bugs are closed, or accepted by the business with a comment.
   - **Release**: Release Manager (Will Folz) comment or linked deployment evidence; the item is in Ready to Deploy or later.
   - **Hygiene**: Area Path, Iteration Path, council tag, assignee set; IR # preserved verbatim.
   - **Board vs. comments**: state any contradiction explicitly; trust the comment.
3. Give an overall verdict: Done / Not done / Cannot determine, plus the minimum actions to close each gap, each with an owner.

## Output

Table (Check | Result | Evidence | Source with author and date), verdict, and action list. Do not infer that UAT or QA happened from the board column. Do not change fields, board column, or sprint; offer proposed comment wording only.
