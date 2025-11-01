class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.59"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.59/nameback-aarch64-apple-darwin.dmg"
      sha256 "3960e6dedd7087bd31e5ad2286ad775d11270bd259b21d09cf38b278b426f401"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.59/nameback-x86_64-apple-darwin.dmg"
      sha256 "70aadd7eac95b8bf68f22c2d81a9d27ca37eed33ec2aafdee8193d01faf7ef45"
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
