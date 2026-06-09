#!/bin/bash
# Installation script for Nautilus Scripts (DaVinci Resolve Linux Tools)

# Output colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}>>> Nautilus Scripts Installer for DaVinci Resolve${NC}"

# Define target directory (Nautilus scripts folder)
TARGET_DIR="$HOME/.local/share/nautilus/scripts"

# Create directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${BLUE}Creating scripts directory at $TARGET_DIR...${NC}"
    mkdir -p "$TARGET_DIR"
fi

# Verify dependencies
echo -e "${BLUE}Verifying dependencies...${NC}"
MISSING=()
for cmd in ffmpeg zenity; do
    if ! command -v $cmd &> /dev/null; then
        MISSING+=($cmd)
    fi
done

if [ ${#MISSING[@]} -ne 0 ]; then
    echo -e "${RED}Error: Missing dependencies: ${MISSING[*]}${NC}"
    echo -e "Please install them using your package manager (e.g.: sudo apt install ffmpeg zenity)"
    exit 1
fi

# Copy scripts
echo -e "${BLUE}Installing scripts...${NC}"

# Get the directory of the install script
SOURCE_DIR=$(dirname "$(readlink -f "$0")")

cp "$SOURCE_DIR/Convert to Universal MP4" "$TARGET_DIR/"
cp "$SOURCE_DIR/Prepare for DaVinci Resolve" "$TARGET_DIR/"

# Set execution permissions
chmod +x "$TARGET_DIR/Convert to Universal MP4"
chmod +x "$TARGET_DIR/Prepare for DaVinci Resolve"

echo -e "${GREEN}>>> Installation completed successfully!${NC}"
echo -e "You can now use the scripts by right-clicking any video in Nautilus:"
echo -e "   ${BLUE}Scripts -> Convert to Universal MP4 / Prepare for DaVinci Resolve${NC}"
echo -e "\nNote: If they don't appear, restart Nautilus with 'nautilus -q'."
