cask "basstab-pro" do
  version "0.2.371"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/b4cecb6/Basstab-Pro-mac-arm.dmg"
    sha256 "07d96bf3a21412f3aaf7fd671a414fbc85f95cf0df11910f91fe1b2db1f0babd"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/b4cecb6/Basstab-Pro-mac-intel.dmg"
    sha256 "f0c932096d7c148deb2343f2e784b1cdd16cd6ba1a6d5e85c6e899dabaeec766"
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
