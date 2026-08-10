cask "basstab-pro" do
  version "0.2.411"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/fa5674b/Basstab-Pro-mac-arm.dmg"
    sha256 "121f4cd004ec84f3df57768a05b132642e652e170f7aef94b29e0d7adb5524f7"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/fa5674b/Basstab-Pro-mac-intel.dmg"
    sha256 "866e06ba080314c89ac4e6979eee7c76c4d688765b96e80a66576e0d95dc7e4f"
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
