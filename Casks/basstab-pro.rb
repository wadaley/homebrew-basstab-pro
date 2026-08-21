cask "basstab-pro" do
  version "0.2.448"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/f63f1fe/Basstab-Pro-mac-arm.dmg"
    sha256 "a7a862baff7ab916a6c3921b6d736a5dc761ba1dea7f959bc9aa79ff9f21358e"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/f63f1fe/Basstab-Pro-mac-intel.dmg"
    sha256 "f3961d6b1b6c80d7fab1e1fa11c67655709f2ad04b03b1c6fc6d506c866d7c7e"
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
