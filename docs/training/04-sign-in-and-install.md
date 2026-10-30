# 4. Install the toolkit in the Copilot app

## Confirm you are signed in

Open the Copilot desktop app. If it asks, click **Sign in with GitHub** and approve in the browser.

[SCREENSHOT: Copilot app signed in]

## Install the agents and skills

The app reads personal agents and skills from `C:\Users\<you>\.copilot\`. A script copies them there:

1. Open PowerShell.
2. Run these, replacing the path with where the repo is on your computer (the app shows it; Option B uses `$HOME\source\ado-agent-tools`):
   ```
   cd <path to ado-agent-tools>
   powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
   ```
3. You should see three "Copied N files" lines and "Done".
4. **Close and reopen the Copilot app.**

**Check:** in the app, start a new chat, type `/` and look for `/bpe-help` and `/gtm-help`. Open the agent picker and look for the BPE agents.

[SCREENSHOT: slash menu showing /bpe-help]

Do not edit files in `C:\Users\<you>\.copilot\` by hand. Changes belong in the repo (page 8).

Next: [Connect MCP servers](05-connect-mcp-servers.md)
