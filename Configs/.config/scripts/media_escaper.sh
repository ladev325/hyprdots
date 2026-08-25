#!/bin/bash
TEMP_DIR="/tmp"
TEMP_FILE="$TEMP_DIR/doorguard"
mkdir -p "$TEMP_DIR"

if [[ "$1" == "-r" ]]; then
    echo "1" > "$TEMP_FILE"
else
    playerctl pause
fi

handle_window() {
    if [[ "$1" == "-r" ]]; then
        # ---show---
        sleep 0.6
        ydotool key 29:1 17:1 17:0 29:0  # ctrl+W (close termorary tab)
        #sleep 0.2
        #ydotool key 33:1 33:0 # F (enter fullscreen)
        
    else
        # ---hide---
        ydotool key 29:1 20:1 20:0 29:0  # ctrl+T (open termorary tab)
    fi
}

focused=$(hyprctl activewindow -j | jq -r 'if .class == "firefox" then .address else "empty" end')
if [[ "$focused" != "empty" ]]; then
  hyprctl dispatch "hl.dsp.focus({ window = 'address:$focused' })"
  handle_window "$1"
fi

windows=$(hyprctl clients -j | jq -r --arg focused "$focused" '.[] | select(.class == "firefox" and .address != $focused) | .address')
for window in $windows; do
    hyprctl dispatch "hl.dsp.focus({ window = 'address:$window' })"
    handle_window "$1"
done

if [[ "$1" == "-r" ]]; then
    playerctl play
    notify-send "[DoorGuard] Continue" -t 1000
else
    echo "0" > "$TEMP_FILE"
fi