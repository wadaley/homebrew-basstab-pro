cask "basstab-pro" do
  version "0.2.352"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/b6e7559/Basstab-Pro-mac-arm.dmg"
    sha256 "4efab9a3407ed9f8c4ad6db2f9747d3c9b60a56403c559c5812730799873c5dd"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/b6e7559/Basstab-Pro-mac-intel.dmg"
    sha256 "83d0acf22f6b83aa19edf827d9965d87893bdcd9ad194f56a716ba3fb9447ba0"
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
