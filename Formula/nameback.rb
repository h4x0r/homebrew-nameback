class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.38"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.38/nameback-aarch64-apple-darwin.dmg"
      sha256 "47209613b51bee81565bc7006fa1c847e351d3108d251b0ee330c6ad2eba8942"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.38/nameback-x86_64-apple-darwin.dmg"
      sha256 "279812762a1624e94645b522b6ada5d9100a9c426e27afe01934602912eaddd9"
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
