cask "codeisland" do
  version "2.0.5"
  sha256 "899b6566c3188d33e7905c9617753ab30024b0c23d5d25b85a8b5af088bc7578"

  url "https://github.com/MioMioOS/MioIsland/releases/download/v#{version}/CodeIsland-v#{version}.zip",
      verified: "github.com/MioMioOS/MioIsland/"
  name "CodeIsland"
  desc "Your AI agents live in the macOS notch — Claude Code companion"
  homepage "https://github.com/MioMioOS/MioIsland"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :sequoia" # macOS 15.0+

  app "Code Island.app"

  # CodeIsland ships unsigned as a deliberate project policy — Apple's
  # notary service repeatedly failed with server-side statusCode 7000 and
  # we stopped fighting it. Strip the quarantine attribute on install so
  # Homebrew users do not hit Gatekeeper on first launch.
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
