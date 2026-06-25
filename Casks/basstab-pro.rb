cask "basstab-pro" do
  version "0.2.377"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/fa908f3/Basstab-Pro-mac-arm.dmg"
    sha256 "587c170d2fd0e43567f09f72904b99e54bb587b82e42dcbf1b704754577d0f80"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/fa908f3/Basstab-Pro-mac-intel.dmg"
    sha256 "0d4494c0c0a231ca1b34347a76eaaa5e1c0730b6ef87ac694f8837de835019e4"
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
