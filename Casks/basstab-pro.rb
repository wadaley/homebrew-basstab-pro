cask "basstab-pro" do
  version "0.2.442"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/a31a61a/Basstab-Pro-mac-arm.dmg"
    sha256 "3a6f500ebfc53c369ab71f83fc0cfb68e639171d11f56a6d03fbab74cbf7c502"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/a31a61a/Basstab-Pro-mac-intel.dmg"
    sha256 "c9bad23f3604e726e8fa7c70204734d9635b4110b4671b3f588809ab7402ea9c"
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
