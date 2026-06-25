cask "basstab-pro" do
  version "0.2.362"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/62faab1/Basstab-Pro-mac-arm.dmg"
    sha256 "4302c3ba1cfbcef1b71dfd4222000855be5fd7a77bb8a51a718a8797e6b55b09"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/62faab1/Basstab-Pro-mac-intel.dmg"
    sha256 "e2a677097a3f489ce070aa010a4b498b587444596edf734c2e51ffac42181200"
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
