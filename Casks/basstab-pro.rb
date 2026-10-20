cask "basstab-pro" do
  version "0.2.540"

  on_arm do
    url "https://basstab.pro/desktop/prod/mac-arm/14cd4c5/Basstab-Pro-mac-arm.dmg"
    sha256 "c7d5313a0b5413da27f2e1337dbdad0bb824cc84bf04ea44860e3f0649eaa1f2"
  end

  on_intel do
    url "https://basstab.pro/desktop/prod/mac-intel/14cd4c5/Basstab-Pro-mac-intel.dmg"
    sha256 "54d564ca375ae172c6628d8779a01372a1503a8f550757b8c5e4d54d8edcd989"
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
