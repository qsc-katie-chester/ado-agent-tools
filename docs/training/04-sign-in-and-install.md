# 4. Sign in and install the toolkit

## Sign in to Copilot

- **App:** open it and click **Sign in with GitHub**. Approve in the browser.
- **CLI:** run `copilot`, then type `/login` and follow the prompts.

[SCREENSHOT: signed-in Copilot]

## Install the agents and skills

Copilot reads personal agents and skills from `C:\Users\<you>\.copilot\`. The script copies them there:

```
cd $HOME\source\ado-agent-tools
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

You should see three "Copied N files" lines and "Done". Restart Copilot.

**Check:** type `/` in Copilot. You should see skills such as `/bpe-help` and `/gtm-help`.

Next: [Connect MCP servers](05-connect-mcp-servers.md)
