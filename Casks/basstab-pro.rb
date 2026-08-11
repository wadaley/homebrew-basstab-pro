cask "basstab-pro" do
  version "0.2.425"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/c339f78/Basstab-Pro-mac-arm.dmg"
    sha256 "fd7275114807e894a7ab1fd866756349fd9d5b0a64237daef141fa5eeff5a9fb"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/c339f78/Basstab-Pro-mac-intel.dmg"
    sha256 "89e350ab6acaa73184c761102f3aed1425191c60307b27969aa5001e7dd57ebc"
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
