class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.30/nameback-aarch64-apple-darwin.dmg"
      sha256 "49fabbf88ed037003bc53c6184e7ba25349c92ef8e599f55877d58cb976ac108"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.30/nameback-x86_64-apple-darwin.dmg"
      sha256 "e321ff6c55b5f5fa04eaea24e14479ac717ea5f461cffb18372e08831fb40d76"
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
