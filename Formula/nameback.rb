class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.16/nameback-aarch64-apple-darwin.dmg"
      sha256 "0f441e3329b0c249d9270297cd4de2542b3c1bc43fc3cf2d8f2a9e29f7d7604e"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.16/nameback-x86_64-apple-darwin.dmg"
      sha256 "bda684eca2dd7154d78c7ab8cbb22d9eced1a032ffd128cf4c70aaddb6afe315"
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
