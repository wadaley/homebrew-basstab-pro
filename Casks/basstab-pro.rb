cask "basstab-pro" do
  version "0.2.441"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/6c27b1a/Basstab-Pro-mac-arm.dmg"
    sha256 "18353a11be65cd3ea8ab119f93cca66ea1ac59a04d2247abb1fea1c7679450f7"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/6c27b1a/Basstab-Pro-mac-intel.dmg"
    sha256 "9a3b0edf4a8392bdb1c8cfbb1a7972d561a5086b63e2624163f7855d2eb81a95"
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
