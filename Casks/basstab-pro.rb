cask "basstab-pro" do
  version "0.2.387"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/3df6bf1/Basstab-Pro-mac-arm.dmg"
    sha256 "15bb429c2e1a7f7013427c8b8a9d0b525208bad8190e055ae0f11ca197071306"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/3df6bf1/Basstab-Pro-mac-intel.dmg"
    sha256 "0cde23fe9fd325dc67350dbb11ab7528c79ed25609fdef63c4810b05a73cad7b"
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
