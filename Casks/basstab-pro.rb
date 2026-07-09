cask "basstab-pro" do
  version "0.2.406"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/bb86a20/Basstab-Pro-mac-arm.dmg"
    sha256 "e6f0c683435ad6b21d22f22e94633d1772c03ee8e4343c40561af317a1cb3833"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/bb86a20/Basstab-Pro-mac-intel.dmg"
    sha256 "d3cb0dfd5ea9e16f0e10231cf3a56343a556af145f1177621cc9d60e62a570a9"
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
