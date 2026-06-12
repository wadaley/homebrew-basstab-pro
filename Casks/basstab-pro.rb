cask "basstab-pro" do
  version "0.2.0"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/latest/Basstab-Pro-mac-arm.dmg"
    sha256 "092a77dcea86e4a2c1de7d5b90ca3eff1da7884f6a6bea843f5229de130245ca"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/latest/Basstab-Pro-mac-intel.dmg"
    sha256 "4d6d98073767a17bbee0587e7d13420fed69bbd877066e7b1fa0d90ed1adbb8d"
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
