cask "basstab-pro" do
  version "0.2.538"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/abf15c2/Basstab-Pro-mac-arm.dmg"
    sha256 "fdb2f7e154f665e8be2a802cfd775926983ea44269d5d537c236c3243a7d7455"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/abf15c2/Basstab-Pro-mac-intel.dmg"
    sha256 "bb4dad2b026941d1f4a35953a3203c31262669c67386060a3a360c61c6904a79"
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
