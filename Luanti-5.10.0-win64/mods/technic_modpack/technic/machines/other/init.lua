local path = technic.modpath.."/machines/other"

-- mesecons and tubes related
if core.get_modpath("pipeworks") then
	dofile(path.."/injector.lua")
end
dofile(path.."/constructor.lua")

if technic.config:get_bool("enable_frames") and core.get_modpath("mesecons_mvps") ~= nil and core.get_modpath("pipeworks") ~= nil then
	dofile(path.."/frames.lua")
end

-- Coal-powered machines
dofile(path.."/coal_alloy_furnace.lua")
dofile(path.."/coal_furnace.lua")

dofile(path.."/anchor.lua")
