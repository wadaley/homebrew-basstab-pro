cask "basstab-pro" do
  version "0.2.355"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/7f353f3/Basstab-Pro-mac-arm.dmg"
    sha256 "e461aa11f3392a948e3067699d3a0762d10993b0a5fc48d6d207ce5ded587bdb"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/7f353f3/Basstab-Pro-mac-intel.dmg"
    sha256 "e13957067666466b2c12918541a8de6b8197e674140336893cd3b530545cd58e"
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
