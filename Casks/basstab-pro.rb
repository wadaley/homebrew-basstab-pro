cask "basstab-pro" do
  version "0.2.504"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/a04f130/Basstab-Pro-mac-arm.dmg"
    sha256 "dd1e72bd4426fcb00208f7dc19f08eb06c6ebadd27930c0c76f40c2e3dddbab9"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/a04f130/Basstab-Pro-mac-intel.dmg"
    sha256 "402e10d520e2741f936261c5b3338db15727d087eff5ae76d2e684c04c172a98"
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
