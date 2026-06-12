cask "basstab-pro" do
  version "0.1.0"

  on_arm do
    url "https://basstab.pro/desktop/dev/mac-arm/latest/Basstab-Pro-mac-arm.dmg"
    sha256 "716ab09a9dce478cc4e5c96e398c582d8b5efef8dd2c09a056505bf9ebca5077"
  end

  on_intel do
    url "https://basstab.pro/desktop/dev/mac-intel/latest/Basstab-Pro-mac-intel.dmg"
    sha256 "218534ac45d6b765743e0f27828d09f394f1617f125ee571b3781050877a2ae6"
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
