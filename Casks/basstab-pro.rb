cask "basstab-pro" do
  version "0.2.347"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/ea03163/Basstab-Pro-mac-arm.dmg"
    sha256 "9420d9a18988d6d012b18c67a908bc031defbc096f3ad4ed418140fd560b50d1"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/ea03163/Basstab-Pro-mac-intel.dmg"
    sha256 "5b4c11a197d0f79691f468f0de2930d226182a0cc98bdbe185f195e9950517b5"
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
