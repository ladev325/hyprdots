#!/usr/bin/env python3

from pathlib import Path
import subprocess

JSON_PATH = Path.home() / ".cache" / "wal" / "icons"
CATPPUCIN_PALETTE = "mocha"  # mocha colors are set below!
PAPIRUS_THEME = "Papirus-Dark"

COLORS = {
    "adwaita": (147, 192, 234),
    "black": (79, 79, 79),
    "blue": (82, 148, 226),
    "bluegrey": (96, 125, 139),
    "breeze": (87, 184, 236),
    "brown": (174, 142, 108),
    "carmine": (163, 0, 2),
    "cyan": (0, 188, 212),
    "darkcyan": (69, 171, 183),
    "deeporange": (235, 102, 55),
    "green": (135, 177, 88),
    #"grey": (142, 142, 142),
    "indigo": (92, 107, 192),
    "magenta": (202, 113, 223),
    "nordic": (129, 161, 193),
    "orange": (238, 146, 58),
    "palebrown": (209, 191, 174),
    "paleorange": (238, 202, 143),
    "pink": (240, 98, 146),
    "red": (226, 82, 82),
    "teal": (22, 160, 133),
    "violet": (126, 87, 194),
    "white": (228, 228, 228),
    "yaru": (103, 103, 103),
    "yellow": (249, 189, 48),
    "cat-X-rosewater": (245, 224, 220),
    "cat-X-maroon": (235, 160, 172),
    "cat-X-pink": (245, 194, 231),
    "cat-X-teal": (148, 226, 213),
    "cat-X-peach": (250, 179, 135),
    "cat-X-sapphire": (116, 199, 236),
    "cat-X-red": (243, 139, 168),
    "cat-X-flamingo": (242, 205, 205),
    "cat-X-green": (166, 227, 161),
    "cat-X-mauve": (203, 166, 247),
    "cat-X-sky": (137, 220, 235),
    "cat-X-yellow": (249, 226, 175),
    "cat-X-blue": (137, 180, 250),
    "cat-X-lavender": (180, 190, 254),
}

# ---------------- HEX TO RGB ----------------

def hex_to_rgb(hex_color):
    if hex_color.startswith("#"):
        hex_color = hex_color[1:]

    if len(hex_color) != 6:
        raise ValueError("Invalid hex color format")

    r = int(hex_color[0:2], 16)
    g = int(hex_color[2:4], 16)
    b = int(hex_color[4:6], 16)
    return (r, g, b)


# ---------------- SCRIPT ----------------

# get color
with open(JSON_PATH, "r", encoding="utf-8") as file:
    data = file.read()

color_hex = data
color_rgb = hex_to_rgb(color_hex)

# get the best-matching color name
match_name = next(iter(COLORS))
match_diff = float("inf")

for name, rgb in COLORS.items():
    saturation = max(rgb) - min(rgb) + 1
    r_diff = (color_rgb[0] - rgb[0]) ** 2
    g_diff = (color_rgb[1] - rgb[1]) ** 2
    b_diff = (color_rgb[2] - rgb[2]) ** 2
    total_diff = (r_diff + g_diff + b_diff) / saturation

    if total_diff < match_diff:
        match_diff = total_diff
        match_name = name

match_name = match_name.replace("X", CATPPUCIN_PALETTE)
subprocess.run(["papirus-folders", "-C", match_name, "-t", PAPIRUS_THEME])