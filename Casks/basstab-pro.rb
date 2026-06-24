cask "basstab-pro" do
  version "0.2.358"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/7f40edb/Basstab-Pro-mac-arm.dmg"
    sha256 "9949becd72cc5145b18621c349dcf21afc31b172ce631278204eec5122d57d06"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/7f40edb/Basstab-Pro-mac-intel.dmg"
    sha256 "03257cbe2cbede71ca28e223a7507ece887a24211312a9de738eef219ee43e81"
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
