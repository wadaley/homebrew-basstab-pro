cask "basstab-pro" do
  version "0.2.342"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/922b3c1/Basstab-Pro-mac-arm.dmg"
    sha256 "fcacd3fc6db9cc8d07ec25b0ccffcf2c117e0911490b2ff0f77f9180e484270d"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/922b3c1/Basstab-Pro-mac-intel.dmg"
    sha256 "a89ba4d683a9ebec842918da0efbc757e71712095196a0070ffdbcb2bd16e7b7"
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
