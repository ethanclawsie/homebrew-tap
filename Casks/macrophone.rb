cask "macrophone" do
  version "0.1.0"
  sha256 "253c7d3f0205efe279fcffb610f9ad6425067fdf68daa751a90026d9581cbefa"

  url "https://github.com/ethanclawsie/macrophone/releases/download/v#{version}/Macrophone-#{version}.zip"
  name "Macrophone"
  desc "Hold-to-talk local Whisper dictation for macOS"
  homepage "https://github.com/ethanclawsie/macrophone"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Macrophone.app"

  # The app is ad-hoc signed (not notarized), so clear the download quarantine flag
  # to let it open without a Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Macrophone.app"]
  end

  uninstall quit: "com.ethanclawsie.macrophone"

  zap trash: [
    "~/Library/Application Support/Macrophone",
    "~/Library/Logs/Macrophone",
    "~/Library/Preferences/com.ethanclawsie.macrophone.plist",
  ]
end
