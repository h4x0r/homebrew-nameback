class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.19/nameback-aarch64-apple-darwin.dmg"
      sha256 "7b19b233f6c1fa7b21f52d5bc0c5da71f03a013f58a6e43ef8f5a487a64c0eed"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.19/nameback-x86_64-apple-darwin.dmg"
      sha256 "b06ceb84a679c20752ff34f0c3d90f67275bca8f1f13c7fb7a8f190f81a1bc32"
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
