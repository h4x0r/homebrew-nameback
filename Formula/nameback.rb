class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.5/nameback-aarch64-apple-darwin.dmg"
      sha256 "0b941b4ba153bf0bd40e1afb7857a1ed8611a6b02a0146838f2d71b11a32e79c"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.5/nameback-x86_64-apple-darwin.dmg"
      sha256 "46b8a649e79cef4e1f052014bf11260eef67191eb5c74ac5fc0396789d46a4a4"
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
