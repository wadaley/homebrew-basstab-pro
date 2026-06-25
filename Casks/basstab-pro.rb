cask "basstab-pro" do
  version "0.2.368"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/c3e2e61/Basstab-Pro-mac-arm.dmg"
    sha256 "53517473c59344a089d189d87618810fd9e4480fee9429bddaf06ed0f26100c1"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/c3e2e61/Basstab-Pro-mac-intel.dmg"
    sha256 "39736be9e94c61c36265caf090ff46cde927440030522408eec2520fdf31e2aa"
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
