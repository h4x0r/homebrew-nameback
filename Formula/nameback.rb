class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.21/nameback-aarch64-apple-darwin.dmg"
      sha256 "b7f37f77e981b3ee72f6819faf1b8fb2e96a100dac406df3ad2496b12d9a2f43"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.21/nameback-x86_64-apple-darwin.dmg"
      sha256 "17ef295c14e8b38c9eba6286030aef9eceacdd06e35a44382e31c3ec3840613c"
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
