class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.21/nameback-aarch64-apple-darwin.dmg"
      sha256 "ad1d2627851fcdff8f6fec4d91f3674371458f0d367db800c30cc177f1138012"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.21/nameback-x86_64-apple-darwin.dmg"
      sha256 "3dc7348032b561d1a4e7a11dbb4f6468e68b5fa99d5463615f9caa6d55d77a05"
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
