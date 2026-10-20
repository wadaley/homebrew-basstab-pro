cask "basstab-pro" do
  version "0.2.529"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/1d01652/Basstab-Pro-mac-arm.dmg"
    sha256 "84833e7fbb08f89c6275265cc7df29123e02de472e358de4709536f1134653a1"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/1d01652/Basstab-Pro-mac-intel.dmg"
    sha256 "005ff40c9009acf68edc00719ea2d921a3f89528e39f0086c1e018b61f9c241a"
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
