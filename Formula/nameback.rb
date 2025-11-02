class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.2/nameback-aarch64-apple-darwin.dmg"
      sha256 "31683a1fc453959594ae6e928d9f453f9c4276025c616b3e03ebc0917b728c44"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.2/nameback-x86_64-apple-darwin.dmg"
      sha256 "0a46c324bbf27481ec2f09959277f4c2cee81f08d7e03f29174342d9c3d62e26"
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
