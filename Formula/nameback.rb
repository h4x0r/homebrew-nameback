class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.5/nameback-aarch64-apple-darwin.dmg"
      sha256 "31ffb09a03833da25e389b9a4c18c384d74930702c8b82adac20719dc8ebd705"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.5/nameback-x86_64-apple-darwin.dmg"
      sha256 "9a34a99e3d2cd06483674d23c4626124fdefb8132c27f77ec8e0ffd05034240e"
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
