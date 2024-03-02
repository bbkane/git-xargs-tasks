Fix the following when running goreleaser

  • setting defaults
    • DEPRECATED:  brews.tap  should not be used anymore, check https://goreleaser.com/deprecations#brewstap for more info
    • DEPRECATED:  scoop  should not be used anymore, check https://goreleaser.com/deprecations#scoop for more info
    • DEPRECATED:  scoops.bucket  should not be used anymore, check https://goreleaser.com/deprecations#scoopsbucket for more info

Let's get the changelog feature working better as well

TODO: fixing the changelog will have to wait, I'm taking a small detour to fix envelope...

Once envelope is fixed and I get my envvars back, I need to:

- fix it so goreleaser either doesn't do release notes or points to my changelog as a link (see --releas-notes)
- apploy this to example-go-cli
- release a new example-go-cli version to test
- fix up all the others
