cask "binder" do
  version "1.1.1"
  sha256 "782e235943b87f9b92c1713568129cd99a26455edf6f3a1accc0f28826acbbaa"

  url "https://github.com/ethanclawsie/binder-mac/releases/download/v#{version}/Binder-#{version}.zip"
  name "Binder"
  desc "Ultra-minimal, high-performance macOS menu bar shortcut and key remapper"
  homepage "https://github.com/ethanclawsie/binder-mac"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Binder.app"

  # The app is ad-hoc signed (not notarized), so clear the download quarantine flag
  # to let it open without a Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Binder.app"]
  end

  uninstall quit: "com.ethanclawsie.Binder"

  zap trash: [
    "~/Library/Preferences/com.ethanclawsie.Binder.plist",
  ]
end
