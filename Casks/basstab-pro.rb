cask "basstab-pro" do
  version "0.2.439"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/abfb9ed/Basstab-Pro-mac-arm.dmg"
    sha256 "505ec855e860ee3896d44a36fa8e887f65a50e8dd0cf429fc4f671f7810101e8"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/abfb9ed/Basstab-Pro-mac-intel.dmg"
    sha256 "511e6bf9d7286df009ef17a87d72709140496caae4c5c849d648d83bc3f3f0a0"
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
