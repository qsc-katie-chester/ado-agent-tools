---
name: gtm-uat-document
description: "Create a business-friendly UAT document (Confluence-ready Markdown) for a GTM work item from its QA guide, acceptance criteria, description, recent comments, and ADO test cases/suites."
argument-hint: "Work item ID (PBI, Bug, or Task). Optional: environment, tester, approver, target test date."
user-invocable: true
disable-model-invocation: true
---

# GTM UAT document

Read-only against Azure DevOps. Produce straightforward UAT documentation a business tester can follow before an item is released. Use for enhancements, fixes, configuration changes, integrations, and other release candidates. Use Azure DevOps MCP tools only. Follow the GTM team context instructions and the work item formatting standard for wording.

Never invent system behavior, field names, navigation labels, expected values, or acceptance criteria. Anything not found in the sources is marked `To Be Confirmed` and listed in Open Questions and Gaps. Production must not be used for testing unless the user explicitly says so.

## 1. Gather context

1. `wit_work_item get` with `expand: relations` for the work item: title, type, board column, tags, assigned to, parent, iteration path, release version, description, acceptance criteria, and linked items. Strip HTML and keep the original wording.
2. If the item has the tag `No UAT Needed`, say so and ask whether to continue.
3. `wit_work_item list_comments` (latest 5 to 10): look for test results, environment details, test data, defects, and scope changes. Treat the newest comments as the best signal and call out any contradiction with the description or acceptance criteria.
4. QA guide: from the `AttachedFile` relations, find the QA guide. It is typically a PDF named like "QA Evidences" or "QA Guide", uploaded by a QA resource on the item (also check the parent and child items if none is found). Download it with `wit_work_item_attachment` (GUID is the last segment of the relation URL).
   - PDFs and images are readable. Use the steps, data, and screenshots from the guide as the source for test steps and evidence references.
   - Word, Excel, PowerPoint, CSV, and .msg files cannot be read. If the QA guide is only in one of those formats, say so and ask the user to paste its text. Do not guess its content.
5. Test cases: the work item's `Tested By` relations point to Test Case work items. Fetch them with `wit_work_item get_batch` (fields `System.Id`, `System.Title`, `System.State`, `Microsoft.VSTS.TCM.Steps`). The steps field is XML: each `step` has an action (first `parameterizedString`) and an expected result (second); strip HTML tags and `&lt;br&gt;` line breaks. Also check the children and `Related` items for test cases when none are linked. Use `testplan` (`list_plans`, `list_suites`, `list_cases`) only to confirm suite membership when the user names a plan or suite. Reuse existing test case IDs, steps, and expected results. `Test Result` artifact links on the item show that runs were recorded, but their pass/fail outcomes are not readable with these tools, so leave results as `Not Run` / `To Be Completed` unless the user or comments supply them.
6. If any of these are not in ADO and the user did not supply them, mark them `To Be Confirmed` and ask focused follow-up questions: target non-production environment and URL, build or release version, tester, target test date, business approver, required roles and permissions, test accounts, test data, dependencies, feature flags or configuration, and cleanup needs.

## 2. Define scope

- State what is included, what is excluded, and what must be true before testing begins.
- Number acceptance criteria `AC-01`, `AC-02`, and so on. If the work item uses `AC1`, `AC2`, keep the mapping (`AC-01` = `AC1`).
- Translate each acceptance criterion into at least one observable test case, numbered `TC-01`, `TC-02`. Add negative, permission, boundary, or error-handling cases only when relevant to the change.
- Record each test case's source: `ADO Test Case #<id>`, `QA guide`, or `Derived from AC`. A case with no acceptance criterion is labeled `Supplemental (risk-based)`.

## 3. Produce the document in this order

Title line: `UAT: <work item ID> - <title>`, followed by a short header table with work item link, board column, release version, tester, approver, and target test date.

1. **UAT Overview**: one short paragraph on what is changing, why it is being tested, and what successful acceptance means.
2. **Test Environment**: table with columns `Field`, `Required Value`, `Notes`. Rows: environment name and URL, application or build version, browser or device (when relevant), tester role and permissions, test accounts, test data, integrations or dependencies, feature flags or configuration, reset or cleanup. Include a line stating production must not be used.
3. **Entry Criteria and Prerequisites**: concise, complete sentences.
4. **Acceptance Criteria**: table with `Acceptance Criteria ID`, `Acceptance Criterion`, `Source or Reference`. Preserve wording; clarify ambiguity without changing intent.
5. **Step-by-Step Test Cases**: for each case, `Test Case ID`, `Title`, `Source`, `Acceptance Criteria Covered`, `Purpose`, `Preconditions`, `Test Data`, a numbered table with `Step`, `Tester Action`, `Expected Result`, and `Cleanup or Reset` when needed. One action per step, direct verbs, enough explanation for an infrequent tester, and every expected result observable and specific. Place any supplied screenshot or evidence reference right after the step it supports. Keep setup actions separate from validation actions.
6. **Test Results Log**: one table, one row per test case, columns `Test Case ID`, `Acceptance Criteria ID`, `Tester`, `Date`, `Environment or Build`, `Actual Result`, `Status`, `Evidence Link`, `Defect ID`, `Comments`. Status is only `Not Run`, `Pass`, `Fail`, or `Blocked`. Use `Not Run` and `To Be Completed` when results are not supplied.
7. **Acceptance Criteria Coverage**: columns `Acceptance Criteria ID`, `Related Test Case IDs`, `Expected Outcome`, `Observed Outcome`, `Coverage Status`, `Notes or Gap`. Coverage status is only `Covered`, `Partially Covered`, or `Not Covered`. Never mark a criterion accepted merely because a test case exists; acceptance requires passing evidence for all related test cases.
8. **Defects and Follow-Up**: columns `Defect ID`, `Related Test Case ID`, `Summary`, `Severity`, `Owner`, `Status`, `Retest Required`. If none are known, state the table is ready for use during execution. Pull linked Bugs from the work item when present.
9. **UAT Sign-Off**: totals for total, passed, failed, blocked, and not-run cases when results exist; each acceptance criterion marked satisfied, unresolved, or untested; fields for business approver, decision, date, and comments. Never infer approval.
10. **Open Questions and Gaps**: contradictions, missing coverage, missing test data, untestable criteria, and unreadable sources.

## 4. Validate before finishing

- Every acceptance criterion maps to at least one test case.
- Every test case maps to at least one acceptance criterion or is labeled `Supplemental (risk-based)`.
- Every test case has preconditions, numbered actions, and observable expected results.
- Environment and permissions are explicit.
- The results log has exactly one row per test case.

## 5. Output

Use plain language, short paragraphs, concise tables, and numbered steps. Explain business or system terms only when needed. Save the Markdown to `uat-<work item ID>.md` in the session files folder, show the document in chat, and tell the user the file path so it can be pasted or uploaded to Confluence. Write nothing back to Azure DevOps unless the user asks.
