cask "basstab-pro" do
  version "0.2.349"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/8c24e17/Basstab-Pro-mac-arm.dmg"
    sha256 "a3559f2314a483f27ac7d332fdb2fb3dc9296e4fdee088139e683077071320da"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/8c24e17/Basstab-Pro-mac-intel.dmg"
    sha256 "44765d3166f5806467967864962cd158498bb3437e1e909e4bd5850a13e33838"
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
