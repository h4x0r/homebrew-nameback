class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.48"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.48/nameback-aarch64-apple-darwin.dmg"
      sha256 "590bb6418e338a487582957ad071b32f39668e733e50a276a3b1fc165bc19492"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.48/nameback-x86_64-apple-darwin.dmg"
      sha256 "102626e22ffc287f9d76ff884fcc201db6df7d31ccd9473370b7b7d8105bc096"
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
