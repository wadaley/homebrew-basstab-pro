cask "basstab-pro" do
  version "0.2.392"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/1fe00ba/Basstab-Pro-mac-arm.dmg"
    sha256 "a9aaa79124df6a1e36ff0b68b3c9d4fb3311234f12bfa4c08b2e7596c3d8c59f"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/1fe00ba/Basstab-Pro-mac-intel.dmg"
    sha256 "826a532dae7b54009c04ef2fba38bafc9796f8ca7ac4a3d906278dde7ed2dc14"
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
