cask "basstab-pro" do
  version "0.2.378"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/9ec93cd/Basstab-Pro-mac-arm.dmg"
    sha256 "a03adf7e5ba14176f0261c58612c9e0ed3618fefd9c82c5e6ba5fb3e10606bca"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/9ec93cd/Basstab-Pro-mac-intel.dmg"
    sha256 "7ff12cf571b9da4d504229f2ec9f6c5eb2a88bc3e46279387e53e10d477a2c7a"
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
