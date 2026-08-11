cask "basstab-pro" do
  version "0.2.428"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/f0b99d7/Basstab-Pro-mac-arm.dmg"
    sha256 "bde2a08cc8f0d21763947a19a9ab93d7cf78806049a63fe7c8b22a092e4632f7"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/f0b99d7/Basstab-Pro-mac-intel.dmg"
    sha256 "5fe1df024cc902457e981cb6745a5a444ab267edb0a32b3b669edd953ed3220d"
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
