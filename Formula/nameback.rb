class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.36"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.36/nameback-aarch64-apple-darwin.dmg"
      sha256 "149f153ef7219921dc7de736b657d32a3567cd4383b7892ead6df450c97398b3"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.36/nameback-x86_64-apple-darwin.dmg"
      sha256 "b6d6e6a3827e64011d50fac2256811aad72aa13edbc107c7a6e17b40fabfca0c"
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
