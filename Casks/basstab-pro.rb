cask "basstab-pro" do
  version "0.2.0"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/latest/Basstab-Pro-mac-arm.dmg"
    sha256 "703f2b3a52e8c89a77229c17c6f08c728e1fea1e0ad3bea3b821f1007fc86864"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/latest/Basstab-Pro-mac-intel.dmg"
    sha256 "21d4eb4e129b452aef6620822c868f44ad8c698d6eb43e7164c0ecdeb7dcf31b"
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
