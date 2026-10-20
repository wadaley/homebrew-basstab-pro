cask "basstab-pro" do
  version "0.2.528"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/3ab24fd/Basstab-Pro-mac-arm.dmg"
    sha256 "0f5ca0af65943769baffd09a49b957220a36bfe1022255ffe7271a87730a8a12"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/3ab24fd/Basstab-Pro-mac-intel.dmg"
    sha256 "c2f480e798c4e8348aaed08e9c0c6c504d94426454b88c0512a634c56ce7e56f"
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
