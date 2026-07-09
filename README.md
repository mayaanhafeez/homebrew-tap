# homebrew-tap

Personal Homebrew tap for [mayaanhafeez](https://github.com/mayaanhafeez)'s tools.

```
brew tap mayaanhafeez/tap
brew install ssht
brew install keyboard-cleaner-cli
```

> Note: `keyboard-cleaner-cli` is named that way (not the shorter `keyboard-cleaner`)
> because an unrelated app of that name already exists in the main `homebrew-cask`
> repo. Always install with the full tap path or the `-cli` suffix so Homebrew
> doesn't resolve to the wrong one.

## Formulas

| Formula | Source |
| --- | --- |
| [`ssht`](Formula/ssht.rb) | [mayaanhafeez/ssht](https://github.com/mayaanhafeez/ssht) |
| [`keyboard-cleaner-cli`](Formula/keyboard-cleaner-cli.rb) | [mayaanhafeez/keyboard_cleaner](https://github.com/mayaanhafeez/keyboard_cleaner) |
