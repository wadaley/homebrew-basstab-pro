cask "basstab-pro" do
  version "0.2.460"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/e7e2f16/Basstab-Pro-mac-arm.dmg"
    sha256 "c4ed9dccd3b8905f117a28840f2e416a9de367b4996ab3c39b8d92145066a00d"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/e7e2f16/Basstab-Pro-mac-intel.dmg"
    sha256 "cafa039731f2f512dfda9bb902834cc7c7cf7146b8f88079c80d167a13da3c94"
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
