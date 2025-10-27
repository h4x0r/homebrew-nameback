class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.20/nameback-aarch64-apple-darwin.dmg"
      sha256 "97ef75a1880ce9e9d528d0ee5def3dce3e64ba75e5d2cf241272e9764363159d"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.20/nameback-x86_64-apple-darwin.dmg"
      sha256 "ea2fb8dd7ca797b66009518a7eba68fec78e9d90bd5c2d5af8d4cfd71dd4456f"
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
