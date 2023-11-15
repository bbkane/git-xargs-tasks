#!/bin/bash

# exit the script on command errors or unset variables
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# - copy yamllint config
cp "/Users/bbkane/Git-GH/example-go-cli/.yamllint.yml" .

# - update lefthook
yq -i '.pre-commit.commands.yamllint = {"run": "yamllint"}' lefthook.yml

# - update ci
# https://mikefarah.gitbook.io/yq/operators/add#append-to-existing-array and figure it out
yq -i '.jobs.setup.steps += {"name": "Install yamllint", "run": "pip install yamllint"}' .github/workflows/ci.yml
yq -i '.jobs.setup.steps += {"name": "Lint YAML files", "run": "yamllint ."}' .github/workflows/ci.yml

# - run yq to format
# - run yamllint? Or let CI do that?
