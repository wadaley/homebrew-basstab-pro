cask "basstab-pro" do
  version "0.1.0"

  on_arm do
    url "https://basstab.pro/desktop/dev/mac-arm/latest/Basstab-Pro-mac-arm.dmg"
    sha256 "8c7266e909c6bb7583e97fec17e24fd8d8d29f62dbfb09eecb4ba032f0e3d324"
  end

  on_intel do
    url "https://basstab.pro/desktop/dev/mac-intel/latest/Basstab-Pro-mac-intel.dmg"
    sha256 "b446dd471490aa9a6051d627d7af91521b5ba48b9fc4ae051811e547f46d38f7"
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
