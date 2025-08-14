
--- Schematics

local S = {name = "default:stone", force_place = true}
local G = {name = "default:gold_block", force_place = true}
local O = {name = "default:obsidian", force_place = true}
local H = {name = "draconis:hot_obsidian", force_place = true}
local N = {name = "draconis:fire_wyvern_nest", force_place = true}

fire_lair = {size = {x = 10, y = 4, z = 10}, data = {
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,_,_,O,S,S,S,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,_,S,S,S,S,S,O,S,_,
_,_,_,_,O,S,S,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,O,S,S,S,S,S,S,S,S,
_,_,_,S,_,G,G,S,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

S,S,S,S,S,S,S,S,S,S,
_,_,S,G,_,_,_,G,S,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

S,S,S,S,S,H,S,S,O,S,
_,S,G,_,_,N,_,S,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

S,S,S,S,S,S,S,S,S,_,
_,_,S,_,G,_,_,S,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,S,S,S,S,S,S,S,S,_,
_,_,_,O,_,G,S,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,_,S,S,S,S,S,O,_,_,
_,_,_,_,S,S,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,_,_,S,S,S,S,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_}}

local I = {name = "default:ice", force_place = true}
local C = {name = "draconis:cold_ice", force_place = true}
N = {name = "draconis:ice_wyvern_nest", force_place = true}

ice_lair = {size = {x = 10, y = 4, z = 10}, data = {
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,_,_,I,S,S,S,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,_,S,S,S,S,S,I,S,_,
_,_,_,_,I,S,S,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,I,S,S,S,S,S,S,S,S,
_,_,_,S,_,G,G,S,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

S,S,S,S,S,S,S,S,S,S,
_,_,S,G,_,_,_,G,S,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

S,S,S,S,S,C,S,S,I,S,
_,S,G,_,_,N,_,S,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

S,S,S,S,S,S,S,S,S,_,
_,_,S,_,G,_,_,S,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,S,S,S,S,S,S,S,S,_,
_,_,_,I,_,G,S,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,_,S,S,S,S,S,I,_,_,
_,_,_,_,S,S,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,

_,_,_,S,S,S,S,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_}}

--- Nodes

core.register_node("draconis:spawn_fire_nest", {
	description = "spawn_fire_nest",
	tiles = {"draconis_temp_heat.png"},
	drop = "",
	on_timer = function(pos)
		core.remove_node(pos)
		core.place_schematic(pos, fire_lair, "random", {}, false)
	end,
	groups = {timer_check=1}
})

core.register_node("draconis:spawn_ice_nest", {
	description = "spawn_ice_nest",
	tiles = {"draconis_temp_cold.png"},
	drop = "",
	on_timer = function(pos)
		core.remove_node(pos)
		core.place_schematic(pos, ice_lair, "random", {}, false)
	end,
	groups = {timer_check=1}
})

--- Register Ores ---

core.register_ore({
	ore_type = "scatter",
	ore = "draconis:spawn_fire_nest",
	wherein = {"default:dirt_with_grass", "default:clay_dirt_with_savanna_grass"},
	clust_scarcity = 40*40*40,
	clust_num_ores = 1,
	clust_size = 1,
	y_max = 250,
	y_min = 80,
})

core.register_ore({
	ore_type = "scatter",
	ore = "draconis:spawn_ice_nest",
	wherein = {"default:dirt_with_snow", "default:dirt_with_coniferous_litter"},
	clust_scarcity = 40*40*40,
	clust_num_ores = 1,
	clust_size = 1,
	y_max = 250,
	y_min = 80,
})
