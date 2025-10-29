cask "nameback" do
  version "0.6.40"

  if Hardware::CPU.arm?
    url "https://github.com/h4x0r/nameback/releases/download/v#{version}/nameback-aarch64-apple-darwin.dmg"
    sha256 "01abb0d71229f9d134e998ead5dc9fc7640e4c8559c2d9199bfe2ad1e89235db"
  else
    url "https://github.com/h4x0r/nameback/releases/download/v#{version}/nameback-x86_64-apple-darwin.dmg"
    sha256 "8ea9077d88e97e08ca869343276205f5cbfe328d891020ae60d3fab3ceeed9c8"
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