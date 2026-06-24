cask "basstab-pro" do
  version "0.2.348"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/68f26d8/Basstab-Pro-mac-arm.dmg"
    sha256 "dbdb85ee765c77c09420513d0abcca9a21fa6fd75fe401115a16e25317cfd70c"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/68f26d8/Basstab-Pro-mac-intel.dmg"
    sha256 "161f07efd1f3876da268620c02559e803c87b8e35ac6138053f3f57da09d9191"
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
