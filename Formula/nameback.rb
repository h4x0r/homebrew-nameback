class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.23/nameback-aarch64-apple-darwin.dmg"
      sha256 "9874e2125a22848278fadb123a6df2ef1dd9beb9d736f2b2b195ea883d1ce8be"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.23/nameback-x86_64-apple-darwin.dmg"
      sha256 "060d113d4ea1457bd4853a3a78c551d46bd2a28c70d93ac5775e7ca3de13e74f"
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
