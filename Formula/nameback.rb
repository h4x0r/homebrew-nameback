class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.34"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.34/nameback-aarch64-apple-darwin.dmg"
      sha256 "7de64bfb0f5636e9b539fdebe3675493177f4a84c21e4b937c7ed80eaceb4f91"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.34/nameback-x86_64-apple-darwin.dmg"
      sha256 "218b5a5837e49aa95f251eac1c667e23cb1b0c80a9c447bcd4b8444d7e675ea4"
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
