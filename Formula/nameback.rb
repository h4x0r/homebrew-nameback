class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.8.0/nameback-aarch64-apple-darwin.dmg"
      sha256 "97a756dd5d10601a2b170f7428ccc24bf11d11053ae301f23044b17c2048c53d"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.8.0/nameback-x86_64-apple-darwin.dmg"
      sha256 "beb9a536ac18a942709095dabbd904a264a6fb1b2fc8d9f6c70737c53423161a"
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
