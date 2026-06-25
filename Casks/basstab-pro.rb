cask "basstab-pro" do
  version "0.2.391"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/ed61404/Basstab-Pro-mac-arm.dmg"
    sha256 "e58993f9baf568da128ae1dec05abd9031ee92b75428f3e66b82d5685a66d74e"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/ed61404/Basstab-Pro-mac-intel.dmg"
    sha256 "2a81038a5361f662c71caee59f7ddb591dac433cf8a1c4e1fbc8966466556467"
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
