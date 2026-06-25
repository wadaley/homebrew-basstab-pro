cask "basstab-pro" do
  version "0.2.390"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/f364feb/Basstab-Pro-mac-arm.dmg"
    sha256 "353ea6e4f487924abe7ca5fbacfa570fc16553ecfba93f0a19f2cde2505ad7ae"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/f364feb/Basstab-Pro-mac-intel.dmg"
    sha256 "be87ca68cf4065d3e272b2176ac9de7adfb74b9e2e7a95e507fc4eb5c4866faa"
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
