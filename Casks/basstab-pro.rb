cask "basstab-pro" do
  version "0.2.357"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/b94b068/Basstab-Pro-mac-arm.dmg"
    sha256 "7e5ba4fa167503ac5dfc3cd1c8eb00daca58550436a09e3f52bf49c0bdb3f5aa"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/b94b068/Basstab-Pro-mac-intel.dmg"
    sha256 "009acb1f7d8ef207b175f2aec00ba80c2c1f91d12c9c3afb3212a38d521f0d3e"
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
