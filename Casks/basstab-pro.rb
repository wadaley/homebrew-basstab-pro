cask "basstab-pro" do
  version "0.2.537"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/6bb372c/Basstab-Pro-mac-arm.dmg"
    sha256 "7a4c8861a269081bef2498285ad7a317fa53db5e24e5ba05a2be65845a3bbc17"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/6bb372c/Basstab-Pro-mac-intel.dmg"
    sha256 "ee1cbde30a52659a0d458c8f138551fdfbaf6f7c4db865612e1f64390bc9ced6"
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
