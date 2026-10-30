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

This is Salesforce's official connector. It lets the agent read Salesforce using your own login. You do this once, and it takes about 15 minutes. You copy and paste every command; you do not need to understand them.

**How to paste a command:** open PowerShell (press the Windows key, type `PowerShell`, press Enter). Copy a command from this page, right-click inside the PowerShell window to paste it, then press Enter. Wait until the cursor comes back before the next step.

**Part A: Install two programs**

1. Paste this and press Enter. If Windows asks "Do you want to allow this app to make changes?", click **Yes**.
   ```
   winget install --id OpenJS.NodeJS.LTS -e
   ```
2. **Close PowerShell and open it again.** This is required.
3. Paste this and press Enter. It can take a few minutes and print a lot of text; that is normal.
   ```
   npm install -g @salesforce/cli
   ```

**Part B: Log in to Salesforce**

4. Paste this and press Enter. Your web browser opens a Salesforce login page. Sign in with your work account and click **Allow**. When the browser says you can close the window, return to PowerShell.
   ```
   sf org login web --alias QA --instance-url https://qsc--qa.sandbox.my.salesforce.com
   ```
5. Repeat step 4 for each other org you were told to use. Change the word after `--alias` and the web address. For production, ask Katie first:
   ```
   sf org login web --alias PROD --instance-url https://qsc.my.salesforce.com
   ```
6. Check it worked: paste `sf org list` and press Enter. Every org you logged in to should appear in the list.

**Part C: Add the connector in the app**

7. Open the Copilot app and go to **Customize > Installed**.
8. Add a new local MCP server. If you see a box for JSON or a configuration, paste the text below. If you see separate boxes, enter: Name `sf-mcp-server`, Command `npx`, and Arguments `-y @salesforce/mcp --orgs QA,PROD --toolsets orgs,metadata,data`.
   ```json
   "sf-mcp-server": {
     "tools": ["*"],
     "type": "local",
     "command": "npx",
     "args": ["-y", "@salesforce/mcp", "--orgs", "QA,PROD", "--toolsets", "orgs,metadata,data"]
   }
   ```
   In `QA,PROD`, use the same names you chose after `--alias` in Part B, separated by commas with no spaces. Leave out any org you did not log in to.
9. Fully close the Copilot app and open it again.

**Part D: Check it works**

10. In a new chat, type: `List my Salesforce orgs`. You should see the names from Part B. If you do, you are done.

**If something goes wrong**
- "winget" or "npm" is not recognized: close PowerShell, open it again, and retry. If it still fails, ask Katie.
- An org is missing from the chat: repeat Part B for it and check its name is in the app configuration (step 8).
- It stops working weeks later: your Salesforce login expired. Repeat step 4 for that org, then restart the app.

**Rules**
- Agents only read Salesforce. Never ask one to deploy or change anything.
- Never test in production. Use QA unless Katie tells you otherwise.

## Step 5: First run

Type `/bpe-help`. You see a table of jobs and the agent for each. Nothing is read or changed. To use an agent, pick it in the agent picker, then type a normal sentence such as `Check PBI 12345`.

**A good answer** cites sources, labels each statement **Confirmed**, **Conflicting**, **Inferred** or **Gap**, and shows a preview before any change. If it does not, stop and tell the facilitator.

## Updating later

Ask Copilot in the repo: "pull the latest changes", then run the install script again and reopen the app.
