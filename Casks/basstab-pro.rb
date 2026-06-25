cask "basstab-pro" do
  version "0.2.379"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/bb63953/Basstab-Pro-mac-arm.dmg"
    sha256 "2ccdaee52777f03001c02ff4b5336c5f7bca66cf77c982cd0fd1dda7a4c47de7"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/bb63953/Basstab-Pro-mac-intel.dmg"
    sha256 "5efe673922952a90f376ea726bf94393667cb1db613aee636f888363d50c6653"
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
