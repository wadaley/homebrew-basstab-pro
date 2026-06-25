cask "basstab-pro" do
  version "0.2.381"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/3913625/Basstab-Pro-mac-arm.dmg"
    sha256 "6d69babd7a0d89cb76db3746d0541c5eda83129d36de157824c887959e5d49f3"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/3913625/Basstab-Pro-mac-intel.dmg"
    sha256 "cb700ae6612315956eb4ad0d95c22909d353ba2baf55fbd8c376f736e1a6de62"
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
