cask "basstab-pro" do
  version "0.2.395"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/60e32cb/Basstab-Pro-mac-arm.dmg"
    sha256 "fcfdacd0416df80d59d1b1fefc2a2a5a3a47ce9577fdd42c2257275f34dea602"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/60e32cb/Basstab-Pro-mac-intel.dmg"
    sha256 "beaa0a1ef2be1a0e8c0a5a6707d7ffcfb33a73370440b3e477d1214641a7ade0"
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
