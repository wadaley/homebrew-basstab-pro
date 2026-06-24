cask "basstab-pro" do
  version "0.2.351"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/c6c6575/Basstab-Pro-mac-arm.dmg"
    sha256 "b2f166cf8191eddd95466768f504806ccd84ada35803bc5d6fec71105202b9fa"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/c6c6575/Basstab-Pro-mac-intel.dmg"
    sha256 "b7f11083c16b0a9c8072dc380c8f7765ef3e29f265dff3b5625f5d62d45b7186"
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
