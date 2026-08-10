cask "basstab-pro" do
  version "0.2.417"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/4a07c97/Basstab-Pro-mac-arm.dmg"
    sha256 "fda508b69fa252fb0478d3e02341b01c3693332823fb6ae9c67ddbdecc3984f6"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/4a07c97/Basstab-Pro-mac-intel.dmg"
    sha256 "e6f392d8b43e1a3e0bff80bbc518fff3be05770915adcfbd6446fe31485aee17"
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
