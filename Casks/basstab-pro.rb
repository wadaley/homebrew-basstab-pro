cask "basstab-pro" do
  version "0.2.359"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/86a4311/Basstab-Pro-mac-arm.dmg"
    sha256 "7fc8184c56b9cdb15c68250f44dd432ec2c72ffc2eb5c22b67d51821f997fa47"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/86a4311/Basstab-Pro-mac-intel.dmg"
    sha256 "45a0aa63a050afff40d3b0e580a9a85f74c0d3221c5ea207b2219e16f18bc93c"
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
