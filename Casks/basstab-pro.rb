cask "basstab-pro" do
  version "0.2.422"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/00e9cfe/Basstab-Pro-mac-arm.dmg"
    sha256 "d3e2265fa785d90c4438b9810d033cf122264d2ed95e7b64404aceb5381c825b"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/00e9cfe/Basstab-Pro-mac-intel.dmg"
    sha256 "d1f71792cf9412bd08aba587da32d5e7703b99b7a4dbc0f1b324c0488aff0e74"
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
