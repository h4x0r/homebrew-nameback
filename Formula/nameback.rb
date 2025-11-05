class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.18/nameback-aarch64-apple-darwin.dmg"
      sha256 "fe72cc5b37cdc6751658df7a6b9e8daa54a3941551afd25eed29929cf391df50"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.18/nameback-x86_64-apple-darwin.dmg"
      sha256 "5d15f7bf57866b0a0a00f78864ae746ca73e6510f451f58ca0f13e23c8328d04"
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
