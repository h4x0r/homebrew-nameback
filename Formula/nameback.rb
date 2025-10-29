class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.41"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.41/nameback-aarch64-apple-darwin.dmg"
      sha256 "f0380be6198dd4bbe6daacdc7dfcf268a35087ee024748b40bab20760882d1bb"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.41/nameback-x86_64-apple-darwin.dmg"
      sha256 "986a1384f2ae2c79634d28c6b5a22248d7a5c0ca05f2be9e2584d3a5d09828b2"
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
