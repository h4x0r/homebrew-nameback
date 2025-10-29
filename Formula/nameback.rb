class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.43"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.43/nameback-aarch64-apple-darwin.dmg"
      sha256 "97925462b9f7bdae6503f0831e400ad4347bcf1df733f137b94aa5f1f6a9ec0c"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.43/nameback-x86_64-apple-darwin.dmg"
      sha256 "0e93ec768c170d9f1a4ae67b0752be6fae91c04856f87b083e98173277ee2516"
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
