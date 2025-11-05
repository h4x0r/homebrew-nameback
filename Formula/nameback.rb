class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.7.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.16/nameback-aarch64-apple-darwin.dmg"
      sha256 "e2d152c7bdc4840bd72d0653c692e65cf05f8af46a7656d08cd3dc83218f5b80"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.7.16/nameback-x86_64-apple-darwin.dmg"
      sha256 "f50460f7645e4200d2bbb444ffa43b60488f8d45e3ddadc258c470080e00c9c2"
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
