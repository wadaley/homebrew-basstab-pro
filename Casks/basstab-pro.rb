cask "basstab-pro" do
  version "0.2.471"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/8b5074d/Basstab-Pro-mac-arm.dmg"
    sha256 "f2e0d7233f89fb6e8389608ccb55a7ea7d2e8cdd3bddabfa148b428bf3a16cc5"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/8b5074d/Basstab-Pro-mac-intel.dmg"
    sha256 "69f45bb4ae5b03078815cb6341e986d2589e666b51280c1879a78edfe5c582b5"
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
