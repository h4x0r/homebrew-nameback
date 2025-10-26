class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.13/nameback-aarch64-apple-darwin.dmg"
      sha256 "43348c230d44b0c0de3f533efb4ac3be34108bec1e5564a72a96c0a306b2328b"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.13/nameback-x86_64-apple-darwin.dmg"
      sha256 "b0a02b595fab7037f29e43202e34605ae797de5dbcbb6c177d44ea824c3d9fcf"
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
