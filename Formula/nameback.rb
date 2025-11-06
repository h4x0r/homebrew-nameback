class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.20/nameback-aarch64-apple-darwin.dmg"
      sha256 "18504c6dbfe442c64e45527002ad794875f808b328606e4f88a0a8acec02d50e"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.20/nameback-x86_64-apple-darwin.dmg"
      sha256 "032b6313c34b934467d700925c5502df41e1f90b9f2eabb997d11406a4048999"
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
