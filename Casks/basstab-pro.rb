cask "basstab-pro" do
  version "0.2.340"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/8cb3053/Basstab-Pro-mac-arm.dmg"
    sha256 "28eb4903fc2bb705d17d693cc77d21de5e1f7657fdba499f28d89e5d98e01b6f"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/8cb3053/Basstab-Pro-mac-intel.dmg"
    sha256 "32ad72b657358860379c341c0acfadd716e9314d1cc0a6e9084ff89c85166c65"
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
