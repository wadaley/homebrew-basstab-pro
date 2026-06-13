cask "basstab-pro" do
  version "0.2.0"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/latest/Basstab-Pro-mac-arm.dmg"
    sha256 "f38f5a8e165fdd69152db05bf99167ca114e680834cf280a2091a69d082c4c32"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/latest/Basstab-Pro-mac-intel.dmg"
    sha256 "4afbf4e345cbf782ec42205922ad6066aa266fc38743dd6356cfcd0531cc31a1"
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
