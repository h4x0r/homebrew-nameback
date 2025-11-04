class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.12/nameback-aarch64-apple-darwin.dmg"
      sha256 "812d6ad0742328d20094f0d1e1baf5843442e498deb1d694890e9563052a4749"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.12/nameback-x86_64-apple-darwin.dmg"
      sha256 "0ffafeae06c6ae488be6e18aa6b323758016bcb3711aaa9861bae2b822e92b9c"
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
