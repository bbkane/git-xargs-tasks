#!/bin/bash

# exit the script on command errors or unset variables
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# https://stackoverflow.com/a/246128/295807
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly script_dir
cd "${script_dir}"

set -x

# Can add:
# 	--dry-run true \

git-xargs \
	--repo bbkane/fling \
	--repo bbkane/grabbit \
	--repo bbkane/starghaze \
	--repo bbkane/tablegraph \
	--branch-name git-xargs/update-goreleasor-embedded-version \
	--loglevel DEBUG \
	--commit-message 'Prefix goreleasor-embedded version with v' \
	--no-skip-ci \
	yq -i '.builds[0].ldflags[0] = "-s -w -X main.version=v{{.Version}} -X main.commit={{.Commit}} -X main.date={{.Date}} -X main.builtBy=goreleaser"' .goreleaser.yml

