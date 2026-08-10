cask "basstab-pro" do
  version "0.2.416"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/d3b386d/Basstab-Pro-mac-arm.dmg"
    sha256 "9b8a40b9abbb05f90aaf86e2dd06f8365694b310ac9310226f373d21392dc312"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/d3b386d/Basstab-Pro-mac-intel.dmg"
    sha256 "f1127b1918b06f600ecb6974b8b2a0569285948459f6a67e7987b183374fed3e"
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
