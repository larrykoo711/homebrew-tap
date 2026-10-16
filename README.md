# larrykoo711/tap

Homebrew formulae for [larrykoo711](https://github.com/larrykoo711)'s projects.

## Install

```sh
brew install larrykoo711/tap/<formula>
```

Or tap once, then install by name:

```sh
brew tap larrykoo711/tap
brew install <formula>
```

## Formulae

| Formula | What it is | Platforms | Project |
|---------|------------|-----------|---------|
| `cc-moss` | Recoverable Claude Code sessions in tmux | macOS, Linux | [larrykoo711/cc-moss](https://github.com/larrykoo711/cc-moss) |
| `bibo` | Fast, local neural text-to-speech CLI | macOS | [larrykoo711/bibo](https://github.com/larrykoo711/bibo) |
| `wxemma` | Run multiple WeChat instances on macOS | macOS | [larrykoo711/wechat-emma](https://github.com/larrykoo711/wechat-emma) |

## How formulae are updated

Each project's release workflow builds its binaries, publishes a GitHub Release and
commits the new formula here. Pull requests run `brew style` and `brew audit` on
every formula.

## Issues

A problem with a tool itself belongs in that project's issue tracker. A problem
with installing it (a broken checksum, a missing dependency) is welcome
[here](https://github.com/larrykoo711/homebrew-tap/issues).

## License

[MIT](LICENSE). Each formula installs software under that project's own license.
