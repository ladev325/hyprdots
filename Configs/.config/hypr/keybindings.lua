local mainMod = "SUPER"
local terminal = "kitty"
local fileManager = "thunar"
local browser = "firefox"
local notepad = "mousepad"
local calculator = "gnome-calculator"
local monitor = "kitty -e btop"

local home = os.getenv("HOME")


--------- WINDOW ---------
--- actions ---
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + S", hl.dsp.layout("togglesplit"))
hl.bind("F11", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + W", function()
    hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
    hl.dispatch(hl.dsp.window.center())
end)

--- switch ---
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "down" }))

--- move ---
hl.bind(mainMod .. " + SHIFT + CTRL + Left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + CTRL + Right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + CTRL + Up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + CTRL + Down", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

--- resize ---
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.resize({ x = 120, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.resize({ x = -120, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.resize({ x = 0, y = -120, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.resize({ x = 0, y = 120, relative = true }), { repeating = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


--------- PROGS ---------
--- system ---
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(notepad))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(calculator))
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd(monitor))

--- custom ---
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("Telegram"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("viber"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord & element-desktop"))


--------- SCRIPTS ---------
--- system ---
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(home .. "/.config/rofi/launcher/launcher.sh"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(home .. "/.config/rofi/powermenu/powermenu.sh"))
hl.bind(mainMod .. " + ALT + Space", hl.dsp.exec_cmd(home .. "/.config/rofi/wall_select/wall_select.sh"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(home .. "/.config/matugen/scripts/reload.sh"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/blue_light_filter.sh"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/screenshot.sh"))
hl.bind(mainMod .. " + O", function()
    hl.dispatch(hl.dsp.window.set_prop({ prop = "opaque", value = "toggle" }))
end)

--- custom ---
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(home .. "/.config/scripts/media_escaper.sh"))
hl.bind("Pause", hl.dsp.exec_cmd(home .. "/.config/scripts/media_escaper.sh"))
hl.bind(mainMod .. " + Pause", hl.dsp.exec_cmd(home .. "/.config/scripts/media_escaper.sh -r"))
hl.bind("Print", hl.dsp.exec_cmd("bluetoothctl connect B0:38:E2:5A:F1:B3"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("bluetoothctl disconnect B0:38:E2:5A:F1:B3"))

hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(browser .. " https://youtube.com"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd(browser .. " https://keep.google.com"))


--------- MEDIA ---------
--- volume ---
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })

--- playerctl ---
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
