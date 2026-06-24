cask "basstab-pro" do
  version "0.2.353"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/1a0435f/Basstab-Pro-mac-arm.dmg"
    sha256 "f2affafe3370dd40044afb4508b0fbbda437e42d395aaa3c9674467ef951be83"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/1a0435f/Basstab-Pro-mac-intel.dmg"
    sha256 "96684eccf618132b89bcb2b085712debe9cade5dd88d86f641fe562b681e59f3"
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
