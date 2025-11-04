class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.13/nameback-aarch64-apple-darwin.dmg"
      sha256 "b1b199b3930361ae770653d8a69413ca390bf17ae200ebdd6b08c871ec0da8f9"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.13/nameback-x86_64-apple-darwin.dmg"
      sha256 "35367d6a5a6024351a3e09afe5416bec2c37f97357b62e08c7d88fb59c393132"
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
