class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.47"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.47/nameback-aarch64-apple-darwin.dmg"
      sha256 "8466cb2f5de67fb0622bd8f1145184e67af058a95e7e3aeea939cf1548ab60fc"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.47/nameback-x86_64-apple-darwin.dmg"
      sha256 "f9285946a81f7a27c9ad44c2c9e2a428ed36ee0d2438a8e3fb0514392830c0de"
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
