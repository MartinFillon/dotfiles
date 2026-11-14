-- Hyprland Lua Config
-- Documentation: https://wiki.hypr.land/Configuring/

------------------
---- MONITORS ----
------------------
-- hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "1920x0", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "0x0", scale = 1 })
-- hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "auto", scale = 1, mirror = "eDP-1" })

hl.on("hyprland.start", function()
    -- hl.exec_cmd("hyprctl output create headless && sleep 1 && wayvnc -o HEADLESS-1 0.0.0.0")
    hl.exec_cmd("waybar")
end)

-- 1. Define the resolution and position for the virtual monitor
-- In Lua, monitor properties are passed inside a table {}
-- hl.monitor({
--     output = "HEADLESS-1",
--     mode = "1920x1080@60",
--     position = "auto",
--     scale = 1
-- })
