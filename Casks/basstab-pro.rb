cask "basstab-pro" do
  version "0.2.383"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/6c205f8/Basstab-Pro-mac-arm.dmg"
    sha256 "fd8dff18c3062cfec91ea9d4bc27346553c98b731e923789c24437054c6f6306"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/6c205f8/Basstab-Pro-mac-intel.dmg"
    sha256 "4cd15e6e9e9a9e3499edd756d742fe0dba4ba2ce15f790eb59db04c2efe1b151"
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
