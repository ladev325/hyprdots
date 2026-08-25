#!/bin/bash
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
PIDFILE="/tmp/screenshot.pid"
mkdir -p "$SCREENSHOT_DIR"

if [ -f "$PIDFILE" ]; then
    OTHER=$(cat "$PIDFILE")
    kill -9 "$OTHER" 2>/dev/null
    pkill -9 -f hyprshot 2>/dev/null
    pkill -9 slurp 2>/dev/null
    sleep 0.2
    hyprshot -m output -m active -t 1000 -o "$SCREENSHOT_DIR"
    pkill -9 wayfreeze 2>/dev/null
    rm -f "$PIDFILE"
else
    echo $$ > "$PIDFILE"
    wayfreeze --hide-cursor &
    sleep 0.4
    hyprshot -m region -t 1000 -o "$SCREENSHOT_DIR"
    pkill -9 wayfreeze 2>/dev/null
    rm -f "$PIDFILE"
fi