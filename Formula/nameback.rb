class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.22/nameback-aarch64-apple-darwin.dmg"
      sha256 "7b5ec8281e37c46a90d5339f719c2374fc5d30d3a129aee84350bbc1c500f43b"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.22/nameback-x86_64-apple-darwin.dmg"
      sha256 "ec492d187ac6c480e3ae8250d4fc80b640ff9294c4125d4aa9911f26cd50436e"
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
