cask "codeisland" do
  version "2.0.8"
  sha256 "410f844c2e49bb27ed53d6049af42e6d6527c3611aec9f6a62e486257dcd604e"

  url "https://github.com/MioMioOS/MioIsland/releases/download/v#{version}/CodeIsland-v#{version}.zip"
  name "Mio Island"
  desc "Your AI agents live in the macOS notch — Claude Code companion"
  homepage "https://github.com/MioMioOS/MioIsland"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :sequoia" # macOS 15.0+

  app "Mio Island.app"

  # MioIsland ships unsigned as a deliberate project policy — Apple's
  # notary service repeatedly failed with server-side statusCode 7000 and
  # we stopped fighting it. Strip the quarantine attribute on install so
  # Homebrew users do not hit Gatekeeper on first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Mio Island.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Mio Island",
    "~/Library/Caches/com.codeisland.app",
    "~/Library/Preferences/com.codeisland.app.plist",
    "~/Library/Saved Application State/com.codeisland.app.savedState",
  ]
end
