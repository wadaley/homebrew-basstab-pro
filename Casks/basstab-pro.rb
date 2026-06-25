cask "basstab-pro" do
  version "0.2.370"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/bfe383b/Basstab-Pro-mac-arm.dmg"
    sha256 "ce5b0e955c6565cb26014d68abd81e6b92f6b4b9c597dcddb8f680fc04cf0fb4"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/bfe383b/Basstab-Pro-mac-intel.dmg"
    sha256 "59ac51e015691d898df5e870582062c4c96011ebccf24cd802848dc9b9a7187d"
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
