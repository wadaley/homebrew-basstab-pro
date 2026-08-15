cask "basstab-pro" do
  version "0.2.430"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/a7c9986/Basstab-Pro-mac-arm.dmg"
    sha256 "d828c1539080fa0f30df670d8839a3a8ed3c2701222f3e0831f9674c384fe088"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/a7c9986/Basstab-Pro-mac-intel.dmg"
    sha256 "bc7bbc358eeb573e0528fcea2f4b4c76202ebc7d0ba60e35e2e1a8584a0f5237"
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
