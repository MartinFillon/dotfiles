local mainMod = "SUPER"

-- Basic Apps & Actions
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
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
