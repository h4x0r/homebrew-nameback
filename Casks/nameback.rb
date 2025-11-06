cask "nameback" do
  version "0.7.19"

  if Hardware::CPU.arm?
    url "https://github.com/h4x0r/nameback/releases/download/v#{version}/nameback-aarch64-apple-darwin.dmg"
    sha256 "7b19b233f6c1fa7b21f52d5bc0c5da71f03a013f58a6e43ef8f5a487a64c0eed"
  else
    url "https://github.com/h4x0r/nameback/releases/download/v#{version}/nameback-x86_64-apple-darwin.dmg"
    sha256 "b06ceb84a679c20752ff34f0c3d90f67275bca8f1f13c7fb7a8f190f81a1bc32"
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