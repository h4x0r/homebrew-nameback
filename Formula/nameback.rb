class Nameback < Formula
  desc "Rename files based on their metadata with multi-language OCR and HEIC support"
  homepage "https://github.com/h4x0r/nameback"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/h4x0r/nameback/releases/download/v0.2.3/nameback-aarch64-apple-darwin.tar.gz"
      sha256 "3e6a46ca5153431cb04f5c64f19112e7a3a55966cd118a94cd2de48307cd52ad"
    else
      url "https://github.com/h4x0r/nameback/releases/download/v0.2.3/nameback-x86_64-apple-darwin.tar.gz"
      sha256 "cf1d83b05c18cbb36eba35321e73ebc55d72f43bdd9594d3e4142968bb3aa4bb"
    end
  end

  depends_on "exiftool"
  depends_on "tesseract"
  depends_on "tesseract-lang"
  depends_on "ffmpeg"
  depends_on "imagemagick"

  def install
    bin.install "nameback"
  end

  test do
    system "#{bin}/nameback", "--version"
  end
end
