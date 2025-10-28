class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.32/nameback-aarch64-apple-darwin.dmg"
      sha256 "de6b5d80c70d58f24eab71562878abd7b6d763c570e05f8d8c3331fcbf1c88fa"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.32/nameback-x86_64-apple-darwin.dmg"
      sha256 "9c93fd125c501fa8d166e6b5949e87ca017d81909745eb53fca2dd27e4a0576c"
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
