cask "headroom-bar" do
  version "1.2.0"
  sha256 "22626a0fc1d197311a0e4f0b01345195dd01438a62bb43ac83e66770d2a2877b"

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
