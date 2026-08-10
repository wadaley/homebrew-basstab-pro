cask "basstab-pro" do
  version "0.2.410"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/ee49878/Basstab-Pro-mac-arm.dmg"
    sha256 "3ea0c027fe7d565c2ea4d30abb590e325e40e9cff98425ff1b799bb7fd3968ee"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/ee49878/Basstab-Pro-mac-intel.dmg"
    sha256 "bb6095b7a3fa5bcc3d7a9cda036c143b06606ea62e4a1de9e17d69fd4592fe0d"
  end

  name "Basstab Pro"
  desc "Bass tab analysis and practice workstation"
  homepage "https://basstab.pro"

  app "Basstab Pro.app"

  # Remove macOS quarantine flag so Gatekeeper does not block unsigned builds.
  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/Basstab Pro.app"]
  end

  zap trash: [
    "~/Library/Application Support/Basstab Pro",
    "~/Library/Logs/Basstab Pro",
    "~/Library/Preferences/com.basstab.pro.plist",
  ]
end
