#!/bin/bash
# Sync poster images from NineLivesCat project into the website.
# Usage: ./sync-posters.sh

set -e
ROOT="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="$ROOT/../NineLivesCat"
DST_DIR="$ROOT/assets/posters"

mkdir -p "$DST_DIR"

copied=0
for i in 1 2 3 4 5; do
  src="$SRC_DIR/poster$i.png"
  dst="$DST_DIR/poster$i.png"
  if [ -f "$src" ]; then
    cp "$src" "$dst"
    echo "✓ poster$i.png"
    copied=$((copied + 1))
  fi
done

if [ "$copied" -eq 0 ]; then
  echo "No poster*.png found in $SRC_DIR"
  echo "Place poster1.png … poster5.png there, then re-run this script."
  exit 1
fi

echo "Synced $copied poster(s) to assets/posters/"
