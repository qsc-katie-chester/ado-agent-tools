# 3. Get the repo

## Option A: clone from inside the Copilot desktop app (recommended)

The app can add a GitHub repository and download it for you, so you do not need to type Git commands.

1. In the Copilot app, choose the option to **add a repository** (look for **Add repository**, **Add project** or **Clone**). [PLACEHOLDER: confirm exact label in your app version.]
2. Choose **GitHub** and enter `qsc-katie-chester/ado-agent-tools`, or pick it from your repository list.
3. Wait for the download to finish. The repo then appears in the app.
4. Note where the app saved it (the repo's folder path is shown in its details). You need this path on page 4 to run the install script. [PLACEHOLDER: where the app shows the folder path.]

[SCREENSHOT: add repository dialog]

**Check:** the repo is listed in the app and its folder contains `agents`, `skills`, `instructions`, `docs`, `README.md`.

## Option B: clone with Git (fallback)

If the app option is missing or fails:

```
mkdir $HOME\source -Force
cd $HOME\source
git clone https://github.com/qsc-katie-chester/ado-agent-tools.git
```
Sign in to GitHub in the browser window that appears.

## Option C: download a zip (no Git, harder to update)

1. On the repo page click the green **Code** button > **Download ZIP**.
2. Right-click the zip > **Extract All** to `C:\Users\<you>\source\`.

## Getting updates later

- **App:** open the repo in the app and use its **Pull / Sync** option, or ask Copilot: "pull the latest changes in this repo". [PLACEHOLDER: confirm in your app version.]
- **Git:** `cd` to the repo folder and run `git pull`.

Then run the install script again (page 4).

Next: [Install the toolkit](04-sign-in-and-install.md)
