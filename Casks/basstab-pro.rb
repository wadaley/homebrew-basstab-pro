cask "basstab-pro" do
  version "0.2.470"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/8b5074d/Basstab-Pro-mac-arm.dmg"
    sha256 "58dc34c2007dcc9e68a5381c4f3c574ad290a5a547244e105733251dc1936800"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/8b5074d/Basstab-Pro-mac-intel.dmg"
    sha256 "dca806e051deb25344bfe7f039bcea99fd3b989e72b3882823446b0d3985bb3b"
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
