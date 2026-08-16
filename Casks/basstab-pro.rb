cask "basstab-pro" do
  version "0.2.437"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/82688f1/Basstab-Pro-mac-arm.dmg"
    sha256 "eb8596fa9243a1d10e637433024866cfbb441fa9703f3ac1a161932d96bb0049"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/82688f1/Basstab-Pro-mac-intel.dmg"
    sha256 "fcc005558ed9bea9b99b4a0df9a0bc6f01455303816408f5ae4777994a3d692a"
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
