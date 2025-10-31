class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.54"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.54/nameback-aarch64-apple-darwin.dmg"
      sha256 "0d6735c8500aa9025f881563ac4d2c65655ad9784f78fc25e9d7fc43acc4f476"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.54/nameback-x86_64-apple-darwin.dmg"
      sha256 "8f6ca34f29546121768643d6814612f6cecf2284174b29d84067d4258f48f188"
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
