cask "headroom" do
  version "1.0.0"
  sha256 "ccb56a1fbb14f1111e1320d00b724bf2db7efdf8c7dedfee3c45396479ed8a27"

  url "https://github.com/maximilianfalco/headroom/releases/download/v#{version}/Headroom.zip"
  name "Headroom"
  desc "Menu bar app and widget for Claude plan limits, token usage, and cost"
  homepage "https://github.com/maximilianfalco/headroom"

  depends_on macos: ">= :sonoma"

  app "Headroom.app"

  # Self signed rather than notarized, so Gatekeeper would otherwise refuse the download.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Headroom.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Containers/app.headroom.Widget",
    "~/Library/Preferences/app.headroom.plist",
  ]
end
