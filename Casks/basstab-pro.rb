cask "basstab-pro" do
  version "0.2.374"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/ee14f7f/Basstab-Pro-mac-arm.dmg"
    sha256 "9dbbfeed1f2ef6f0728b48932360a39548f072c710e5d688c5c586b01c9aae1d"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/ee14f7f/Basstab-Pro-mac-intel.dmg"
    sha256 "011026324a33cd68f5ba0df344856b3b94ee1e544e67830a5d03cf766a2f5753"
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
