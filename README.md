# DaVinci Resolve Linux Codec Solutions (Nautilus Scripts)

This repository contains a pair of Nautilus scripts that fix common codec issues in the free version of **DaVinci Resolve for Linux**.

## Problems it Solves

On Linux, the free version of DaVinci Resolve cannot decode/encode **H.264/H.265 (MP4/AAC)** due to patent restrictions. This causes videos to show as "Media Offline" or fail to import entirely and export.

- **Prepare for DaVinci Resolve**: Converts videos (MP4, MKV, etc.) to **DNxHR HQ** with **PCM (16-bit)** audio in a `.mov` container. This is a native editing format that works perfectly in Resolve Free for Linux.
- **Convert to Universal MP4**: Useful for converting videos with modern codecs (like AV1, which is so modern that even VLC itself can't read it.) to standard **H.264/AAC**, ideal for sharing or when you need maximum compatibility outside of Resolve.

## 🛠️ Requirements

Make sure you have the following packages installed:

- `ffmpeg`: For the conversion magic.
- `zenity`: To display the graphical progress interface.

On Ubuntu/Debian:
```bash
sudo apt update && sudo apt install ffmpeg zenity
```

## 📦 Installation

Simply run the installation script:

```bash
chmod +x install.sh
./install.sh
```

The script will copy the files to your local Nautilus folder (`~/.local/share/nautilus/scripts`) and set the necessary execution permissions.

## Usage

1. Open your file manager (Nautilus).
2. Right-click on one or more videos.
3. Select **Scripts** > **Prepare for DaVinci Resolve** or **Convert to Universal MP4**.
4. A window will open showing the conversion progress. You can cancel at any time.

## Quality Notes

- **DNxHR HQ**: Generates larger files than the original MP4, but they maintain professional quality and are much faster for the computer to process during editing.
- **Interface**: The scripts include a window with auto-scroll and a real cancel button that stops the FFmpeg process.

---
*Made with ❤️ from Spain.*
