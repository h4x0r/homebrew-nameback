class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.11/nameback-aarch64-apple-darwin.dmg"
      sha256 "2a15601be66182462b91ef3baf6ed57066cb617e5a87b0dd03d96e5740cd9d6d"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.11/nameback-x86_64-apple-darwin.dmg"
      sha256 "7c67999bd3996e57b3e124abbec92564e3a33be552b5b185cbd2623d2348fe68"
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
