cask "headroom-bar" do
  version "1.1.0"
  sha256 "d0f118e375753522862c1b1ced893b8ad098a84ab86efe55d16b368f8388112d"

  url "https://github.com/maximilianfalco/headroom/releases/download/v#{version}/Headroom.zip"
  name "Headroom"
  desc "Menu bar app and widget for Claude plan limits, token usage, and cost"
  homepage "https://github.com/maximilianfalco/headroom"

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
