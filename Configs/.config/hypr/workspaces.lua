local function toggle_main()
    local special_ws = hl.get_active_special_workspace()
    if special_ws then
        local stripped = special_ws.name:gsub("special:", "")
        hl.dispatch(hl.dsp.workspace.toggle_special(stripped))
    end
end

local function get_windows()
    local windows = {}
    local special_ws = hl.get_active_special_workspace()
    if special_ws then
        windows = hl.get_workspace_windows(special_ws) or {}
    else
        windows = hl.get_workspace_windows(hl.get_active_workspace()) or {}
    end
    return windows
end

local function focus_first()
    local windows = get_windows()
    if #windows > 0 then
        hl.dispatch(hl.dsp.focus({ window = "address:" .. windows[1].address }))
    end
end

--- toggle workspace ---
for i = 2, 9 do
    hl.bind("SUPER + " .. i, function()
        local special_ws = hl.get_active_special_workspace()
        if not special_ws or special_ws.name ~= "special:scratch_" .. i then
            hl.dispatch(hl.dsp.workspace.toggle_special("scratch_" .. i))
        end
    end)
end

hl.bind("SUPER + 1", function()
    toggle_main()
end)


--- move window to workspace ---
for i = 2, 9 do
    hl.bind("SUPER + SHIFT + " .. i, function()
        local windows = get_windows()
        if #windows > 0 then
            hl.dispatch(hl.dsp.window.move({ workspace = "special:scratch_" .. i, follow = (#windows == 1) }))
            focus_first()
        else
            hl.dispatch(hl.dsp.workspace.toggle_special("scratch_" .. i))
        end
    end)
end

hl.bind("SUPER + SHIFT + 1", function()
    local windows = get_windows()
    if #windows > 0 then
        local ws = hl.get_active_workspace()
        hl.dispatch(hl.dsp.window.move({ workspace = ws, follow = (#windows == 1) }))
        focus_first()
    else
        toggle_main()
    end
end)

hl.bind("SUPER + 0", function()
    hl.dispatch(hl.dsp.focus({ workspace = 15}))
end)