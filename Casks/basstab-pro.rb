cask "basstab-pro" do
  version "0.2.443"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/a31a61a/Basstab-Pro-mac-arm.dmg"
    sha256 "6e2b03be1ea2d78a8660a566b7ff5224286c91408f8f9a179954ed3f26d5027e"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/a31a61a/Basstab-Pro-mac-intel.dmg"
    sha256 "e29b8806ad1dd032cf497d7611f76c06d1ebcbffd8495ccef3f6b50b756917a8"
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
