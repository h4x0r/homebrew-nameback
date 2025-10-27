class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.18/nameback-aarch64-apple-darwin.dmg"
      sha256 "330b0746075bdcfeba668afd378f1bc2ed9d59ffa4fd1f9ce349e352bf03cdf4"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.18/nameback-x86_64-apple-darwin.dmg"
      sha256 "137284b066c72ba376f803368c4f00d63b5bf3b3295f6b53c14067607019d330"
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
