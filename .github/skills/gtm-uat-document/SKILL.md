---
name: gtm-uat-document
description: "Create a business-friendly UAT document (published to Confluence) for a GTM work item from its QA guide, acceptance criteria, description, recent comments, and ADO test cases/suites."
argument-hint: "Work item ID (PBI, Bug, or Task). Optional: environment, tester, approver, target test date."
user-invocable: true
---

# GTM UAT document

Read-only against Azure DevOps. Produce straightforward UAT documentation a business tester can follow before an item is released. Use for enhancements, fixes, configuration changes, integrations, and other release candidates. Follow the GTM team context instructions and the work item formatting standard for wording.

Keep the document short: about one page for a small item. Cut anything a tester does not need to run the tests. Board columns do not map to work item System State; report the board column only and never compare or flag differences between them.

Never invent system behavior, field names, navigation labels, expected values, or acceptance criteria. Anything not found in the sources is marked `To Be Confirmed` and listed in Open Questions and Gaps. Never use production for testing, even if the user requests it. If the required non-production environment cannot be established, leave it `To Be Confirmed` and treat it as a blocker.

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

- State briefly what is excluded and what must be true before testing begins.
- Number acceptance criteria `AC-01`, `AC-02`, and so on. If the work item uses `AC1`, `AC2`, keep the mapping (`AC-01` = `AC1`).
- Group tests by **area of testing** (for example "Category picklist" or "Symptom picklists"), not one case per acceptance criterion. Name them `Scenario 1`, `Scenario 2`. Merge overlapping ADO test cases into one group and list their IDs as references. Do not repeat a check that applies to a whole area; state it once.
- Add negative, permission, boundary, or regression checks only when relevant, labeled `Supplemental (risk-based)`.

## 3. Produce the document in this order

Keep every section minimal. Omit tables that add no information.

The structure mirrors the Confluence "UAT Guide Template" (page 4638441532) in a lightweight form. Do not add a TOC, results database, roles table, communication plan, defect process, or sign-off table. Sign-off is a comment the business owner adds in ADO for SOX compliance.

Page title: `UAT: <work item ID> - <title>`. In order:

1. **UAT Scope** (info panel): numbered list with the work item ADO link, bold title, and a one-sentence outcome; then out-of-scope items.
2. **Details table** (2 x 3): environment and URL, build, tester, test date, business owner, overall status lozenge (`Not Run`, `Pass`, `Fail`, `Blocked`). Mark unknowns `To Be Confirmed`.
3. **User Preparation**: numbered list. Always include a link to the shared "QA Guide - Salesforce QA Login" page (Confluence page id 3924754564, `https://qsc.atlassian.net/wiki/pages/viewpage.action?pageId=3924754564`), plus required test data or accounts. Add a warning panel: do not test in production.
4. **UAT Instructions**: three short steps: run each scenario and record Pass/Fail with notes; on failure create a bug linked to the work item and put its ID in Notes; when all pass, add a comment on the work item in ADO stating UAT has passed (SOX requirement).
5. **Scenarios**: heading `Scenario N: <area of testing>`, then a status lozenge, ADO test case IDs, and AC IDs covered. Table columns `Step` (numbered `N.1`, `N.2`), `Tester Action`, `Expected Result`, `Pass / Fail`, `Notes`. One action per step, direct verbs, observable and specific expected results. Put screenshots (or an `[IMAGEn]` placeholder) after the table, labeled.
6. **Open Questions**: short bullets, only true blockers, contradictions with comments, and unreadable sources.

## 4. Validate before finishing

- Every acceptance criterion is tagged in at least one scenario.
- Every scenario has numbered steps and observable expected results.
- The page is short, repeats nothing, and has no sign-off table.

## 5. Preview and publish

1. Show the complete draft and exact Confluence target (space PE, parent "Active UAT Guides", page id 4575723533), including any unknowns, before writing. Wait for explicit approval of that preview.
2. After approval, publish with the Atlassian MCP tool `createConfluenceContent`: cloudId `cbb0eec9-464c-4815-86a3-6f97352c86df`, space PE (id 2764374026), HTML body, default (narrow) page width, `contentType: live_doc` so testers can edit results inline (an existing page cannot be converted; create a new live doc), and `data-layout="wide"` on every `<table>`. Use `<div data-type="panel-info|panel-warning">` for panels and `<span data-type="status" data-color="neutral|green|red|yellow">` for lozenges.
3. If Confluence is unavailable, present the Markdown draft in chat. Save it as `uat-<work item ID>.md` in the session files folder only after the user approves that file write.

Screenshots cannot be uploaded through the MCP. Leave `[IMAGEn]` placeholders and tell the user to insert them manually. If the QA guide is a .docx, state that it could not be read with the available tools and ask the user to paste relevant text; do not claim to unzip or inspect it unless a suitable file-reading tool is available.

If published, reply with the page link and a two-line summary only. If the user does not approve the preview or publishing is unavailable, state that clearly and provide the draft or blocker. Write nothing back to Azure DevOps unless the user asks.
