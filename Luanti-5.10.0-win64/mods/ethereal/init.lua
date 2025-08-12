--[[
	Luanti Ethereal Mod

	Created by ChinChow
	Updated by TenPlus1
	Edited by Biomeguy
]]

 -- DO NOT change settings below, use the settings.conf file instead
ethereal = {

	version = "1.28",
	cavedirt = core.settings:get_bool('ethereal.cavedirt', true),

	glacier = core.settings:get('ethereal.glacier') or 1,
	bamboo = core.settings:get('ethereal.bamboo') or 1,
	alpine = core.settings:get('ethereal.alpine') or 1,
	snowy = core.settings:get('ethereal.snowy') or 1,
	frost = core.settings:get('ethereal.frost') or 1,
	grassy = core.settings:get('ethereal.grassy') or 1,
	junglee = core.settings:get('ethereal.junglee') or 1,
	grove = core.settings:get('ethereal.grove') or 1,
	scorched = core.settings:get('ethereal.scorched') or 1,
	fiery = core.settings:get('ethereal.fiery') or 1,
	swamp = core.settings:get('ethereal.swamp') or 1,
	sealife = core.settings:get('ethereal.sealife') or 1,
	reefs = core.settings:get('ethereal.reefs') or 1,
}

local path = core.get_modpath("ethereal")

-- Load new settings if found
local input = io.open(path.."/settings.conf", "r")
if input then
	dofile(path .. "/settings.conf")
	input:close()
	input = nil
end

-- load new world-specific settings if found inside world folder
local worldpath = core.get_worldpath()
local input = io.open(worldpath.."/ether.conf", "r")
if input then
	dofile(worldpath.."/ether.conf")
	input:close()
	input = nil
end

-- Intllib
local S
if core.get_translator then
	S = core.get_translator("ethereal")
elseif core.global_exists("intllib") then
	if intllib.make_gettext_pair then
		S = intllib.make_gettext_pair()
	else
		S = intllib.Getter()
	end
else
	S = function(s) return s end
end
ethereal.intllib = S

dofile(path .. "/plantlife.lua")
dofile(path .. "/dirt.lua")
dofile(path .. "/food.lua")
dofile(path .. "/wood.lua")
dofile(path .. "/leaves.lua")
dofile(path .. "/sapling.lua")
dofile(path .. "/extra.lua")
dofile(path .. "/sealife.lua")
dofile(path .. "/fences.lua")
dofile(path .. "/gates.lua")
dofile(path .. "/biomes.lua")
dofile(path .. "/ores.lua")
dofile(path .. "/schems.lua")
dofile(path .. "/decor.lua")
dofile(path .. "/stairs.lua")
dofile(path .. "/lucky_block.lua")

-- Set bonemeal aliases
if core.get_modpath("bonemeal") then
	core.register_alias("ethereal:bone", "bonemeal:bone")
	core.register_alias("ethereal:bonemeal", "bonemeal:bonemeal")
else
	core.register_alias("ethereal:bone", "default:bone")
end

print (S("[MOD] Ethereal loaded"))
