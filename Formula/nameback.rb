class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.31/nameback-aarch64-apple-darwin.dmg"
      sha256 "285c8e6d989b6c7eac0bc7c6ae3110fe79a406498cdcc6e87e8f848b6f917bbc"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.31/nameback-x86_64-apple-darwin.dmg"
      sha256 "a2fc6800c92e01a2d42c2460516dc1a3055e9d54bb0c8d3490b8ea3e66eb7881"
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
