cask "basstab-pro" do
  version "0.2.527"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/3ab24fd/Basstab-Pro-mac-arm.dmg"
    sha256 "4a8f889ff648b0ad51de81df8596c98404b807d67c6deee777b1aa3541c64706"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/3ab24fd/Basstab-Pro-mac-intel.dmg"
    sha256 "9bab0aad38e3341180e382a6dcc0d6b2fb3249a46096feded8353e34f9943866"
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
