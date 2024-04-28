#!/bin/bash

# exit the script on command errors or unset variables
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

cp ~/Git-GH/example-go-cli/.yamllint.yml .yamllint.yml

find . \( -name '*.yaml' -o -name '*.yml' \) -exec yq -i -P 'sort_keys(..)' {} \;

# yamllint .
