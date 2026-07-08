cask "basstab-pro" do
  version "0.2.401"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/30a4dfc/Basstab-Pro-mac-arm.dmg"
    sha256 "a36a3b754716e42c92841288be7fcb637d3fb419d1bc00be631bf1b9992cf48a"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/30a4dfc/Basstab-Pro-mac-intel.dmg"
    sha256 "2c54788167522530491c85c24bae17a04235f5d05a24e0e666ab8c4ced9c209c"
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
