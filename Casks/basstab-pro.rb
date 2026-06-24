cask "basstab-pro" do
  version "0.2.343"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/99fdf58/Basstab-Pro-mac-arm.dmg"
    sha256 "437e7e2dda5b369ba0497972eb3ce530930083cb6c3c09e70e5a19c4babad6f0"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/99fdf58/Basstab-Pro-mac-intel.dmg"
    sha256 "4015bbf4b9de9b2be2c26dc1465e0f3dc3d485ab273b3547327f297809327293"
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
