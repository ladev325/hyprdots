local colors = require("matugen")

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 0,
        border_size = 2,

        col = {
            active_border = { colors = { colors.primary, colors.tertiary }, angle = 45 },
            inactive_border = "rgba(464646ff)",
        },
        resize_on_border = true,
    },

    decoration = {
        rounding = 10,
        rounding_power = 2,

        active_opacity = 0.88,
        inactive_opacity = 0.88,
        dim_special = 0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xaa1a1a1a,
        },

        blur = {
            enabled = true,
            size = 20,
            passes = 3,
            vibrancy = 0.1696,
        },
    },
    animations = {
        enabled = true,
    },
})
