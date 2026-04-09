cask "codeisland" do
  version "1.10.0-rc1"
  sha256 "001888bd1f37f1cb79536e48ab1b00975abc1dcd9482be5515f97b0b79b88870"

  url "https://github.com/xmqywx/CodeIsland/releases/download/v#{version}/CodeIsland-v#{version}.zip",
      verified: "github.com/xmqywx/CodeIsland/"
  name "CodeIsland"
  desc "Your AI agents live in the macOS notch — Claude Code companion"
  homepage "https://github.com/xmqywx/CodeIsland"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :sequoia" # macOS 15.0+

  app "Code Island.app"

  # The current build is signed with our Developer ID but not yet notarized
  # by Apple — we are working with Apple Developer Programs Support to
  # resolve a server-side notarization configuration issue (error 7000).
  # Until that is resolved, strip the quarantine attribute on install so
  # users do not have to right-click → Open the app on first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Code Island.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Code Island",
    "~/Library/Caches/com.codeisland.app",
    "~/Library/Preferences/com.codeisland.app.plist",
    "~/Library/Saved Application State/com.codeisland.app.savedState",
  ]
end
