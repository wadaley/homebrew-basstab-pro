cask "basstab-pro" do
  version "0.2.375"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/4932f84/Basstab-Pro-mac-arm.dmg"
    sha256 "587036b1746592404de3b2c7b93bfa47172d327658582f2ae065b3f5810f17fe"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/4932f84/Basstab-Pro-mac-intel.dmg"
    sha256 "1fc5f2f3ac9b2dee1061833c8c7206758ac00c40ea24f6bc35d76c743650e6bb"
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
