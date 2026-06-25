cask "basstab-pro" do
  version "0.2.367"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/9edb5a0/Basstab-Pro-mac-arm.dmg"
    sha256 "694ffdadd233b2dbe0ea00467691fb4c1d88b44d9d9689f642d1d7531e74914f"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/9edb5a0/Basstab-Pro-mac-intel.dmg"
    sha256 "1af686caaeeadeeb65de2b880a66243ecb05a9546c8df0d50b1aa86cb7735ae7"
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
