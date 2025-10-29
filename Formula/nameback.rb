class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.43"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.43/nameback-aarch64-apple-darwin.dmg"
      sha256 "537ae4f1a9fe67c6efd62b9b0579301c1547a09019d9ea60e74a13adb84f1827"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.43/nameback-x86_64-apple-darwin.dmg"
      sha256 "c1d3411c7512590959d45f8349482837cb3f973a8950a4b376a97017bdc6045d"
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
