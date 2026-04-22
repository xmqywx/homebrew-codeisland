cask "codeisland" do
  version "2.2.5"
  sha256 "43c8dacf48e4f3c186daa48810d56ff834b774b30171824e78842408f5503c12"

  url "https://github.com/MioMioOS/MioIsland/releases/download/v#{version}/MioIsland-v#{version}.zip"
  name "Mio Island"
  desc "Your AI agents live in the macOS notch — Claude Code companion"
  homepage "https://github.com/MioMioOS/MioIsland"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma" # macOS 15.0+

  app "Mio Island.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Mio Island.app"],
                   sudo: false
    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "--sign", "-", "#{appdir}/Mio Island.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Mio Island",
    "~/Library/Caches/com.codeisland.app",
    "~/Library/Preferences/com.codeisland.app.plist",
    "~/Library/Saved Application State/com.codeisland.app.savedState",
    "~/.config/codeisland",
  ]
end
