cask "basstab-pro" do
  version "0.2.402"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/6d9de74/Basstab-Pro-mac-arm.dmg"
    sha256 "099d28ca95ff06933d0bf07fab9135d9b4f4cb7ac54bce8d8fcb15bd64859e2c"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/6d9de74/Basstab-Pro-mac-intel.dmg"
    sha256 "799bb5cc9e3a44c7db12cd1210bac8504c5fbe16287faffacb940f7f81fc37e3"
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
