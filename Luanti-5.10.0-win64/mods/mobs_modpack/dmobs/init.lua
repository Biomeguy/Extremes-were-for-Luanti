dmobs = {}

-- dmobs by D00Med

-- mounts api by D00Med and lib_mount api by blert2112

dofile(core.get_modpath("dmobs").."/api.lua")

-- Enable dragons (disable to remove tamed dragons and dragon bosses)
dmobs.dragons = core.settings:get_bool("dmobs.dragons")
if dmobs.dragons == nil then
dmobs.dragons = true
end
dmobs.regulars = core.settings:get_bool("dmobs.regulars")
if dmobs.regulars == nil then
dmobs.regulars = true
end


-- Enable fireballs/explosions
dmobs.destructive = core.settings:get_bool("dmobs.destructive") or false

-- Timer for the egg mechanics
dmobs.eggtimer = tonumber(core.settings:get("dmobs.eggtimer") ) or 100



-- Table cloning to reduce code repetition
dmobs.deepclone = function(t) -- deep-copy a table -- from https://gist.github.com/MihailJP/3931841
	if type(t) ~= "table" then return t end

	local target = {}

	for k, v in pairs(t) do
		if k ~= "__index" and type(v) == "table" then -- omit circular reference
			target[k] = dmobs.deepclone(v)
		else
			target[k] = v
		end
	end
	return target
end

-- Start loading ----------------------------------------------------------------------------------

local function loadmob(mobname,dir)
	dir = dir or "/mobs/"
	dofile(core.get_modpath("dmobs")..dir..mobname..".lua")
end

-- regular mobs

local mobslist = {
	-- friendlies
	"tortoise",
	"nyan",
	"gnorm",
	"hedgehog",
	"owl",
	"whale",
	"badger",
	"elephant",
	"aquatic",
	"raptor",
	"flying",
	"land",

	"golems",

	-- baddies
	"fox",
	"rat",
	"wasps",
	"treeman",
	"orc",
	"ninja",
	"yeti",
}

if dmobs.regulars then
	for _,mobname in pairs(mobslist) do
		loadmob(mobname)
	end
end

-- dragons!!

if not dmobs.dragons then
	loadmob("dragon_normal","/dragons/")
else
	loadmob("main","/dragons/")
	loadmob("dragon1","/dragons/")
	loadmob("dragon2","/dragons/")
	loadmob("dragon3","/dragons/")
	loadmob("dragon4","/dragons/")
	loadmob("great_dragon","/dragons/")
	loadmob("water_dragon","/dragons/")
	loadmob("wyvern","/dragons/")

	dofile(core.get_modpath("dmobs").."/dragons/eggs.lua")
end
dofile(core.get_modpath("dmobs").."/arrows/dragonfire.lua")
dofile(core.get_modpath("dmobs").."/arrows/dragonarrows.lua")

-- General arrow definitions

if dmobs.destructive == true then
	dofile(core.get_modpath("dmobs").."/arrows/fire_explosive.lua")
else
	dofile(core.get_modpath("dmobs").."/arrows/fire.lua")
end

dofile(core.get_modpath("dmobs").."/nodes.lua")
dofile(core.get_modpath("dmobs").."/arrows/sting.lua")

-- Spawning

dofile(core.get_modpath("dmobs").."/spawn.lua")
