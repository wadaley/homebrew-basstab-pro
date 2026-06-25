cask "basstab-pro" do
  version "0.2.365"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/33c9d3f/Basstab-Pro-mac-arm.dmg"
    sha256 "644d44c07276ebdc6369270df004907cf67ef3932aaa718c9c33dfed700d8abb"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/33c9d3f/Basstab-Pro-mac-intel.dmg"
    sha256 "06c9cd22baa1038650340ce2621cd26e3f17acad3b4ed58b15ce577e47143477"
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
