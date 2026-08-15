cask "basstab-pro" do
  version "0.2.435"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/8e2e9a3/Basstab-Pro-mac-arm.dmg"
    sha256 "0fbd4c68ca6741bf81796824e410011322bf30053af131866707c9acd850c98e"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/8e2e9a3/Basstab-Pro-mac-intel.dmg"
    sha256 "e826fdf3800517394c2433eda101eaa56b0d2ecd2fbf6e4ba0c1a8499e8620c6"
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
