cask "basstab-pro" do
  version "0.2.420"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/b43f9b9/Basstab-Pro-mac-arm.dmg"
    sha256 "60a4396529619a1cdbde52f59bfb693d8eeceb1c1c9a1665dae9334979e12dab"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/b43f9b9/Basstab-Pro-mac-intel.dmg"
    sha256 "afcb029fb1fa155582e2b7dd59b2fa21eae0068c6738912270ae210c5900ddd7"
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
