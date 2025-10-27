class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.28"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.28/nameback-aarch64-apple-darwin.dmg"
      sha256 "c7bcaacc1628eb6e356c336fb869f34532e3e04c3474bcf86f08925fdd7e0cac"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.28/nameback-x86_64-apple-darwin.dmg"
      sha256 "2a2c7fde728af8db8ecc86ab3d61fe2aa007e55066b0e2437f683fad24f701a0"
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
