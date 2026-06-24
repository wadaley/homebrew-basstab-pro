cask "basstab-pro" do
  version "0.2.361"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/82800d3/Basstab-Pro-mac-arm.dmg"
    sha256 "6c34a37e437657088911998b4f433e80b09303c5374c59720a37d0c27efe015e"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/82800d3/Basstab-Pro-mac-intel.dmg"
    sha256 "8728430a9e40a023af87b0bba3d7c04d56b6963daecae8593e0a7e7a846ffafa"
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
