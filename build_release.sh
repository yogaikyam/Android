#!/bin/bash
# Yogaikyam Flutter — Play Store Release Build Script
# Run this once Android Studio + Android SDK are installed.

set -e

FLUTTER_PROJECT="/Users/kaustabchakraborty/Downloads/As/stitch_yogaikyam_functional_movement_pwa/yogaikyam_flutter"
OUTPUT_DIR="/Users/kaustabchakraborty/Downloads/As/Android"

# Make sure OpenJDK 17 is on PATH (installed via brew)
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

echo "==> Flutter doctor check"
flutter doctor

echo "==> Getting dependencies"
cd "$FLUTTER_PROJECT"
flutter pub get

echo "==> Building release AAB"
flutter build appbundle --release

AAB="$FLUTTER_PROJECT/build/app/outputs/bundle/release/app-release.aab"
echo "==> Copying AAB to $OUTPUT_DIR"
cp "$AAB" "$OUTPUT_DIR/yogaikyam-v1.2.0-release.aab"

echo ""
echo "Done! Upload $OUTPUT_DIR/yogaikyam-v1.2.0-release.aab to Play Console."
