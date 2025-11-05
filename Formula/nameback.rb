class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.17/nameback-aarch64-apple-darwin.dmg"
      sha256 "81192e55bc744f285bc49919ea8d578e3a603b266ce92e2f99c4b5a265f63a27"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.17/nameback-x86_64-apple-darwin.dmg"
      sha256 "4af6ba34d67b0337c8382e85ecd8980ef3a10d50b4b8c30777c1e8ef086b16a2"
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
