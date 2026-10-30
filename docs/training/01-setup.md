# 1. Setup

## Step 1: Get access to the repo

1. Send Katie your GitHub username.
2. Accept the invitation email from GitHub.
3. Open https://github.com/qsc-katie-chester/ado-agent-tools. If you see files, you are in. A "404" means you are not invited yet or are signed in to the wrong account. If GitHub asks you to authorize SSO, click **Authorize**.

## Step 2: Add the repo in the Copilot app

1. Open the Copilot app and choose **Add repository** (or **Clone**).
2. Enter `qsc-katie-chester/ado-agent-tools` and wait for the download.
3. Note the folder where the app saved it; it is shown in the repo details.

No luck? Install Git (`winget install --id Git.Git -e` in PowerShell) and run:
`git clone https://github.com/qsc-katie-chester/ado-agent-tools.git`

## Step 3: Install the toolkit

In PowerShell:

```
cd <folder from step 2>
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

You should see "Done". Fully close and reopen the Copilot app. In a new chat type `/` and look for `/bpe-help`.

## Step 4: Connect your systems (MCP servers)

Agents look for these exact server names. Use them when you add each server in the app (**Customize > Installed**).

| Name | System | Required? |
|---|---|---|
| `azure-devops` | Azure DevOps | Yes |
| `atlassian` | Confluence / Jira | Yes for BPE agents |
| `sf-mcp-server` | Salesforce (read-only); see setup below | Yes for change impact and process docs |
| `miro`, `figma` | Diagrams | Optional |

Sign in to each with your own work account. Ask Katie for the production Salesforce alias; never test in production.

[PLACEHOLDER: Katie adds the approved install link or command for each server.]

### Connecting Salesforce (`sf-mcp-server`)

The Salesforce server runs on your computer and uses your own Salesforce CLI login. There is no separate sign-in in the app.

1. Install Node.js LTS: `winget install --id OpenJS.NodeJS.LTS -e`
2. Install the Salesforce CLI: `npm install -g @salesforce/cli`
3. Close and reopen PowerShell, then log in to each org you need. A browser window opens each time; sign in with your work account:
   ```
   sf org login web --alias QA --instance-url https://qsc--qa.sandbox.my.salesforce.com
   sf org login web --alias PROD --instance-url https://qsc.my.salesforce.com
   ```
   Add any other sandbox you use the same way (change the alias and URL).
4. Check the logins: `sf org list`. Each org should be listed.
5. In the app, open **Customize > Installed**, add a local MCP server named `sf-mcp-server`, and use this configuration (replace the org list with your own aliases):
   ```json
   "sf-mcp-server": {
     "tools": ["*"],
     "type": "local",
     "command": "npx",
     "args": ["-y", "@salesforce/mcp", "--orgs", "QA,PROD", "--toolsets", "orgs,metadata,data"]
   }
   ```
6. Fully close and reopen the app. In a new chat ask: `List my Salesforce orgs`. You should see the aliases from step 3.

Notes:
- Only orgs listed in `--orgs` are available to the agent.
- If a login expires, repeat step 3 for that org.
- Agents are read-only. Do not ask them to deploy metadata, and never test in production.

## Step 5: First run

Type `/bpe-help`. You see a table of jobs and the agent for each. Nothing is read or changed. To use an agent, pick it in the agent picker, then type a normal sentence such as `Check PBI 12345`.

**A good answer** cites sources, labels each statement **Confirmed**, **Conflicting**, **Inferred** or **Gap**, and shows a preview before any change. If it does not, stop and tell the facilitator.

## Updating later

Ask Copilot in the repo: "pull the latest changes", then run the install script again and reopen the app.
