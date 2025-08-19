
-- (by Mossmanikin)

abstract_ferns = {}

-- support for i18n
local S = core.get_translator("ferns")

dofile(core.get_modpath("ferns").."/settings.lua")

if abstract_ferns.config.enable_lady_fern == true and core.get_modpath("biome_lib") then
	dofile(core.get_modpath("ferns").."/fern.lua")
end

if abstract_ferns.config.enable_horsetails == true then
	dofile(core.get_modpath("ferns").."/horsetail.lua")
end

if abstract_ferns.config.enable_treefern == true then
	dofile(core.get_modpath("ferns").."/treefern.lua")
end

if abstract_ferns.config.enable_giant_treefern == true then
	dofile(core.get_modpath("ferns").."/gianttreefern.lua")
end

dofile(core.get_modpath("ferns").."/crafting.lua")
