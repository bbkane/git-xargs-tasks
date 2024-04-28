#!/bin/bash

# exit the script on command errors or unset variables
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

yq -i '.brews.[0].directory = .brews.[0].folder | del(.brews.[0].folder)' .goreleaser.yml

cp ~/Git-GH/example-go-cli/.github/workflows/release.yml .github/workflows/release.yml

find . \( -name '*.yaml' -o -name '*.yml' \) -exec yq -i -P 'sort_keys(..)' {} \;

