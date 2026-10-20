cask "basstab-pro" do
  version "0.2.541"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/1c4079f/Basstab-Pro-mac-arm.dmg"
    sha256 "d212984719b14b920213cb617c894439cfd8179817aa0406b2157f12ab55f1d7"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/1c4079f/Basstab-Pro-mac-intel.dmg"
    sha256 "37ae2e769285dc4a8d86b614d926d968959df6c50dc119fac18016847305cc12"
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
