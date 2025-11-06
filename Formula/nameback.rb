class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.8.0/nameback-aarch64-apple-darwin.dmg"
      sha256 "4491221aaf65cb134b0b0e229fe08e3239b50787d29fb2502a02144150ce82c0"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.8.0/nameback-x86_64-apple-darwin.dmg"
      sha256 "629697d6f348b7833786d2f6365fab2792b47aba7a515533e3645f02d7126422"
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
