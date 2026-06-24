cask "basstab-pro" do
  version "0.2.339"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/abdb3b1/Basstab-Pro-mac-arm.dmg"
    sha256 "6a24d09b2acce00a59a553804f0e64fca7e4d70a5b243db06317b17c2881f6b5"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/abdb3b1/Basstab-Pro-mac-intel.dmg"
    sha256 "4c12af8161b097ea6a45574aa4e320fca324fbb4f909288352390ad2bfc38082"
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
