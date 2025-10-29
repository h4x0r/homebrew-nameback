cask "nameback" do
  version "0.6.41"

  if Hardware::CPU.arm?
    url "https://github.com/h4x0r/nameback/releases/download/v#{version}/nameback-aarch64-apple-darwin.dmg"
    sha256 "f0380be6198dd4bbe6daacdc7dfcf268a35087ee024748b40bab20760882d1bb"
  else
    url "https://github.com/h4x0r/nameback/releases/download/v#{version}/nameback-x86_64-apple-darwin.dmg"
    sha256 "986a1384f2ae2c79634d28c6b5a22248d7a5c0ca05f2be9e2584d3a5d09828b2"
  end

  name "Nameback"
  desc "GUI for intelligent file renaming based on metadata with OCR support"
  homepage "https://github.com/h4x0r/nameback"

  app "Nameback.app"

  zap trash: [
    "~/Library/Application Support/Nameback",
    "~/Library/Preferences/com.securityronin.nameback.plist",
    "~/Library/Saved Application State/com.securityronin.nameback.savedState"
  ]
end