# 5. Connect MCP servers

MCP servers are the connections that let agents read your systems. **The name you give each one matters**: agents look for these exact names.

| Name to use | System | Required? |
|---|---|---|
| `azure-devops` | Azure DevOps (org `ablcode`, project `Lyra`) | Yes |
| `atlassian` | Confluence / Jira | Yes for BPE agents |
| `salesforce` | Salesforce (read-only) | Yes for change impact, process docs, monthly report |
| `miro` | Miro boards | Optional |
| `figma` | Figma / FigJam | Optional |

## Steps

1. In Copilot open MCP settings: app **Customize > Installed** (or **Settings > MCP servers**); CLI: `/mcp`.
2. Add each server using the install details your IT or Katie provides. [PLACEHOLDER: add the approved install link/command for each server before the session.]
3. Set the server **name** to exactly the name in the table.
4. Click **Sign in** on each server and use your own work account. Never share credentials.
5. For Salesforce, ask Katie which org alias is **production (read-only)**. Never use production to test.

[SCREENSHOT: MCP servers list showing azure-devops connected]

## Check

Each server shows as connected/signed in. Then run Exercise 1 (page 7); if the agent says it cannot reach a system, see [Troubleshooting](10-troubleshooting.md).

Next: [First run](06-first-run.md)
