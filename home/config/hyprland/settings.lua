hl.config({
    input = {
        kb_layout = "fr",
        follow_mouse = 1,
        touchpad = {
            natural_scroll = false
        },
        sensitivity = 0
    },
    general = {
        gaps_in = 5,
        gaps_out = 20,
        border_size = 2,
        ["col.active_border"] = "rgb(cdd6f4)",
        ["col.inactive_border"] = "rgba(595959aa)",
        layout = "dwindle"
    },
    decoration = {
        rounding = 10,
        blur = {
            enabled = true,
            size = 7,
            passes = 3,
            new_optimizations = true
        },
        shadow = {
            enabled = true,
            range = 4,
            color = "rgba(1a1a1aee)",
            render_power = 3
        }
    },
    animations = {
        enabled = true,
        -- Custom Bezier
        beziers = {
            myBezier = { 0.05, 0.9, 0.1, 1.05 }
        },
        -- Animation rules
        animations = {
            { name = "windows",    enabled = true, speed = 7,  curve = "myBezier" },
            { name = "windowsOut", enabled = true, speed = 7,  curve = "default", style = "popin 80%" },
            { name = "border",     enabled = true, speed = 10, curve = "default" },
            { name = "fade",       enabled = true, speed = 7,  curve = "default" },
            { name = "workspaces", enabled = true, speed = 6,  curve = "default" }
        }
    },
    dwindle = {
        preserve_split = true
    },
    misc = {
        disable_hyprland_logo = true
    }
})