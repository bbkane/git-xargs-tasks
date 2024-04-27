#!/bin/bash

# exit the script on command errors or unset variables
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

yq -i '.brews.[0].folder = .brews.[0].directory | del(.brews.[0].folder)' .goreleaser.yml

lefthook run pre-commit --force
