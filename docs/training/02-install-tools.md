# 2. Install Git and GitHub Copilot

If your computer is managed by IT and you cannot install software, ask IT to install the items below.

## Git

Git is the tool that downloads the repo.

1. Open **PowerShell** (Start menu, type `PowerShell`).
2. Try: `git --version`. If you see a version number, skip to the next section.
3. Otherwise run: `winget install --id Git.Git -e`
   (or download from https://git-scm.com/download/win and accept all defaults).
4. Close and reopen PowerShell, then run `git --version` again.

## GitHub CLI (optional but handy)

`winget install --id GitHub.cli -e` then `gh --version`.

## GitHub Copilot app or CLI

Use whichever Katie tells you; the agents and skills work the same.

- **Copilot app:** download from the link Katie gives you and install.
- **Copilot CLI:** `winget install GitHub.Copilot` (or follow https://docs.github.com/copilot/how-tos/copilot-cli). Check with `copilot --version`.

[SCREENSHOT: Copilot app after install]

**Check:** `git --version` prints a version and Copilot opens.

Next: [Get the repo](03-get-the-repo.md)
