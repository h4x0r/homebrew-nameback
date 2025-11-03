class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.6/nameback-aarch64-apple-darwin.dmg"
      sha256 "657beea40b57886c5692252eea444f59a3e06320bbac13bfa0c0218ea1894f71"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.6/nameback-x86_64-apple-darwin.dmg"
      sha256 "450561d5957ed6cc456d6ceb370f3f97cd6e6ed74c688036e07988032af38f55"
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
