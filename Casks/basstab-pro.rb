cask "basstab-pro" do
  version "0.2.438"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/e022b92/Basstab-Pro-mac-arm.dmg"
    sha256 "55c2692133a12504cedf63fd44b262f77e99422f802b0e119102113e1826cc7b"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/e022b92/Basstab-Pro-mac-intel.dmg"
    sha256 "6f6ecbc56be6872a25fd4fa9214a49dc906ef685de4a04886494ec8d8fb9878b"
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
