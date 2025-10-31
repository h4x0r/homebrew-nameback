class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.52"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.52/nameback-aarch64-apple-darwin.dmg"
      sha256 "250f9177546817d7465dbd418d1ac9dbffef4de33f5de8dfefa5c74e92c03850"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.52/nameback-x86_64-apple-darwin.dmg"
      sha256 "06d6d55fb0b5da8e8a4f804780bdf14402721ad192a0fb072e5783830346868c"
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
