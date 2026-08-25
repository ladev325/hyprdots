local systemRounding = 15

---------SYSTEM---------

hl.window_rule({
    name        = "single-window-workspace",
    match       = { float = false, workspace = "w[t1]" },
    border_size = 0,
    rounding    = 0,
})

hl.layer_rule({
    name  = "waybar",
    match = { namespace = "waybar" },
    blur  = true,
})

hl.window_rule({
    name         = "rofi-all",
    match        = { class = "Rofi" },
    float        = true,
    center       = true,
    pin          = true,
    stay_focused = true,
    rounding     = systemRounding,
})

hl.window_rule({
    name    = "rofi-wallpapers",
    match   = { class = "Rofi", title = "rofi - Wallpapers" },
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})


hl.window_rule({
    name     = "gsimplecal-position",
    match    = { class = "gsimplecal" },
    move     = { "monitor_w*0.8", "monitor_h*0.7" },
    pin      = true,
    rounding = systemRounding,
})


---------CUSTOM---------

hl.window_rule({
    name    = "youtube",
    match   = { title = ".*YouTube — Mozilla Firefox.*" },
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    name    = "teams",
    match   = { title = ".*Micro(soft|slop) Teams — Mozilla Firefox.*" },
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    name    = "obs",
    match   = { class = "com.obsproject.Studio" },
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    name    = "minecraft",
    match   = { class = ".*Minecraft.*" },
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    name    = "onlyoffice",
    match   = { class = "ONLYOFFICE" },
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    name    = "pinta",
    match   = { class = "com.github.PintaProject.Pinta" },
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    name    = "vlc",
    match   = { class = "vlc" },
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    name    = "qview",
    match   = { class = "com.interversehq.qView" },
    no_blur = true,
    opacity = "1.0 override 1.0 override",
    float   = true,
    center  = true,
    size    = { "monitor_w*0.85", "monitor_h*0.8" },
})

hl.window_rule({
    name   = "kitty",
    match  = { class = "kitty" },
    float  = true,
    center = true,
    size   = { "monitor_w*0.5", "monitor_h*0.55" },
})

hl.window_rule({
    name   = "thunar",
    match  = { class = "[Tt]hunar|xdg-desktop-portal-gtk" },
    float  = true,
    center = true,
    size   = { "monitor_w*0.56", "monitor_h*0.6" },
})

hl.window_rule({
    name   = "blueman",
    match  = { class = "blueman-manager" },
    float  = true,
    center = true,
    size   = { "monitor_w*0.4", "monitor_h*0.45" },
})

hl.window_rule({
    name   = "mousepad",
    match  = { class = "org.xfce.mousepad" },
    float  = true,
    center = true,
    size   = { "monitor_w*0.95", "monitor_h*0.9" },
})

hl.window_rule({
    name   = "pavucontrol",
    match  = { class = "org.pulseaudio.pavucontrol" },
    float  = true,
    center = true,
    size   = { "monitor_w*0.45", "monitor_h*0.5" },
})

hl.window_rule({
    name   = "calculator",
    match  = { class = "org.gnome.Calculator" },
    float  = true,
    center = true,
})

hl.window_rule({
    name    = "steam",
    match   = { class = ".*steam.*" },
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})