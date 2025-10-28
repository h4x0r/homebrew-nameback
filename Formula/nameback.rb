class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.33"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.33/nameback-aarch64-apple-darwin.dmg"
      sha256 "40244843571ff3205938d771dcfbf641f3d145ee1adaae90a9bcee9101a1d4b4"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.33/nameback-x86_64-apple-darwin.dmg"
      sha256 "2cafe5bcc75911ff827014dd81ddf336e8d4e2adb29b3c06344f202e04834162"
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
