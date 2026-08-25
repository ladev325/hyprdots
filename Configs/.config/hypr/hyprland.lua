require("monitors")
require("autolaunch")
require("keybindings")
require("windowrules")
require("styles")
require("animations")
require("workspaces")

---------THEME---------
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("QT_SCALE_FACTOR", "1.25")

---------CONFIG---------
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    scrolling = {
        fullscreen_on_one_column = true,
    },
    input = {
        kb_layout = "us, ru",
        kb_variant = ", ruu",
        kb_model = "",
        kb_options = "caps:escape",
        kb_rules = "",

        follow_mouse = 1,
        sensitivity = 0,
        mouse_refocus = true,
        touchpad = {
            natural_scroll = false,
        },
        --repeat_delay = 200,
    },

})
