cask "basstab-pro" do
  version "0.2.363"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/11cbdfa/Basstab-Pro-mac-arm.dmg"
    sha256 "1dfd75688b258f6ba7654fb967d35c00ebd67277f02c454f5b4b9a20ef886257"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/11cbdfa/Basstab-Pro-mac-intel.dmg"
    sha256 "3aae7f536f07b6c26d5535f37bfe029bb1095be17ef24dd1a4e63f2a554a08bd"
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
