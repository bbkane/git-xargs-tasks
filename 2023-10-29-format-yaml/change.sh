#!/bin/bash

# exit the script on command errors or unset variables
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# - copy yamllint config
cp "/Users/bbkane/Git-GH/example-go-cli/.yamllint.yml" .

# - update lefthook
yq -i '.pre-commit.commands.yamllint = {"run": "yamllint ."}' lefthook.yml

# - update ci
# https://mikefarah.gitbook.io/yq/operators/add#append-to-existing-array and figure it out
yq -i '.jobs.setup.steps += {"name": "Install yamllint", "run": "pip install yamllint"}' .github/workflows/ci.yml

yq -i '.jobs.setup.steps += {"name": "Lint YAML files", "run": "yamllint ."}' .github/workflows/ci.yml

# - run yq to format
find . \( -name '*.yaml' -o -name '*.yml' \) -exec yq -i -P 'sort_keys(..)' {} \;

# - ignore 'on' key for yaml truthiness
perl -pi -w -e 's/^on:$/on: # yamllint disable-line rule:truthy/g;' .github/workflows/*.yml

# - run yamllint - should pass since we just formatted
yamllint .

# quitting for now. Next steps:
# - run against other repos
# - create PRs
