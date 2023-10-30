This should add YAMl config to run yamllint, then format yaml and run yamllint...

My yq script isn't quite working, so I'm gonna stop here and nap. See main.sh for script

Notes from journal:

```
yq -i -P 'sort_keys(..)' lefthook.yml
```

works fantastically

```bash
find . -name '*.yml' -exec yq -i -P 'sort_keys(..)' '{}' \;
find . -name '*.yaml' -exec yq -i -P 'sort_keys(..)' '{}' \;
```

Note that I only need the `*.yaml` version for `./dist/...`, which is ignored by git anyway

Next steps:
