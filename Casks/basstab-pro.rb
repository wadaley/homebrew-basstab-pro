cask "basstab-pro" do
  version "0.2.372"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/3aab83f/Basstab-Pro-mac-arm.dmg"
    sha256 "356783c728b63e338f267a910bd5efd42109f2c09beb1564b377fce0831e5e06"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/3aab83f/Basstab-Pro-mac-intel.dmg"
    sha256 "368bb63d986b4d43c62292c40fec682b540bd7d7848e0e4453e99bab955057e3"
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
