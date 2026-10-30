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
- Keep the exact MCP server names and exposed tool names listed in the README and agent allowlists.
- Keep skill metadata consistent: skills should support both natural-language routing and direct slash-command use. Write-capable skills must preview the exact content, target, and fields, then wait for explicit approval.
- Say how you tested it (the prompt you ran and what you saw).
- Katie approves all merges.

## Updating the shared agents

1. Edit the existing agent, skill, instruction, or documentation file in a branch. Keep a skill's folder name, frontmatter `name`, and command name aligned.
2. From the repository root, run `powershell -ExecutionPolicy Bypass -File .\scripts\validate.ps1`.
3. Open a pull request with the change, rationale, and a plain-English prompt to verify it. Do not edit the shared `main` branch directly.
4. After the PR is approved and merged, each teammate runs the repo's `scripts\update.ps1` from a clean checkout and starts a new Copilot session. Repository-local sessions only need a pull and a new session; the personal install copies files for use in other repositories.

Active chats do not receive a live rewrite. Starting a fresh session is the supported way to load revised agent and skill instructions.
