#!/bin/bash

# exit the script on command errors or unset variables
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

yq -i '.brews.[0].repository = .brews.[0].tap | del(.brews.[0].tap)' .goreleaser.yml

yq -i '.scoops = [.scoop] | del(.scoop)' .goreleaser.yml
yq -i '.scoops.[0].repository = .scoops.[0].bucket | del(.scoops.[0].bucket)' .goreleaser.yml

# - run yq to format
find . \( -name '*.yaml' -o -name '*.yml' \) -exec yq -i -P 'sort_keys(..)' {} \;

yamllint .

## -- TODO: Delete
