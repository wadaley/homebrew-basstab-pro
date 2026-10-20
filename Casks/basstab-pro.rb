cask "basstab-pro" do
  version "0.2.539"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/bd79419/Basstab-Pro-mac-arm.dmg"
    sha256 "ce7269b517cb7ee201b411120023420b712a6de832fd7d2eb3a7d49a750caa9e"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/bd79419/Basstab-Pro-mac-intel.dmg"
    sha256 "eff32b77984a2a13c1f276803b973bef61097dd2aa7dfaa15de240fd2631d5f1"
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
