cask "copyshelf" do
  version "0.2.1"
  sha256 "c654e0076abb0a7242db269e355e316f21d650961e35a54dff03e735b455b8c0"

  url "https://github.com/ethanclawsie/copyshelf-mac/releases/download/v#{version}/CopyShelf-#{version}.zip"
  name "CopyShelf"
  desc "Menu bar shelf of reusable text snippets — click to copy"
  homepage "https://github.com/ethanclawsie/copyshelf-mac"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "CopyShelf.app"

  # The app is ad-hoc signed (not notarized), so clear the download quarantine flag
  # to let it open without a Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CopyShelf.app"]
  end

  uninstall quit: "com.ethanclawsie.copyshelf"

  zap trash: [
    "~/Library/Application Support/CopyShelf",
    "~/Library/Preferences/com.ethanclawsie.copyshelf.plist",
  ]
end
