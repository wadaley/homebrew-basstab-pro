cask "basstab-pro" do
  version "0.2.350"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/abe95fa/Basstab-Pro-mac-arm.dmg"
    sha256 "913b39b1ad7eac072f42a5ce86f24de6dc5e1e03c60491b540dfa0207925d5cc"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/abe95fa/Basstab-Pro-mac-intel.dmg"
    sha256 "e7c1909476a01d606fd1828042a703c48bc1f3479ed03ca3a5394f671f06ba59"
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
