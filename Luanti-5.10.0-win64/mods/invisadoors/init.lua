-- Undetectable doors for secret passages

invisadoors = {}

core.register_craftitem("invisadoors:key", {
	description = "Crystal Key",
	inventory_image = "invisadoors_key.png",
	groups = {not_in_creative_inventory = 1},
	stack_max = 2,
})

core.register_craft({
	output = "invisadoors:key 2",
	recipe = {
		{"default:mese_crystal", "default:mese_crystal"},
		{"",	"default:mithril_ingot"}
	}
})

core.register_node("invisadoors:door_open", {
	drawtype = "airlike",
	paramtype = "light",
	diggable = false,
	sunlight_propagates = true,
	walkable = false,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-.4, -.5, -.4, .4, -.4, .4},
	},
	on_blast = function() end,
	groups = {not_in_creative_inventory = 1},
	on_punch = function(pos, node, puncher)
		local wielded = puncher:get_wielded_item():get_name()
		if wielded == "invisadoors:key" then
	local meta = core.get_meta(pos)
	swap_preserved(pos, "invisadoors:door_" ..meta:get_string("door_of"))
	pos.y = pos.y + 1
	if core.get_node(pos).name == "doors:hidden" then
		core.set_node(pos, {name = meta:get_string("door_top_of")})
	end
		end
	end
})

function invisadoors.register(subname, recipeitem, groups, images, description, sounds, light)

	core.register_node("invisadoors:door_" .. subname, {
		description = description.. " Door",
		tiles = images,
		groups = groups,
		sounds = sounds,
		light_source = light,
		on_burn = function(pos)
			if core.get_item_group(core.get_node(pos).name, "flammable") >= 1 then
		core.set_node(pos, {name="fire:basic_flame"})
		core.add_item(pos, "default:mese_crystal")
			end
		end,
		on_punch = function(pos, node, puncher)
			local wielded = puncher:get_wielded_item():get_name()
			if wielded == "invisadoors:key" then
		local meta = core.get_meta(pos)
		meta:set_string("door_of", subname)
		swap_preserved(pos, "invisadoors:door_open")
		pos.y = pos.y + 1
		if core.get_node(pos).name == recipeitem then
			core.set_node(pos, {name = "doors:hidden"})
			meta:set_string("door_top_of", recipeitem)
		end
			end
		end
	})

	core.register_craft({
		type = "shapeless",
		output = "invisadoors:door_" .. subname,
		recipe = {recipeitem, "default:mese_crystal"}
	})

	core.register_craft({
		output = recipeitem,
		recipe = {{"invisadoors:door_" .. subname}},
		replacements = {{"invisadoors:door_" .. subname, "default:mese_crystal"}}
	})
end

invisadoors.register(
	"acacia_trunk",
	"default:acacia_trunk",
	{choppy = 2, flammable = 2},
	{"default_acacia_trunk_top.png", "default_acacia_trunk_top.png", "default_acacia_trunk.png"},
	"Acacia Trunk",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"acacia_wood",
	"default:acacia_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	{"default_acacia_wood.png"},
	"Acacia Wood",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"apple_trunk",
	"default:apple_trunk",
	{choppy = 2, flammable = 2},
	{"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	"Apple Trunk",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"apple_wood",
	"default:apple_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_apple_wood.png"},
	"Apple Wood",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"aspen_trunk",
	"default:aspen_trunk",
	{choppy = 2, flammable = 1},
	{"default_aspen_trunk_top.png", "default_aspen_trunk_top.png", "default_aspen_trunk.png"},
	"Aspen Trunk",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"aspen_wood",
	"default:aspen_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 1},
	{"default_aspen_wood.png"},
	"Aspen Wood",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"beech_trunk",
	"default:beech_trunk",
	{choppy = 2, flammable = 2},
	{"default_beech_trunk_top.png", "default_beech_trunk_top.png", "default_beech_trunk.png"},
	"Beech Trunk",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"wood",
	"default:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_wood.png"},
	"Wood",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"birch_trunk",
	"default:birch_trunk",
	{choppy = 2, flammable = 1},
	{"default_birch_trunk_top.png", "default_birch_trunk_top.png", "default_birch_trunk.png"},
	"Birch Trunk",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"birch_wood",
	"default:birch_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_birch_wood.png"},
	"Birch Wood",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"coco_palm_trunk",
	"default:coco_palm_trunk",
	{choppy = 2, flammable = 2},
	{"default_coco_palm_trunk_top.png", "default_coco_palm_trunk_top.png", "default_coco_palm_trunk.png"},
	"Coco Palm Trunk",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"coco_palm_wood",
	"default:coco_palm_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_coco_palm_wood.png"},
	"Coco Palm Wood",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"jungle_trunk",
	"default:jungle_trunk",
	{choppy = 2, flammable = 2},
	{"default_jungle_trunk_top.png", "default_jungle_trunk_top.png", "default_jungle_trunk.png"},
	"Jungle Trunk",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"jungle_wood",
	"default:jungle_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	{"default_jungle_wood.png"},
	"Jungle Wood",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"mangrove_trunk",
	"default:mangrove_trunk",
	{choppy = 2, flammable = 1},
	{"default_mangrove_trunk_top.png", "default_mangrove_trunk_top.png", "default_mangrove_trunk.png"},
	"Mangrove Trunk",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"mangrove_wood",
	"default:mangrove_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"default_mangrove_wood.png"},
	"Mangrove Wood",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"orange_trunk",
	"default:orange_trunk",
	{choppy = 2, flammable = 2},
	{"default_orange_trunk_top.png", "default_orange_trunk_top.png", "default_apple_trunk.png"},
	"Orange Trunk",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"pine_trunk",
	"default:pine_trunk",
	{choppy = 3, flammable = 3},
	{"default_pine_trunk_top.png", "default_pine_trunk_top.png", "default_pine_trunk.png"},
	"Pinyon Pine Trunk",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"pine_wood",
	"default:pine_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 4},
	{"default_pine_wood.png"},
	"Pine Wood",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"cactus",
	"default:cactus",
	{choppy = 3},
	{"default_cactus_top.png", "default_cactus_top.png", "default_cactus_side.png"},
	"Saguaro Cactus",
	default.node_sound_wood_defaults()
)

invisadoors.register(
	"stone",
	"default:stone",
	{cracky = 3},
	{"default_stone.png"},
	"Stone",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"cobble",
	"default:cobble",
	{cracky = 3},
	{"default_cobble.png"},
	"Cobblestone",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"stone_brick",
	"default:stone_brick",
	{cracky = 2},
	{"default_stone_brick.png"},
	"Stone Brick",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"stone_block",
	"default:stone_block",
	{cracky = 2},
	{"default_stone_block.png"},
	"Stone Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"mossystone",
	"default:mossystone",
	{cracky = 3},
	{"default_stone.png^default_mossy.png"},
	"Mossy Stone",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"mossycobble",
	"default:mossycobble",
	{cracky = 3},
	{"default_mossycobble.png"},
	"Mossy Cobblestone",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"mossystone_brick",
	"default:mossystone_brick",
	{cracky = 2},
	{"default_mossy_stone_brick.png"},
	"Mossy Stone Brick",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"mossystone_block",
	"default:mossystone_block",
	{cracky = 2},
	{"default_stone_block.png^default_mossy.png"},
	"Mossy Stone Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"basalt",
	"default:basalt",
	{cracky = 2},
	{"default_basalt.png"},
	"Basalt",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"desert_stone",
	"default:desert_stone",
	{cracky = 3},
	{"default_desert_stone.png"},
	"Desert Stone",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"desert_cobble",
	"default:desert_cobble",
	{cracky = 3},
	{"default_desert_cobble.png"},
	"Desert Cobblestone",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"desert_stone_brick",
	"default:desert_stone_brick",
	{cracky = 2},
	{"default_desert_stone_brick.png"},
	"Desert Stone Brick",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"desert_stone_block",
	"default:desert_stone_block",
	{cracky = 2},
	{"default_desert_stone_block.png"},
	"Desert Stone Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"pumice",
	"default:pumice",
	{cracky=3, crumbly=2},
	{"default_pumice.png"},
	"Pumice",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"ocean_stone",
	"default:ocean_stone",
	{cracky = 3, cools_lava = 1},
	{"default_ocean_stone.png"},
	"Ocean Stone",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"ocean_cobble",
	"default:ocean_cobble",
	{cracky = 3, cools_lava = 1},
	{"default_ocean_cobble.png"},
	"Ocean Cobblestone",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"ocean_stone_carved",
	"default:ocean_stone_carved",
	{cracky = 2, cools_lava = 1},
	{"default_ocean_stone_carved.png"},
	"Carved Ocean Stone",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"ocean_stone_circular",
	"default:ocean_stone_circular",
	{cracky = 2, cools_lava = 1},
	{"default_ocean_stone_circular.png"},
	"Circular Ocean Stone",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"ocean_stone_pillar",
	"default:ocean_stone_pillar",
	{cracky = 2, cools_lava = 1},
	{"default_ocean_stone_circular.png", "default_ocean_stone_circular.png", "default_ocean_stone_pillar.png"},
	"Ocean Stone Pillar",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"ocean_stone_brick",
	"default:ocean_stone_brick",
	{cracky = 2, cools_lava = 1},
	{"default_ocean_stone_brick.png"},
	"Ocean Stone Brick",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"sandstone",
	"default:sandstone",
	{crumbly = 1, cracky = 3},
	{"default_sandstone.png"},
	"Sandstone",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"sandstone_brick",
	"default:sandstone_brick",
	{cracky = 2},
	{"default_sandstone_brick.png"},
	"Sandstone Brick",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"sandstone_block",
	"default:sandstone_block",
	{cracky = 2},
	{"default_sandstone_block.png"},
	"Sandstone Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"desert_sandstone",
	"default:desert_sandstone",
	{crumbly = 1, cracky = 3},
	{"default_desert_sandstone.png"},
	"Desert Sandstone",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"desert_sandstone_brick",
	"default:desert_sandstone_brick",
	{cracky = 2},
	{"default_desert_sandstone_brick.png"},
	"Desert Sandstone Brick",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"desert_sandstone_block",
	"default:desert_sandstone_block",
	{cracky = 2},
	{"default_desert_sandstone_block.png"},
	"Desert Sandstone Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"silver_sandstone",
	"default:silver_sandstone",
	{crumbly = 1, cracky = 3},
	{"default_silver_sandstone.png"},
	"Silver Sandstone",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"silver_sandstone_brick",
	"default:silver_sandstone_brick",
	{cracky = 2},
	{"default_silver_sandstone_brick.png"},
	"Silver Sandstone Brick",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"silver_sandstone_block",
	"default:silver_sandstone_block",
	{cracky = 2},
	{"default_silver_sandstone_block.png"},
	"Silver Sandstone Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"obsidian",
	"default:obsidian",
	{cracky = 3},
	{"default_obsidian.png"},
	"Obsidian",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"obsidian_brick",
	"default:obsidian_brick",
	{cracky = 2},
	{"default_obsidian_brick.png"},
	"Obsidian Brick",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"obsidian_block",
	"default:obsidian_block",
	{cracky = 2},
	{"default_obsidian_block.png"},
	"Obsidian Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"white_marble",
	"default:white_marble",
	{cracky = 3},
	{"default_white_marble.png"},
	"White Marble",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"white_marble_block",
	"default:white_marble_block",
	{cracky = 2},
	{"default_white_marble_block.png"},
	"White Marble Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"marble",
	"default:marble",
	{cracky = 3},
	{"default_marble.png"},
	"Marble",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"marble_brick",
	"default:marble_brick",
	{cracky = 2},
	{"default_marble_brick.png"},
	"Marble Brick",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"diamite",
	"default:diamite",
	{cracky = 1, level = 2},
	{"default_diamite.png"},
	"Diamite",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"granite",
	"default:granite",
	{cracky = 1, level = 2},
	{"default_granite.png"},
	"Granite",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"bedrock",
	"default:bedrock",
	{cracky = 1, level = 3},
	{"default_bedrock.png"},
	"Bedrock",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"concrete",
	"default:concrete",
	{cracky = 1, level = 2},
	{"technic_concrete_block.png"},
	"Concrete",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"cement_block",
	"default:cement_block",
	{cracky = 2},
	{"basic_materials_cement_block.png"},
	"Cement Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"concrete_block",
	"default:concrete_block",
	{cracky = 1, level = 2},
	{"basic_materials_concrete_block.png"},
	"Concrete Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"brick",
	"default:brick",
	{cracky = 3},
	{"default_brick.png"},
	"Brick Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"wrought_iron_block",
	"default:wrought_iron_block",
	{cracky = 1, level = 2},
	{"default_wrought_iron_block.png"},
	"Wrought Iron Block",
	default.node_sound_metal_defaults()
)

invisadoors.register(
	"cast_iron_block",
	"default:cast_iron_block",
	{cracky = 1, level = 2},
	{"default_cast_iron_block.png"},
	"Cast Iron Block",
	default.node_sound_metal_defaults()
)

invisadoors.register(
	"steel_block",
	"default:steel_block",
	{cracky = 1, level = 2},
	{"default_steel_block.png"},
	"Steel Block",
	default.node_sound_metal_defaults()
)

invisadoors.register(
	"stainless_steel_block",
	"default:stainless_steel_block",
	{cracky = 1, level = 2},
	{"default_stainless_steel_block.png"},
	"Stainless Steel Block",
	default.node_sound_metal_defaults()
)

invisadoors.register(
	"copper_block",
	"default:copper_block",
	{cracky = 1, level = 2},
	{"default_copper_block.png"},
	"Copper Block",
	default.node_sound_metal_defaults()
)

invisadoors.register(
	"tin_block",
	"default:tin_block",
	{cracky = 1, level = 2},
	{"default_tin_block.png"},
	"Tin Block",
	default.node_sound_metal_defaults()
)

invisadoors.register(
	"brass_block",
	"default:brass_block",
	{cracky = 1, level = 2},
	{"default_brass_block.png"},
	"Brass Block",
	default.node_sound_metal_defaults()
)

invisadoors.register(
	"bronze_block",
	"default:bronze_block",
	{cracky = 1, level = 2},
	{"default_bronze_block.png"},
	"Bronze Block",
	default.node_sound_metal_defaults()
)

invisadoors.register(
	"chromium_block",
	"default:chromium_block",
	{cracky = 1, level = 2},
	{"default_chromium_block.png"},
	"Chromium Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"zinc_block",
	"default:zinc_block",
	{cracky = 1, level = 2},
	{"default_zinc_block.png"},
	"Zinc Block",
	default.node_sound_metal_defaults()
)

invisadoors.register(
	"silver_block",
	"default:silver_block",
	{cracky = 1, level = 2},
	{"default_silver_block.png"},
	"Silver Block",
	default.node_sound_metal_defaults()
)

invisadoors.register(
	"gold_block",
	"default:gold_block",
	{cracky = 1},
	{"default_gold_block.png"},
	"Gold Block",
	default.node_sound_metal_defaults()
)

invisadoors.register(
	"mese",
	"default:mese",
	{cracky = 1, level = 2},
	{"default_mese_block.png"},
	"Mese Block",
	default.node_sound_stone_defaults(),
	3
)

invisadoors.register(
	"mithril_block",
	"default:mithril_block",
	{cracky = 1, level = 2},
	{"default_mithril_block.png"},
	"Mithril Block",
	default.node_sound_metal_defaults()
)

invisadoors.register(
	"diamond_block",
	"default:diamond_block",
	{cracky = 1, level = 3},
	{"default_diamond_block.png"},
	"Diamond Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"blue_diamond_block",
	"default:blue_diamond_block",
	{cracky = 1, level = 4},
	{"default_blue_diamond_block.png"},
	"Blue Diamond Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"orichalc_block",
	"default:orichalc_block",
	{cracky = 1, level = 3},
	{"default_orichalc_block.png"},
	"Orichalc Block",
	default.node_sound_metal_defaults()
)

invisadoors.register(
	"crystal_block",
	"default:crystal_block",
	{cracky = 1, level = 2, cools_lava = 1},
	{"crystal_block.png"},
	"Frost Crystal Block",
	default.node_sound_glass_defaults(),
	9
)

invisadoors.register(
	"snow_block",
	"default:snow_block",
	{crumbly = 3, cools_lava = 1, snowy = 1, melttoflo= 1},
	{"default_snow.png"},
	"Snow Block",
	default.node_sound_snow_defaults()
)

invisadoors.register(
	"snow_brick",
	"default:snow_brick",
	{crumbly = 3, cools_lava = 1, snowy = 1, melttoflo= 1},
	{"default_snow_brick.png"},
	"Snow Brick",
	default.node_sound_snow_defaults()
)

invisadoors.register(
	"ice",
	"default:ice",
	{cracky = 3, cools_lava = 1, slippery = 3, icy = 1, melttoflo= 1},
	{"default_ice.png"},
	"Ice",
	default.node_sound_ice_defaults()
)

invisadoors.register(
	"ice_brick",
	"default:ice_brick",
	{cracky = 3, cools_lava = 1, slippery = 3, icy = 1, melttoflo= 1},
	{"default_ice_brick.png"},
	"Ice Brick",
	default.node_sound_ice_defaults()
)

invisadoors.register(
	"ice_block",
	"default:ice_block",
	{cracky = 3, cools_lava = 1, slippery = 3, icy = 1, melttoflo= 1},
	{"default_ice_block.png"},
	"Ice Block",
	default.node_sound_ice_defaults()
)

invisadoors.register(
	"dirt",
	"default:dirt",
	{crumbly = 3},
	{"default_dirt.png"},
	"Dirt",
	default.node_sound_dirt_defaults()
)

invisadoors.register(
	"sand",
	"default:sand",
	{crumbly = 3},
	{"default_sand.png"},
	"Sand",
	default.node_sound_sand_defaults()
)

invisadoors.register(
	"desert_sand",
	"default:desert_sand",
	{crumbly = 3},
	{"default_desert_sand.png"},
	"Desert Sand",
	default.node_sound_sand_defaults()
)

invisadoors.register(
	"silver_sand",
	"default:silver_sand",
	{crumbly = 3},
	{"default_silver_sand.png"},
	"Silver Sand",
	default.node_sound_sand_defaults()
)

invisadoors.register(
	"gravel",
	"default:gravel",
	{crumbly = 2},
	{"default_gravel.png"},
	"Gravel",
	default.node_sound_gravel_defaults()
)

invisadoors.register(
	"silt",
	"default:silt",
	{crumbly = 3},
	{"default_silt.png"},
	"Silt",
	default.node_sound_dirt_defaults()
)

invisadoors.register(
	"clay",
	"default:clay",
	{crumbly = 3},
	{"default_clay.png"},
	"Clay",
	default.node_sound_dirt_defaults()
)

invisadoors.register(
	"terracotta",
	"default:terracotta",
	{crumbly = 3},
	{"terracotta_unfired.png"},
	"Unfired Terracotta Base",
	default.node_sound_dirt_defaults()
)

if core.get_modpath("gems") then
invisadoors.register(
	"lapis_block",
	"gems:lapis_block",
	{cracky = 1, level = 2},
	{"gems_lapislazuli_block.png"},
	"Lapis Lazuli Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"amethyst_block",
	"gems:amethyst_block",
	{cracky = 1},
	{"gems_amethyst_block.png"},
	"Amethyst Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"aquamarine_block",
	"gems:aquamarine_block",
	{cracky = 1},
	{"gems_aquamarine_block.png"},
	"Aquamarine Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"emerald_block",
	"gems:emerald_block",
	{cracky = 1},
	{"gems_emerald_block.png"},
	"Emerald Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"ruby_block",
	"gems:ruby_block",
	{cracky = 1},
	{"gems_ruby_block.png"},
	"Ruby Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"sapphire_block",
	"gems:sapphire_block",
	{cracky = 1},
	{"gems_sapphire_block.png"},
	"Sapphire Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"jade_block",
	"gems:jade_block",
	{cracky = 1},
	{"gems_jade_block.png"},
	"Jade Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"quartz_block",
	"gems:quartz_block",
	{cracky=3, oddly_breakable_by_hand=1},
	{"gems_quartz_block.png"},
	"Quartz Block",
	default.node_sound_glass_defaults()
)

invisadoors.register(
	"quartz_chiseled",
	"gems:quartz_chiseled",
	{cracky=3, oddly_breakable_by_hand=1},
	{"gems_quartz_chiseled.png"},
	"Chiseled Quartz",
	default.node_sound_glass_defaults()
)

invisadoors.register(
	"quartz_pillar",
	"gems:quartz_pillar",
	{cracky=3, oddly_breakable_by_hand=1},
	{"gems_quartz_pillar_top.png", "gems_quartz_pillar_top.png", "gems_quartz_pillar_side.png"},
	"Quartz Pillar",
	default.node_sound_glass_defaults()
)

invisadoors.register(
	"quarloy_block",
	"gems:quarloy_block",
	{cracky = 1, level = 2},
	{"gems_quarloy_block.png"},
	"Quarloy Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"stellarium_block",
	"gems:stellarium_block",
	{cracky = 1, level = 3},
	{"gems_stellarium.png"},
	"Stellarium Block",
	default.node_sound_stone_defaults()
)
end

if core.get_modpath("es") then
invisadoors.register(
	"aikerumblock",
	"es:aikerumblock",
	{cracky=1,level=2},
	{"aikerum_block.png"},
	"Aikerum Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"infiniumblock",
	"es:infiniumblock",
	{cracky=1,level=2},
	{"infinium_block.png"},
	"infinium Block",
	default.node_sound_stone_defaults()
)

invisadoors.register(
	"magentiumblock",
	"es:magentiumblock",
	{cracky=1,level=2, fall_damage_add_percent = -1000},
	{"magentium_block.png"},
	"Magentium Block",
	default.node_sound_stone_defaults(),
	7
)

invisadoors.register(
	"hdsteel_block",
	"es:hdsteel_block",
	{immortal=1},
	{"default_steel_block.png"},
	"High Density Steel Block",
	default.node_sound_stone_defaults()
)
end
