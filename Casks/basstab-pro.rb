cask "basstab-pro" do
  version "0.2.0"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/latest/Basstab-Pro-mac-arm.dmg"
    sha256 "4436134b26e557b27a34b62d5cec224e336e8c7255e3d5e35dc760f961da6aa3"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/latest/Basstab-Pro-mac-intel.dmg"
    sha256 "c4ad33e17ad70109dc942e6ce780e5745ff0366cb577df2018613b7482139c47"
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
