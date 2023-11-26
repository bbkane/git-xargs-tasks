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
    --repo bbkane/gocolor \
    --repo bbkane/grabbit \
    --repo bbkane/logos \
    --repo bbkane/shovel \
    --repo bbkane/starghaze \
    --repo bbkane/tablegraph \
    --repo bbkane/warg \
    --branch-name git-xargs/yamllint-ignore-dist \
    --loglevel DEBUG \
    --commit-message 'Format yaml and add lint' \
    --no-skip-ci \
    cp "/Users/bbkane/Git-GH/example-go-cli/.yamllint.yml" .
