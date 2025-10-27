class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.16/nameback-aarch64-apple-darwin.dmg"
      sha256 "9d73d73991872490c7de6b685d26e83112214ad9f4d70cd0e3b7e4a77208f1b2"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.16/nameback-x86_64-apple-darwin.dmg"
      sha256 "29bd94021567393a5431e11420c62b10e234162b7bbb4ca3bf94224e0eb3a3c4"
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
