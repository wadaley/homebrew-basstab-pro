cask "basstab-pro" do
  version "0.2.446"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/8ef12d9/Basstab-Pro-mac-arm.dmg"
    sha256 "4313e5acc06fbfd001febbc274baf4d21b81210eb562f7e683510c32f208797a"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/8ef12d9/Basstab-Pro-mac-intel.dmg"
    sha256 "e9203d5fcdfdb8f2337d7c71693ae048e0d3ed0286f9e3a036bed1f190af7ce5"
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
