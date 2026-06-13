cask "basstab-pro" do
  version "0.2.0"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/latest/Basstab-Pro-mac-arm.dmg"
    sha256 "216cf7b022eb67897c2a8f71db6647042251a609e8b3cc92f5c4dc942d6266fd"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/latest/Basstab-Pro-mac-intel.dmg"
    sha256 "61b689ee57e28916c1491b12c07271b733c84e6cd5b6ce52ec3bf84bed8e292a"
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
