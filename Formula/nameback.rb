class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.17/nameback-aarch64-apple-darwin.dmg"
      sha256 "317c3860f567ca9b88b59b2af4505161ec900c02eac4d207dcac7d81b0f297ca"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.17/nameback-x86_64-apple-darwin.dmg"
      sha256 "25a9221259594e0949b1b10750aa9bb33f3cb33c29af821c3f57ee21ed5c0d66"
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
