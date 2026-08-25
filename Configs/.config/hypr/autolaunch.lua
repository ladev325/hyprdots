local home = os.getenv("HOME")

hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("wl-clip-persist --clipboard regular")
    hl.exec_cmd("dunst")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("waybar")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("ydotoold")

    --- scripts ---
    hl.exec_cmd(home .. "/.config/matugen/scripts/background_walreader.py")

    --- post ---
    -- hl.timer(function()
    --     hl.dispatch(hl.dsp.focus({ monitor = "DP-1" }))
    --     hl.exec_cmd("firefox")
    -- end, { timeout = 200, type = "oneshot" })
end)
