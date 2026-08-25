cask "basstab-pro" do
  version "0.2.467"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/76bd1b8/Basstab-Pro-mac-arm.dmg"
    sha256 "d1bb629846f802972f69514c5262bac303df2caa77aa1ae1d16b3fd77a998260"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/76bd1b8/Basstab-Pro-mac-intel.dmg"
    sha256 "168dac0b037460f987e11ba00feeef616460604b89cfdfe37ec5b1b6e30bc088"
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
