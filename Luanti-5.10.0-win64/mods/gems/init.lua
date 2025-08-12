-- mods/gems/init.lua
-- ===================
-- See LICENSE.txt for licensing and README.md for other information.

-- load support for intllib
local S, NS = dofile(core.get_modpath("gems") .. "/intllib.lua")

-- Items
core.register_craftitem("gems:lapis", {
	description = S("Lapis Lazuli"),
	inventory_image = "gems_lapislazuli.png",
	groups = {gem = 1},
})

core.register_craftitem("gems:amethyst", {
	description = "Amethyst",
	inventory_image = "gems_amethyst.png",
	groups = {gem = 1},
})

core.register_craftitem("gems:aquamarine", {
	description = "Aquamarine",
	inventory_image = "gems_aquamarine.png",
	groups = {gem = 1},
})

core.register_craftitem("gems:emerald", {
	description = "Emerald",
	inventory_image = "gems_emerald.png",
	groups = {gem = 1},
})

core.register_craftitem("gems:ruby", {
	description = "Ruby",
	inventory_image = "gems_ruby.png",
	groups = {gem = 1},
})

core.register_craftitem("gems:sapphire", {
	description = "Sapphire",
	inventory_image = "gems_sapphire.png",
	groups = {gem = 1},
})

core.register_craftitem("gems:jade", {
	description = "Jade",
	inventory_image = "gems_jade.png",
	groups = {gem = 1},
})

core.register_craftitem("gems:quartz_crystal", {
	description = "Quartz Crystal",
	inventory_image = "gems_quartz_crystal.png",
	groups = {gem = 1},
})

core.register_craftitem("gems:quartz_crystal_fragment", {
	description = "Quartz Crystal Fragment",
	inventory_image = "gems_quartz_crystal_fragment.png",
})

core.register_craftitem("gems:garnet", {
	description = "Garnet",
	inventory_image = "gems_garnet.png",
	groups = {gem = 1},
})

core.register_craftitem("gems:opal", {
	description = "Opal",
	inventory_image = "gems_opal.png",
	groups = {gem = 1},
})

-- Ores and blocks
core.register_node("gems:stone_with_lapis", {
	description = S("Lapis Lazuli Ore"),
	tiles = {"default_stone.png^gems_mineral_lapislazuli.png"},
	groups = {cracky=2},
	drop = {
		max_items = 1,
		items = {
			{items = {"gems:lapis 5", "default:rock 4"}, rarity = 9},
			{items = {"gems:lapis 4", "default:rock 5"}, rarity = 6},
			{items = {"gems:lapis 3", "default:rock 6"}, rarity = 3},
			{items = {"gems:lapis 2", "default:rock 7"}},
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:lapis_block", {
	description = S("Lapis Lazuli Block"),
	tiles = {"gems_lapislazuli_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:stone_with_amethyst", {
	description = "Amethyst Ore",
	tiles = {"default_stone.png^gems_mineral_amethyst.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"gems:amethyst 5", "default:rock 4"}, rarity = 9},
			{items = {"gems:amethyst 4", "default:rock 5"}, rarity = 6},
			{items = {"gems:amethyst 3", "default:rock 6"}, rarity = 3},
			{items = {"gems:amethyst 2", "default:rock 7"}},
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:amethyst_block", {
	description = "Amethyst Block",
	tiles = {"gems_amethyst_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:stone_with_aquamarine", {
	description = "Aquamarine Ore",
	tiles = {"default_stone.png^gems_mineral_aquamarine.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"gems:aquamarine 5", "default:rock 4"}, rarity = 9},
			{items = {"gems:aquamarine 4", "default:rock 5"}, rarity = 6},
			{items = {"gems:aquamarine 3", "default:rock 6"}, rarity = 3},
			{items = {"gems:aquamarine 2", "default:rock 7"}},
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:aquamarine_block", {
	description = "Aquamarine Block",
	tiles = {"gems_aquamarine_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:stone_with_emerald", {
	description = "Emerald Ore",
	tiles = {"default_stone.png^gems_mineral_emerald.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"gems:emerald 5", "default:rock 4"}, rarity = 9},
			{items = {"gems:emerald 4", "default:rock 5"}, rarity = 6},
			{items = {"gems:emerald 3", "default:rock 6"}, rarity = 3},
			{items = {"gems:emerald 2", "default:rock 7"}},
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:emerald_block", {
	description = "Emerald Block",
	tiles = {"gems_emerald_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:stone_with_ruby", {
	description = "Ruby Ore",
	tiles = {"default_stone.png^gems_mineral_ruby.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"gems:ruby 5", "default:rock 4"}, rarity = 9},
			{items = {"gems:ruby 4", "default:rock 5"}, rarity = 6},
			{items = {"gems:ruby 3", "default:rock 6"}, rarity = 3},
			{items = {"gems:ruby 2", "default:rock 7"}},
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:ruby_block", {
	description = "Ruby Block",
	tiles = {"gems_ruby_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:stone_with_sapphire", {
	description = "Sapphire Ore",
	tiles = {"default_stone.png^gems_mineral_sapphire.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"gems:sapphire 5", "default:rock 4"}, rarity = 9},
			{items = {"gems:sapphire 4", "default:rock 5"}, rarity = 6},
			{items = {"gems:sapphire 3", "default:rock 6"}, rarity = 3},
			{items = {"gems:sapphire 2", "default:rock 7"}},
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:sapphire_block", {
	description = "Sapphire Block",
	tiles = {"gems_sapphire_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:stone_with_jade", {
	description = "Jade Ore",
	tiles = {"default_stone.png^gems_mineral_jade.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"gems:jade 5", "default:rock 4"}, rarity = 9},
			{items = {"gems:jade 4", "default:rock 5"}, rarity = 6},
			{items = {"gems:jade 3", "default:rock 6"}, rarity = 3},
			{items = {"gems:jade 2", "default:rock 7"}},
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:jade_block", {
	description = "Jade Block",
	tiles = {"gems_jade_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:stone_with_quartz", {
	description = "Quartz Ore",
	tiles = {"default_stone.png^gems_mineral_quartz.png"},
	groups = {cracky = 3},
	drop = {
		max_items = 1,
		items = {
			{items = {"gems:quartz_crystal 3", "default:rock 3"}, rarity = 6},
			{items = {"gems:quartz_crystal 2", "default:rock 5"}, rarity = 3},
			{items = {"gems:quartz_crystal", "default:rock 7"}},
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:quartz_block", {
	description = "Quartz Block",
	tiles = {"gems_quartz_block.png"},
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("gems:quartz_chiseled", {
	description = "Chiseled Quartz",
	tiles = {"gems_quartz_chiseled.png"},
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("gems:quartz_pillar", {
	description = "Quartz Pillar",
	tiles = {"gems_quartz_pillar_top.png", "gems_quartz_pillar_top.png", "gems_quartz_pillar_side.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_glass_defaults(),
	on_place = core.rotate_node
})

core.register_node("gems:stone_with_garnet", {
	description = "Garnet Ore",
	tiles = {"default_stone.png^gems_mineral_garnet.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"gems:garnet 5", "default:rock 4"}, rarity = 9},
			{items = {"gems:garnet 4", "default:rock 5"}, rarity = 6},
			{items = {"gems:garnet 3", "default:rock 6"}, rarity = 3},
			{items = {"gems:garnet 2", "default:rock 7"}},
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:stone_with_opal", {
	description = "Opal Ore",
	tiles = {"default_stone.png^gems_mineral_opal.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"gems:opal 5", "default:rock 4"}, rarity = 9},
			{items = {"gems:opal 4", "default:rock 5"}, rarity = 6},
			{items = {"gems:opal 3", "default:rock 6"}, rarity = 3},
			{items = {"gems:opal 2", "default:rock 7"}},
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:quarloy_block", {
	description = "Quarloy Block",
	tiles = {"gems_quarloy_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:quarloy_pot", {
	description = "Quarloy Flower Pot",
	tiles = {"default_grass.png^gems_quarloy_pot_top.png", "gems_quarloy_block.png"},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

core.register_node("gems:quarstal_block", {
	description = "Quarstal Block",
	tiles = {"gems_quarstal_top.png", "gems_quarstal_top.png", "gems_quarstal_side.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 9,
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("gems:quarstal_spiral_block", {
	description = "Quarstal Spiral Block",
	tiles = {"gems_quarstal_spiral_top.png", "gems_quarstal_spiral_bottom.png", "gems_quarstal_spiral_side.png"},
	paramtype = "light",
	light_source = 9,
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("gems:stellarium_block", {
	description = "Stellarium Block",
	tiles = {"gems_stellarium.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gems:atlanite", {
	description = "Atlanite",
	tiles = {"gems_atlanite.png"},
	paramtype = "light",
	light_source = default.LIGHT_MAX,
	is_ground_content = false,
	on_punch = function(pos, node, puncher)
		if( not( pos ) or not( node ) or not( puncher )) then
			return
		end
		local wielded = puncher:get_wielded_item()

		if wielded:get_count() == 0 then
			puncher:set_hp(puncher:get_hp() + 6)
		end
	end,
	groups = {cracky = 3, level = 2, cools_lava = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("gems:atlanite_glass", {
	description = "Atlanite Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"gems_atlanite_glass.png", "blank.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 1, cools_lava = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("gems:healwater_source", {
	description = "Healing Water Source",
	drawtype = "liquid",
	tiles = {{
		name = "default_water_source_animated.png^[colorize:magenta:130",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.},
		},
		{
		name = "default_water_source_animated.png^[colorize:magenta:130",
		backface_culling = true,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.},
	}},
	use_texture_alpha = "blend",
	light_source = 6,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	damage_per_second = -6,
	liquidtype = "source",
	liquid_alternative_flowing = "gems:healwater_flowing",
	liquid_alternative_source = "gems:healwater_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 120, g = 0, b = 200},
	on_construct = function(pos)
		core.get_node_timer(pos):start(1)
	end,
	on_timer = function(pos)-- The constant bubbling prevents freezing
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local name = core.get_node(above).name
		local nodedef = core.registered_nodes[name]
		if name ~= "ignore" and nodedef and ((nodedef.sunlight_propagates or
			nodedef.paramtype == "light") and nodedef.liquidtype == "none") then
	core.add_particlespawner({
		amount = 10,
		time = 4,
		minpos = {x=pos.x-.5, y=pos.y+.4, z=pos.z-.5},
		maxpos = {x=pos.x+.5, y=pos.y+.5, z=pos.z+.5},
		minvel = {x=0, y=.5, z=0},
		maxvel = {x=0, y=.5, z=0},
		minacc = {x=0, y=.5, z=0},
		maxacc = {x=0, y=.5, z=0},
		exptime = {min = .5, max = 2},
		minsize = .3,
		maxsize = .6,
		texture = "fairy_spark.png",
		glow = 9 })
		end
		core.get_node_timer(pos):start(math.random(3,5))
	end,
	groups = {water = 3, liquid = 3, cools_lava = 1, timer_check = 1},
	sounds = default.node_sound_water_defaults(),
})

core.register_node("gems:healwater_flowing", {
	description = "Flowing Healing Water",
	drawtype = "flowingliquid",
	tiles = {"default_water.png^[colorize:magenta:130"},
	special_tiles = {{
		name = "default_water_flowing_animated.png^[colorize:magenta:130",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = .5},
		},
		{
		name = "default_water_flowing_animated.png^[colorize:magenta:130",
		backface_culling = true,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = .5},
	}},
	use_texture_alpha = "blend",
	light_source = 6,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	damage_per_second = -6,
	liquidtype = "flowing",
	liquid_alternative_flowing = "gems:healwater_flowing",
	liquid_alternative_source = "gems:healwater_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 120, g = 0, b = 200},
	on_construct = function(pos)
		core.get_node_timer(pos):start(1)
	end,
	on_timer = function(pos)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local name = core.get_node(above).name
		local nodedef = core.registered_nodes[name]
		if name ~= "ignore" and nodedef and ((nodedef.sunlight_propagates or
			nodedef.paramtype == "light") and nodedef.liquidtype == "none") then
	local p2 = core.get_node(pos).param2
	local by = 10
	if p2 > 10 then
		by = 60
	end
	core.add_particlespawner({
		amount = 10,
		time = 4,
		minpos = {x=pos.x-.5, y=pos.y-.5+(p2/by), z=pos.z-.5},
		maxpos = {x=pos.x+.5, y=pos.y-.4+(p2/by), z=pos.z+.5},
		minvel = {x=0, y=.5, z=0},
		maxvel = {x=0, y=.5, z=0},
		minacc = {x=0, y=.5, z=0},
		maxacc = {x=0, y=.5, z=0},
		exptime = {min = .5, max = 2},
		minsize = .3,
		maxsize = .6,
		texture = "fairy_spark.png",
		glow = 9 })
		end
		core.get_node_timer(pos):start(math.random(3,5))
	end,
	groups = {water = 3, liquid = 3, cools_lava = 1, timer_check = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_water_defaults(),
})

bucket.register_liquid(
	"gems:healwater_source",
	"gems:healwater_flowing",
	"gems:bucket_healwater",
	"bucket_healwater.png",
	"Healing Water Bucket",
	{tool = 1, water_bucket = 1},
	false,
	default.LIGHT_MAX - 6
)

-- Crafting
register_nine("gems:lapis_block", "gems:lapis")
register_nine("gems:amethyst_block", "gems:amethyst")
register_nine("gems:aquamarine_block", "gems:aquamarine")
register_nine("gems:emerald_block", "gems:emerald")
register_nine("gems:ruby_block", "gems:ruby")
register_nine("gems:sapphire_block", "gems:sapphire")
register_nine("gems:jade_block", "gems:jade")
register_nine("gems:quartz_crystal", "gems:quartz_crystal_fragment")

-- Blue dye crafting
core.register_craft({
	output = "dye:blue 2",
	recipe = {{"gems:lapis"}}
})

core.register_craft({
	output = "gems:quartz_block 4",
	recipe = {
		{"gems:quartz_crystal", "gems:quartz_crystal"},
		{"gems:quartz_crystal", "gems:quartz_crystal"}
	}
})

core.register_craft({
	output = "gems:quartz_crystal 4",
	recipe = {{"gems:quartz_block"}}
})

core.register_craft({
	output = "gems:quartz_chiseled 2",
	recipe = {
		{"stairs:slab_quartz_block", "stairs:slab_quartz_block"},
		{"stairs:slab_quartz_block", "stairs:slab_quartz_block"}
	}
})

core.register_craft({
	output = "gems:quartz_pillar 2",
	recipe = {
		{"gems:quartz_block"},
		{"gems:quartz_block"},
	}
})

core.register_craft({
	type = "shapeless",
	output = "gems:quarloy_block 4",
	recipe = {"default:diamite_dust", "gems:quartz_crystal", "gems:quartz_crystal", "gems:quartz_crystal"},
})

core.register_craft({
	output = "gems:quarloy_pot 3",
	recipe = {{"gems:quarloy_block", "default:dirt_with_grass", "gems:quarloy_block"}}
})

core.register_craft({
	output = "gems:quarloy_block 2",
	recipe = {{"gems:quarloy_pot", "gems:quarloy_pot", "gems:quarloy_pot"}},
	replacements = {{"gems:quarloy_pot", "default:dirt_with_grass"}}
})

core.register_craft({
	output = "gems:quarstal_block 3",
	recipe = {
		{"gems:quartz_crystal", "default:crystal_spike"},
		{"gems:quartz_crystal", "default:crystal_spike"}
	}
})

core.register_craft({
	output = "gems:quarstal_spiral_block 3",
	recipe = {
		{"gems:quartz_crystal", "default:crystal_spike"},
		{"default:crystal_spike", "gems:quartz_crystal"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "gems:stellarium_block 4",
	recipe = {"default:zinc_block", "gems:quartz_crystal", "gems:quartz_crystal", "default:steel_block"},
})

core.register_craft({
	type = "shapeless",
	output = "gems:atlanite",
	recipe = {"nether:glowstone", "default:ocealite_crystal", "default:blue_diamond"},
})

core.register_craft({
	type = "shapeless",
	output = "default:plasma_cannon",
	recipe = {"default:plasma_cannon", "gems:atlanite"},
	replacements = {{"gems:atlanite", "gems:atlanite"}}
})

core.register_craft({
	output = "gems:atlanite_glass 9",
	recipe = {
		{"default:glass", "default:glass", "default:glass"},
		{"default:glass", "gems:atlanite", "default:glass"},
		{"default:glass", "default:glass", "default:glass"},
	}
})

core.register_craft({
	output = "gems:healwater_source 8",
	recipe = {
		{"group:fresh_water_bucket", "group:fresh_water_bucket", "group:fresh_water_bucket"},
		{"group:fresh_water_bucket", "es:magentium_lump", "group:fresh_water_bucket"},
		{"group:fresh_water_bucket", "group:fresh_water_bucket", "group:fresh_water_bucket"}
	},
	replacements = {
		{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
		{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
		{"bucket:bucket_fresh_water", "bucket:bucket_empty"},
		{"bucket:bucket_fresh_water", "bucket:bucket_empty"},
		{"bucket:bucket_fresh_water", "bucket:bucket_empty"},
		{"bucket:bucket_fresh_water", "bucket:bucket_empty"},
		{"bucket:bucket_fresh_water", "bucket:bucket_empty"},
		{"bucket:bucket_fresh_water", "bucket:bucket_empty"},
		{"bucket:bucket_fresh_water", "bucket:bucket_empty"},
		{"bucket:bucket_fresh_water", "bucket:bucket_empty"}
	}
})

if core.get_modpath("moreblocks") then
stairsplus:register_all("gems", "lapis_block", "gems:lapis_block", {
	description = S("Lapis Lazuli Block"),
	tiles = {"gems_lapislazuli_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("gems", "amethyst_block", "gems:amethyst_block", {
	description = "Amethyst Block",
	tiles = {"gems_amethyst_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("gems", "aquamarine_block", "gems:aquamarine_block", {
	description = "Aquamarine Block",
	tiles = {"gems_aquamarine_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("gems", "emerald_block", "gems:emerald_block", {
	description = "Emerald Block",
	tiles = {"gems_emerald_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("gems", "ruby_block", "gems:ruby_block", {
	description = "Ruby Block",
	tiles = {"gems_ruby_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("gems", "sapphire_block", "gems:sapphire_block", {
	description = "Sapphire Block",
	tiles = {"gems_sapphire_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("gems", "jade_block", "gems:jade_block", {
	description = "Jade Block",
	tiles = {"gems_jade_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("gems", "quartz_block", "gems:quartz_block", {
	description = "Quartz Block",
	tiles = {"gems_quartz_block.png"},
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_glass_defaults(),
})

stairsplus:register_all("gems", "quartz_chiseled", "gems:quartz_chiseled", {
	description = "Chiseled Quartz",
	tiles = {"gems_quartz_chiseled.png"},
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_glass_defaults(),
})

stairsplus:register_all("gems", "quartz_pillar", "gems:quartz_pillar", {
	description = "Quartz Pillar",
	tiles = {"gems_quartz_pillar_top.png", "gems_quartz_pillar_top.png", "gems_quartz_pillar_side.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_glass_defaults(),
	on_place = core.rotate_node
})

stairsplus:register_all("gems", "quarloy_block", "gems:quarloy_block", {
	description = "Quarloy Block",
	tiles = {"gems_quarloy_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("gems", "quarstal_block", "gems:quarstal_block", {
	description = "Quarstal Block",
	tiles = {"gems_quarstal_top.png", "gems_quarstal_top.png", "gems_quarstal_side.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 9,
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_glass_defaults(),
})

core.override_item("gems:slope_quarstal_block_cylinder", {tiles = {"gems_quarstal_top.png", "gems_quarstal_top.png", "gems_quarstal_cylinder_side.png"}})
core.override_item("gems:slope_quarstal_block_sphere", {tiles = {"gems_quarstal_cylinder_side.png"}})

stairsplus:register_all("gems", "quarstal_spiral_block", "gems:quarstal_spiral_block", {
	description = "Quarstal Spiral Block",
	tiles = {"gems_quarstal_spiral_top.png", "gems_quarstal_spiral_bottom.png", "gems_quarstal_spiral_side.png"},
	paramtype = "light",
	light_source = 9,
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_glass_defaults(),
})

core.override_item("gems:slope_quarstal_spiral_block_cylinder", {
	tiles = {"gems_quarstal_spiral_top.png", "gems_quarstal_spiral_bottom.png", "gems_quarstal_spiral_cylinder_side.png"}})
core.override_item("gems:slope_quarstal_spiral_block_sphere", {tiles = {"gems_quarstal_spiral_cylinder_side.png"}})

stairsplus:register_all("gems", "stellarium_block", "gems:stellarium_block", {
	description = "Stellarium Block",
	tiles = {"gems_stellarium.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("gems", "atlanite", "gems:atlanite", {
	description = "Atlanite",
	tiles = {"gems_atlanite.png"},
	paramtype = "light",
	light_source = default.LIGHT_MAX,
	is_ground_content = false,
	on_punch = function(pos, node, puncher)
		if( not( pos ) or not( node ) or not( puncher )) then
			return
		end
		local wielded = puncher:get_wielded_item()

		if wielded:get_count() == 0 then
			puncher:set_hp(puncher:get_hp() + 6)
		end
	end,
	groups = {cracky = 3, level = 2, cools_lava = 1},
	sounds = default.node_sound_glass_defaults(),
})

stairsplus:register_all("gems", "atlanite_glass", "gems:atlanite_glass", {
	description = "Atlanite Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"gems_atlanite_glass.png", "blank.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 1, cools_lava = 1},
	sounds = default.node_sound_glass_defaults(),
})
end

stairs.register_stair_and_slab("lapis_block", "gems:lapis_block", {cracky = 1, level = 2}, {"gems_lapislazuli_block.png"},
	"Lapis Lazuli Block Stair", "Lapis Lazuli Block Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("amethyst_block", "gems:amethyst_block", {cracky = 1}, {"gems_amethyst_block.png"},
	"Amethyst Block Stair", "Amethyst Block Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("aquamarine_block", "gems:aquamarine_block", {cracky = 1}, {"gems_aquamarine_block.png"},
	"Aquamarine Block Stair", "Aquamarine Block Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("emerald_block", "gems:emerald_block", {cracky = 1}, {"gems_emerald_block.png"},
	"Emerald Block Stair", "Emerald Block Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("ruby_block", "gems:ruby_block", {cracky = 1}, {"gems_ruby_block.png"},
	"Ruby Block Stair", "Ruby Block Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("sapphire_block", "gems:sapphire_block", {cracky = 1}, {"gems_sapphire_block.png"},
	"Sapphire Block Stair", "Sapphire Block Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("jade_block", "gems:jade_block", {cracky = 1}, {"gems_jade_block.png"},
	"Jade Block Stair", "Jade Block Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("quartz_block", "gems:quartz_block", {cracky = 3, oddly_breakable_by_hand = 1}, {"gems_quartz_block.png"},
	"Quartz Block Stair", "Quartz Block Slab", default.node_sound_glass_defaults(), true)

stairs.register_stair_and_slab("quartz_chiseled", "gems:quartz_chiseled", {cracky = 3, oddly_breakable_by_hand = 1}, {"gems_quartz_chiseled.png"},
	"Chiseled Quartz Stair", "Chiseled Quartz Slab", default.node_sound_glass_defaults(), true)

stairs.register_stair_and_slab("quartz_pillar", "gems:quartz_pillar", {cracky = 3, oddly_breakable_by_hand = 1},
	{"gems_quartz_pillar_top.png", "gems_quartz_pillar_top.png", "gems_quartz_pillar_side.png"},
	"Quartz Pillar Stair", "Quartz Pillar Slab", default.node_sound_glass_defaults(), true)

stairs.register_stair_and_slab("quarloy_block", "gems:quarloy_block", {cracky = 1, level = 2}, {"gems_quarloy_block.png"},
	"Quarloy Block Stair", "Quarloy Block Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("quarstal_block", "gems:quarstal_block", {cracky = 1, level = 2}, {"gems_quarstal_top.png", "gems_quarstal_top.png", "gems_quarstal_side.png"},
	"Quarstal Block Stair", "Quarstal Block Slab", default.node_sound_glass_defaults(), true)

stairs.register_stair_and_slab("quarstal_spiral_block", "gems:quarstal_spiral_block", {cracky = 1, level = 2},
	{"gems_quarstal_spiral_top.png", "gems_quarstal_spiral_bottom.png", "gems_quarstal_spiral_side.png"},
	"Quarstal Spiral Block Stair", "Quarstal Spiral Block Slab", default.node_sound_glass_defaults(), true)

stairs.register_stair_and_slab("stellarium_block", "gems:stellarium_block", {cracky = 1, level = 3}, {"gems_stellarium.png"},
	"Stellarium Block Stair", "Stellarium Block Slab", default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("atlanite", "gems:atlanite", {cracky = 3, level = 2, cools_lava = 1}, {"gems_atlanite.png"},
	"Atlanite Stair", "Atlanite Slab", default.node_sound_glass_defaults(), true)

stairs.register_stair_and_slab("atlanite_glass", "gems:atlanite_glass", {cracky = 3, oddly_breakable_by_hand = 1, cools_lava = 1}, {"gems_atlanite_glass.png"},
	"Atlanite Glass Stair", "Atlanite Glass Slab", default.node_sound_glass_defaults(), true)

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
local BasicStones = {"default:stone", "default:diamite", "default:bedrock"}

-- Ore generation
core.register_ore({
	ore_type		= "scatter",
	ore				= "gems:stone_with_lapis",
	wherein			= BasicStones,
	clust_scarcity	= 16 * 16 * 16,
	clust_num_ores	= 5,
	clust_size		= 3,
	y_max			= -128,
	y_min			= -255,
})

core.register_ore({
	ore_type		= "scatter",
	ore				= "gems:stone_with_lapis",
	wherein			= BasicStones,
	clust_scarcity	= 15 * 15 * 15,
	clust_num_ores	= 6,
	clust_size		= 4,
	y_max			= -256,
	y_min			= -31000,
})

core.register_ore({
	ore_type		= "scatter",
	ore				= "gems:stone_with_amethyst",
	wherein			= BasicStones,
	clust_scarcity	= 13 * 13 * 13,
	clust_num_ores	= 5,
	clust_size		= 3,
	y_max			= -50,
	y_min			= -31000,
})

core.register_ore({
	ore_type		= "scatter",
	ore				= "gems:stone_with_aquamarine",
	wherein			= BasicStones,
	clust_scarcity	= 7 * 7 * 7,
	clust_num_ores	= 1,
	clust_size		= 1,
	y_max			= -128,
	y_min			= -31000,
})

core.register_ore({
	ore_type		= "scatter",
	ore				= "gems:stone_with_emerald",
	wherein			= BasicStones,
	clust_scarcity	= 9 * 9 * 9,
	clust_num_ores	= 5,
	clust_size		= 3,
	y_max			= 31000,
	y_min			= 1025,
})

core.register_ore({
	ore_type		= "scatter",
	ore				= "gems:stone_with_emerald",
	wherein			= BasicStones,
	clust_scarcity	= 12 * 12 * 12,
	clust_num_ores	= 4,
	clust_size		= 3,
	y_max			= -16,
	y_min			= -63,
})

core.register_ore({
	ore_type		= "scatter",
	ore				= "gems:stone_with_emerald",
	wherein			= BasicStones,
	clust_scarcity	= 9 * 9 * 9,
	clust_num_ores	= 5,
	clust_size		= 3,
	y_max			= -64,
	y_min			= -31000,
})

core.register_ore({
	ore_type		= "scatter",
	ore				= "gems:stone_with_ruby",
	wherein			= BasicStones,
	clust_scarcity	= 13 * 13 * 13,
	clust_num_ores	= 5,
	clust_size		= 3,
	y_max			= -500,
	y_min			= -31000,
})

core.register_ore({
	ore_type		= "scatter",
	ore				= "gems:stone_with_sapphire",
	wherein			= BasicStones,
	clust_scarcity	= 13 * 13 * 13,
	clust_num_ores	= 5,
	clust_size		= 3,
	y_max			= -200,
	y_min			= -31000,
})

core.register_ore({
	ore_type		= "scatter",
	ore				= "gems:stone_with_jade",
	wherein			= BasicStones,
	clust_scarcity	= 14 * 14 * 14,
	clust_num_ores	= 5,
	clust_size		= 4,
	y_max			= -70,
	y_min			= -7000,
})

core.register_ore({
	ore_type		= "scatter",
	ore				= "gems:stone_with_quartz",
	wherein			= BasicStones,
	clust_scarcity	= 10 * 10 * 10,
	clust_num_ores	= 6,
	clust_size		= 5,
	y_max			= -5,
	y_min			= -31000,
})

core.register_ore({
	ore_type		= "scatter",
	ore				= "gems:stone_with_garnet",
	wherein			= BasicStones,
	clust_scarcity	= 15 * 15 * 15,
	clust_num_ores	= 6,
	clust_size		= 4,
	y_max			= -65,
	y_min			= -31000,
})

core.register_ore({
	ore_type		= "scatter",
	ore				= "gems:stone_with_opal",
	wherein			= BasicStones,
	clust_scarcity	= 15 * 15 * 15,
	clust_num_ores	= 6,
	clust_size		= 4,
	y_max			= -500,
	y_min			= -31000,
})
end
