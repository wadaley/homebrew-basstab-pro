cask "basstab-pro" do
  version "0.2.344"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/e233a86/Basstab-Pro-mac-arm.dmg"
    sha256 "c8196ef629992d99592ff6acf0bf9dcb2f780b3fe65440935ec80bea9c0958dd"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/e233a86/Basstab-Pro-mac-intel.dmg"
    sha256 "7f54fd5fa597e79f0a4e28026a52cb82059a8e492f8e5c508ba7c2ac6d94bc72"
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
