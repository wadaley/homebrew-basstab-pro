cask "basstab-pro" do
  version "0.2.431"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/405088d/Basstab-Pro-mac-arm.dmg"
    sha256 "ff9f672ddf576bdff42103526c92283e40db858ac3e13e6da94839858d1931d5"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/405088d/Basstab-Pro-mac-intel.dmg"
    sha256 "c28047779c4de41a241df87d7ab9bd67f0f21b7666445337d41ad4be4788f43b"
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
