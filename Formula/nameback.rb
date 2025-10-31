class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.51"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.51/nameback-aarch64-apple-darwin.dmg"
      sha256 "59c4f7bac71ca7eac59794a6f1d6ebc6f993b43d36ddb84e77a40efb98ab9f7d"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.51/nameback-x86_64-apple-darwin.dmg"
      sha256 "7480d5e0323741825ba6e7054fe25a26f07f3b3299692343e26924863e0258b9"
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
