class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.35"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.35/nameback-aarch64-apple-darwin.dmg"
      sha256 "1c4279feec0aaa790761b70a57f0eeada2fd2fd65244979c087ea40cc1294aaa"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.35/nameback-x86_64-apple-darwin.dmg"
      sha256 "83583e01d815a5a91e7fd3be65687a58ec467b14901e8904d4aa6aea85875d85"
    end
  end

  depends_on "exiftool"
  depends_on "tesseract"
  depends_on "tesseract-lang"
  depends_on "ffmpeg"
  depends_on "imagemagick"

  def install
    # Mount the DMG
    system "hdiutil", "attach", cached_download, "-mountpoint", buildpath/"mount"

    # Install only the CLI binary
    bin.install buildpath/"mount/nameback"

    # Unmount the DMG
    system "hdiutil", "detach", buildpath/"mount"
  end

  test do
    system "#{bin}/nameback", "--version"
  end
end
