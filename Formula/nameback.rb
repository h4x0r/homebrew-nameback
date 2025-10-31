class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.50"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.50/nameback-aarch64-apple-darwin.dmg"
      sha256 "5237471fff9f32a4d5166f17d9cc29946c6f712dafc40c6aefe3e30f84d69d2d"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.50/nameback-x86_64-apple-darwin.dmg"
      sha256 "b1230d7e21be5e2477ba365aabecbf1fd1b8e8cd68e3e9b260b7b926ce8034de"
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
