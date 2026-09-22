cask "headroom-bar" do
  version "1.3.0"
  sha256 "e509c3209e56dffbfb997238236aa9bf5817c74294c20748e3d5f5049acf72a5"

  url "https://github.com/maximilianfalco/headroom/releases/download/v#{version}/Headroom.zip"
  name "Headroom Bar"
  desc "Menu bar app and widget for Claude plan limits, token usage, and cost"
  homepage "https://github.com/maximilianfalco/headroom"

  # The homebrew-cask "headroom" (extraheadroom.com) also installs Headroom.app.
  conflicts_with cask: "headroom"
  depends_on macos: :sonoma

  app "Headroom.app"

  # Self signed rather than notarized, so Gatekeeper would otherwise refuse the download.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Headroom.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Caches/app.headroom",
    "~/Library/Containers/app.headroom.Widget",
    "~/Library/HTTPStorages/app.headroom",
    "~/Library/Preferences/app.headroom.plist",
  ]
end
