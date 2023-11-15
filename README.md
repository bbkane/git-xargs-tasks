Hold git-xargs scripts I use to update my repos.

# Running

Needs  `GITHUB_OAUTH_TOKEN`  in environment

## .gitconfig modifications

Due to https://github.com/gruntwork-io/git-xargs/issues/48, I need to
temporarily put user.name and user.email in .root gitconfig...

```bash
fling unlink --ask false -i 'README.*' -s ~/Git-GH/dotfiles/git

git config --global user.name "Benjamin Kane"
git config --global user.email "6081085+bbkane@users.noreply.github.com"
```

After running `git-xargs`, I need to re-symlink my git config:

```bash
rm ~/.gitconfig
fling link --ask false -i 'README.*' -s ~/Git-GH/dotfiles/git
```

# Basic steps for a change

- update example-go-cli with change and test
- write script to update fling but don't commit
- source `GITHUB_OAUTH_TOKEN` and do gitconfig workaround
- run script against fling
- run against other repos
- merge PRs and update spreadsheet
- restore gitconfig

# NEXT - yamllint propagation

Oh boy I unleased yamllint on this.. let's add yamllint to the other repos

what to change in fling

```
master 17:50:09.150 PDT mac02:~/Git-GH/example-go-cli
git diff 577ef89050e7ced7f6e469b7d0af18bb2f296e5e HEAD
```

# Links

- https://blog.gruntwork.io/introducing-git-xargs-an-open-source-tool-to-update-multiple-github-repos-753f9f3675ec
- https://docs.google.com/spreadsheets/d/1R0c6VFFU_vLC45zgs_53rcWDHWRxt4S6UxdxBkFgPpo/edit?usp=sharing
- https://github.com/gruntwork-io/git-xargs#how-to-supply-commands-or-scripts-to-run 
- https://mikefarah.gitbook.io/yq/
- https://www.bbkane.com/blog/go-notes/#code-updates-across-repos

