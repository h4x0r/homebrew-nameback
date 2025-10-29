class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.42"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.42/nameback-aarch64-apple-darwin.dmg"
      sha256 "62cfeaa0cc28ce7921df3c9f828ffadf38a3016701e9611f3fd4b673a0c1d7b9"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.42/nameback-x86_64-apple-darwin.dmg"
      sha256 "3436b086b9bb7d93aaf3660b08a9d37823194d6733d28df2bcc0bfb7b80ad2d1"
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
