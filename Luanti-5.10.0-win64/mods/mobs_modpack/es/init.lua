--Extreme Survival created by Maikerumine edited by Biomeguy
-- Luanti mod: "Extreme Survival"
-- namespace: es
--https://github.com/maikerumine

es = {}

local path = core.get_modpath("es")

dofile(path .. "/deco_schems.lua")
dofile(path .. "/armor.lua")
dofile(path .. "/crafting.lua")
dofile(path .. "/nodes.lua")
dofile(path .. "/vault.lua")
dofile(path .. "/mapgen.lua")
dofile(path .. "/tools.lua")
dofile(path .. "/es_mobs_nice.lua")
dofile(path .. "/es_mobs_bad.lua")
dofile(path .. "/Old_mese_monster.lua")

-- Extreme Survival Stairs (in More Blocks)
if core.global_exists("stairsplus") then
stairsplus:register_all("es", "aikerum", "es:aikerumblock", {
	description = "Aikerum Block",
	tiles = {"aikerum_block.png"},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("es", "infinium", "es:infiniumblock", {
	description = "Infinium Block",
	tiles = {"infinium_block.png"},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("es", "magentium", "es:magentiumblock", {
	description = "Magentium Block",
	tiles = {"magentium_block.png"},
	light_source = 7,
	groups = {cracky=1, fall_damage_add_percent = -1000},
	sounds = default.node_sound_stone_defaults(),
})
end

stairs.register_stair_and_slab("aikerum", "es:aikerumblock",
	{cracky=1}, {"aikerum_block.png"},
	"Aikerum Block Stair", "Aikerum Block Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("infinium", "es:infiniumblock",
	{cracky=1}, {"infinium_block.png"},
	"Infinium Block Stair", "Infinium Block Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("magentium", "es:magentiumblock",
	{cracky=1, fall_damage_add_percent = -1000}, {"magentium_block.png"},
	"Magentium Block Stair", "Magentium Block Slab", default.node_sound_stone_defaults(), true)
