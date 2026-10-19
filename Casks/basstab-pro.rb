cask "basstab-pro" do
  version "0.2.507"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/241b6d4/Basstab-Pro-mac-arm.dmg"
    sha256 "f4e9b5b71f9b9795ed540a2d99c39aad59f12cbe8743692a22fb683a8b5b71d8"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/241b6d4/Basstab-Pro-mac-intel.dmg"
    sha256 "12cf6da39d3290c000387545337998cf4c6871bbb4a924beccf618ec9684d851"
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
