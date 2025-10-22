cask "nameback" do
  version "0.5.1"

  if Hardware::CPU.arm?
    url "https://github.com/h4x0r/nameback/releases/download/v#{version}/nameback-aarch64-apple-darwin.dmg"
    sha256 "d8c73e159c4b2f7b94ae360640bc7250fdb45c9ad8a5f6117cdafc634e3d65ce"
  else
    url "https://github.com/h4x0r/nameback/releases/download/v#{version}/nameback-x86_64-apple-darwin.dmg"
    sha256 "63a0c5eaa8f598bd11fdc13382f1dea2ed5e70dcb42438c021055a8844bd5ded"
  end

  name "Nameback"
  desc "GUI for intelligent file renaming based on metadata with OCR support"
  homepage "https://github.com/h4x0r/nameback"

  app "nameback-gui", target: "Nameback.app"

  zap trash: [
    "~/Library/Application Support/Nameback",
    "~/Library/Preferences/com.securityronin.nameback.plist",
    "~/Library/Saved Application State/com.securityronin.nameback.savedState"
  ]
end