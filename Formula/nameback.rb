class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.29/nameback-aarch64-apple-darwin.dmg"
      sha256 "7282f3e3cd54b74e02d5a6625fb89ae7550a22c5db4aa75033876d71333e14c4"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.29/nameback-x86_64-apple-darwin.dmg"
      sha256 "0b4fa86423ea845a860833587a7a43d5d90bea6d6df475a881f86a3b075e2e18"
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
