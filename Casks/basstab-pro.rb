cask "basstab-pro" do
  version "0.2.423"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/c069680/Basstab-Pro-mac-arm.dmg"
    sha256 "4ec5bbb3f6a83d63abdfc8280b9ece14d48141ddee2802d76541c9694c984271"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/c069680/Basstab-Pro-mac-intel.dmg"
    sha256 "2c4974039e73b72ca8df5022280f22285a9e5df84688ab7fe098fbf9b73fc7da"
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
