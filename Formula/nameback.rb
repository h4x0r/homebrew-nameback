class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.59"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.59/nameback-aarch64-apple-darwin.dmg"
      sha256 "b1b1e66e051cb66f425897c003af81dc7b4b04315fe62f2d466f0246e82f4049"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.59/nameback-x86_64-apple-darwin.dmg"
      sha256 "133af9a633438afae8f0688f3f20c8a3ffb7ce1e93227ec670f445c1fea133ac"
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
