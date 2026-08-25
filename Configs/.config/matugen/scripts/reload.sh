#!/bin/bash
awww img "$HOME/.config/matugen/wallpapers/current.jpg" --transition-type wipe --transition-angle 45
matugen image "$HOME/.config/matugen/wallpapers/current.jpg" --source-color-index 0
"$HOME/.config/matugen/scripts/apply_vscode.py" &
"$HOME/.config/matugen/scripts/apply_telegram.py" &