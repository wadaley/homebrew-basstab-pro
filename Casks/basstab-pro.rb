cask "basstab-pro" do
  version "0.2.384"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/713b7d9/Basstab-Pro-mac-arm.dmg"
    sha256 "6eeddfbe1917b3e628357cbcf1254ba6e7e17fc9cc333e26509d74e29fc3f07e"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/713b7d9/Basstab-Pro-mac-intel.dmg"
    sha256 "36ebd70025dcef0a78b42efa277ff57936b177a3e0bced5ff5ac13bdfea73196"
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
