--[[
** Map Tools **
By Calinou.

Copyright (c) 2012-2017 Hugo Locurcio and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
--]]

maptools = {}

local S
if core.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end
maptools.intllib = S

maptools.config = {}

local function getbool_default(setting, default)
	local value = core.settings:get_bool(setting)
	if value == nil then
		value = default
	end
	return value
end

local function setting(settingtype, name, default)
	if settingtype == "bool" then
		maptools.config[name] =
			getbool_default("maptools." .. name, default)
	else
		maptools.config[name] =
			core.settings:get("maptools." .. name) or default
	end
end

-- Show Map Tools stuff in creative inventory (1 or 0):
setting("integer", "hide_from_creative_inventory", 0)

local modpath = core.get_modpath("maptools")

dofile(modpath .. "/aliases.lua")
dofile(modpath .. "/items.lua")

if core.settings:get_bool("log_mods") then
	core.log("action", S("[maptools] loaded."))
end
