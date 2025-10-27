class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.26/nameback-aarch64-apple-darwin.dmg"
      sha256 "1e9c390a9b221ce32039c3b8968cfba0e4a18d8624258ed461bbc13244a5e6c4"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.26/nameback-x86_64-apple-darwin.dmg"
      sha256 "4f23663da223f4d12a7e6d222369f24ce83ff4f5286ccd13b7af39eff1998a2a"
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
