Hold [git-xargs](https://github.com/gruntwork-io/git-xargs) scripts I use to update my repos.

# Basic steps for a change

- update [example-go-cli](https://github.com/bbkane/example-go-cli) with change and test
- write script to update fling but don't commit
  - Format is `[date]-[name-of-change]/{run.sh,change.sh}`, where `run.sh` calls `git-xargs` with `change.sh` if necessary

- source `GITHUB_OAUTH_TOKEN` and do gitconfig workaround (see below)
- run script against fling
- run against other repos
- merge PRs and update spreadsheet
- restore gitconfig

# Links

- https://blog.gruntwork.io/introducing-git-xargs-an-open-source-tool-to-update-multiple-github-repos-753f9f3675ec
- https://docs.google.com/spreadsheets/d/1R0c6VFFU_vLC45zgs_53rcWDHWRxt4S6UxdxBkFgPpo/edit?usp=sharing
- https://github.com/gruntwork-io/git-xargs#how-to-supply-commands-or-scripts-to-run
- https://mikefarah.gitbook.io/yq/
- https://www.bbkane.com/blog/go-notes/#code-updates-across-repos

# Run Notes

Needs  `GITHUB_OAUTH_TOKEN`  in environment

Envelope instructions (once in the directory):

```bash
envelope env create
envelope env ref create --name GITHUB_OAUTH_TOKEN --ref-env-name keyring --ref-var-name github_personal_access_token
export-env "$PWD"
```

## .gitconfig modifications

Due to https://github.com/gruntwork-io/git-xargs/issues/48, I need to
temporarily put user.name and user.email in .root gitconfig...

```bash
fling unlink --ask false -s ~/Git-GH/dotfiles/git

git config --global user.name "Benjamin Kane"
git config --global user.email "6081085+bbkane@users.noreply.github.com"
```

After running `git-xargs`, I need to re-symlink my git config:

```bash
rm ~/.gitconfig
fling link --ask false -s ~/Git-GH/dotfiles/git
```

