cask "basstab-pro" do
  version "0.2.386"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/da86d29/Basstab-Pro-mac-arm.dmg"
    sha256 "12bdada157b514bd844c62db2d323b09ec436b2f51fc1c3196325ffc6419cfe7"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/da86d29/Basstab-Pro-mac-intel.dmg"
    sha256 "afee445788d13af85a3120f486941ea19fa14de77697baf48cc1ec69b53035c4"
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
