# How to propose a change

You do not need to be a developer. Agents and skills are plain text files, so improving one is like editing a document and asking Katie to approve it.

## The idea

1. You suggest a change (a **pull request**, or "PR").
2. Katie reviews it and approves, asks for edits, or declines.
3. Once approved it is merged and everyone gets it next time they update.

Nobody edits the shared copy directly.

## Easiest way (no tools to install)

1. Open the repo on github.com and find the file (for example `.github/skills/bpe-help/SKILL.md`).
2. Click the pencil icon (**Edit**).
3. Make your change. Keep it small and change one thing at a time.
4. Click **Commit changes**, choose **Create a new branch for this commit and start a pull request**.
5. Give it a title and a sentence saying what you changed and why. Add an example prompt where the old result was wrong.
6. Click **Create pull request**. Katie is notified.

## Not ready to edit? Open an issue

On github.com choose **Issues > New issue**. Describe the prompt you ran, what you expected, and what happened. Paste the answer if it has no confidential data.

## Rules for every change

- Never add passwords, tokens, customer data or personal data.
- Do not weaken the safety rules (read-only until approved; Confirmed/Conflicting/Inferred/Gap labels).
- Keep the exact MCP server names listed in the README.
- Say how you tested it (the prompt you ran and what you saw).
- Katie approves all merges.
