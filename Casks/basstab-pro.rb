cask "basstab-pro" do
  version "0.2.380"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/d2331d9/Basstab-Pro-mac-arm.dmg"
    sha256 "1d410fd2316bea8c653fabf141a0cc721946d74811e6a29e3de6675347a8a9c1"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/d2331d9/Basstab-Pro-mac-intel.dmg"
    sha256 "66e3abbdc94d5184dfa1795b3b9f4424b86d88113077c1898e22f8f215051991"
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
