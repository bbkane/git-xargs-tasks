Fix the following when running goreleaser

- brews[0].folder renamed to directory
- update GH workflow to make release notes just a link to the changelog

TODO: this change

- check release notes for example
- cp release.yml to all dirs in change.sh
- make all PRs


TODO: put in separate change for libs + CLIs, not just CLIs

- enforce single quotes with yamllint (already in example, envelope) - just copy over .yamllint.yml
