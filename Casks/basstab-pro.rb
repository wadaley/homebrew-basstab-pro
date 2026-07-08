cask "basstab-pro" do
  version "0.2.404"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/dba9d75/Basstab-Pro-mac-arm.dmg"
    sha256 "041b74008aa8113098541a96d78553af441e5387a320147a1ad31b9e4dcb99f4"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/dba9d75/Basstab-Pro-mac-intel.dmg"
    sha256 "41d7b76b9a7e374306bc8f3e4b86cb8025774a15484285fd32b9bd4623f565c6"
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
