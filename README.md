Hold git-xargs scripts I use to update my repos. TODO: update this README!

See https://www.bbkane.com/blog/go-notes/#code-updates-across-repos

Needs  `GITHUB_OAUTH_TOKEN`  in environment

Let's start with the spreadsheet - made https://docs.google.com/spreadsheets/d/1R0c6VFFU_vLC45zgs_53rcWDHWRxt4S6UxdxBkFgPpo/edit?usp=sharing

update example-go-cli: done

https://blog.gruntwork.io/introducing-git-xargs-an-open-source-tool-to-update-multiple-github-repos-753f9f3675ec

https://mikefarah.gitbook.io/yq/

https://github.com/gruntwork-io/git-xargs#how-to-supply-commands-or-scripts-to-run 

# .gitconfig modifications

https://github.com/gruntwork-io/git-xargs/issues/48

Due to this, I need to temporarily put user.name and user.email in .gitconfig...

```bash
fling unlink -i 'README.*' -s ~/Git-GH/dotfiles/git

git config --global user.name "Benjamin Kane"
git config --global user.email "6081085+bbkane@users.noreply.github.com"
```

Afterwards, I need to re-symlink my git config:

```bash
fling link -i 'README.*' -s ~/Git-GH/dotfiles/git
```

# Basic steps

- update example-go-cli with change and test
- write script to update fling but don't commit
- update `~/Git-GH/git-xargs-tasks/update-goreleasor-embedded-version` with script
- source envvar
- do gitconfig workaround
- run against fling
- run against other repos
- merge PRs and update spreadsheet
- restore gitconfig

# NEXT - yamllint propagation

Oh boy I unleased yamllint on this.. let's add yamllint to the other repos

what to change in fling

```
master 17:50:09.150 PDT mac02:~/Git-GH/example-go-cli
$ git diff 577ef89050e7ced7f6e469b7d0af18bb2f296e5e HEAD
```

## yq script to update fling

## git-xargs on the rest of them

Oh boy. I had yamllint doing stuff. Merged that except the sorted keys stuff, which maybe I'll get to at some point

