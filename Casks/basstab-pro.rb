cask "basstab-pro" do
  version "0.2.366"

  on_arm do
    url "https://dev.basstab.pro/desktop/dev/mac-arm/110e77b/Basstab-Pro-mac-arm.dmg"
    sha256 "fd4868e843cdb234e4dba5bfc70f9d93fce84dcbf07b38114e50b63ea8696ed4"
  end

  on_intel do
    url "https://dev.basstab.pro/desktop/dev/mac-intel/110e77b/Basstab-Pro-mac-intel.dmg"
    sha256 "261ee507671d9eb5946643c4a9e4b9961527155d57c830c9adcfce72f426c48f"
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
