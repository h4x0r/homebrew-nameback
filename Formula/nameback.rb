class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.20/nameback-aarch64-apple-darwin.dmg"
      sha256 "89b7a90b1ec7a367b3a30dbb166099cf30596a95d625493564be3575a42ccf7b"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.20/nameback-x86_64-apple-darwin.dmg"
      sha256 "1068d78259abdbd12c82528f0d001974a3d34c3a5ea221428f9351d71c3a94d7"
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
