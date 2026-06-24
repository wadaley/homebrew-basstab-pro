cask "basstab-pro" do
  version "0.2.345"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/93c4a03/Basstab-Pro-mac-arm.dmg"
    sha256 "f7bb25472342e2c222a70ca807dd2570f702fc8edb738135f8459bb74d112e6e"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/93c4a03/Basstab-Pro-mac-intel.dmg"
    sha256 "641c49467d4cf25f000afd42feda3563bed69d643ec1859c34aa5c599e621be9"
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
