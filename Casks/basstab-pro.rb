cask "basstab-pro" do
  version "0.2.385"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/d185980/Basstab-Pro-mac-arm.dmg"
    sha256 "10b4ce0013968ad3a7dc2c9254c480fde1a76e025d682d3cfad2bc7404933723"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/d185980/Basstab-Pro-mac-intel.dmg"
    sha256 "ac3ea73b10e9850a7df13dd18651d77ebbedfa2d6f3f806f2d834d7bd3493492"
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
