class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.8.0/nameback-aarch64-apple-darwin.dmg"
      sha256 "46ce4a7e54d959529c01553b8f45c518c82c8d40ea99e19d9f1770d898e7eae6"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.8.0/nameback-x86_64-apple-darwin.dmg"
      sha256 "98b5687c480a084615056b8cc790fe5c37dd5443900b11c1b60f0d8c882d8a98"
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
