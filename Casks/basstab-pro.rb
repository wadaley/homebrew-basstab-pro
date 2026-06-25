cask "basstab-pro" do
  version "0.2.369"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/c28ded0/Basstab-Pro-mac-arm.dmg"
    sha256 "ee3ddcabcc404cca3d786216e12c17807c0a1a43e7b32aa5b784fadc2e54f4a8"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/c28ded0/Basstab-Pro-mac-intel.dmg"
    sha256 "ddac3645a4fcee7c542909f2b033a5f34ecba9104f7f823d50db8754979f1151"
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
