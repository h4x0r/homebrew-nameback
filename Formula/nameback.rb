class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.7/nameback-aarch64-apple-darwin.dmg"
      sha256 "69423c6a54a29d53144fd151622adc17ce22bab2b361b7dfb6ebbd2c29794c5f"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.7/nameback-x86_64-apple-darwin.dmg"
      sha256 "381aa19f2ccf3b935a7da05a9a955c63268166c33119b27818bc2fba2e003d62"
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
