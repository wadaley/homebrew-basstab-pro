cask "basstab-pro" do
  version "0.2.475"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/f02705e/Basstab-Pro-mac-arm.dmg"
    sha256 "fdbdf8d4a19582885864678c21d8c3c597bc2c6a22454efe15c67e2ad92af4d0"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/f02705e/Basstab-Pro-mac-intel.dmg"
    sha256 "a26a63d366e73ed472004c7d5875381c25e3c90bf0bdb9bbd4f2f5327a0a76b6"
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
