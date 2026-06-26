cask "basstab-pro" do
  version "0.2.394"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/7b943b0/Basstab-Pro-mac-arm.dmg"
    sha256 "e08f08f465b7a5d459f22883cf6076a84e6d7d2f9879c0d6b830ba67cc10141e"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/7b943b0/Basstab-Pro-mac-intel.dmg"
    sha256 "37ae05eba1d8c40a7119a260757b5e3d0dffe4adfeec0c8718f8579398506257"
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
