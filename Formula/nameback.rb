class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.11/nameback-aarch64-apple-darwin.dmg"
      sha256 "744780dbf09dcfaea4b5cc953dc538088e1742a7678f5e2afdcc4fa693e81a30"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.11/nameback-x86_64-apple-darwin.dmg"
      sha256 "5b7ee3825583dab8410166df78088bbaa854a9854850ebd9d0d5674cf74eca18"
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
