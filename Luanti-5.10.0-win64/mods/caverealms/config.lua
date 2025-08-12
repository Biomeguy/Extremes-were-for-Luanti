
local CONFIG_FILE_PREFIX = "caverealms."

caverealms.config = {}

-- This function based on kaeza/minetest-irc/config.lua and used under the
-- terms of BSD 2-clause license.
local function setting(stype, name, default)
	local value
	if stype == "bool" then
		value = core.settings:get_bool(CONFIG_FILE_PREFIX..name)
	elseif stype == "string" then
		value = core.settings:get(CONFIG_FILE_PREFIX..name)
	elseif stype == "number" then
		value = tonumber(core.settings:get(CONFIG_FILE_PREFIX..name))
	end
	if value == nil then
		value = default
	end
	caverealms.config[name] = value
end

--generation settings
setting("number", "ymax", -1500) --top realm limit
if core.get_modpath("nether") then --bottom realm limit
	if core.get_modpath("nssm") then
	setting("number", "ymin", -24736)
	else
	setting("number", "ymin", -24910)
	end
elseif core.get_modpath("nssm") then
setting("number", "ymin", -30748)
else
setting("number", "ymin", -30911)
end

--decoration chances
setting("number", "stagcha", 0.003) --chance of stalagmites
setting("number", "stalcha", 0.003) --chance of stalactites

setting("number", "h_lag", 8) --max height for stalagmites
setting("number", "h_lac", 8) --...stalactites
setting("number", "crystal", 0.0002) --chance of glow crystal formations
setting("number", "h_cry", 8) --max height of glow crystals
setting("number", "h_clac", 8) --max height of glow crystal stalactites

setting("number", "gemcha", 0.03) --chance of small glow gems
setting("number", "mushcha", 0.04) --chance of mushrooms
setting("number", "myccha", 0.03) --chance of mycena mushrooms
setting("number", "wormcha", 0.015) --chance of glow worms
setting("number", "giantcha", 0.002) --chance of giant mushrooms
setting("number", "icicha", 0.035) --chance of icicles
setting("number", "flacha", 0.04) --chance of constant flames

--realm limits for Dungeon Masters' Lair
setting("number", "dm_top", -1400) --upper limit
setting("number", "dm_bot", -25600) --lower limit

--should DMs spawn in DM Lair?
setting("bool", "dm_spawn", true) 

--Deep cave settings
setting("number", "deep_cave", -3000) -- upper limit


--says some information.
caverealms.info = true

--informs the players too
caverealms.inform_all = false--core.is_singleplayer()

--1:<a bit of information> 2:<acceptable amount of information> 3:<lots of text>
caverealms.max_spam = 2

--disallows growing a mushroom if it not every node would have a free place
caverealms.giant_restrict_area = false
