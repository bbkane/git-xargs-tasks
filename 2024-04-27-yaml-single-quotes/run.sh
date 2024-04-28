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

readonly branch_name='git-xargs/2024-04-27-yaml-single-quotes'
readonly commit_message='update goreleaser to use brew directory instead of brew folder'

# grabbit dry run first

# git-xargs \
# 	--repo bbkane/grabbit \
# 	--branch-name git-xargs/2024-04-27-yaml-single-quotes \
# 	--loglevel DEBUG \
# 	--commit-message 'Enforce single quotes in YAML files' \
# 	--no-skip-ci \
#     --dry-run \
# 	"$(pwd)/change.sh"

# grabbit for real

# git-xargs \
# 	--repo bbkane/grabbit \
# 	--branch-name git-xargs/2024-04-27-yaml-single-quotes \
# 	--loglevel DEBUG \
# 	--commit-message 'Enforce single quotes in YAML files' \
# 	--no-skip-ci \
# 	"$(pwd)/change.sh"

# do all Go projects

# git-xargs \
# 	--repo bbkane/envelope \
# 	--repo bbkane/example-go-cli \
# 	--repo bbkane/fling \
# 	--repo bbkane/gocolor \
# 	--repo bbkane/grabbit \
# 	--repo bbkane/logos \
# 	--repo bbkane/shovel \
# 	--repo bbkane/starghaze \
# 	--repo bbkane/tablegraph \
# 	--repo bbkane/warg \
# 	--branch-name "$branch_name" \
# 	--loglevel DEBUG \
# 	--commit-message "$commit_message" \
# 	--no-skip-ci \
# 	"$(pwd)/change.sh"

# Try just envelope

git-xargs \
	--repo bbkane/envelope \
	--branch-name "$branch_name" \
	--loglevel DEBUG \
	--commit-message "$commit_message" \
	--no-skip-ci \
	"$(pwd)/change.sh"
