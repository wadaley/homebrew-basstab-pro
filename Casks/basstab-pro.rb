cask "basstab-pro" do
  version "0.2.445"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/8ef12d9/Basstab-Pro-mac-arm.dmg"
    sha256 "3f188149d5f3ebcc6ecf5af6a6a57f686c5d47be954903c1750d9e6ac9b1f34b"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/8ef12d9/Basstab-Pro-mac-intel.dmg"
    sha256 "33c635f5ab2f3b93c272a4bfb06343a4e5f5cfb03febe15abccfe856e669414e"
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
