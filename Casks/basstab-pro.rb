cask "basstab-pro" do
  version "0.2.364"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/0fa23f0/Basstab-Pro-mac-arm.dmg"
    sha256 "37d9189aa3dc4909ef07f62fdef4078d3d92d9264d6a69a5ec9a1539d0521ab3"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/0fa23f0/Basstab-Pro-mac-intel.dmg"
    sha256 "2ceac8a6013cb006d431f206bb5c1273f240386f0e2cdef04c64ea64c5852d73"
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
