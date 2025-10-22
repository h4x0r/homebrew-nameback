class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.5.1/nameback-aarch64-apple-darwin.dmg"
      sha256 "d8c73e159c4b2f7b94ae360640bc7250fdb45c9ad8a5f6117cdafc634e3d65ce"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.5.1/nameback-x86_64-apple-darwin.dmg"
      sha256 "63a0c5eaa8f598bd11fdc13382f1dea2ed5e70dcb42438c021055a8844bd5ded"
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

    # Install both binaries if they exist
    if File.exist?(buildpath/"mount/nameback")
      bin.install buildpath/"mount/nameback"
    end

    if File.exist?(buildpath/"mount/nameback-gui")
      bin.install buildpath/"mount/nameback-gui"
    end

    # Unmount the DMG
    system "hdiutil", "detach", buildpath/"mount"
  end

  test do
    system "#{bin}/nameback", "--version"
  end
end
