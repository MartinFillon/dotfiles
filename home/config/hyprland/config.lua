-- Hyprland Lua Config
-- Documentation: https://wiki.hypr.land/Configuring/

------------------
---- MONITORS ----
------------------
for _, monitor in ipairs(MONITORS) do
    hl.monitor(monitor)
end

local vncOutputName = nil

local function isHeadlessMonitor(monitor)
    return type(monitor.name) == "string" and monitor.name:match("^HEADLESS%-") ~= nil
end

local function startVnc()
    hl.exec_cmd("hyprctl output create headless")
end

local function stopVnc()
    if vncOutputName then
        hl.exec_cmd("killall wayvnc; hyprctl output remove " .. vncOutputName)
        vncOutputName = nil
        return
    end

    hl.exec_cmd([[killall wayvnc; hyprctl monitors all -j | jq -r '.[] | select(.name|startswith("HEADLESS-")) | .name' | while read -r n; do hyprctl output remove "$n"; done]])
end

hl.on("monitor.added", function(monitor)
    if not IS_VNC_SERVER or not isHeadlessMonitor(monitor) then
        return
    end

    vncOutputName = monitor.name

    hl.monitor({
        output = monitor.name,
        mode = "1920x1080@60",
        position = "auto",
        scale = 1,
    })

    hl.exec_cmd("wayvnc -o " .. monitor.name .. " 0.0.0.0")
end)

hl.on("monitor.removed", function(monitor)
    if monitor.name == vncOutputName then
        vncOutputName = nil
    end
end)

hl.on("hyprland.start", function()
    if (IS_VNC_SERVER) then
        startVnc()
    end
    hl.exec_cmd("waybar")
end)

hl.on("hyprland.shutdown", function()
    if (IS_VNC_SERVER) then
        stopVnc()
    end
end)

hl.on("config.reloaded", function()
    if (IS_VNC_SERVER) then
        stopVnc()
        startVnc()
    end
end)
