cask "basstab-pro" do
  version "0.2.389"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/48af3ff/Basstab-Pro-mac-arm.dmg"
    sha256 "726e549e985abd0d03355b80422f65fb7a7a663f6ca9c9dc998131e6433d58c3"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/48af3ff/Basstab-Pro-mac-intel.dmg"
    sha256 "2ddaa66e786b22b6f9fcdf246db46329224e3afc7d880f7329cfa30b48879d6d"
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
