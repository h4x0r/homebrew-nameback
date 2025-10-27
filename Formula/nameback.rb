class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.14/nameback-aarch64-apple-darwin.dmg"
      sha256 "d0e2a2f9a9899163e3e613d3e9a99edc7f8bd0b91b3b7d623dd44394111ccd2d"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.14/nameback-x86_64-apple-darwin.dmg"
      sha256 "f883fe7ecc30169c2967e3ead8958a003c765a0537ef81c64250f6bf0694132f"
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
