cask "copyshelf" do
  version "0.1.0"
  sha256 "98896ced657f91c3eff19d9dd4d0354fd264f52b3a016b32f1da43687d65bf8a"

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
