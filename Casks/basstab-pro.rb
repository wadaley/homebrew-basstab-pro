cask "basstab-pro" do
  version "0.2.388"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/fc10dbc/Basstab-Pro-mac-arm.dmg"
    sha256 "1acdc091f9a63ad798633eb8606c6e723387208ad51fbd2cccca24488b436842"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/fc10dbc/Basstab-Pro-mac-intel.dmg"
    sha256 "6c8cae99b8f357a619dbfc06647b53b23b00930dd6413ebefa311a44c59f7f43"
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
