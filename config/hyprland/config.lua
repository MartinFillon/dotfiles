-- Hyprland Lua Config
-- Documentation: https://wiki.hypr.land/Configuring/

------------------
---- MONITORS ----
------------------
-- monitor=eDP-1,1920x1080@60,0x0,1
hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = 1 })
-- monitor=HDMI-A-1,1920x1080@60,1920x0,1
-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "1920x0", scale = 1 })
-- hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "auto", scale = 1, mirror = "eDP-1" })

------------------
---- AUTOSTART ---
------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
end)

------------------
---- SETTINGS ----
------------------
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

----------------------
---- WINDOW RULES ----
----------------------
hl.window_rule({
    name = "pip",
    match = { 
        class = "floorp|firefox|chromium", 
        title = "Picture-in-Picture" 
    },
    float = true,
    pin = true,
    size = { 469, 263 }
})

-------------------
---- KEYBINDS ----
-------------------
local mainMod = "SUPER"

-- Basic Apps & Actions
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + C", hl.dsp.window.kill())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("swaylock -i ~/.config/hypr/wallpaper.jpg"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wlogout --protocol layer-shell"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("wofi"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo({ action = "toggle" }))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }))

-- Focus movement
local directions = { left = "l", right = "r", up = "u", down = "d" }
for key, dir in pairs(directions) do
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = dir }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.swap({ direction = dir }))
end

-- Workspace bindings (AZERTY Layout)
local workspaces = {
    { "ampersand",  "1" },
    { "eacute",     "2" },
    { "quotedbl",   "3" },
    { "apostrophe", "4" },
    { "parenleft",  "5" },
    { "minus",      "6" },
    { "egrave",     "7" },
    { "underscore", "8" },
    { "ccedilla",   "9" },
    { "agrave",     "10" }
}

for _, ws in ipairs(workspaces) do
    local key, id = ws[1], ws[2]
    -- Switch workspace
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = id }))
    -- Move window to workspace
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = id }))
    -- Move window to workspace silently
    hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = id, follow = false }))
end

-- Mouse bindings
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Sound & Brightness
hl.bind("ALT + F2", hl.dsp.exec_cmd("amixer set Master 10%-"))
hl.bind("ALT + F3", hl.dsp.exec_cmd("amixer set Master 10%+"))
hl.bind("ALT + F1", hl.dsp.exec_cmd("amixer set Master toggle"))
hl.bind("ALT + F6", hl.dsp.exec_cmd("brightnessctl s 10%-"))
hl.bind("ALT + F7", hl.dsp.exec_cmd("brightnessctl s 10%+"))
