-- Hyprland Lua Config
-- Documentation: https://wiki.hypr.land/Configuring/

------------------
---- MONITORS ----
------------------
for _, monitor in ipairs(MONITORS) do
    hl.monitor(monitor)
end

hl.on("hyprland.start", function()
    if (IS_VNC_SERVER) then
        hl.exec_cmd("hyprctl output create headless && sleep 1 && wayvnc -o HEADLESS-1 0.0.0.0")
    end
    hl.exec_cmd("waybar")
end)

if (IS_VNC_SERVER) then
    hl.monitor({
        output = "HEADLESS-1",
        mode = "1920x1080@60",
        position = "auto",
        scale = 1
    })
end
