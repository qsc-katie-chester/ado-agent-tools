---
name: gtm-docs
description: "Search Azure DevOps wiki and work items for GTM documentation and prior decisions, and summarize the matches with links."
argument-hint: "Search query, for example RoomSuite bundling or Oracle auto-book"
user-invocable: true
disable-model-invocation: true
---

# GTM docs

Read-only. Follow the GTM team context instructions. Use Azure DevOps MCP tools only (wiki search, wiki read, work item search).

## Steps

1. Search the wiki in project `Lyra` for the query; read the top relevant pages.
2. Search work items in `Lyra\GTM Team` for the same terms (include IR # if present) to find related decisions and history.
3. Summarize only what the sources say.

## Output

1. Wiki matches: page title, path, link, and a short quoted excerpt.
2. Related work items: ID, title, board column, and the most relevant latest comment (author, date).
3. Gaps: topics with no documentation found.

Do not fill gaps with assumptions. Do not modify any page or work item.
