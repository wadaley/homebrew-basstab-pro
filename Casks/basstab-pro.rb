cask "basstab-pro" do
  version "0.2.474"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/4de313f/Basstab-Pro-mac-arm.dmg"
    sha256 "1984ff6d2f15630cd082e3ec3f68bf380874b360879263e0a623a01cce8dc0b6"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/4de313f/Basstab-Pro-mac-intel.dmg"
    sha256 "9994675ee91372f640d34ff75ba94de5f3a0686101f5c81ada5f48851ad682e6"
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
