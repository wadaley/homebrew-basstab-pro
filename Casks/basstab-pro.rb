cask "basstab-pro" do
  version "0.2.542"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/26cbdf9/Basstab-Pro-mac-arm.dmg"
    sha256 "aeb4178eadee5c99d2c7f6c3612cb2cadfa9e817769c924fe497dae327b093ea"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/26cbdf9/Basstab-Pro-mac-intel.dmg"
    sha256 "196ba90599ccfadb2bcd627d672e1b284a039c1a1c494178af9d59fcedbdb9ca"
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
