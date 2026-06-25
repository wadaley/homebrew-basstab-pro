cask "basstab-pro" do
  version "0.2.382"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/f8417ee/Basstab-Pro-mac-arm.dmg"
    sha256 "c5396f08c719cda80063e12d54bb28ec54cbee8fc3210cbc6c5af6dde9407b99"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/f8417ee/Basstab-Pro-mac-intel.dmg"
    sha256 "99d79bd40dab7f99a51c811736613e91811ed3fcdd4d249baf262cc2aae60f38"
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
