cask "basstab-pro" do
  version "0.2.459"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/e7e2f16/Basstab-Pro-mac-arm.dmg"
    sha256 "f4f73892a440639bca1943ea902bc7b54b97addb1c358d07a8b747edf3f1f051"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/e7e2f16/Basstab-Pro-mac-intel.dmg"
    sha256 "924123ddb79ed92b0605700b9099c6fba2a14a02ecc6093177f1c9e1a890fa72"
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
