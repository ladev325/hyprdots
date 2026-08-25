#!/bin/bash
hyprctl switchxkblayout all 0
pkill rofi
rofi -x11 -normal-window -show drun -theme "~/.config/rofi/launcher/style.rasi"