#!/bin/bash
"$HOME/.config/matugen/scripts/reload.sh"
"$HOME/.config/matugen/scripts/apply_icons.py" &
systemctl --user restart xdg-desktop-portal-gtk