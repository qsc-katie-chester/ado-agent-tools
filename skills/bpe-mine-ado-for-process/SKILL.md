---
name: bpe-mine-ado-for-process
description: "Read-only mining of ADO work items and test cases (GTM Team, Lyra) to extract candidate process facts, map them to Quote to Cash sub-process pages and steps, and find conflicts and gap closures."
argument-hint: "Process (default Quote to Cash), date window (default last 12 months), board columns (default Deployed/Done), optional sub-process page"
user-invocable: true
disable-model-invocation: true
---

# Mine ADO for process knowledge

Read-only. Follow `bpe-process-documentation.instructions.md` and `gtm-team-context.instructions.md`.

1. Scope with WIQL (`wit_query` action `wiql`, project Lyra): Area Path under `Lyra\GTM Team`, types PBI/Bug, Board Column Deployed or Done, exclude Removed, window by Iteration Path or Changed Date. Batch by sprint; state any failed retrieval, never treat it as empty.
2. For candidates, read via `wit_work_item` (get_batch: title, description, ACs, tags, iteration, board column; list_comments: latest 1-3; list_revisions when the deploy date is needed). Read linked test cases and plans (`testplan`).
3. Map each item to a sub-process page (1-8) and step # using keywords (systems, objects, SKUs, field names) and the page steps table. If the mapping is not explicit, mark Inferred or Unmapped.
4. Extract candidate facts: rules, thresholds, fields, SKUs, exceptions, regional differences, each with item ID, IR # (verbatim), quote, date. Test case steps/expected results = evidence of intended behavior, with last-modified date.
5. Label Confirmed (explicit in AC/test/comment), Inferred, Conflicting (cite both). Board column is not process fact; Deployed, QA Passed, UAT Accepted stay distinct.
6. Output: (a) facts per page and step, (b) conflicts with current pages, (c) gap closures against the Open Gaps Register (G01-G23), (d) steps missing from pages, (e) unmapped items, (f) retrieval limits.
