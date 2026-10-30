# 2. Check your tools

You already have the GitHub Copilot desktop app. **Git** is only needed if you clone with commands instead of the app (page 3, Option B), and for the install script's folder path it helps to have it, so install it if you can.

## Git

1. Open **PowerShell** (Start menu, type `PowerShell`).
2. Run `git --version`. If you see a version number, you are done.
3. Otherwise run: `winget install --id Git.Git -e`
   (or download from https://git-scm.com/download/win and accept all defaults).
4. Close and reopen PowerShell, then run `git --version` again.

If your computer is managed by IT and you cannot install software, ask IT to install Git.

## Copilot desktop app

1. Open the GitHub Copilot app from the Start menu.
2. Confirm it shows you signed in with your GitHub account. If not, sign in (page 4).
3. Update the app if it offers an update.

[SCREENSHOT: Copilot desktop app home screen]

**Check:** `git --version` prints a version and the Copilot app opens signed in.

Next: [Get the repo](03-get-the-repo.md)
