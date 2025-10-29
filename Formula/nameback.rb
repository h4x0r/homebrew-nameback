class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.40"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.40/nameback-aarch64-apple-darwin.dmg"
      sha256 "01abb0d71229f9d134e998ead5dc9fc7640e4c8559c2d9199bfe2ad1e89235db"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.40/nameback-x86_64-apple-darwin.dmg"
      sha256 "8ea9077d88e97e08ca869343276205f5cbfe328d891020ae60d3fab3ceeed9c8"
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
