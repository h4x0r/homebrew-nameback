class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.49"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.49/nameback-aarch64-apple-darwin.dmg"
      sha256 "6bb9e2c94ca463e74820cfc2fcb8a47d3b4f2943b9d2cf2219fc443924dcc6d7"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.49/nameback-x86_64-apple-darwin.dmg"
      sha256 "7dcf53c78a3a10639405934a497dd758bc603c9ba19a92e04eda728800ff1ad5"
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
