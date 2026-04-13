cask "codeisland" do
  version "2.0.3"
  sha256 "5c325b9d35b9ec6b931dea95e0a25a77e45a9584fd6edc5d1bf3b9a6f8890077"

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
