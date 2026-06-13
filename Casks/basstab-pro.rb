cask "basstab-pro" do
  version "0.2.0"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/latest/Basstab-Pro-mac-arm.dmg"
    sha256 "f5a9ccedfa6b74986227277e1a08592c55bcfbe307926001cf9bbfc6b3b9efb9"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/latest/Basstab-Pro-mac-intel.dmg"
    sha256 "e60b00e2630390977de27c6f4b7adad90a84b24ccc4172a6a8de1b228f5a38d4"
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
