cask "basstab-pro" do
  version "0.2.479"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/fbcfc65/Basstab-Pro-mac-arm.dmg"
    sha256 "608634f0619ff948430ab7860e0562aace5df8a2d3ac97731a399d4c30af1667"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/fbcfc65/Basstab-Pro-mac-intel.dmg"
    sha256 "6eac9bcf042d17a4494bf6a4cf68bc66880b97d2f753aa9d94ff9732725def77"
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
