class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.20/nameback-aarch64-apple-darwin.dmg"
      sha256 "0264ae333a3a45079697de909ef50d0b87f620fe9cdba93371409726a2b614af"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.20/nameback-x86_64-apple-darwin.dmg"
      sha256 "834006934ad4c95505fde7eb3a8c8fe7f0b5de25ab1214fb7cbd2a7567fb8d12"
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
