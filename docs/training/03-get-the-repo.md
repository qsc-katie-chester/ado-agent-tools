# 3. Get the repo

## Option A: clone (recommended, easy to update later)

1. In PowerShell run:
   ```
   mkdir $HOME\source -Force
   cd $HOME\source
   git clone https://github.com/qsc-katie-chester/ado-agent-tools.git
   ```
2. A browser or window asks you to sign in to GitHub. Sign in and approve.
3. Check: `cd ado-agent-tools` then `dir`. You should see `agents`, `skills`, `instructions`, `docs`, `README.md`.

[SCREENSHOT: GitHub sign-in prompt during clone]

## Option B: download a zip (no Git needed, harder to update)

1. On the repo page click the green **Code** button > **Download ZIP**.
2. Right-click the zip > **Extract All** to `C:\Users\<you>\source\`.
3. To update later, download the zip again and repeat page 4.

## Getting updates later (Option A)

```
cd $HOME\source\ado-agent-tools
git pull
```
Then run the install script again (page 4).

Next: [Sign in and install](04-sign-in-and-install.md)
