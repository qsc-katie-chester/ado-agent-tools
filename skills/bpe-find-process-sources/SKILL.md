---
name: bpe-find-process-sources
description: "Locate Confluence pages, ADO work items, UAT/QA guides, and Salesforce intake records that describe a named business process; list what was and was not readable."
argument-hint: "Process name and optional keywords, e.g. Quote to Oracle Order partial ordering"
user-invocable: true
disable-model-invocation: true
---

# Find process sources

Read-only. Follow `bpe-process-documentation.instructions.md`.

## Steps
1. Get the Atlassian cloudId (`getAccessibleAtlassianResources`). Search Confluence space PE first, then site-wide, using process terms, synonyms, system names (Salesforce, CPQ, Oracle, EDI), and IR/PBI IDs. Use a small `limit` and page through.
2. Search ADO (`Lyra\GTM Team` and child areas) for matching Features/PBIs/Bugs; note IDs, titles, board columns.
3. If useful and verified production, find Intake Requests by inspecting metadata first, then querying.
4. Rank sources: process guides, BRDs, UAT/QA guides, ADO ACs, comments, meeting notes.

## Output
Table: source | type | ID/URL | last modified | relevance | readable? Then a list of searches that returned nothing or failed. Do not read bodies yet unless asked.
