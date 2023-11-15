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
# 	--dry-run

git-xargs \
	--repo bbkane/fling \
	--branch-name git-xargs/format-yaml \
	--loglevel DEBUG \
	--commit-message 'Format yaml and add lint' \
	--no-skip-ci \
    --dry-run \
    "$(pwd)/change.sh"
