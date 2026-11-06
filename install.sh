#!/bin/bash
set -e

echo "🚀 Starting Fastfetch installation..."

# Check if fastfetch is installed
if ! command -v fastfetch &> /dev/null; then
    echo "❌ Error: fastfetch is not installed."
    echo "Please install it first (e.g., sudo pacman -S fastfetch)"
    exit 1
fi

echo "📁 Creating config directory..."
mkdir -p ~/.config/fastfetch

# Backup existing config
if [ -f ~/.config/fastfetch/config.jsonc ]; then
    echo "📦 Backing up existing config to config.jsonc.bak"
    mv ~/.config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc.bak
fi
if [ -f ~/.config/fastfetch/my-logo.txt ]; then
    echo "📦 Backing up existing logo to my-logo.txt.bak"
    mv ~/.config/fastfetch/my-logo.txt ~/.config/fastfetch/my-logo.txt.bak
fi

# Copy new files
echo "📄 Installing new config..."
cp config.jsonc ~/.config/fastfetch/
cp my-logo.txt ~/.config/fastfetch/

echo "✅ Installation complete! Run 'fastfetch' to see the magic."
