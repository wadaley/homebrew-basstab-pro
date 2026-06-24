cask "basstab-pro" do
  version "0.2.346"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/1045372/Basstab-Pro-mac-arm.dmg"
    sha256 "8b28d264cfc9f7fdc6d60c5683983a11abd083d6708730c5dd55afabd2e4d26a"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/1045372/Basstab-Pro-mac-intel.dmg"
    sha256 "5440752fcdc40ee1583a69b508105ee851bbbae613944277edadbc3aa1836a3b"
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
