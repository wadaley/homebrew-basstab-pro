cask "basstab-pro" do
  version "0.2.436"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/82688f1/Basstab-Pro-mac-arm.dmg"
    sha256 "1ae0ea8bedf585059472290e25e6c29b301d08355149527544674452b1e47381"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/82688f1/Basstab-Pro-mac-intel.dmg"
    sha256 "1855109e3ecae3bd9267b3f7af410fbbad16612ab9c37c08faab64af31a33385"
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
