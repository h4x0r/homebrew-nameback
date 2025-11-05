class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.15/nameback-aarch64-apple-darwin.dmg"
      sha256 "30c64d0daf711bb99fd2d0bf3cc844a4732a7ac587ba292bbbb476aa3e259850"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.15/nameback-x86_64-apple-darwin.dmg"
      sha256 "838a6d4861d25dabda81b85e52d06033fc0b1c2313723c882da1948b97fb427c"
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
