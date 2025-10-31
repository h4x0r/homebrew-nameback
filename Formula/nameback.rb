class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.53"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.53/nameback-aarch64-apple-darwin.dmg"
      sha256 "6b9a87f453d97c653ac72b097113a1c108251fcd54fbf0f7a6b45c235c619918"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.53/nameback-x86_64-apple-darwin.dmg"
      sha256 "74dfa7049af3b96c99700bd2a9ec10e9092df8d653ed5e40c98c186d2a48bfae"
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
