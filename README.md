# Homebrew Nameback

Official Homebrew tap for [nameback](https://github.com/h4x0r/nameback) - Rename files based on their metadata.

## Installation

```bash
brew tap h4x0r/nameback
brew install nameback
```

This automatically installs nameback with all dependencies:
- **exiftool** - Required for metadata extraction
- **tesseract** + **tesseract-lang** - Multi-language OCR support
- **ffmpeg** - Video frame extraction
- **imagemagick** - HEIC/HEIF support

## Usage

```bash
# Check dependencies
nameback --check-deps

# Preview changes (dry-run)
nameback /path/to/folder --dry-run

# Rename files
nameback /path/to/folder
```

## Documentation

See the [main repository](https://github.com/h4x0r/nameback) for full documentation.
