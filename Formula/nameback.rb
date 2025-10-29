class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.6.39"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.39/nameback-aarch64-apple-darwin.dmg"
      sha256 "428c35b1adaaf5655c6abf2cb685c3ba8da6965bdc0c1a9304f89c560a1dae54"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.6.39/nameback-x86_64-apple-darwin.dmg"
      sha256 "a01f7d4c9ea784515a9ed3fde1a6e9f20db72288db8e72101524d8e582589df1"
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
