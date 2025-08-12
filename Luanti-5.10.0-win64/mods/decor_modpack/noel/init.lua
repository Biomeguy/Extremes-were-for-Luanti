local MODPATH = core.get_modpath("noel")

local depends = {
	armor = core.global_exists("armor"),
	basic_materials = core.get_modpath("basic_materials"),
	bucket = core.get_modpath("bucket"),
	default = core.get_modpath("default"),
	fir = core.get_modpath("fir"),
	dye = core.get_modpath("dye"),
	farming = core.get_modpath("farming"),
	mobs_animal = core.get_modpath("mobs_animal"),
	mobs_redo = core.global_exists("mobs") and mobs.mod and mobs.mod == "redo",
	stairs = core.global_exists("stairs"),
	vessels = core.get_modpath("vessels"),
	fabric = core.get_modpath("fabric"),
	xpanes = core.global_exists("xpanes"),
}

local function default_sounds(name)
	if default and default[name] then return default[name]() end
end

local function include(filename)
	assert(loadfile(MODPATH .. "/" .. filename))(depends, default_sounds)
end

include("food.lua")
include("lights.lua")
include("mobs.lua")
include("stocking.lua")
include("misc.lua")
include("INFINATUM.lua")
