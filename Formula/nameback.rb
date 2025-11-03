class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.8/nameback-aarch64-apple-darwin.dmg"
      sha256 "03e7e984d2f857d9ccda5fb891d1bbb4b26f10c1e022d8ce1b6e09bdfe0a837d"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.8/nameback-x86_64-apple-darwin.dmg"
      sha256 "dfb872ac4e62efc9ba549814659e1b36825498e0be52389e51a55b952392610c"
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
