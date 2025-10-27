class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.23/nameback-aarch64-apple-darwin.dmg"
      sha256 "f07c3f8fbd27ccd8825646de6d2e8ec5487931072c6af2b022134c4c8b6d6da2"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.23/nameback-x86_64-apple-darwin.dmg"
      sha256 "04998db51cd693879d1a3ebc74baa5bec43ad97a7b19e52920944df4fd2f4eee"
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
