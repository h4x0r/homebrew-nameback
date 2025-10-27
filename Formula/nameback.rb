class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.19/nameback-aarch64-apple-darwin.dmg"
      sha256 "5158a971eadea73db9ef97ca6858e3ad83d8312c12da49a70bc47df3ff1ea93e"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.19/nameback-x86_64-apple-darwin.dmg"
      sha256 "b734e8119e8ec4e8bc013f7c7f404f91572e586ed6511a3d506317de32ece671"
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
