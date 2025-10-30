class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.44"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.44/nameback-aarch64-apple-darwin.dmg"
      sha256 "0ac877292c0b4ca3eda9e6ca98bcc94d235f4fcc2097dc916fde85e2c266f080"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.44/nameback-x86_64-apple-darwin.dmg"
      sha256 "c9a4b5dce90138d6ab633d5c02a67172e2e975d47450757be72ed908d7d26164"
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
