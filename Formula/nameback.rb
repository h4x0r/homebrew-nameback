class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.3/nameback-aarch64-apple-darwin.dmg"
      sha256 "6e0b6a456af5fa9a128bc4bb346b376b9a436110b4e790fa1ff8bc4ffd609297"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.3/nameback-x86_64-apple-darwin.dmg"
      sha256 "ff8e101807af0f59755233fdc2e86b4208e2b72eae1f2679308bb5c3ff2a15c8"
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
