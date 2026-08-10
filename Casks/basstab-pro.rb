cask "basstab-pro" do
  version "0.2.415"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/c9e03ab/Basstab-Pro-mac-arm.dmg"
    sha256 "6057185eaade7fb64f60bc91b96acfa9023036c29de27279dc4655b10b72de76"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/c9e03ab/Basstab-Pro-mac-intel.dmg"
    sha256 "e78482a687a244e8620222f22d327c27164022e319879d4e58234f648aa985a9"
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
