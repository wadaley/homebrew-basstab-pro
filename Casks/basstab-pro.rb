cask "basstab-pro" do
  version "0.2.403"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/30aa09c/Basstab-Pro-mac-arm.dmg"
    sha256 "0975f3298392f1134280cf442d3d0193824eca47d79b2c81d4eee058bd8721a5"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/30aa09c/Basstab-Pro-mac-intel.dmg"
    sha256 "0cb9d826ef116dd2c61795761e560ddfc05c525670e2e701265fa07590226c2e"
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
