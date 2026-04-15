cask "codeisland" do
  version "2.1.1"
  sha256 "ca350da9acdda7c948ab6f87dc35277611505e58919c963f40da76c2dc2128e3"

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
