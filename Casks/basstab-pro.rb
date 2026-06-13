cask "basstab-pro" do
  version "0.2.0"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/latest/Basstab-Pro-mac-arm.dmg"
    sha256 "222c024601fa0bbee0c106849ae88a1dce0cf54bfa59633b0d65dc84b39529f5"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/latest/Basstab-Pro-mac-intel.dmg"
    sha256 "f4d840cf889b4b8f84b090f23a84b8e0476c8e8e514738781fdc7ea57890d062"
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
