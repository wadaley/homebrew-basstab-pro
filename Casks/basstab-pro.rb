cask "basstab-pro" do
  version "0.2.469"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/2216f65/Basstab-Pro-mac-arm.dmg"
    sha256 "d3922192d990167cdfb14b547a5b95700eeba95bdc86b6e81a8ce168933835c2"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/2216f65/Basstab-Pro-mac-intel.dmg"
    sha256 "dc1449cb37819daac1646b6c8cdd6a81571fee39abbe7ab331a9d27bec90915d"
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
