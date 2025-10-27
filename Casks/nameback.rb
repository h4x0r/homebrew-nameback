cask "nameback" do
  version "0.6.16"

  if Hardware::CPU.arm?
    url "https://github.com/h4x0r/nameback/releases/download/v#{version}/nameback-aarch64-apple-darwin.dmg"
    sha256 "9d73d73991872490c7de6b685d26e83112214ad9f4d70cd0e3b7e4a77208f1b2"
  else
    url "https://github.com/h4x0r/nameback/releases/download/v#{version}/nameback-x86_64-apple-darwin.dmg"
    sha256 "29bd94021567393a5431e11420c62b10e234162b7bbb4ca3bf94224e0eb3a3c4"
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