cask "basstab-pro" do
  version "0.2.424"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/15c42aa/Basstab-Pro-mac-arm.dmg"
    sha256 "c84c86b9b7399c7d38de4c22c77ec168950c15ab6debb7b48b653a43391bb835"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/15c42aa/Basstab-Pro-mac-intel.dmg"
    sha256 "4d7402552eede60fff92150323bd2a15568071a99e52d7f31e48a59f5e222788"
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
