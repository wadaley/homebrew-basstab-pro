cask "basstab-pro" do
  version "0.2.429"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/a6fce9a/Basstab-Pro-mac-arm.dmg"
    sha256 "a0fb82659547c560667df8f6531d8ba473a3b0f0a5712cb598127c460bb19bbb"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/a6fce9a/Basstab-Pro-mac-intel.dmg"
    sha256 "b50a19c4684d2316a8df0bd7177c5ad841058001a3c9d6bb059f24228d854fda"
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
