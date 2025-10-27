class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.27"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.27/nameback-aarch64-apple-darwin.dmg"
      sha256 "6d8592bd5f0616abca7052841dfd17b9d5544c185a681da4ed6846fa0be3c71a"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.27/nameback-x86_64-apple-darwin.dmg"
      sha256 "c80d45a3b101885fbe2a5f60391866775b4f6fa29877c28a71bcfa96ad536e6b"
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
