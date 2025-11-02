class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.1/nameback-aarch64-apple-darwin.dmg"
      sha256 "51748e86a93d930f79c02fac4d34700525de4df900d68363d65e8224c2c37d85"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.1/nameback-x86_64-apple-darwin.dmg"
      sha256 "415fa980f0c79f7c4ccc3420e40903e497ac5cfb24e101350201e3411cee8613"
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
