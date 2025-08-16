
-- Copyright (C) 2012 Vanessa Ezekowitz and celeron55, Perttu Ahola <celeron55@gmail.com>
-- Copyright (C) 2016 DOOmed <heiselong@gmx.com>

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

local vessels_shelf_formspec =
	"size[8,7;]"..
	"list[context;vessels;0,.3;8,2;]"..
	"list[current_player;main;0,2.85;8,1;]"..
	"list[current_player;main;0,4.08;8,3;8]"..
	"listring[context;vessels]"..
	"listring[current_player;main]"..
	default.get_hotbar_bg(0, 2.85)

core.register_node("mtools:shelf", {
	description = "Potion shelf",
	tiles = {"default_wood.png", "default_wood.png", "default_wood.png^vessels_shelf.png^vessels_shelf_overlay.png"},
	is_ground_content = false,
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec", vessels_shelf_formspec)
		local inv = meta:get_inventory()
		inv:set_size("vessels", 8*2)
	end,
	can_dig = function(pos,player)
		local inv = core.get_meta(pos):get_inventory()
		return inv:is_empty("vessels")
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		local to_stack = inv:get_stack(listname, index)
		if listname == "vessels" then
			if core.get_item_group(stack:get_name(), "potion") ~= 0 and to_stack:is_empty() then
				return 1
			else
				return 0
			end
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack(from_list, from_index)
		local to_stack = inv:get_stack(to_list, to_index)
		if to_list == "vessels" then
			if core.get_item_group(stack:get_name(), "potion") ~= 0 
					and to_stack:is_empty() then
				return 1
			else
				return 0
			end
		end
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		core.log("action", player:get_player_name()..
			   " moves stuff in vessels shelf at "..core.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name()..
			   " moves stuff to vessels shelf at "..core.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name()..
			   " takes stuff from vessels shelf at "..core.pos_to_string(pos))
	end,
})

-- Ingredients

core.register_node("mtools:jar_eyes", {
	description = "Jar of eyes",
	drawtype = "plantlike",
	tiles = {"witchcraft_jar_eyes.png"},
	inventory_image = "witchcraft_jar_eyes.png",
	wield_image = "witchcraft_jar_eyes.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("mtools:jar_slime", {
	description = "Jar of Slime",
	drawtype = "plantlike",
	tiles = {"witchcraft_jar_slime.png"},
	inventory_image = "witchcraft_jar_slime.png",
	wield_image = "witchcraft_jar_slime.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craftitem("mtools:herb", {
	description = "Herb",
	inventory_image = "witchcraft_herbs.png",
	groups = {flammable = 2}
})

core.register_craftitem("mtools:pentagram", {
	description = "Pentagram",
	inventory_image = "mtools_penta.png",
	groups = {flammable = 1}
})

-- Small bottle and contents

core.register_node("mtools:small_bottle", {
	description = "Small bottle",
	drawtype = "plantlike",
	tiles = {"witchcraft_small_bottle.png"},
	inventory_image = "witchcraft_small_bottle.png",
	wield_image = "witchcraft_small_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("mtools:tooth_bottle", {
	description = "Small bottle of tooth dust",
	drawtype = "plantlike",
	tiles = {"witchcraft_tooth_bottle.png"},
	inventory_image = "witchcraft_tooth_bottle.png",
	wield_image = "witchcraft_tooth_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("mtools:slime_bottle", {
	description = "Small bottle of slime",
	drawtype = "plantlike",
	tiles = {"witchcraft_slime_bottle.png"},
	inventory_image = "witchcraft_slime_bottle.png",
	wield_image = "witchcraft_slime_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("mtools:herb_bottle", {
	description = "Small bottle of herbs",
	drawtype = "plantlike",
	tiles = {"witchcraft_herb_bottle.png"},
	inventory_image = "witchcraft_herb_bottle.png",
	wield_image = "witchcraft_herb_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("mtools:mud_bottle", {
	description = "Small bottle of mud",
	drawtype = "plantlike",
	tiles = {"witchcraft_mud_bottle.png"},
	inventory_image = "witchcraft_mud_bottle.png",
	wield_image = "witchcraft_mud_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("mtools:bottle_medicine", {
	description = "Small bottle of Medicine",
	drawtype = "plantlike",
	tiles = {"witchcraft_medicine_bottle.png"},
	inventory_image = "witchcraft_medicine_bottle.png",
	wield_image = "witchcraft_medicine_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = core.item_eat(10, "mtools:small_bottle"),
})

-- Crafting

core.register_craft({
	output = "mtools:shelf",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:potion", "group:potion", "group:potion"},
		{"group:wood", "group:wood", "group:wood"}
	}
})

if core.get_modpath("ecology") then
core.register_craft({
	type = "shapeless",
	output = "mtools:jar_eyes",
	recipe = {"ecology:eye", "ecology:eye", "group:water_bucket", "vessels:glass_jar"},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

core.register_craft({
	output = "ecology:eye 2",
	recipe = {{"mtools:jar_eyes"}},
	replacements = {{"mtools:jar_eyes", "vessels:glass_jar"}}
})

core.register_craft({
	output = "mtools:herb 4",
	recipe = {{"ecology:bush"}}
})

core.register_craft({
	output = "mtools:herb 4",
	recipe = {{"ecology:weed"}}
})

core.register_craft({
	output = "mtools:herb 4",
	recipe = {{"ecology:tall_grass"}}
})
else
core.register_craft({
	output = "mtools:herb 4",
	recipe = {{"default:grass_1"}}
})
end

core.register_craft({
	output = 'mtools:pot',
	recipe = {
		{'default:copper_lump', '', 'default:copper_lump'},
		{'default:copper_lump', 'default:molten_rock', 'default:copper_lump'},
		{'', 'default:copper_lump', ''}
	}
})

core.register_craft({
	output = 'mtools:pot',
	recipe = {
		{'default:copper_lump', '', 'default:copper_lump'},
		{'default:copper_lump', 'ethereal:fire_dust', 'default:copper_lump'},
		{'', 'default:copper_lump', ''}
	}
})

core.register_craft({
	output = 'mtools:pot',
	recipe = {
		{'default:copper_lump', '', 'default:copper_lump'},
		{'default:copper_lump', 'mobs:lava_orb', 'default:copper_lump'},
		{'', 'default:copper_lump', ''}
	}
})

core.register_craft({
	output = 'mtools:pot',
	recipe = {
		{'default:copper_lump', '', 'default:copper_lump'},
		{'default:copper_lump', 'caverealms:fire_vine', 'default:copper_lump'},
		{'', 'default:copper_lump', ''}
	}
})

core.register_craft({
	output = 'mtools:portal_gram',
	recipe = {
		{'default:torch', 'default:clay', 'default:torch'}
	}
})

core.register_craft({
	output = 'mtools:small_bottle',
	recipe = {
		{'vessels:glass_fragments', 'vessels:glass_fragments', 'vessels:glass_fragments'}
	}
})

core.register_craft({
	output = 'mtools:pentablock',
	recipe = {
		{'mtools:pentagram'},
		{'default:molten_rock'}
	}
})

core.register_craft({
	output = 'mtools:bottle_medicine 2',
	recipe = {
		{'mtools:small_bottle', 'mtools:potion_red', 'mtools:small_bottle'}
	},
	replacements = {{"mtools:potion_red", "vessels:glass_bottle"}}
})

core.register_craft({
	output = 'mtools:bottle_medicine 5',
	recipe = {
		{'mtools:small_bottle', 'mtools:potion_red_2', 'mtools:small_bottle'},
		{'mtools:small_bottle', 'mtools:small_bottle', 'mtools:small_bottle'}
	},
	replacements = {{"mtools:potion_red_2", "vessels:glass_bottle"}}
})

core.register_craft({
	output = 'mtools:tooth_bottle',
	recipe = {
		{'mapgen:tooth'},
		{'farming:mortar_pestle'},
		{'mtools:small_bottle'}
	},
	replacements = {{"farming:mortar_pestle", "farming:mortar_pestle"}}
})

core.register_craft({
	output = 'mtools:mud_bottle 8',
	recipe = {
		{'mtools:small_bottle', 'mtools:small_bottle', 'mtools:small_bottle'},
		{'mtools:small_bottle', 'default:mud', 'mtools:small_bottle'},
		{'mtools:small_bottle', 'mtools:small_bottle', 'mtools:small_bottle'}
	}
})

core.register_craft({
	output = 'mtools:herb_bottle',
	recipe = {
		{'mtools:herb'},
		{'mtools:small_bottle'}
	}
})

core.register_craft({
	output = 'mtools:slime_bottle 2',
	recipe = {
		{'mtools:jar_slime'},
		{'mtools:small_bottle'},
		{'mtools:small_bottle'}
	},
	replacements = {{"mtools:jar_slime", "vessels:glass_jar"}}
})

core.register_craft({
	output = 'mtools:herb',
	recipe = {{'mtools:herb_bottle'}},
	replacements = {{"mtools:herb_bottle", "mtools:small_bottle"}}
})

core.register_craft({
	output = 'default:mud',
	recipe = {
		{'mtools:mud_bottle', 'mtools:mud_bottle', 'mtools:mud_bottle'},
		{'mtools:mud_bottle', '', 'mtools:mud_bottle'},
		{'mtools:mud_bottle', 'mtools:mud_bottle', 'mtools:mud_bottle'}
	},
	replacements = {
		{"mtools:mud_bottle", "mtools:small_bottle"},
		{"mtools:mud_bottle", "mtools:small_bottle"},
		{"mtools:mud_bottle", "mtools:small_bottle"},
		{"mtools:mud_bottle", "mtools:small_bottle"},
		{"mtools:mud_bottle", "mtools:small_bottle"},
		{"mtools:mud_bottle", "mtools:small_bottle"},
		{"mtools:mud_bottle", "mtools:small_bottle"},
		{"mtools:mud_bottle", "mtools:small_bottle"}
	}
})

core.register_craft({
	output = 'mtools:jar_slime',
	recipe = {
		{'mtools:slime_bottle'},
		{'mtools:slime_bottle'},
		{'vessels:glass_jar'}
	},
	replacements = {
		{"mtools:slime_bottle", "mtools:small_bottle"},
		{"mtools:slime_bottle", "mtools:small_bottle"}
	}
})

core.register_craft({-- the idea is to empty the potion on something, NOT throwing the container with it
	output = 'mtools:splash_yellwgrn',
	recipe = {
		{'vessels:glass_jar'},
		{'mtools:potion_yllwgrn'}
	},
	replacements = {{"mtools:potion_yllwgrn", "vessels:glass_bottle"}}
})

core.register_craft({
	output = 'mtools:splash_purple',
	recipe = {
		{'vessels:glass_jar'},
		{'mtools:potion_purple'}
	},
	replacements = {{"mtools:potion_purple", "vessels:glass_bottle"}}
})

core.register_craft({
	output = 'mtools:splash_magenta',
	recipe = {
		{'vessels:glass_jar'},
		{'mtools:potion_magenta'}
	},
	replacements = {{"mtools:potion_magenta", "vessels:glass_bottle"}}
})

core.register_craft({
	output = 'mtools:splash_cyan',
	recipe = {
		{'vessels:glass_jar'},
		{'mtools:potion_cyan'}
	},
	replacements = {{"mtools:potion_cyan", "vessels:glass_bottle"}}
})

core.register_craft({
	output = 'mtools:splash_red',
	recipe = {
		{'vessels:glass_jar'},
		{'mtools:potion_red'}
	},
	replacements = {{"mtools:potion_red", "vessels:glass_bottle"}}
})

core.register_craft({
	output = 'mtools:splash_green',
	recipe = {
		{'vessels:glass_jar'},
		{'mtools:potion_green'}
	},
	replacements = {{"mtools:potion_green", "vessels:glass_bottle"}}
})

core.register_craft({
	output = 'mtools:splash_grey',
	recipe = {
		{'vessels:glass_jar'},
		{'mtools:potion_grey'}
	},
	replacements = {{"mtools:potion_grey", "vessels:glass_bottle"}}
})

core.register_craft({
	output = 'mtools:splash_brown',
	recipe = {
		{'vessels:glass_jar'},
		{'mtools:potion_brown'}
	},
	replacements = {{"mtools:potion_brown", "vessels:glass_bottle"}}
})

core.register_craft({
	output = 'mtools:splash_ggreen',
	recipe = {
		{'vessels:glass_jar'},
		{'mtools:potion_ggreen'}
	},
	replacements = {{"mtools:potion_ggreen", "vessels:glass_bottle"}}
})


-- Empty pot

core.register_node("mtools:pot", {
	description = "Potion Pot",
	tiles = {"witchcraft_pot_top2.png", "witchcraft_pot_bottom2.png", "witchcraft_pot_side2.png"},
	drawtype = "nodebox",
	paramtype = "light",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, -5/16, .5},
			{-.5, -.5, -.5, .5, .5, -5/16},
			{-.5, -.5, -.5, -5/16, .5, .5},
			{-.5, -.5, 5/16, .5, .5, .5},
			{5/16, -.5, -.5, .5, .5, .5}
		}
	},
	on_rightclick = function(pos, node, clicker, item)
		local wielded = item:get_name()
		local meta = core.get_meta(pos)
		if wielded == "farming:boiling_water" or wielded == "farming:boiling_fresh_water" then
			core.set_node(pos, {name= "mtools:pot_blue"})
			item:replace("bucket:bucket_empty")
		elseif wielded == "vessels:glass_jar" and item:get_count() == 1 and meta:get_string("has_slime") == "true" then
			item:replace("mtools:jar_slime")
			meta:set_string("has_slime", "")
		end
		return item
	end,
	groups = {cracky=1, falling_node=1, oddly_breakable_by_hand=1}
})

local lp = core.settings:get_bool("limit_particles")
local potion = {}

-- Brew pots
potion.pots = {
	{"blue"}, {"blue2"}, {"green"}, {"green2"}, {"yellow"}, {"ggreen"}, {"cyan"}, {"gcyan"}, {"orange"}, {"yllwgrn"}, {"gold"},
	{"brown"}, {"redbrown"}, {"gred"}, {"red"}, {"magenta"}, {"gviolet"}, {"purple"}, {"pinkishred"}, {"silver"}, {"grey"}, {"aqua"}
}

-- Brew recipes
potion.brew = {
	{"blue2", "ecology:mandragora", "flowers:waterlily", "default:bulrush_2"},
	{"green", "ecology:mandragora", "ecology:gliophorus_viridis", "ecology:laurel"},
	{"green2", "default:aspen_sapling", "ecology:mushroom_shiitake", "default:copper_ingot", "default:stick", nil, "default:copper_ingot"},
	{"yellow", "ecology:mandragora", "ecology:grass", "ecology:star_anise"},
	{"ggreen", "ecology:creeper", "ecology:long_grass_dark", "ecology:bush"},
	{"cyan", "mapgen:crystal_shard", "ecology:lucky_club", "ecology:pale_green_berries"},
	{"gcyan", "default:ocealite_crystal", "ecology:sproutling_grass", "default:seagrass_green", "default:ocealite_crystal"},
	{"orange", "ecology:mandragora", "ecology:curlyfruit", "mtools:herb"},
	{"yllwgrn", "ecology:mandragora", "tnt:gunpowder", "mtools:herb"},
	{"gold", "ecology:mandragora", "ecology:bigmush", "ecology:golden_grass_S5"},
	{"brown", "ecology:groundfung", "flowers:mushroom_red", "mtools:jar_slime", nil, nil, "vessels:glass_jar"},
	{"redbrown", "ecology:anemone", "mapgen:ice_shard", "mtools:jar_eyes", nil, "", "vessels:glass_jar"},
	{"gred", "ecology:mushroom_red", "mtools:mud_bottle", "mtools:tooth_bottle", nil, "mtools:small_bottle", "mtools:small_bottle"},
	{"red", "default:cactus_fruit", "default:apple", "default:iron_lump", "", nil, "default:iron_lump"},
	{"magenta", "mtools:magic_powder", "ecology:wildberry", "ecology:aloe_vera", "fabric:sheet_orange"},
	{"gviolet", "mtools:magic_powder", "mtools:saffron", "ecology:winter_lavender", "fabric:sheet_orange", "default:paper"},
	{"purple", "mtools:magic_powder", "mtools:slime_bottle", "flowers:purple_allium", "fabric:sheet_orange", "mtools:small_bottle"},
	{"pinkishred", "mtools:magic_powder", "flowers:mushroom_brown", "mtools:potion_red", "fabric:sheet_orange", nil, "vessels:glass_bottle"},
	{"silver", "ecology:mandragora", "ecology:arctic_carrot_root", "mtools:potion_cyan", nil, nil, "vessels:glass_bottle"},
	{"grey", "ecology:mandragora", "mtools:black_pearl", "mtools:jar_eyes", nil, "mtools:black_pearl", "vessels:glass_jar"},
	{"aqua", "ecology:swamp_weed", "ecology:aqua_mush", "mtools:triforce", nil, nil, "mtools:triforce"}
}

for _, row in ipairs(potion.pots) do
local color = row[1]
core.register_node("mtools:pot_"..color, {
	tiles = {{name = "mtools_pot_"..color..".png", animation = {type="vertical_frames", length=3.}},
		"witchcraft_pot_bottom2.png", "witchcraft_pot_side2.png"},
	is_ground_content = false,
	collision_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, -5/16, .5},
			{-.5, -.5, -.5, .5, .5, -5/16},
			{-.5, -.5, -.5, -5/16, .5, .5},
			{-.5, -.5, 5/16, .5, .5, .5},
			{5/16, -.5, -.5, .5, .5, .5}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, -5/16, .5},
			{-.5, -.5, -.5, .5, .5, -5/16},
			{-.5, -.5, -.5, -5/16, .5, .5},
			{-.5, -.5, 5/16, .5, .5, .5},
			{5/16, -.5, -.5, .5, .5, .5}
		}
	},
	damage_per_second = 1,
	drop = 'mtools:pot',
	on_construct = function(pos)
		core.get_node_timer(pos):start(0)
	end,
	on_timer = function(pos, elapsed)
		local meta = core.get_meta(pos)
	if meta:get_string("mese_crystal") == "true" then
		if meta:get_int("delay") < 3 then
	meta:set_int("delay", meta:get_int("delay")+1)
		else
	meta:set_string("level_2", "true")
	meta:set_string("mese_crystal", "")
	core.add_item(pos, "default:mese_crystal")
		end
	end
		local nn = core.get_node(pos).name
	if nn == "mtools:pot_blue" then
for _, row in ipairs(potion.brew) do
local newcolor, ingred1, ingred2, ingred3, retrn1, retrn2, retrn3 =
	  row[1], row[2],   row[3],  row[4],  row[5],  row[6], row[7]
if newcolor == nil then
	newcolor, ingred1, ingred2, ingred3 = "", "", "", ""
end
	if newcolor ~= "" and ingred1 ~= "" and meta:get_string("ingred1") == ingred1 and
	ingred2 ~= "" and meta:get_string("ingred2") == ingred2 and ingred3 ~= "" and meta:get_string("ingred3") == ingred3 then
		if meta:get_int("delay") < 5 then
	meta:set_int("delay", meta:get_int("delay")+1)
		else
	core.set_node(pos, {name= "mtools:pot_"..newcolor})
	local ditem = retrn1 or "farming:spent_biomasse"
if ditem ~= "" then
	core.add_item(pos, ditem)
end
	ditem = retrn2 or "farming:spent_biomasse"
if ditem ~= "" then
	core.add_item(pos, ditem)
end
	ditem = retrn3 or "farming:spent_biomasse"
if ditem ~= "" then
	core.add_item(pos, ditem)
end
		end
	end
end
	end
if lp ~= true then
		local lastdef1, lastdef2, lastdef3, lastdef4 = 2, 3, "witchcraft_bubbles.png", 0
	if nn == "mtools:pot_ggreen" or nn == "mtools:pot_gred" or nn == "mtools:pot_gviolet" or nn == "mtools:pot_gcyan" then
		lastdef1, lastdef2, lastdef3, lastdef4 = 1, 2, "mtools_light_over.png", 7
	elseif nn == "mtools:pot_gold" or nn == "mtools:pot_silver" or nn == "mtools:pot_aqua" then
		lastdef1, lastdef2, lastdef3, lastdef4 = 1, 3, "mtools_white_bubbles.png", 0
	elseif nn == "mtools:pot_green" or nn == "mtools:pot_green2" then
		lastdef1, lastdef2, lastdef3, lastdef4 = 1, 1.5, "witchcraft_bubble.png", 0
	elseif nn == "mtools:pot_magenta" then
		lastdef1, lastdef2, lastdef3, lastdef4 = 2, 3, "witchcraft_bubbles_pink.png", 0
	elseif nn == "mtools:pot_purple" then
		lastdef1, lastdef2, lastdef3, lastdef4 = 5, 7, "witchcraft_smoke.png^[colorize:magenta:50", 0
	elseif nn == "mtools:pot_pinkishred" then
		lastdef1, lastdef2, lastdef3, lastdef4 = 2, 3, "witchcraft_symbol.png", 0
	elseif nn == "mtools:pot_orange" then
		lastdef1, lastdef2, lastdef3, lastdef4 = 2, 3, "mtools_flame.png", 13
	end
	core.add_particlespawner({
		amount = 2,
		time = 1,
		minpos = {x=pos.x-.1, y=pos.y+.3, z=pos.z-.1},
		maxpos = {x=pos.x+.1, y=pos.y+.4, z=pos.z+.1},
		minvel = {x=0, y=.5, z=0},
		maxvel = {x=0, y=.6, z=0},
		minacc = {x=0, y=.2, z=0},
		maxacc = {x=0, y=.3, z=0},
		exptime = {min = 1, max = 1.5},
		minsize = lastdef1,
		maxsize = lastdef2,
		texture = lastdef3,
		glow = lastdef4 })
end
		core.get_node_timer(pos):start(1)
	end,
	on_rightclick = function(pos, node, clicker, item)
		local wielded = item:get_name()
		local meta = core.get_meta(pos)
		if wielded == "" then return end
		if wielded == "vessels:glass_bottle" and item:get_count() >= 4 then
	local level = ""
	if meta:get_string("level_2") == "true" then
		level = "_2"
	end
	local inv = clicker:get_inventory()
for i = 1, 4 do
	item:take_item()
	if item:is_empty() then
		item:add_item("mtools:potion_"..color..level)
	else
		if inv and inv:room_for_item("main", {name="mtools:potion_"..color..level}) then
	inv:add_item("main", "mtools:potion_"..color..level.." 1")
		else
	core.add_item({x=pos.x, y=pos.y+1, z=pos.z}, "mtools:potion_"..color..level)
		end
	end
end
	core.set_node(pos, {name= "mtools:pot"})
	meta:set_string("has_slime", "true")
		else
	--	if core.get_item_group(wielded, "potion") ~= 0 then
	local nn = core.get_node(pos).name
if meta:get_string("level_2") ~= "true" and meta:get_string("mese_crystal") ~= "true" then
	if nn == "mtools:pot_blue" then
for _, row in ipairs(potion.brew) do
local newcolor, ingred1, ingred2, ingred3 =
	  row[1], row[2],   row[3],  row[4]
if newcolor == nil then
	newcolor, ingred1, ingred2, ingred3 = "", "", "", ""
end
	if wielded == ingred1 and meta:get_string("ingred1") == "" then
		meta:set_string("ingred1", ingred1)
		item:take_item()
	elseif wielded == ingred2 and meta:get_string("ingred2") == "" and meta:get_string("ingred1") == ingred1 then
		meta:set_string("ingred2", ingred2)
		item:take_item()
	elseif wielded == ingred3 and meta:get_string("ingred3") == "" and meta:get_string("ingred2") == ingred2 then
		meta:set_string("ingred3", ingred3)
		item:take_item()
	end
end
	end
	if wielded == "default:mese_crystal" and nn ~= "mtools:pot_gviolet" and nn ~= "mtools:pot_gred" and
	nn ~= "mtools:pot_blue" and nn ~= "mtools:pot_green" and nn ~= "mtools:pot_gcyan" and nn ~= "mtools:pot_ggreen" then
		meta:set_string("mese_crystal", "true")
		item:take_item()
	end
end
		end
		return item
	end,
	groups = {cracky=1, falling_node=1, oddly_breakable_by_hand=1, timer_check=1}
})
end

-- Splash effects

core.register_entity("mtools:tnt_splash", {
	initial_properties = {
visual = "sprite",
textures = {"mtools_potion_splash.png^[colorize:#bf5d"},
physical = false,
collisionbox = {0,0,0,0,0,0},
	},
	age = 0,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 3 then self.object:remove() return end

		local pos = self.object:get_pos()
		for k, obj in pairs(core.get_objects_inside_radius(pos, 2)) do
			if obj:get_luaentity() ~= nil then
	if obj:get_luaentity().name ~= "mtools:tnt_splash" and obj:get_luaentity().name ~= "__builtin:item" then
		obj:punch(self.object, 1.0, {
			full_punch_interval=1.0,
			damage_groups={fleshy=3},
		}, nil)

	core.add_particlespawner({
		amount = 15,
		time = 1.5,
		minpos = {x=pos.x-2, y=pos.y+1, z=pos.z-2},
		maxpos = {x=pos.x+2, y=pos.y+1, z=pos.z+2},
		exptime = {min = .4, max = .6},
		minsize = 5,
		maxsize = 15,
		texture = "mtools_boomeffect.png",
	animation = {type = "vertical_frames", aspect_w = 20, aspect_h = 20, length = -1},
		glow = 9
	})
	self.object:remove()
	tnt.boom(pos, {damage_radius=5,radius=3,ignore_protection=false})
	return
	end
			end
		end
		local n = core.get_node(pos).name
		if n ~= "mtools:tnt_splash" and n ~= "air" then
	core.add_particlespawner({
		amount = 15,
		time = 1.5,
		minpos = {x=pos.x-2, y=pos.y+1, z=pos.z-2},
		maxpos = {x=pos.x+2, y=pos.y+1, z=pos.z+2},
		exptime = {min = .4, max = .6},
		minsize = 5,
		maxsize = 15,
		texture = "mtools_boomeffect.png",
	animation = {type = "vertical_frames", aspect_w = 20, aspect_h = 20, length = -1},
		glow = 9
	})
	self.object:remove()
	tnt.boom(pos, {damage_radius=5,radius=3,ignore_protection=false})
		end
	end,
})

core.register_entity("mtools:death_splash", {
	initial_properties = {
visual = "sprite",
textures = {"mtools_potion_splash.png^[colorize:#777b"},
physical = false,
collisionbox = {0,0,0,0,0,0},
	},
	age = 0,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 3 then self.object:remove() return end

		local pos = self.object:get_pos()
		for k, obj in pairs(core.get_objects_inside_radius(pos, 2)) do
			if obj:get_luaentity() ~= nil then
	if obj:get_luaentity().name ~= "mtools:death_splash" and obj:get_luaentity().name ~= "__builtin:item" then
		obj:punch(self.object, 1., {
			full_punch_interval=1.,
			damage_groups={fleshy=50},
		}, nil)
	self.object:remove()
	return
	end
			end
		end
		local n = core.get_node(pos).name
		if n ~= "mtools:death_splash" and n ~= "air" then
	core.sound_play("default_break_glass", {pos = pos, gain = 1., max_hear_distance = 20})
			self.object:remove()
		elseif n =="default:dirt_with_grass" or n =="default:dirt_with_savanna_grass" then
			self.object:remove()
		end
	end,
})

core.register_entity("mtools:heal_splash", {
	initial_properties = {
visual = "sprite",
textures = {"mtools_potion_splash.png^[colorize:#f12c"},
physical = false,
collisionbox = {0,0,0,0,0,0},
	},
	age = 0,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 3 then self.object:remove() return end

		local pos = self.object:get_pos()
		for k, obj in pairs(core.get_objects_inside_radius(pos, 2)) do
			if obj:get_luaentity() ~= nil then
	if obj:get_luaentity().name ~= "mtools:heal_splash" and obj:get_luaentity().name ~= "__builtin:item" then
		obj:punch(self.object, 1., {
			full_punch_interval=1.,
			damage_groups={fleshy=-20},
		}, nil)
	self.object:remove()
	return
	end
			end
		end
		local n = core.get_node(pos).name
		if n ~= "mtools:heal_splash" and n ~= "air" then
	core.sound_play("default_break_glass", {pos = pos, gain = 1., max_hear_distance = 20})
			self.object:remove()
		elseif n =="default:dirt_with_grass" or n =="default:dirt_with_savanna_grass" then
			self.object:remove()
		end
	end,
})

core.register_entity("mtools:antigrav_splash", {
	initial_properties = {
visual = "sprite",
textures = {"mtools_potion_splash.png^[colorize:#3bdb"},
physical = false,
collisionbox = {0,0,0,0,0,0},
	},
	age = 0,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 3 then self.object:remove() return end

		local pos = self.object:get_pos()
		for k, obj in pairs(core.get_objects_inside_radius(pos, 2)) do
			if obj:get_luaentity() ~= nil then
	if obj:get_luaentity().name ~= "mtools:antigrav_splash" and obj:get_luaentity().name ~= "__builtin:item" then
		local vel = obj:get_velocity()
		obj:set_velocity({x=vel.x*20, y=vel.y+20, z=vel.z*20})
	self.object:remove()
	return
	end
			end
		end
		local n = core.get_node(pos).name
		if n ~= "mtools:antigrav_splash" and n ~= "air" then
	core.sound_play("default_break_glass", {pos = pos, gain = 1., max_hear_distance = 20})
			self.object:remove()
		elseif n =="default:dirt_with_grass" or n =="default:dirt_with_savanna_grass" then
			self.object:remove()
		end
	end,
})

core.register_entity("mtools:fast_splash", {
	initial_properties = {
visual = "sprite",
textures = {"mtools_potion_splash.png^[colorize:#f3cc"},
physical = false,
collisionbox = {0,0,0,0,0,0},
	},
	age = 0,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 3 then self.object:remove() return end

		local pos = self.object:get_pos()
		for k, obj in pairs(core.get_objects_inside_radius(pos, 2)) do
			if obj:get_luaentity() ~= nil then
	if obj:get_luaentity().name ~= "mtools:fast_splash" and obj:get_luaentity().name ~= "__builtin:item" then
		local vel = obj:get_velocity()
		obj:set_velocity({x=vel.x*24, y=vel.y*1, z=vel.z*24})
	self.object:remove()
	return
	end
			end
		end
		local n = core.get_node(pos).name
		if n ~= "mtools:fast_splash" and n ~= "air" then
	core.sound_play("default_break_glass", {pos = pos, gain = 1., max_hear_distance = 20})
			self.object:remove()
		elseif n =="default:dirt_with_grass" or n =="default:dirt_with_savanna_grass" then
			self.object:remove()
		end
	end,
})

core.register_entity("mtools:jump_splash", {
	initial_properties = {
visual = "sprite",
textures = {"mtools_potion_splash.png^[colorize:#1c5b"},
physical = false,
collisionbox = {0,0,0,0,0,0},
	},
	age = 0,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 3 then self.object:remove() return end

		local pos = self.object:get_pos()
		for k, obj in pairs(core.get_objects_inside_radius(pos, 2)) do
			if obj:get_luaentity() ~= nil then
	if obj:get_luaentity().name ~= "mtools:jump_splash" and obj:get_luaentity().name ~= "__builtin:item" then
		local vel = obj:get_velocity()
		obj:set_velocity({x=vel.x*1, y=(vel.y+2)*3, z=vel.z*1})
	self.object:remove()
	return
	end
			end
		end
		local n = core.get_node(pos).name
		if n ~= "mtools:jump_splash" and n ~= "air" then
	core.sound_play("default_break_glass", {pos = pos, gain = 1., max_hear_distance = 20})
			self.object:remove()
		elseif n =="default:dirt_with_grass" or n =="default:dirt_with_savanna_grass" then
			self.object:remove()
		end
	end,
})

core.register_entity("mtools:murky_splash", {
	initial_properties = {
visual = "sprite",
textures = {"mtools_potion_splash.png^[colorize:#a63b"},
physical = false,
collisionbox = {0,0,0,0,0,0},
	},
	age = 0,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 3 then self.object:remove() return end

		local pos = self.object:get_pos()
		for k, obj in pairs(core.get_objects_inside_radius(pos, 2)) do
			if obj:get_luaentity() ~= nil then
	if obj:get_luaentity().name ~= "mtools:murky_splash" and obj:get_luaentity().name ~= "__builtin:item" then
		obj:punch(self.object, 1., {
			full_punch_interval=1.,
			damage_groups={fleshy=6},
		}, nil)
	self.object:remove()
	return
	end
			end
		end
		local n = core.get_node(pos).name
		if n ~= "mtools:murky_splash" and n ~= "air" then
	core.sound_play("default_break_glass", {pos = pos, gain = 1., max_hear_distance = 20})
			self.object:remove()
		elseif n =="default:dirt_with_grass" or n =="default:dirt_with_savanna_grass" then
			self.object:remove()
		end
	end,
})

core.register_entity("mtools:shadow_splash", {
	initial_properties = {
visual = "sprite",
textures = {"mtools_potion_splash.png^[colorize:#7f4d"},
physical = true,
collisionbox = {-.1, -.1, -.1, .1, .1, .1},
	},
	age = 0,
	on_activate = function(self)
		core.add_particlespawner({
			amount = 200,
			time = 0,
			pos = {min = {x=-3, y=-3, z=-3}, max = {x=3, y=3, z=3}},
			minacc = {x=-.1,y=.2,z=-.1},
			maxacc = {x=.1,y=.2,z=.1},
			attached = self.object,
			exptime = {min = 5, max = 10},
			minsize = 10,
			maxsize = 20,
			texture = "witchcraft_pot_bottom.png^[colorize:black:200"})
	end,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 5 then self.object:remove() return end

	end,
})

core.register_entity("mtools:smoke_splash", {
	initial_properties = {
visual = "sprite",
textures = {"mtools_potion_splash.png^[colorize:#c3fc"},
physical = true,
collisionbox = {-.1, -.1, -.1, .1, .1, .1},
	},
	age = 0,
	on_activate = function(self)
		core.add_particlespawner({
			amount = 50,
			time = 0,
			pos = {min = {x=-1, y=-1, z=-1}, max = {x=1, y=1, z=1}},
			minvel = {x=-1, y=0, z=-1},
			maxvel = {x=1, y=0, z=1},
			minacc = {x=-.5,y=2,z=-.5},
			maxacc = {x=.5,y=3,z=.5},
			attached = self.object,
			exptime = {min = 2, max = 4},
			minsize = 10,
			maxsize = 20,
			texture = "witchcraft_smoke.png^[colorize:magenta:50"})
	end,
	on_step = function(self, dtime)
		self.age = self.age+dtime
	if self.age > 10 then self.object:remove() return end

		local velo = self.object:get_velocity()
		if velo ~= nil then
	self.object:set_velocity({x=velo.x*.9, y=velo.y, z=velo.z*.9})
		end
	end,
})

-- Player effects

playereffects.register_effect_type("potion_speed_lv1", "High speed", nil, {"speed"},
	function(player)
		player:set_physics_override({speed = 2})
	end,
	
	function(effect, player)
		player:set_physics_override({speed = 1})
	end
)

playereffects.register_effect_type("potion_speed_lv2", "High speed", nil, {"speed"},
	function(player)
		player:set_physics_override({speed = 2.5})
	end,
	
	function(effect, player)
		player:set_physics_override({speed = 1})
	end
)

playereffects.register_effect_type("potion_jump", "High Jump", nil, {"jump"},
	function(player)
		player:set_physics_override({jump = 1.5, gravity = .8})
	end,
	
	function(effect, player)
		player:set_physics_override({jump = 1, gravity = 1})
	end
)

playereffects.register_effect_type("potion_antigrav", "Light weight", nil, {"gravity"},
	function(player)
		player:set_physics_override({gravity = .1})
	end,
	
	function(effect, player)
		player:set_physics_override({gravity = 1})
	end
)

playereffects.register_effect_type("potion_slow_lv1", "Low speed", nil, {"speed"},
	function(player)
		player:set_physics_override({speed = .5})
	end,
	
	function(effect, player)
		player:set_physics_override({speed = 1})
	end
)

playereffects.register_effect_type("potion_slow_lv2", "Low speed", nil, {"speed"},
	function(player)
		player:set_physics_override({speed = .4})
	end,
	
	function(effect, player)
		player:set_physics_override({speed = 1})
	end
)

playereffects.register_effect_type("potion_swim_lv1", "Fast Swim", nil, {"swim"},
	function(player)
		player:set_physics_override({speed = 3})
	end,
	
	function(effect, player)
		player:set_physics_override({speed = 1})
	end
)

playereffects.register_effect_type("potion_swim_lv2", "Dive", nil, {"swim"},
	function(player)
		player:set_physics_override({speed = 3, gravity = 4})
	end,
	
	function(effect, player)
		player:set_physics_override({speed = 1, gravity = 1})
	end
)

playereffects.register_effect_type("fly_o_noel", "Flight O'Noel", nil, {"fly"},
	function(player)
	end,
	function(effect, player)
		local privs = core.get_player_privs(effect.playername)
		privs.fly = nil
		core.set_player_privs(effect.playername, privs)
	end
)

playereffects.register_effect_type("regen_lv1", "Regeneration 1", nil, {"health"},
	function(player)
		player:set_hp(player:get_hp()+2)
	end,
	nil, nil, nil, 1
)

playereffects.register_effect_type("regen_lv2", "Regeneration 2", nil, {"health"},
	function(player)
		player:set_hp(player:get_hp()+10)
	end,
	nil, nil, nil, 1
)

-- Splash potions

core.register_node("mtools:splash_purple", {
	description = "Smokey Splash Potion",
	drawtype = "plantlike",
	tiles = {"mtools_splash_purple.png"},
	inventory_image = "mtools_splash_purple.png",
	wield_image = "mtools_splash_purple.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user, pointd)
	local pos = user:get_pos()
	local dir = user:get_look_dir()
	local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+2+dir.y,z=pos.z+dir.z}, "mtools:smoke_splash")
	obj:set_velocity({x=dir.x*9,y=dir.y*3.5,z=dir.z*9})
	obj:set_acceleration({x=0,y=-9.8,z=0})

		if user then
	return core.do_item_eat(0, "vessels:glass_jar", item, user)
		end
	end,
})

core.register_node("mtools:splash_red", {
	description = "Healthy Splash Potion",
	drawtype = "plantlike",
	tiles = {"mtools_splash_red.png"},
	inventory_image = "mtools_splash_red.png",
	wield_image = "mtools_splash_red.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user, pointd)
	local pos = user:get_pos()
	local dir = user:get_look_dir()
	local obj = core.add_entity({x=pos.x+dir.x*2,y=pos.y+2+dir.y,z=pos.z+dir.z*2}, "mtools:heal_splash")
	obj:set_velocity({x=dir.x*9,y=dir.y*3.5,z=dir.z*9})
	obj:set_acceleration({x=0,y=-9,z=0})

		if user then
	return core.do_item_eat(0, "vessels:glass_jar", item, user)
		end
	end,
})

core.register_node("mtools:splash_green", {
	description = "Volatile Splash Potion",
	drawtype = "plantlike",
	tiles = {"mtools_splash_green.png"},
	inventory_image = "mtools_splash_green.png",
	wield_image = "mtools_splash_green.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user, pointd)
	local pos = user:get_pos()
	local dir = user:get_look_dir()
	local obj = core.add_entity({x=pos.x+dir.x*2,y=pos.y+2+dir.y,z=pos.z+dir.z*2}, "mtools:jump_splash")
	obj:set_velocity({x=dir.x*9,y=dir.y*3.5,z=dir.z*9})
	obj:set_acceleration({x=0,y=-9,z=0})

		if user then
	return core.do_item_eat(0, "vessels:glass_jar", item, user)
		end
	end,
})

core.register_node("mtools:splash_cyan", {
	description = "Light Splash Potion",
	drawtype = "plantlike",
	tiles = {"mtools_splash_cyan.png"},
	inventory_image = "mtools_splash_cyan.png",
	wield_image = "mtools_splash_cyan.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user, pointd)
	local pos = user:get_pos()
	local dir = user:get_look_dir()
	local obj = core.add_entity({x=pos.x+dir.x*2,y=pos.y+2+dir.y,z=pos.z+dir.z*2}, "mtools:antigrav_splash")
	obj:set_velocity({x=dir.x*9,y=dir.y*3.5,z=dir.z*9})
	obj:set_acceleration({x=0,y=-9,z=0})

		if user then
	return core.do_item_eat(0, "vessels:glass_jar", item, user)
		end
	end,
})

core.register_node("mtools:splash_magenta", {
	description = "Fast Splash Potion",
	drawtype = "plantlike",
	tiles = {"mtools_splash_magenta.png"},
	inventory_image = "mtools_splash_magenta.png",
	wield_image = "mtools_splash_magenta.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user, pointd)
	local pos = user:get_pos()
	local dir = user:get_look_dir()
	local obj = core.add_entity({x=pos.x+dir.x*2,y=pos.y+2+dir.y,z=pos.z+dir.z*2}, "mtools:fast_splash")
	obj:set_velocity({x=dir.x*13,y=dir.y*2.5,z=dir.z*13})
	obj:set_acceleration({x=0,y=-9,z=0})

		if user then
	return core.do_item_eat(0, "vessels:glass_jar", item, user)
		end
	end,
})

core.register_node("mtools:splash_brown", {
	description = "Murky Splash Potion",
	drawtype = "plantlike",
	tiles = {"mtools_splash_brown.png"},
	inventory_image = "mtools_splash_brown.png",
	wield_image = "mtools_splash_brown.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user, pointd)
	local pos = user:get_pos()
	local dir = user:get_look_dir()
	local obj = core.add_entity({x=pos.x+dir.x*2,y=pos.y+2+dir.y,z=pos.z+dir.z*2}, "mtools:murky_splash")
	obj:set_velocity({x=dir.x*9,y=dir.y*3.5,z=dir.z*9})
	obj:set_acceleration({x=0,y=-9,z=0})

		if user then
	return core.do_item_eat(0, "vessels:glass_jar", item, user)
		end
	end,
})

core.register_node("mtools:splash_grey", {
	description = "Death Splash Potion",
	drawtype = "plantlike",
	tiles = {"mtools_splash_grey.png"},
	inventory_image = "mtools_splash_grey.png",
	wield_image = "mtools_splash_grey.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user, pointd)
	local pos = user:get_pos()
	local dir = user:get_look_dir()
	local obj = core.add_entity({x=pos.x+dir.x*2,y=pos.y+2+dir.y,z=pos.z+dir.z*2}, "mtools:death_splash")
	obj:set_velocity({x=dir.x*9,y=dir.y*3.5,z=dir.z*9})
	obj:set_acceleration({x=0,y=-9,z=0})

		if user then
	return core.do_item_eat(0, "vessels:glass_jar", item, user)
		end
	end,
})

core.register_node("mtools:splash_ggreen", {
	description = "Darkness Splash Potion",
	drawtype = "plantlike",
	tiles = {"mtools_splash_ggreen.png"},
	inventory_image = "mtools_splash_ggreen.png",
	wield_image = "mtools_splash_ggreen.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user, pointd)
	local pos = user:get_pos()
	local dir = user:get_look_dir()
	local obj = core.add_entity({x=pos.x+dir.x*1.5,y=pos.y+2+dir.y,z=pos.z+dir.z*1.5}, "mtools:shadow_splash")
	obj:set_velocity({x=dir.x*6,y=dir.y*3.5,z=dir.z*6})
	obj:set_acceleration({x=0,y=-9.8,z=0})

		if user then
	return core.do_item_eat(0, "vessels:glass_jar", item, user)
		end
	end,
})

core.register_node("mtools:splash_yellwgrn", {
	description = "Dodgy Splash Potion",
	drawtype = "plantlike",
	tiles = {"mtools_splash_yellgrn.png"},
	inventory_image = "mtools_splash_yellgrn.png",
	wield_image = "mtools_splash_yellgrn.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user, pointd)
	local pos = user:get_pos()
	local dir = user:get_look_dir()
	local obj = core.add_entity({x=pos.x+dir.x*1.5,y=pos.y+2+dir.y,z=pos.z+dir.z*1.5}, "mtools:tnt_splash")
	obj:set_velocity({x=dir.x*12,y=dir.y*15,z=dir.z*12})
	obj:set_acceleration({x=0,y=-9.8,z=0})

		if user then
	return core.do_item_eat(0, "vessels:glass_jar", item, user)
		end
	end,
})

-- Potions
local pover = "^mtools_potion_bottle.png"

core.register_node("mtools:potion_orange", {
	description = "Dragon Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_orange.png"..pover},
	inventory_image = "mtools_potion_orange.png"..pover,
	wield_image = "mtools_potion_orange.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x=pos.x+dir.x*1.5,y=pos.y+1.5+dir.y,z=pos.z+dir.z*1.5}, "mtools:fireball")
		obj:set_velocity({x=dir.x*7,y=dir.y*7,z=dir.z*7})
		obj:get_luaentity().damage = 7

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_orange_2", {
	description = "Dragon Potion lv2",
	drawtype = "plantlike",
	tiles = {"mtools_potion_orange.png^[colorize:black:50"..pover},
	inventory_image = "mtools_potion_orange.png^[colorize:black:50"..pover,
	wield_image = "mtools_potion_orange.png^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x=pos.x+dir.x*1.5,y=pos.y+1.5+dir.y,z=pos.z+dir.z*1.5}, "mtools:fireball")
		obj:set_velocity({x=dir.x*12,y=dir.y*12,z=dir.z*12})
		obj:get_luaentity().damage = 12
	core.add_particlespawner({
		amount = 10,
		time = .3,
		minpos = {x=pos.x-.3, y=pos.y+1.5, z=pos.z-.3},
		maxpos = {x=pos.x+.3, y=pos.y+1.5, z=pos.z+.3},
		minvel = {x=dir.x*3,y=dir.y*3,z=dir.z*3},
		maxvel = {x=dir.x*3,y=dir.y*3,z=dir.z*3},
		minacc = {x=-.5,y=-.5,z=-.5},
		maxacc = {x=.5,y=.5,z=.5},
		exptime = {min = 1, max = 2},
		minsize = 1,
		maxsize = 2,
		collisiondetection = true,
		texture = "mtools_flame.png",
		glow = 13 })

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_red", {
	description = "Tasty Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_red.png"..pover},
	inventory_image = "mtools_potion_red.png"..pover,
	wield_image = "mtools_potion_red.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = core.item_eat(20, "vessels:glass_bottle"),
})

core.register_node("mtools:potion_red_2", {
	description = "Tasty Potion lv2",
	drawtype = "plantlike",
	tiles = {"mtools_potion_red.png^[colorize:black:50"..pover},
	inventory_image = "mtools_potion_red.png^[colorize:black:50"..pover,
	wield_image = "mtools_potion_red.png^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = core.item_eat(50, "vessels:glass_bottle"),
})

local function purple_effect(pos)
core.add_particlespawner({
	amount = 5,
	time = .1,
	minpos = {x=pos.x-1, y=pos.y+1, z=pos.z-1},
	maxpos = {x=pos.x+1, y=pos.y+1, z=pos.z+1},
	minacc = {x=-.5,y=4,z=-.5},
	maxacc = {x=.5,y=4,z=.5},
	exptime = {min = .5, max = 1},
	minsize = 1,
	maxsize = 2,
	texture = "witchcraft_effect.png",
	glow = 7 })
end

local pinkyred = "mtools_potion_red.png^[colorize:magenta:70"
core.register_node("mtools:potion_pinkishred", {
	description = "Regen Potion",
	drawtype = "plantlike",
	tiles = {pinkyred..pover},
	inventory_image = pinkyred..pover,
	wield_image = pinkyred..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		playereffects.apply_effect_type("regen_lv1", 30, user)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_pinkishred_2", {
	description = "Regen Potion lv2",
	drawtype = "plantlike",
	tiles = {pinkyred.."^[colorize:black:50"..pover},
	inventory_image = pinkyred.."^[colorize:black:50"..pover,
	wield_image = pinkyred.."^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		playereffects.apply_effect_type("regen_lv2", 60, user)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
}) pinkyred = nil

core.register_node("mtools:potion_brown", {
	description = "Murky Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_brown.png"..pover},
	inventory_image = "mtools_potion_brown.png"..pover,
	wield_image = "mtools_potion_brown.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = core.item_eat(-5, "vessels:glass_bottle"),
})

core.register_node("mtools:potion_brown_2", {
	description = "Murky Potion lv2",
	drawtype = "plantlike",
	tiles = {"mtools_potion_brown.png^[colorize:black:50"..pover},
	inventory_image = "mtools_potion_brown.png^[colorize:black:50"..pover,
	wield_image = "mtools_potion_brown.png^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = core.item_eat(-10, "vessels:glass_bottle"),
})

core.register_node("mtools:potion_yllwgrn", {
	description = "Dodgy Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_yellgrn.png"..pover},
	inventory_image = "mtools_potion_yellgrn.png"..pover,
	wield_image = "mtools_potion_yellgrn.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		local pos = user:get_pos()
	core.add_particlespawner({
		amount = 30,
		time = 3,
		minpos = {x=pos.x-1.5, y=pos.y+1, z=pos.z-1.5},
		maxpos = {x=pos.x+1.5, y=pos.y+1, z=pos.z+1.5},
		exptime = {min = .4, max = .6},
		minsize = 5,
		maxsize = 15,
		texture = "mtools_boomeffect.png",
	animation = {type = "vertical_frames", aspect_w = 20, aspect_h = 20, length = -1},
		glow = 9
	})
		core.after(2, function(pos)
			tnt.boom(pos, {damage_radius=5,radius=3,ignore_protection=false})
		end, pos)

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_yllwgrn_2", {
	description = "Dodgy Potion lv2",
	drawtype = "plantlike",
	tiles = {"mtools_potion_yellgrn.png^[colorize:black:50"..pover},
	inventory_image = "mtools_potion_yellgrn.png^[colorize:black:50"..pover,
	wield_image = "mtools_potion_yellgrn.png^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		local pos = user:get_pos()
	core.add_particlespawner({
		amount = 15,
		time = 1.5,
		minpos = {x=pos.x-2, y=pos.y+1, z=pos.z-2},
		maxpos = {x=pos.x+2, y=pos.y+1, z=pos.z+2},
		exptime = {min = .4, max = .6},
		minsize = 5,
		maxsize = 15,
		texture = "mtools_boomeffect.png",
	animation = {type = "vertical_frames", aspect_w = 20, aspect_h = 20, length = -1},
		glow = 9
	})
		core.after(1, function(pos)
			tnt.boom(pos, {damage_radius=10,radius=4,ignore_protection=false})
		end, pos)

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_purple", {
	description = "Smokey Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_purple.png"..pover},
	inventory_image = "mtools_potion_purple.png"..pover,
	wield_image = "mtools_potion_purple.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		local pos = user:get_pos()
	core.add_particlespawner({
		amount = 20,
		time = .5,
		minpos = {x=pos.x-1, y=pos.y, z=pos.z-1},
		maxpos = {x=pos.x+1, y=pos.y, z=pos.z+1},
		minvel = {x=0,y=.5,z=0},
		maxvel = {x=0,y=.6,z=0},
		minacc = {x=0,y=-.5,z=0},
		maxacc = {x=0,y=.5,z=0},
		exptime = {min = 1, max = 3},
		minsize = 10,
		maxsize = 15,
		collisiondetection = true,
		texture = "witchcraft_smoke.png^[colorize:magenta:50"})

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_purple_2", {
	description = "Smokey Potion lv2",
	drawtype = "plantlike",
	tiles = {"mtools_potion_purple.png^[colorize:black:50"..pover},
	inventory_image = "mtools_potion_purple.png^[colorize:black:20"..pover,
	wield_image = "mtools_potion_purple.png^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		local pos = user:get_pos()
	core.add_particlespawner({
		amount = 20,
		time = .5,
		minpos = {x=pos.x-1, y=pos.y, z=pos.z-1},
		maxpos = {x=pos.x+1, y=pos.y, z=pos.z+1},
		minvel = {x=0,y=.2,z=0},
		maxvel = {x=0,y=.2,z=0},
		minacc = {x=0,y=-.1,z=0},
		maxacc = {x=0,y=.1,z=0},
		exptime = {min = 5, max = 10},
		minsize = 10,
		maxsize = 15,
		collisiondetection = true,
		texture = "witchcraft_smoke.png^[colorize:magenta:50"})

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

if core.get_modpath("hbhunger") then
core.register_node("mtools:potion_gviolet", {
	description = "Filling Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_pink.png"..pover},
	inventory_image = "mtools_potion_pink.png"..pover,
	wield_image = "mtools_potion_pink.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_gred", {
	description = "Hunger Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_gred.png"..pover},
	inventory_image = "mtools_potion_gred.png"..pover,
	wield_image = "mtools_potion_gred.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

--hbhunger.register_food("mtools:potion_gviolet", 10)
--hbhunger.register_food("mtools:potion_gred", -4)
else

core.register_node("mtools:potion_gviolet", {
	description = "Filling Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_purple.png"..pover},
	inventory_image = "mtools_potion_purple.png"..pover,
	wield_image = "mtools_potion_purple.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = core.item_eat(20, "vessels:glass_bottle")
})
	
core.register_node("mtools:potion_gred", {
	description = "Hunger Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_gred.png"..pover},
	inventory_image = "mtools_potion_gred.png"..pover,
	wield_image = "mtools_potion_gred.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = core.item_eat(10, "vessels:glass_bottle")
})
end

core.register_node("mtools:potion_grey", {
	description = "Evil Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_grey.png"..pover},
	inventory_image = "mtools_potion_grey.png"..pover,
	wield_image = "mtools_potion_grey.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = core.item_eat(-100, "vessels:glass_bottle")
})

core.register_node("mtools:potion_grey_2", {
	description = "Evil Potion lv2",
	drawtype = "plantlike",
	tiles = {"mtools_potion_grey.png^[colorize:black:50"..pover},
	inventory_image = "mtools_potion_grey.png^[colorize:black:50"..pover,
	wield_image = "mtools_potion_grey.png^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = core.item_eat(-200, "vessels:glass_bottle")
})

core.register_node("mtools:potion_blue", {-- Mainly for navigation
	description = "Blue Potion (Night vision very experimental)",
	drawtype = "plantlike",
	tiles = {"mtools_potion_blue.png"..pover},
	inventory_image = "mtools_potion_blue.png"..pover,
	wield_image = "mtools_potion_blue.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user, pointd)
		local name = user:get_player_name()
	core.chat_send_player(name, "Night vision for 35 seconds")
	core.add_particlespawner({
		amount = 15050,
		time = 35,
		pos = {min = {x=-15, y=-15, z=-15}, max = {x=15, y=15, z=15}},
		attached = user,
		exptime = {min = 2, max = 3},
		minsize = 30,
		maxsize = 50,
		texture = "default_cloud.png^[colorize:#def3",
		glow = 8,
		playername = name
	})
		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

local function flight_Onoel(user, times)
if lp ~= true then
	core.add_particlespawner({
		amount = 50*times,
		time = times,
		pos = {min = {x=-.3, y=-.1, z=-.3}, max = {x=.3, y=.1, z=.3}},
		minvel = {x=-.1, y=-1, z=-.1},
		maxvel = {x=.1, y=-2, z=.1},
		attached = user,--	spawner not particles
		exptime = {min = .3, max = .5},
		minsize = .6,
		maxsize = 1,
		collisiondetection = true,
		vertical = true,
		texture = "frost_ice.png",
	})
end
	core.add_particlespawner({
		amount = 450*times,
		time = times,
		pos = {min = {x=-.3, y=-.1, z=-.3}, max = {x=.3, y=.1, z=.3}},
		minvel = {x=-.1, y=-.4, z=-.1},
		maxvel = {x=.1, y=-.4, z=.1},
		minacc = {x=-.1, y=-.5, z=-.1},
		maxacc = {x=.1, y=-.5, z=.1},
		attached = user,
		exptime = {min = .3, max = .7},
		minsize = .4,
		maxsize = .6,
		collisiondetection = true,
		texture = "frost_flake.png",
	})
end

core.register_node("mtools:potion_silver", {
	description = "Cold potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_silver.png"..pover},
	inventory_image = "mtools_potion_silver.png"..pover,
	wield_image = "mtools_potion_silver.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		local name = user:get_player_name()
		local privs = core.get_player_privs(name)
	if privs.fly == nil then
		flight_Onoel(user, 30)
		privs.fly = true
		core.set_player_privs(name, privs)
		playereffects.apply_effect_type("fly_o_noel", 30, user)
		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
	end
})

core.register_node("mtools:potion_silver_2", {
	description = "Cold potion lv2",
	drawtype = "plantlike",
	tiles = {"mtools_potion_silver.png^[colorize:black:50"..pover},
	inventory_image = "mtools_potion_silver.png^[colorize:black:50"..pover,
	wield_image = "mtools_potion_silver.png^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		local name = user:get_player_name()
		local privs = core.get_player_privs(name)
	if privs.fly == nil then
		flight_Onoel(user, 60)
		privs.fly = true
		core.set_player_privs(name, privs)
		playereffects.apply_effect_type("fly_o_noel", 60, user)
		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
	end
})

local function twinkle_grow(pos)
	core.add_particlespawner({
		amount = 15,
		time = 1,
		minpos = {x=pos.x-.5, y=pos.y-.5, z=pos.z-.5},
		maxpos = {x=pos.x+.5, y=pos.y+.6, z=pos.z+.5},
		exptime = {min = .7, max = 1},
		minsize = .8,
		maxsize = 2,
		texpool = {"twinkle_gold.png", "twinkle_gold2.png"},
		animation = {type = "vertical_frames", aspect_w = 7, aspect_h = 7, length = -1},
		glow = 13 })
if lp ~= true then
	core.add_particlespawner({
		amount = 30,
		time = 1,
		minpos = {x=pos.x-.5, y=pos.y-.5, z=pos.z-.5},
		maxpos = {x=pos.x+.5, y=pos.y-.4, z=pos.z+.5},
		minvel = {x=-.2, y=.5, z=-.2},
		maxvel = {x=.2, y=1, z=.2},
		minacc = {x=0, y=0, z=0},
		maxacc = {x=0, y=-.2, z=0},
		exptime = {min = .5, max = 1.2},
		minsize = .1,
		maxsize = .3,
		texture = "glisten_green.png",
		animation = {type = "vertical_frames", aspect_w = 3, aspect_h = 3, length = .7},
		glow = 13 }) end
end

function superlize(pos)
	local name = core.get_node(pos).name
	local def = core.registered_nodes[name]
	if def.next_plant or name == "default:poison_ivy_1" or name == "default:poison_ivy_2" then
local meta = core.get_meta(pos)
meta:set_int("light_level", 4)
meta:set_int("soil_need", 1)
core.get_node_timer(pos):start(0)
core.sound_play("default_grass_footstep", {pos = pos, gain = .1})
twinkle_grow(pos)
core.after(1, superlize, pos)
	end
end

core.register_node("mtools:potion_green", {
	description = "Superliser Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_green.png"..pover},
	inventory_image = "mtools_potion_green.png"..pover,
	wield_image = "mtools_potion_green.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user, pointd)
		if pointd.type ~= "node" or not user then return item end
		local pos = pointd.under
		local pname = user:get_player_name()
 if not core.is_protected(pos, pname) then
	local below = core.get_node({x = pos.x, y = pos.y - 1, z = pos.z})
	if core.get_item_group(below.name, "soil") > 0 then
		local node = core.get_node(pos)
		local meta = core.get_meta(pos)
	if core.get_item_group(node.name, "flora") > 0 then
		meta:set_int("light_level", 4)
		core.after(1, function(pos, node) flowers.flower_spread(pos, node) end, pos, node)
		twinkle_grow(pos)
	elseif core.get_item_group(node.name, "sapling") > 0 or
	core.get_item_group(node.name, "sapling2") > 0 or core.get_item_group(node.name, "water_flora") > 0 then
		meta:set_int("light_level", 4)
		core.get_node_timer(pos):start(2)
		core.after(.8, function(pos) twinkle_grow(pos) end, pos)
	elseif (core.get_item_group(node.name, "plant") > 0 and core.registered_nodes[node.name].next_plant) or
	core.get_item_group(node.name, "seed") > 0 or node.name == "default:poison_ivy_1" or node.name == "default:poison_ivy_2" then
		core.after(1, superlize, pos)
	else
		return item
	end
core.add_particlespawner({
	amount = 40,
	time = .1,
	minpos = {x=pos.x, y=pos.y-.2, z=pos.z},
	maxpos = {x=pos.x, y=pos.y-.3, z=pos.z},
	minvel = {x=-2, y=.2, z=-2},
	maxvel = {x=2, y=.5, z=2},
	minacc = {x=0, y=-6, z=0},
	maxacc = {x=0, y=-10, z=0},
	exptime = {min = .2, max = .3},
	minsize = .2,
	maxsize = 4,
	collisiondetection = true,
	texture = "mtools_potion_splash.png^[colorize:#5c3e"})
		if item:get_count() == 1 then
core.after(.1, function(item, user)
core.do_item_eat(0, "vessels:glass_bottle", item, user, pointd, true) end, item, user)
		else
	return core.do_item_eat(0, "vessels:glass_bottle", item, user, pointd, true)
		end
	end
 else
	core.chat_send_player(pname, "This area is protected")
	core.record_protection_violation(pos, pname)
	return item
 end
	end
})

core.register_node("mtools:potion_gold", {
	description = "Alchemy Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_gold.png"..pover},
	inventory_image = "mtools_potion_gold.png"..pover,
	wield_image = "mtools_potion_gold.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user, pointd)
		if pointd.type ~= "node" or not user then return item end
		local pos = pointd.under
		local pname = user:get_player_name()
 if not core.is_protected(pos, pname) then
	if core.get_item_group(core.get_node(pos).name, "trunk") > 0 then
		local pos2 = user:get_pos()
		local dir = user:get_look_dir()
		core.add_particle({
	pos = {x=pos2.x, y=pos2.y+1.5, z=pos2.z},
	velocity = {x=dir.x*9, y=dir.y*9, z=dir.z*9},
	acceleration = {x=0, y=-7, z=0},
	size = 6,
	collisiondetection = true,
	collision_removal = true,
	texture = "mtools_potion_splash.png^[colorize:#ee6d"})
		core.after(1, function(pos)
	core.set_node(pos, {name= "default:diamond_block"})
	core.add_particlespawner({
		amount = 50,
		time = 1,
		minpos = vector.subtract(pos, .5),
		maxpos = vector.add(pos, .5),
		minvel = {x=-6, y=-6, z=-6},
		maxvel = {x=6, y=6, z=6},
		exptime = {min = .3, max = .4},
		minsize = 1,
		maxsize = 2,
		texture = "witchcraft_effect.png",
		glow = 9 })
	end, pos)
		return core.do_item_eat(0, "vessels:glass_bottle", item, user, pointd, true)
	end
 else
	core.chat_send_player(pname, "This area is protected")
	core.record_protection_violation(pos, pname)
	return item
 end
	end
})

core.register_node("mtools:potion_gold_2", {
	description = "Alchemy Potion lv2",
	drawtype = "plantlike",
	tiles = {"mtools_potion_gold.png^[colorize:black:50"..pover},
	inventory_image = "mtools_potion_gold.png^[colorize:black:50"..pover,
	wield_image = "mtools_potion_gold.png^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user, pointd)
		if pointd.type ~= "node" or not user then return item end
		local pos = pointd.under
		local pname = user:get_player_name()
		local madegold
 if not core.is_protected(pos, pname) then
	if core.get_modpath("technic_worldgen") then
		if core.get_node(pos).name == "technic:lead_block" then
		madegold = true end
	else
		if core.get_node(pointd.above).name == "air" and not core.is_protected(pointd.above, pname) then
		pos = pointd.above
		madegold = true end
	end
	if madegold then
		local pos2 = user:get_pos()
		local dir = user:get_look_dir()
		core.add_particle({
	pos = {x=pos2.x, y=pos2.y+1.5, z=pos2.z},
	velocity = {x=dir.x*9, y=dir.y*9, z=dir.z*9},
	acceleration = {x=0, y=-7, z=0},
	size = 6,
	collisiondetection = true,
	collision_removal = true,
	texture = "mtools_potion_splash.png^[colorize:#aa6d"})
		core.after(1, function(pos)
	core.set_node(pos, {name= "default:gold_block"})
	core.add_particlespawner({
		amount = 50,
		time = 1,
		minpos = vector.subtract(pos, .5),
		maxpos = vector.add(pos, .5),
		minvel = {x=-6, y=-6, z=-6},
		maxvel = {x=6, y=6, z=6},
		exptime = {min = .3, max = .4},
		minsize = 1,
		maxsize = 2,
		texture = "witchcraft_effect.png",
		glow = 9 })
	end, pos)
		return core.do_item_eat(0, "vessels:glass_bottle", item, user, pointd, true)
	end
 else
	core.chat_send_player(pname, "This area is protected")
	core.record_protection_violation(pos, pname)
	return item
 end
	end
})

core.register_node("mtools:potion_aqua", {
	description = "Complex Potion",-- makes user convert ambient universe energy to extra_energy
	drawtype = "plantlike",
	tiles = {"mtools_potion_aqua.png"..pover},
	inventory_image = "mtools_potion_aqua.png"..pover,
	wield_image = "mtools_potion_aqua.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
if user:get_meta():get_string("_infinite_energy") ~= "true" then
	local pos = user:get_pos()
core.add_particlespawner({
	amount = 15,
	time = 1,
	minpos = {x=pos.x-.6, y=pos.y+.3, z=pos.z-.6},
	maxpos = {x=pos.x+.6, y=pos.y+1.9, z=pos.z+.6},
	exptime = {min = .7, max = 1},
	minsize = .8,
	maxsize = 2,
	texpool = {"twinkle_gold.png", "twinkle_gold2.png"},
	animation = {type = "vertical_frames", aspect_w = 7, aspect_h = 7, length = -1},
	glow = 13 })
		user:get_meta():set_string("_infinite_energy", "true")
		extra_energy = tonumber(user:get_meta():get_int("_extra_energy"))
		local new_xn = extra_energy+500
		if new_xn >= 1000 then
			new_xn = 1000
		end
		user:get_meta():set_int("_extra_energy", new_xn)
		core.after(1, function(user)
	extra_energy = tonumber(user:get_meta():get_int("_extra_energy"))
	local new_xn = extra_energy+500
	if new_xn >= 1000 then
		new_xn = 1000
	end
	user:get_meta():set_int("_extra_energy", new_xn)
		end, user)

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
end
	end
})

core.register_node("mtools:potion_aqua_2", {
	description = "Complex Potion lv2",-- uses 5000 extra_energy to grant the creative priv
	drawtype = "plantlike",
	tiles = {"mtools_potion_aqua.png^[colorize:black:50"..pover},
	inventory_image = "mtools_potion_aqua.png^[colorize:black:50"..pover,
	wield_image = "mtools_potion_aqua.png^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
core.after(5, function(user)
if user:get_meta():get_string("_infinite_energy") ~= "true" then
	user:get_meta():set_int("_extra_energy", 0)
	user:set_hp(0)
	return
end
	local pos = user:get_pos()
	local name = user:get_player_name()
	local privs = core.get_player_privs(name)
	if privs.creative == nil then
		privs.creative = true
	core.add_particlespawner({
		amount = 200,
		time = .3,
		pos = {x=0, y=1, z=0},
		radius = {min = 2, max = 5, bias = -1},
		attached = user,
		attract = {
	kind = "point",
	strength = {min = 3, max = 5},
	origin = {x=0, y=1, z=0},
	origin_attached = user },
		exptime = {min = 2, max = 3},
		minsize = 6,
		maxsize = 7,
		texture = "extra_energy_globe.png",
		glow = 14 })
		core.sound_play("brewing_magic_sound", {pos = pos, gain = .4})
	else
		privs.creative = nil
	core.add_particlespawner({
		amount = 200,
		time = .3,
		pos = {x=pos.x, y=pos.y+1, z=pos.z},
		minvel = {x=-7, y=-7, z=-7},
		maxvel = {x=7, y=7, z=7},
		exptime = {min = .5, max = .7},
		minsize = 6,
		maxsize = 7,
		texture = "extra_energy_globe.png",
		glow = 14 })
	end
	core.set_player_privs(name, privs)
end, user)

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_magenta", {
	description = "Fast Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_magenta.png"..pover},
	inventory_image = "mtools_potion_magenta.png"..pover,
	wield_image = "mtools_potion_magenta.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		user:set_breath(5)
		playereffects.apply_effect_type("potion_speed_lv1", 10, user)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_magenta_2", {
	description = "Fast Potion lv2",
	drawtype = "plantlike",
	tiles = {"mtools_potion_magenta.png^[colorize:black:50"..pover},
	inventory_image = "mtools_potion_magenta.png^[colorize:black:50"..pover,
	wield_image = "mtools_potion_magenta.png^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		user:set_breath(5)
		playereffects.apply_effect_type("potion_speed_lv2", 10, user)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_cyan", {
	description = "Light Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_cyan.png"..pover},
	inventory_image = "mtools_potion_cyan.png"..pover,
	wield_image = "mtools_potion_cyan.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		playereffects.apply_effect_type("potion_antigrav", 10, user)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_cyan_2", {
	description = "Light Potion lv2",
	drawtype = "plantlike",
	tiles = {"mtools_potion_cyan.png^[colorize:black:50"..pover},
	inventory_image = "mtools_potion_cyan.png^[colorize:black:50"..pover,
	wield_image = "mtools_potion_cyan.png^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		playereffects.apply_effect_type("potion_antigrav", 20, user)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_gcyan", {
	description = "Air Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_gcyan.png"..pover},
	inventory_image = "mtools_potion_gcyan.png"..pover,
	wield_image = "mtools_potion_gcyan.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		user:set_breath(12)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_green2", {
	description = "Volatile Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_green2.png"..pover},
	inventory_image = "mtools_potion_green2.png"..pover,
	wield_image = "mtools_potion_green2.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		user:set_breath(5)
		playereffects.apply_effect_type("potion_jump", 6, user)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_green2_2", {
	description = "Volatile Potion lv2",
	drawtype = "plantlike",
	tiles = {"mtools_potion_green2.png^[colorize:black:50"..pover},
	inventory_image = "mtools_potion_green2.png^[colorize:black:50"..pover,
	wield_image = "mtools_potion_green2.png^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		user:set_breath(5)
		playereffects.apply_effect_type("potion_jump", 12, user)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_ggreen", {
	description = "Darkness Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_ggreen.png"},
	inventory_image = "mtools_potion_ggreen.png",
	wield_image = "mtools_potion_ggreen.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		local pos = user:get_pos()
	core.add_particlespawner({
		amount = 2000,
		time = 1,
		minpos = {x=pos.x-20, y=pos.y-3, z=pos.z-20},
		maxpos = {x=pos.x+20, y=pos.y+3, z=pos.z+20},
		minacc = {x=-.1,y=0,z=-.1},
		maxacc = {x=.1,y=0,z=.1},
		exptime = {min = 5, max = 10},
		minsize = 10,
		maxsize = 20,
		texture = "witchcraft_pot_bottom.png^[colorize:black:200"})
		local mtime = core.get_timeofday()
		if mtime >= .25 and mtime <= .75 then
			user:override_day_night_ratio(0)
			core.after(10, function(user)
			user:override_day_night_ratio(nil)
			end, user)
		end

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_redbrown", {
	description = "Thick Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_redbrown.png"..pover},
	inventory_image = "mtools_potion_redbrown.png"..pover,
	wield_image = "mtools_potion_redbrown.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		playereffects.apply_effect_type("potion_slow_lv1", 11, user)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_redbrown_2", {
	description = "Thick Potion lv2",
	drawtype = "plantlike",
	tiles = {"mtools_potion_redbrown.png^[colorize:black:50"..pover},
	inventory_image = "mtools_potion_redbrown.png^[colorize:black:50"..pover,
	wield_image = "mtools_potion_redbrown.png^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		playereffects.apply_effect_type("potion_slow_lv2", 15, user)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_blue2", {
	description = "Watery Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_blue2.png"..pover},
	inventory_image = "mtools_potion_blue2.png"..pover,
	wield_image = "mtools_potion_blue2.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
	if user:get_breath() <= 9 then
		playereffects.apply_effect_type("potion_swim_lv1", 15, user)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
	end
})

core.register_node("mtools:potion_blue2_2", {
	description = "Watery Potion lv2",
	drawtype = "plantlike",
	tiles = {"mtools_potion_blue2.png^[colorize:black:50"..pover},
	inventory_image = "mtools_potion_blue2.png^[colorize:black:50"..pover,
	wield_image = "mtools_potion_blue2.png^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
	if user:get_breath() <= 9 then
		playereffects.apply_effect_type("potion_swim_lv2", 15, user)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
	end
})

-- Light potion

local function lightchange(plyr, duration)
	local mtime = core.get_timeofday()
	if mtime <= .25 or mtime >= .75 then
		plyr:override_day_night_ratio(1)
		core.after(duration, function(plyr)
	plyr:override_day_night_ratio(nil)
		end, plyr)
	end
end

core.register_node("mtools:potion_yellow", {
	description = "Shiny Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_yellow.png"..pover},
	inventory_image = "mtools_potion_yellow.png"..pover,
	wield_image = "mtools_potion_yellow.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		lightchange(user, 10)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_yellow_2", {
	description = "Shiny Potion lv2",
	drawtype = "plantlike",
	tiles = {"mtools_potion_yellow.png^[colorize:black:50"..pover},
	inventory_image = "mtools_potion_yellow.png^[colorize:black:50"..pover,
	wield_image = "mtools_potion_yellow.png^[colorize:black:50"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		lightchange(user, 20)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_herbal", {
	description = "Herbal Potion",
	drawtype = "plantlike",
	tiles = {"mtools_potion_herbal.png"..pover},
	inventory_image = "mtools_potion_herbal.png"..pover,
	wield_image = "mtools_potion_herbal.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("mtools:potion_redbrown_lom", {
	description = "Thick Potion LOM",
	drawtype = "plantlike",
	tiles = {"mtools_potion_redbrownv2.png"..pover},
	inventory_image = "mtools_potion_redbrownv2.png"..pover,
	wield_image = "mtools_potion_redbrownv2.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		playereffects.apply_effect_type("potion_slow_lv1", 17, user)
		purple_effect(user:get_pos())

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_orange_lom", {
	description = "Dragon Potion LOM",
	drawtype = "plantlike",
	tiles = {"mtools_potion_orangev2.png"..pover},
	inventory_image = "mtools_potion_orangev2.png"..pover,
	wield_image = "mtools_potion_orangev2.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x=pos.x+dir.x*1.5,y=pos.y+1.5+dir.y,z=pos.z+dir.z*1.5}, "mtools:fireball")
		obj:set_velocity({x=dir.x*9,y=dir.y*9,z=dir.z*9})
		obj:get_luaentity().damage = 9

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_red_lom", {
	description = "Red Potion LOM",
	drawtype = "plantlike",
	tiles = {"mtools_potion_redv2.png"..pover},
	inventory_image = "mtools_potion_redv2.png"..pover,
	wield_image = "mtools_potion_redv2.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = core.item_eat(30, "vessels:glass_bottle"),
})

core.register_node("mtools:potion_blue_lom", {
	description = "Waterer Potion LOM",
	drawtype = "plantlike",
	tiles = {"mtools_potion_bluev2.png"..pover},
	inventory_image = "mtools_potion_bluev2.png"..pover,
	wield_image = "mtools_potion_bluev2.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		local health = user:get_hp()
		local name = user:get_player_name()
		user:set_hp(health+25)
		chi.add_up_to(name, 100)

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_blue2_lom", {
	description = "Waterer Potion lv2 LOM",
	drawtype = "plantlike",
	tiles = {"mtools_potion_blue2v2.png"..pover},
	inventory_image = "mtools_potion_blue2v2.png"..pover,
	wield_image = "mtools_potion_blue2v2.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		local health = user:get_hp()
		local name = user:get_player_name()
		user:set_hp(health+50)
		chi.add_up_to(name, 200)

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

core.register_node("mtools:potion_green2_lom", {
	description = "Volatile potion LOM",
	drawtype = "plantlike",
	tiles = {"mtools_potion_green2v2.png"..pover},
	inventory_image = "mtools_potion_green2v2.png"..pover,
	wield_image = "mtools_potion_green2v2.png"..pover,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .4, .25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(item, user)
		local name = user:get_player_name()
		 chi.add_up_to(name, 200)

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end
})

local traxie21s = {}

function traxie21s.register_potion(iname, color, exptime, action, expaction)
	iname = string.gsub(iname, "[-%[%]()1023456789 ]", "")
core.register_craftitem("mtools:".. iname:lower(), {
	description = iname .." Potion",
	inventory_image = "over_potions_".. color ..".png^over_potions_bottle.png",
	range = 2,

	on_place = function(item, user, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and user and
				not user:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, user,
					item, pointd)
			end
		end

		action(item, user, pointd)
		core.after(exptime, expaction, item, user, pointd)

		local pos2 = user:get_pos()
		local dir = user:get_look_dir()
core.add_particle({
	pos = {x=pos2.x, y=pos2.y+1.5, z=pos2.z},
	velocity = {x=dir.x*9, y=dir.y*9, z=dir.z*9},
	acceleration = {x=0, y=-7, z=0},
	size = 6,
	collisiondetection = true,
	collision_removal = true,
	texture = "over_potions_".. color ..".png"})
if lp ~= true then
core.add_particlespawner({
	amount = 30,	time = .2,
	pos = pointd.above,
	minvel = {x=2, y=2, z=2},
	maxvel = {x=-2, y=2, z=-2},
	minacc = {x=.2, y=.1, z=.2},
	maxacc = {x=-.2, y=.3, z=-.2},
	exptime = {min = .5, max = 1},
	minsize = 1,	maxsize = 3,
	collisiondetection = true,
	texture = "over_potions_".. color ..".png"}) end

		if user then
	return core.do_item_eat(0, "vessels:glass_bottle", item, user)
		end
	end,
})
end

traxie21s.register_potion("Anti Gravity", "cyan", 60,
function(item, user, pointd)
	user:set_physics_override({jump = 1.5, gravity = .5})
	core.chat_send_player(user:get_player_name(), "You have Anti Gravity for 60 seconds!")
end,

function(item, user, pointd)
	user:set_physics_override({jump = 1, gravity = 1})
	core.chat_send_player(user:get_player_name(), "Anti Gravity has worn off.")
end)

traxie21s.register_potion("Anti Gravity II", "cyan", 60,
function(item, user, pointd)
	user:set_physics_override({speed = 3, gravity = .1})
	core.chat_send_player(user:get_player_name(), "You have Anti Gravity II for 60 seconds!")
end,

function(item, user, pointd)
	user:set_physics_override({speed = 1, gravity = 1})
	core.chat_send_player(user:get_player_name(), "Anti Gravity II has worn off.")
end)

traxie21s.register_potion("Speed", "pink", 60,
function(item, user, pointd)
	user:set_physics_override({speed = 3})
	core.chat_send_player(user:get_player_name(), "You have Speed for 60 seconds!")
end,

function(item, user, pointd)
	user:set_physics_override({speed = 1})
	core.chat_send_player(user:get_player_name(), "Speed has worn off.")
end)

traxie21s.register_potion("Speed II", "pink", 60,
function(item, user, pointd)
	user:set_physics_override({speed = 5})
	core.chat_send_player(user:get_player_name(), "You have Speed II for 60 seconds!")
end,

function(item, user, pointd)
	user:set_physics_override({speed = 1})
	core.chat_send_player(user:get_player_name(), "Speed II has worn off.")
end)

traxie21s.register_potion("Inversion", "dull", 60,
function(item, user, pointd)
	user:set_physics_override({jump = 0, gravity = -.2})
	core.chat_send_player(user:get_player_name(), "You have Inversion for 60 seconds!")
end,

function(item, user, pointd)
	user:set_physics_override({jump = 1, gravity = 1})
	core.chat_send_player(user:get_player_name(), "Inversion has worn off.")
end)

traxie21s.register_potion("What will this do", "white", 60,
function(item, user, pointd)
	user:set_physics_override({speed = math.random(1, 20), jump = math.random(1, 20), gravity = math.random(-4, 2)})
	core.chat_send_player(user:get_player_name(), "You have unknown powers for good or evil! (60 seconds)")
end,

function(item, user, pointd)
	user:set_physics_override({speed = 1, jump = 1, gravity = 1})
	core.chat_send_player(user:get_player_name(), "Unknown powers lost.")
end)

traxie21s.register_potion("Instant Health", "red", 1,
function(item, user, pointd)
	user:set_hp(user:get_hp() + 6)
end,

function(item, user, pointd)
end)

traxie21s.register_potion("Instant Health II", "red", 1,
function(item, user, pointd)
	user:set_hp(user:get_hp() + 12)
end,

function(item, user, pointd)
end)

traxie21s.register_potion("Harming", "darkgrey", 1,
function(item, user, pointd)
	user:set_hp(user:get_hp() - 3)
end,

function(item, user, pointd)
end)

traxie21s.register_potion("Harming II", "darkgrey", 1,
function(item, user, pointd)
	user:set_hp(user:get_hp() - 6)
end,

function(item, user, pointd)
end)

local potions = {
	potion_yellow = "potion_herbal",
	potion_redbrown = "potion_redbrown_lom",
	potion_orange = "potion_orange_lom",
	potion_pinkishred = "potion_red_lom",
	potion_blue2 = "potion_blue_lom",
	potion_blue2_2 = "potion_blue2_lom",
	potion_green2 = "potion_green2_lom",
	potion_cyan = "antigravity",
	potion_cyan_2 = "antigravityii",
	potion_magenta = "speed",
	potion_magenta_2 = "speedii",
	potion_gred = "inversion",
	potion_gcyan = "whatwillthisdo",
	potion_red = "instanthealth",
	potion_red_2 = "instanthealthii",
	potion_grey = "harming",
	potion_grey_2 = "harmingii"
}

for type1, type2 in pairs(potions) do
	core.register_craft({
		output = "mtools:".. type2,
		recipe = {
			{"mtools:".. type1},
			{"mtools:magic_crystal"}
		},
		replacements = {{"mtools:magic_crystal", "mtools:magic_crystal"}}
	})

	core.register_craft({
		output = "mtools:".. type1,
		recipe = {
			{"mtools:".. type2},
			{"mtools:magic_crystal"}
		},
		replacements = {{"mtools:magic_crystal", "mtools:magic_crystal"}}
	})
end

-- Decorative nodes

core.register_node("mtools:pentablock", {
	description = "Pentagram block",
	tiles = {"mtools_pentablock.png"},
	is_ground_content = false,
	on_construct = function(pos)
		core.get_node_timer(pos):start(.3)
	end,
	on_timer = function(pos)
		for _, ob in ipairs(core.get_objects_inside_radius(pos, 11)) do
			if ob:get_luaentity() ~= nil then
				local ent = ob:get_luaentity()
				if ent.type == "monster" or ent.name == "tsm_pyramids:mummy" or ent.name == "mobs_monster:mese_arrow" or
				ent.name == "dmobs:shuriken" or ent.name == "dmobs:snowball" or ent.name == "es:bullet" or
				ent.name == "mobs:bonebullet" or ent.name == "es:lasershot" or ent.name == "awesome_monsters:star" then
					local pos2=ob:get_pos()
					local d=math.max(1,vector.distance(pos,pos2))
					local r=(8/d)*2
					ob:set_velocity({x=(pos2.x-pos.x)*r, y=(pos2.y-pos.y+.1)*r, z=(pos2.z-pos.z)*r})
				elseif ent.name == "mobs_monster:fireball" or ent.name == "mobs_monster:obsidian_arrow" or ent.name == "mobs_loz:fire" then
					ob:remove()
				end
			end
		end
		return true
	end,
	on_punch = function(pos, node, user)
		if user:get_wielded_item():get_name() == "mapgen:eye" then
core.add_particlespawner({
	amount = 79,
	time = 1,
	minpos = vector.subtract(pos, 5.5),
	maxpos = vector.add(pos, 5.5),
	exptime = {min = 3, max = 9},
	minsize = 1,
	maxsize = 2,
	texture = "brewing_magic_particle.png",
	glow = 11 })
		end
	end,
	groups = {cracky=1, oddly_breakable_by_hand=1, timer_check=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("mtools:portal_gram", {
	description = "Portal gram",
	drawtype = "signlike",
	visual_scale = 3.,
	tiles = {"mtools_portal_gram.png"},
	inventory_image = "mtools_portal_gram.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,	
	light_source = 14,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		fixed = {-.5, -.5, -.5, .5, -.4, .5}
	},
	on_rightclick = function(pos)
		core.get_node_timer(pos):start(1)
	end,
	on_timer = function(pos)
		if core.get_modpath("mobs") then
	local p2 = core.get_node(pos).param2
	core.set_node(pos, {name="mtools:portal", param2= p2})
	core.add_particlespawner({
		amount = 25,
		time = 1,
		minpos = {x=pos.x-1, y=pos.y, z=pos.z-1},
		maxpos = {x=pos.x+1, y=pos.y, z=pos.z+1},
		minacc = {x=-.5,y=1,z=-.5},
		maxacc = {x=.5,y=1,z=.5},
		exptime = {min = 1, max = 1.5},
		minsize = 1,
		maxsize = 2,
		texture = "witchcraft_effect.png^[colorize:green:400"})
		end
	end,
	groups = {crumbly=3, oddly_breakable_by_hand=2, attached_node=1},
})

core.register_node("mtools:portal", {
	description = "Portal",
	drawtype = "signlike",
	visual_scale = 3.,
	tiles = {"mtools_portal.png"},
	inventory_image = "mtools_portal.png",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	light_source = 14,
	walkable = false,
	pointable = false,
	diggable = false,
	is_ground_content = false,
	drop = "",
	on_construct = function(pos)
		core.get_node_timer(pos):start(1)
	end,
	on_timer = function(pos)
		if core.get_modpath("horror") then
		core.add_entity(pos, "horror:ghost")
		elseif core.get_modpath("mobs_loz") then
		core.add_entity(pos, "mobs_loz:dodongo")
		elseif core.get_modpath("dmobs") then
		core.add_entity(pos, "dmobs:owl")
		elseif core.get_modpath("mobs_animal") then
		core.add_entity(pos, "mobs_animal:kitten")
		elseif core.get_modpath("mobs_monster") then
		core.add_entity(pos, "mobs_monster:oerkki")
		end
		core.remove_node(pos)
	end,
	groups = {attached_node=1, not_in_creative_inventory=1},
})

local modpath = core.get_modpath("mtools")

dofile(modpath.."/scrolls.lua")

dofile(modpath.."/hyrule.lua")

dofile(modpath.."/api.lua")
dofile(modpath.."/settings.lua")
dofile(modpath.."/brewing.lua")
if core.get_modpath("3d_armor") then
	dofile(modpath.."/armor.lua")
end
