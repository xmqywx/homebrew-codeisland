# homebrew-codeisland

Homebrew tap for [**CodeIsland**](https://github.com/xmqywx/CodeIsland) — your AI agents live in the macOS notch.

## Install

```bash
brew tap xmqywx/codeisland
brew install --cask codeisland
```

That's it. The app installs to `/Applications/Code Island.app` and is ready to launch from Spotlight or Launchpad.

## Update

```bash
brew update
brew upgrade --cask codeisland
```

## Uninstall

```bash
brew uninstall --cask codeisland
# Optional — also wipe app data, caches, and preferences:
brew uninstall --zap --cask codeisland
```

## Requirements

- **macOS 15.0** (Sequoia) or later
- Universal binary — works on both **Apple Silicon** and **Intel** Macs

## ⚠️ Notarization Notice

The current builds are **code-signed with our Developer ID** but **not yet notarized** by Apple. We are actively working with Apple Developer Programs Support to resolve a server-side configuration issue (notarization error 7000) on Apple's end.

To keep the install experience smooth, this cask runs `xattr -dr com.apple.quarantine` on the installed app in a `postflight` hook so you do **not** need to right-click → Open on first launch — `brew install --cask codeisland` followed by a normal double-click just works.

Once Apple resolves the notarization issue, the `postflight` hook will be removed and the cask will fall back to the default Gatekeeper verification path.

## What is CodeIsland?

CodeIsland is a free and open-source macOS companion for Claude Code that lives in your MacBook's notch. It shows live session phases, recent messages, approval prompts, and lets you launch sessions and reply from a phone via the [Code Light](https://github.com/xmqywx/CodeLight) iPhone app.

See the [main repository](https://github.com/xmqywx/CodeIsland) for screenshots and a full feature list.

## License

The cask itself is provided under the same terms as Homebrew.

CodeIsland is distributed under [CC BY-NC 4.0](https://github.com/xmqywx/CodeIsland/blob/main/LICENSE.md).
