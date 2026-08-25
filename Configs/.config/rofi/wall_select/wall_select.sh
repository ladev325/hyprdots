#!/bin/bash
pkill rofi

wallpaper_dir="${HOME}/.config/matugen/wallpapers/images"
current_dir="${HOME}/.config/matugen/wallpapers"
cache_dir="${HOME}/.cache/jp/${theme}"
rofi_command="rofi -x11 -normal-window -dmenu -p "Wallpapers" -theme ${HOME}/.config/rofi/wall_select/style.rasi"
reload_script="${HOME}/.config/matugen/scripts/apply.sh"

# Create cache directory
if [ ! -d "${cache_dir}" ]; then
    mkdir -p "${cache_dir}"
fi

# Generate thumbnails
for imagen in "$wallpaper_dir"/*.{jpg,jpeg}; do
    if [ -f "$imagen" ]; then
        nombre_archivo=$(basename "$imagen")
        if [ ! -f "${cache_dir}/${nombre_archivo}" ]; then
            convert -strip "$imagen" -thumbnail 500x500^ -gravity center -extent 500x500 "${cache_dir}/${nombre_archivo}"
        fi
    fi
done

# Select wallpaper with rofi
wall_selection=$(find "${wallpaper_dir}" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) \
    -exec basename {} \; | sort | while read -r a; do
        echo -en "$a\x00icon\x1f${cache_dir}/$a\n"
    done | $rofi_command)

[[ -n "$wall_selection" ]] || exit 1

# Copy selected wallpaper
full_path="${wallpaper_dir}/${wall_selection}"
cp "$full_path" "${current_dir}/current.jpg"

# Reload everything
"$reload_script"
exit 0