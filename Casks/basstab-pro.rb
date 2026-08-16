cask "basstab-pro" do
  version "0.2.444"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/a31a61a/Basstab-Pro-mac-arm.dmg"
    sha256 "163984c4c954d01ce53c05f2c3230fb6bea30600bc13b6fc20b851b38dd12e4b"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/a31a61a/Basstab-Pro-mac-intel.dmg"
    sha256 "57c8fda969abe2d602120c18988ac1fa66cafe5ffeedee7de7f6a7eb97c3d73c"
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
