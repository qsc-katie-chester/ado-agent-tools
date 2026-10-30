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
| `salesforce` | Salesforce (read-only) | Yes for change impact and process docs |
| `miro`, `figma` | Diagrams | Optional |

Sign in to each with your own work account. Ask Katie for the production Salesforce alias; never test in production.

[PLACEHOLDER: Katie adds the approved install link or command for each server.]

## Step 5: First run

Type `/bpe-help`. You see a table of jobs and the agent for each. Nothing is read or changed. To use an agent, pick it in the agent picker, then type a normal sentence such as `Check PBI 12345`.

**A good answer** cites sources, labels each statement **Confirmed**, **Conflicting**, **Inferred** or **Gap**, and shows a preview before any change. If it does not, stop and tell the facilitator.

## Updating later

Ask Copilot in the repo: "pull the latest changes", then run the install script again and reopen the app.
