cask "basstab-pro" do
  version "0.2.360"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/76b1172/Basstab-Pro-mac-arm.dmg"
    sha256 "e00ac49d691410fba23d8c756d7e4cc5ea513642559b5326ff53e8fa66c27a5c"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/76b1172/Basstab-Pro-mac-intel.dmg"
    sha256 "e575e15cee7ea340cd191154f13966191c27bc96467baf0d55b0b883080da360"
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
