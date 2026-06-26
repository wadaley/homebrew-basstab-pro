cask "basstab-pro" do
  version "0.2.393"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/b8fddab/Basstab-Pro-mac-arm.dmg"
    sha256 "6d5bef2020c41c6ed2e27a638ad3ef44b71143b3092ccd0c3332588af5854333"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/b8fddab/Basstab-Pro-mac-intel.dmg"
    sha256 "34b29c4a9e89a85d52cc1bb33b575e5124e24706c3d1dd3779a2b427b08da27a"
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
