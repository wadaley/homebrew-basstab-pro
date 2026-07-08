cask "basstab-pro" do
  version "0.2.405"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/0f9f53b/Basstab-Pro-mac-arm.dmg"
    sha256 "9236ddfdaaf283fd8a710bce0156721f50e31eed8edbc53a16fdeabd760133e2"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/0f9f53b/Basstab-Pro-mac-intel.dmg"
    sha256 "0c79af27fe67daaae2244dcdd99720f81b3f4874e6652c16e8c05acad66fe789"
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
