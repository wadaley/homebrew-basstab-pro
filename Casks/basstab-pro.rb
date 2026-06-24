cask "basstab-pro" do
  version "0.2.356"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/58da5d8/Basstab-Pro-mac-arm.dmg"
    sha256 "2b00947abb355947dd3758da7e573babc694fa9042d2c8dc814bcf049a52d4f7"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/58da5d8/Basstab-Pro-mac-intel.dmg"
    sha256 "1dcc3d7553ff93dca86c585465516ac8cad3f727824e63fc0955786ce84c550c"
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
