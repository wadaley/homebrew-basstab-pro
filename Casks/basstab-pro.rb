cask "basstab-pro" do
  version "0.2.512"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/8ccc131/Basstab-Pro-mac-arm.dmg"
    sha256 "328fc85fed2e036d4a523e2dc72e332d9dd22c9264ccd991c8b499479a58593d"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/8ccc131/Basstab-Pro-mac-intel.dmg"
    sha256 "7ef1b00b57a7a17bb4db32bafb2cc0b4c8b5bed8de8e1bf02daac291b5ea4b9b"
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
