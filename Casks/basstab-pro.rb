cask "basstab-pro" do
  version "0.2.354"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/dc241a4/Basstab-Pro-mac-arm.dmg"
    sha256 "a4bf3ba993eb170b3845b5e7d9f81da2c5656d8de9660385bd069e057ab80578"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/dc241a4/Basstab-Pro-mac-intel.dmg"
    sha256 "e3f563b29d6a36c25fcce12944bbeba06589eb26fe66992ba413f833a5837c6e"
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
