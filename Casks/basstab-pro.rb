cask "basstab-pro" do
  version "0.2.447"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/f63f1fe/Basstab-Pro-mac-arm.dmg"
    sha256 "40516afc25abb905bebd0db0440d157e29d9a58ec9bf62498f9ee88f73fd09e8"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/f63f1fe/Basstab-Pro-mac-intel.dmg"
    sha256 "b33df165ceea72a6199e0ed1f9592df05b80ff03d6ea0cb14d50f2251b08c283"
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
