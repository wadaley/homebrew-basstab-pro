cask "basstab-pro" do
  version "0.2.376"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/6e726fb/Basstab-Pro-mac-arm.dmg"
    sha256 "a038b38e041e5f78251dd0fccf3e5a7e42743163f6a545c8ec6d65adb4cc7e5b"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/6e726fb/Basstab-Pro-mac-intel.dmg"
    sha256 "99bc2b604c530dffa53d5e8f800b25d63c86bd75ff8cbd3c88ce268da937a463"
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
