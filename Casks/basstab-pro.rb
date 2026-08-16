cask "basstab-pro" do
  version "0.2.440"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/6c27b1a/Basstab-Pro-mac-arm.dmg"
    sha256 "f4b40d12b88af09ab50cdc855a1f2a1adca53b22546b30f280043e4e656919e0"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/6c27b1a/Basstab-Pro-mac-intel.dmg"
    sha256 "7e0f3929acc7eb17bd5dac051ef961e6cc3d032d5888364b58607a0f3777e7a9"
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
