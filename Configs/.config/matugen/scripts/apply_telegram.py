#!/usr/bin/env python3
import subprocess
from pathlib import Path

ARCHIEVE_NAME = "theme.tdesktop-theme"
CACHE_DIR = Path.home() / ".cache" / "telegram-matugen"
BACKGROUND_COLOR_PATH = Path.home() / ".cache" / "wal" / "telegram_background"

# ---------------- SCRIPT ----------------

# get background color
with open(BACKGROUND_COLOR_PATH, "r", encoding="utf-8") as file:
    background = file.read()

# generate background image in theme dir
CACHE_DIR.mkdir(parents=True, exist_ok=True)
jpg_path = CACHE_DIR / "background.jpg"
subprocess.run(["magick", "-size", "1000x1000", "-depth", "8", "-colorspace", "sRGB", f"xc:{background}", str(jpg_path)], check=True)

# create theme archive
theme_path = CACHE_DIR / "colors.tdesktop-theme"
theme_archive = CACHE_DIR / ARCHIEVE_NAME
subprocess.run(["zip", "-j", str(theme_archive), str(theme_path), str(jpg_path)], check=True)