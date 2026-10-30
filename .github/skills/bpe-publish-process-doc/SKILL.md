---
name: bpe-publish-process-doc
description: "After explicit user approval, publish an approved process document draft to Confluence space PE (narrow width, wide tables) and verify the result."
argument-hint: "Draft file path and Confluence parent page URL or ID"
user-invocable: true
disable-model-invocation: true
---

# Publish process document

Write skill. Requires explicit approval of the draft and the target parent.

## Steps
1. Confirm title, parent page, and status banner (Draft / In Review / Approved) with the user. List exactly what will be created.
2. Load the PE space instructions (`getConfluenceSpace` via execute) and apply them; get the content format guide before authoring.
3. Create the page as HTML, default narrow width, tables with `data-layout="wide"`. Do not claim images or Miro/Figma boards were added; leave placeholders.
4. Re-read the created page and verify sections, step table, and source map exist.

## Output
Page URL and verification result. Report any failure explicitly; never claim success unverified.
