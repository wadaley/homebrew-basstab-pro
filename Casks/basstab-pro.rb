cask "basstab-pro" do
  version "0.2.0"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/latest/Basstab-Pro-mac-arm.dmg"
    sha256 "08a7626d07c5ee281f31a4fcadd611fb1e7fe27909186d7c66b3702b261c9055"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/latest/Basstab-Pro-mac-intel.dmg"
    sha256 "45200891ff5f225fe792108aeabbfa7388f032a048be3047c9e391b3813a8b96"
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
