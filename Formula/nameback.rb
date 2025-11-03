class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.4/nameback-aarch64-apple-darwin.dmg"
      sha256 "655f7a81f7688afceeb2616cdf0b1aa09cc5cbba582f03823b722d62dad5c3fb"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.4/nameback-x86_64-apple-darwin.dmg"
      sha256 "736eed7a728428efea34b454dc95803ccd19aeb49baf89e20d7f9dad9159ccd2"
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
