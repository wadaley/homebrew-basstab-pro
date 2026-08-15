cask "basstab-pro" do
  version "0.2.432"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/ee49642/Basstab-Pro-mac-arm.dmg"
    sha256 "fe273905645334b6df4ce5a6e84218229227cd5c77663b95a084e8eef1693716"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/ee49642/Basstab-Pro-mac-intel.dmg"
    sha256 "5ed17c2a4e1a151197bdb4051a1e6630fd6188a46571575fdd699739222269ce"
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
