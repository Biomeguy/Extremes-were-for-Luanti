local title		= "Trunks"
local version	= "0.1.4"
local mname		= "trunks"

-- Code by Mossmanikin & Neuromancer
abstract_trunks = {}

-- support for i18n
local S = core.get_translator("trunks")

dofile(core.get_modpath("trunks").."/trunks_settings.txt")
dofile(core.get_modpath("trunks").."/generating.lua")
dofile(core.get_modpath("trunks").."/nodes.lua")
dofile(core.get_modpath("trunks").."/crafting.lua")

print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
