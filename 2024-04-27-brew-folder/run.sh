#!/bin/bash

# exit the script on command errors or unset variables
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# https://stackoverflow.com/a/246128/295807
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly script_dir
cd "${script_dir}"

set -x

# Can add:
# 	--dry-run


git-xargs \
	--repo bbkane/envelope \
	--repo bbkane/example-go-cli \
	--repo bbkane/fling \
	--repo bbkane/grabbit \
	--repo bbkane/shovel \
	--repo bbkane/starghaze \
	--repo bbkane/tablegraph \
	--branch-name git-xargs/2024-04-27-brew-folder \
	--loglevel DEBUG \
	--commit-message 'update goreleaser to use brew directory instead of brew folder' \
	--no-skip-ci \
    --dry-run \
	"$(pwd)/change.sh"
