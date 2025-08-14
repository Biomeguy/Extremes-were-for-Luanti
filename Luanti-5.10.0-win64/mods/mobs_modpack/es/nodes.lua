--Extreme Survival created by Maikerumine
-- Luanti mod: "Extreme Survival"
-- namespace: es
--https://github.com/maikerumine

--License:
--~~~~~~~~
--Code:
--(c) Copyright 2015 maikerumine; modified zlib-License
--see "LICENSE.txt" for details.

--Media(if not stated differently):
--(c) Copyright (2014-2015) maikerumine; CC-BY-SA 3.0

core.register_node("es:stone_with_aikerum", {
	description = "Aikerum Ore",
	tiles = {"default_stone.png^aikerum_ore.png"},
	groups = {cracky=1,level = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"es:aikerum_crystal 5", "default:rock 4"}, rarity = 9},
			{items = {"es:aikerum_crystal 4", "default:rock 5"}, rarity = 6},
			{items = {"es:aikerum_crystal 3", "default:rock 6"}, rarity = 3},
			{items = {"es:aikerum_crystal 2", "default:rock 7"}},
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("es:stone_with_infinium", {
	description = "Infinium Ore",
	tiles = {"default_stone.png^infinium_ore.png"},
	groups = {cracky=1,level = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"es:infinium_goo 5", "default:rock 4"}, rarity = 9},
			{items = {"es:infinium_goo 4", "default:rock 5"}, rarity = 6},
			{items = {"es:infinium_goo 3", "default:rock 6"}, rarity = 3},
			{items = {"es:infinium_goo 2", "default:rock 7"}},
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("es:stone_with_magentium", {
	description = "Magentium Ore",
	tiles = {"default_stone.png^magentium_ore.png"},
	groups = {cracky=2,level = 2,fall_damage_add_percent = -100},
	drop = {
		max_items = 1,
		items = {
			{items = {"es:magentium_lump 5", "default:rock 4"}, rarity = 9},
			{items = {"es:magentium_lump 4", "default:rock 5"}, rarity = 6},
			{items = {"es:magentium_lump 3", "default:rock 6"}, rarity = 3},
			{items = {"es:magentium_lump 2", "default:rock 7"}},
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("es:aikerumblock", {
	description = "Aikerum Block",
	tiles = {"aikerum_block.png"},
	is_ground_content = false,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craftitem("es:aikerum_crystal", {
	description = "Aikerum Crystal",
	inventory_image = "aikerum.png",
})

core.register_node("es:infiniumblock", {
	description = "infinium Block",
	tiles = {"infinium_block.png"},
	groups = {cracky=1,level=2},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craftitem("es:infinium_goo", {
	description = "Infinium Goo - Craft with glass bottle to contain.",
	inventory_image = "infinium.png",
})

core.register_craftitem("es:infinium_container", {
	description = "Infinium Container - Cook to get Infinium Ingot",
	inventory_image = "infinium_container.png",
})

core.register_craftitem("es:infinium_ingot", {
	description = "Infinium Ingot",
	inventory_image = "infinium_ingot.png",
})

core.register_node("es:magentiumblock", {
	description = "Magentium Block - Fall from great height without any damage if landing on this block",
	tiles = {"magentium_block.png"},
	light_source = 7,
	is_ground_content = false,
	groups = {cracky=1,level=2, fall_damage_add_percent = -1000},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craftitem("es:magentium_ingot", {
	description = "Magentium Ingot",
	inventory_image = "magentium_ingot.png",
	light_source = 7,
})

core.register_craftitem("es:magentium_lump", {
	description = "Magentium Lump",
	inventory_image = "magentium_lump.png",
})

--BONEBLOCK
core.register_node("es:boneblock", {
	description = "Bone Block",
	tiles = {"bones_top.png", "bones_bottom.png", "bones_side.png",
	"bones_side.png", "bones_rear.png", "bones_front.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {dig_immediate=2},
	sounds = default.node_sound_gravel_defaults(),
})

core.register_node("es:what", {
	description = "The What Block - Dig for random gift",
	drawtype = "glasslike_framed_optional",
	tiles = {"default_obsidian_glass.png^bubble.png", "default_obsidian_glass_detail.png^bubble.png"},
	inventory_image = core.inventorycube("default_obsidian_glass.png^bubble.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky = 3},
	drop = {
		max_items = 5,
		items = {
	{items = {"es:what"}, rarity = 80},
	{items = {"es:sword_aikerum"}, rarity = 50},
	{items = {"es:sword_ruby"}, rarity = 40},
	{items = {"es:sword_emerald"}, rarity = 30},
	{items = {"es:pick_aikerum"}, rarity = 50},
	{items = {"es:pick_ruby"}, rarity = 40},
	{items = {"es:pick_emerald"}, rarity = 30},
	{items = {"default:crystal_ingot 10"}, rarity = 40},
	{items = {"default:gold_lump 10"}, rarity = 10},
	{items = {"default:iron_lump 10"}, rarity = 5},
	{items = {"default:apple 10"}, rarity = 5},
	{items = {"farming:wheat_bread 20"}, rarity = 3},
	{items = {"default:cobble 10"}, rarity = 3},
	{items = {"default:coal_lump 10"}, rarity = 1},
	{items = {"es:punkin_slice 12"}},
		}
	},
	sounds = default.node_sound_glass_defaults(),
})

--INPERVIOUS GLASS & STEELBLOCK CANNOT BREAK- Great for prison walls.
core.register_node("es:hdglass", {
	description = "High Density Glass - Carefull can not be destroyed",
	drawtype = "glasslike_framed_optional",
	tiles = {"default_glass.png", "default_glass_detail.png"},
	inventory_image = core.inventorycube("default_glass.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {immortal=1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("es:hdsteel_block", {
	description = "High Density Steel Block - Carefull can not be destroyed",
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	groups = {immortal=1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("es:clay_dirt_with_aiden_grass", {
	description = "Aiden Grass",
	tiles = {"default_savanna_grass.png^[colorize:#8A084B:160", "default_clay_dirt.png",
		{name = "default_clay_dirt.png^(default_savanna_grass_side.png^[colorize:#8A084B:160)",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:clay_dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = .25},
	}),
	_soil = {dry = "farming:clay_soil"}
})

core.register_node("es:aiden_tree", {
	description = "Aiden Tree",
	tiles = {"default_jungle_trunk.png^[colorize:#FFBBFF:130"},
	paramtype2 = "facedir",
	drop = "default:jungle_wood 4",
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("es:sapling", {
	description = "Aiden Tree Sapling",
	drawtype = "plantlike",
	tiles = {"default_emergent_jungle_sapling.png^[colorize:#FFBBFF:130"},
	inventory_image = "default_emergent_jungle_sapling.png^[colorize:#FFBBFF:130",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 14,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -0.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(600, 3000))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"es:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -7, y = 1, z = -7},
			{x = 7, y = 24, z = 7},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,

	on_timer = function(pos)
		if core.get_node({x = pos.x, y = pos.y-1, z = pos.z}).name == "es:clay_dirt_with_aiden_grass" then
			if enough_height(pos, 23) then
				core.log("action", "A strange sapling grows into a strange tree at ".. core.pos_to_string(pos))
				add_tree(pos, 7, 0, 7, aiden_tree)
			else
				core.get_node_timer(pos):start(math.random(250, 1450))
			end
		else
			core.set_node(pos, {name = "default:dry_shrub"})
		end
	end,
})

core.register_node("es:strange_leaves", {
	description = "Strange Leaves",
	drawtype = leaf_drawtype,
	mesh = "leaf_droop.obj",
	waving = waving_style,
	tiles = {"default_jungle_leaves.png^[colorize:#0000FF:170"..leaf_image("^[transformFY")},
	inventory_image = leaf_image("default_jungle_leaves.png^[colorize:#0000FF:170"),
	wield_image = leaf_image("default_jungle_leaves.png^[colorize:#0000FF:170"),
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 14,
	is_ground_content = false,
	sunlight_propagates = true,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 3,
		items = {
			{items = {"es:sapling"}, rarity = 20},
			{items = {"default:apple"}, rarity = 10},
			{items = {"default:stick"}, rarity = 5},
			{items = {"es:strange_leaves"}},
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

default.register_leafdecay({
	trunks = {"es:aiden_tree"},
	leaves = {"es:strange_leaves"},
	radius = 3,
})

core.register_node("es:dry_shrub", {
	description = "Aiden Shrub",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_dry_shrub.png^[colorize:#00BBFF:180"},
	inventory_image = "default_dry_shrub.png^[colorize:#00BBFF:180",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = default.LIGHT_MAX - 6,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3},
	},
})

core.register_node("es:radia_grass", {
	description = "Radiated Grass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"default_jungle_grass_3.png^[colorize:#8A0808:180"},
	inventory_image = "default_jungle_grass_3.png^[colorize:#8A0808:180",
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	damage_per_second = 1,
	groups = {snappy = 3, flammable = 2, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -.5, -6/16, 6/16, .5, 6/16},
	},
})

core.register_node("es:strange_clay_blue", {
	description = "Strange Clay",
	tiles = {"default_clay.png^[colorize:#00BBFF:180"},
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("es:strange_clay_red", {
	description = "Strange Clay Red",
	--tiles = {"default_clay.png^[colorize:#8A0829:180"},
	tiles = {"default_clay.png^[colorize:#8A0808:180"},
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("es:strange_clay_maroon", {
	description = "Strange Clay Maroon",
	tiles = {"default_clay.png^[colorize:#610B21:180"},
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("es:strange_clay_brown", {
	description = "Strange Clay Brown",
	tiles = {"default_clay.png^[colorize:#61210B:180"},
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("es:strange_clay_orange", {
	description = "Strange Clay Orange",
	tiles = {"default_clay.png^[colorize:#FE642E:180"},
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("es:strange_clay_black", {
	description = "Strange Clay Black",
	tiles = {"default_clay.png^[colorize:#151515:180"},
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("es:strange_clay_grey", {
	description = "Strange Clay Grey",
	tiles = {"default_clay.png^[colorize:#848484:180"},
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("es:toxic_water_source", {
	description = "Toxic Water Source",
	drawtype = "liquid",
	tiles = {{
		name = "es_toxic_water_source_animated.png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.},
		},
		{
		name = "es_toxic_water_source_animated.png",
		backface_culling = true,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.},
	}},
	use_texture_alpha = "blend",
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "es:toxic_water_flowing",
	liquid_alternative_source = "es:toxic_water_source",
	liquid_viscosity = 3,
	liquid_renewable = false,
	liquid_range = 1,
	damage_per_second = 6,
	post_effect_color = {a = 240, r = 105, g = 170, b = 50},
	groups = {water = 3, liquid = 3},
	sounds = default.node_sound_water_defaults(),
})

core.register_node("es:toxic_water_flowing", {
	description = "Toxic Flowing Water",
	drawtype = "flowingliquid",
	tiles = {"es_toxic_water.png"},
	special_tiles = {{
		name = "es_toxic_water_flowing_animated.png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = .8},
		},
		{
		name = "es_toxic_water_flowing_animated.png",
		backface_culling = true,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = .8},
	}},
	use_texture_alpha = "blend",
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "es:toxic_water_flowing",
	liquid_alternative_source = "es:toxic_water_source",
	liquid_viscosity = 2,
	liquid_renewable = false,
	liquid_range = 1,
	damage_per_second = 4,
	post_effect_color = {a = 240, r = 105, g = 170, b = 50},
	groups = {water = 3, liquid = 3, not_in_creative_inventory = 1},
	sounds = default.node_sound_water_defaults(),
})
