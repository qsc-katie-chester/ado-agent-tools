# 10. Troubleshooting

| Problem | Try this |
|---|---|
| `git` is not recognized | Close and reopen PowerShell. If still missing, reinstall Git (page 2). |
| Repo shows 404 on github.com | You are not invited yet or signed in to the wrong account. Check your username with Katie. |
| Clone asks for a password and fails | Use the browser sign-in prompt and sign in with your GitHub account. Passwords do not work. If it keeps failing, ask Katie. |
| SSO "authorize" message | Click **Authorize** next to the organization, then retry. |
| Install script blocked ("running scripts is disabled") | Run it exactly as written, with `-ExecutionPolicy Bypass`. If IT blocks it, copy the `agents`, `skills` and `instructions` folders into `C:\Users\<you>\.copilot\` by hand. |
| `/bpe-help` does not appear | Confirm files exist in `C:\Users\<you>\.copilot\skills\bpe-help`. Fully close and reopen the Copilot app. |
| Agent cannot reach Azure DevOps, Confluence or Salesforce | Check the MCP server is signed in and its **name** matches the table on page 5 exactly. |
| Salesforce says production not verified | Ask Katie for the production alias. The agent will not guess. |
| "Tool not found" in an agent | Your MCP server may name tools differently. Tell Katie; the `tools:` list in the agent file may need updating. |
| Answer has no sources or labels | Re-ask: "Cite sources and label each statement Confirmed, Conflicting, Inferred or Gap." Report it. |
| Answer looks wrong or invented | Do not use it. Check the source yourself and file an issue (page 8). |
| Agent wants to change something | Read the preview. Say "no" unless you meant it. |
| Skills are out of date | `git pull`, run the install script again, restart Copilot. |
| Anything else | Copy the exact error text, remove confidential data, send to Katie. |
