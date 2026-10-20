cask "basstab-pro" do
  version "0.2.530"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/1d01652/Basstab-Pro-mac-arm.dmg"
    sha256 "bb1bdf3c0adc9aa6fdaa699b8ab12cd842f337c38113775ec6b79dbbc8c1786b"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/1d01652/Basstab-Pro-mac-intel.dmg"
    sha256 "0e53c6e619f6fd65173af1ab7022562507450d258148bf51275d130e92f05042"
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
