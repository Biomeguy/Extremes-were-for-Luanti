-- CaveRealms nodes.lua

--glowing crystal
core.register_node("caverealms:glow_crystal", {
	description = "Glow Sapphire",
	drawtype = "glasslike",
	tiles = {"caverealms_glow_crystal.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	light_source = 13,
	sunlight_propagates = true,
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

--glowing emerald
core.register_node("caverealms:glow_emerald", {
	description = "Glow Emerald",
	drawtype = "glasslike",
	tiles = {"caverealms_glow_emerald.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	light_source = 13,
	sunlight_propagates = true,
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

--glowing mese crystal blocks
core.register_node("caverealms:glow_mese", {
	description = "Glow Mese Crystal",
	drawtype = "glasslike",
	tiles = {"caverealms_glow_mese.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	light_source = 13,
	sunlight_propagates = true,
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

--glowing ruby
core.register_node("caverealms:glow_ruby", {
	description = "Glow Ruby",
	drawtype = "glasslike",
	tiles = {"caverealms_glow_ruby.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	light_source = 13,
	sunlight_propagates = true,
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

--glowing amethyst
core.register_node("caverealms:glow_amethyst", {
	description = "Glow Amethyst",
	drawtype = "glasslike",
	tiles = {"caverealms_glow_amethyst.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	light_source = 13,
	sunlight_propagates = true,
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

--embedded crystal
core.register_node("caverealms:glow_ore", {
	description = "Glow Crystal Ore",
	tiles = {"caverealms_glow_ore.png"},
	paramtype = "light",
	light_source = 10,
	groups = {cracky=2},
	sounds = default.node_sound_glass_defaults(),
})

--embedded emerald
core.register_node("caverealms:glow_emerald_ore", {
	description = "Glow Emerald Ore",
	tiles = {"caverealms_glow_emerald_ore.png"},
	paramtype = "light",
	light_source = 10,
	groups = {cracky=2},
	sounds = default.node_sound_glass_defaults(),
})

--embedded ruby
core.register_node("caverealms:glow_ruby_ore", {
	description = "Glow Ruby Ore",
	tiles = {"caverealms_glow_ruby_ore.png"},
	paramtype = "light",
	light_source = 10,
	groups = {cracky=2},
	sounds = default.node_sound_glass_defaults(),
})

--embedded amethyst
core.register_node("caverealms:glow_amethyst_ore", {
	description = "Glow Amethyst Ore",
	tiles = {"caverealms_glow_amethyst_ore.png"},
	paramtype = "light",
	light_source = 10,
	groups = {cracky=2},
	sounds = default.node_sound_glass_defaults(),
})

--thin (transparent) ice
core.register_node("caverealms:thin_ice", {
	description = "Thin Ice",
	drawtype = "glasslike",
	tiles = {"caverealms_thin_ice.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	sunlight_propagates = true,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {cracky=2, cools_lava = 1, slippery = 3, icy = 1},
	sounds = default.node_sound_glass_defaults(),
})

--salt crystal
core.register_node("caverealms:salt_crystal", {
	description = "Salt Crystal",
	drawtype = "glasslike",
	tiles = {"caverealms_salt_crystal.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	light_source = 11,
	sunlight_propagates = true,
	groups = {cracky=2},
	sounds = default.node_sound_glass_defaults(),
})

--glowing crystal gem
core.register_node("caverealms:glow_gem", {
	description = "Glow Gem",
	drawtype = "plantlike",
	tiles = {"caverealms_glow_gem.png"},
	inventory_image = "caverealms_glow_gem.png",
	wield_image = "caverealms_glow_gem.png",
	paramtype = "light",
	light_source = 11,
	--visual_scale = .75,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -5/16, .5}
	},
	groups = {cracky = 3, oddly_breakable_by_hand = 1, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

--glowing salt gem
core.register_node("caverealms:salt_gem", {
	description = "Salt Gem",
	drawtype = "plantlike",
	tiles = {"caverealms_salt_gem.png"},
	inventory_image = "caverealms_salt_gem.png",
	wield_image = "caverealms_salt_gem.png",
	paramtype = "light",
	light_source = 11,
	--visual_scale = .75,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -5/16, .5}
	},
	groups = {cracky = 3, oddly_breakable_by_hand = 1, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

--stone spike
core.register_node("caverealms:spike", {
	description = "Stone Spike",
	drawtype = "plantlike",
	tiles = {"caverealms_spike.png"},
	inventory_image = "caverealms_spike.png",
	wield_image = "caverealms_spike.png",
	paramtype = "light",
	light_source = 3,
	--visual_scale = .75,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -5/16, .5}
	},
	groups = {cracky = 3, oddly_breakable_by_hand = 1, attached_node = 1},
	sounds = default.node_sound_stone_defaults(),
})


--upward pointing icicle
core.register_node("caverealms:icicle_up", {
	description = "Icicle",
	drawtype = "plantlike",
	tiles = {"caverealms_icicle_up.png"},
	inventory_image = "caverealms_icicle_up.png",
	wield_image = "caverealms_icicle_up.png",
	paramtype = "light",
	light_source = 8,
	walkable = false,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.2, .3}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {cracky=3, oddly_breakable_by_hand=1, icy= 1},
	sounds = default.node_sound_glass_defaults(),
})

--downward pointing icicle
core.register_node("caverealms:icicle_down", {
	description = "Icicle",
	drawtype = "plantlike",
	tiles = {"caverealms_icicle_down.png"},
	inventory_image = "caverealms_icicle_down.png",
	wield_image = "caverealms_icicle_down.png",
	paramtype = "light",
	light_source = 8,
	walkable = false,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, .5, -.3, .3, .2, .3}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {cracky=3, oddly_breakable_by_hand=1, icy= 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("caverealms:icicle", {
	description = "Icicle",
	drawtype = "plantlike",
	tiles = {"mapgen_icicle.png"},
	inventory_image = "mapgen_icicle.png",
	wield_image = "mapgen_icicle.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, .2, -.3, .3, .5, .3}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {cracky=3, oddly_breakable_by_hand=2, icy= 1},
	sounds = default.node_sound_ice_defaults(),
})

core.register_node("caverealms:rocks_with_moss", {
	description = "Cave Stones with Moss",
	tiles = {"default_rocks.png^caverealms_moss.png", "default_rocks.png", "default_rocks.png^caverealms_moss_side.png"},
	groups = {crumbly=1, cracky=3},
	drop = 'default:rocks',
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_crumbly", gain = .2},
		dug = {name = "default_hard_footstep", gain = 1.},
		footstep = {name="default_grass_footstep", gain=.13}
	}),
})

core.register_node("caverealms:rocks_with_lichen", {
	description = "Cave Stones with Purple Lichen",
	tiles = {"ethereal_grass_mushroom_top.png^caverealms_lichen.png", "default_rocks.png",
		"default_rocks.png^ethereal_grass_mushroom_side.png^caverealms_lichen_side.png"},
	groups = {crumbly=1, cracky=3},
	drop = 'default:rocks',
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_hard_footstep", gain = 1.},
		footstep = {name="default_grass_footstep", gain=.25}
	}),
})

core.register_node("caverealms:dirt_with_mushroom_grass", {
	description = "Dirt with mushroom grass",
	tiles = {"caverealms_ground_top.png", "default_dirt.png",
		{name = "default_dirt.png^caverealms_ground_side.png", tileable_vertical = false}},
	groups = {crumbly=3},
	sounds = default.node_sound_dirt_defaults(),
	drop = 'default:dirt'
})

core.register_node("caverealms:rocks_with_algae", {
	description = "Cave Stones with Algae",
	tiles = {"default_rocks.png^caverealms_algae.png", "default_rocks.png", "default_rocks.png^caverealms_algae_side.png"},
	groups = {crumbly=1, cracky=3},
	drop = 'default:rocks',
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_hard_footstep", gain = 1.},
		footstep = {name="default_grass_footstep", gain=.18}
	}),
})

core.register_node("caverealms:stone_with_salt", {
	description = "Clear Salt Crystal",
	drawtype = "glasslike",
	tiles = {"caverealms_salty2.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	light_source = 9,
	sunlight_propagates = true,
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

--Hot Cobble - cobble with lava instead of mortar XD
core.register_node("caverealms:hot_cobble", {
	description = "Hot Cobble",
	tiles = {"caverealms_hot_cobble.png"},
	paramtype = "light",
	light_source = 3,
	damage_per_second = 1,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = function(pos, elapsed)
		local melts = core.find_node_near(pos, 1, {"group:icy", "group:snowy"})
		if melts then
			default.melt_near_heat(melts)
		end
	end,
	groups = {cracky=1, hot=1, unbreakable = 1},
	sounds = default.node_sound_stone_defaults({
		footstep = {name="default_stone_footstep", gain=.25},
	}),
})

--Glow Obsidian - has traces of ocealite_crystal_fragment inside
core.register_node("caverealms:glow_obsidian", {
	description = "Glowing Obsidian",
	tiles = {"caverealms_glow_obsidian.png"},
	paramtype = "light",
	light_source = 7,
	groups = {cracky=1, level=2},
	sounds = default.node_sound_stone_defaults({
		footstep = {name="default_stone_footstep", gain=.25},
	}),
})

--Glow Obsidian 2 - has traces of lava
core.register_node("caverealms:glow_obsidian_2", {
	description = "Hot Glowing Obsidian",
	tiles = {"caverealms_glow_obsidian2.png"},
	paramtype = "light",
	light_source = 9,
	damage_per_second = 1,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = function(pos, elapsed)
		local meta = core.get_meta(pos)
		local melts = core.find_node_near(pos, 1, {"group:icy", "group:snowy"})
		if meta:get_int("checked_near") < 1 then
			if melts then
				default.melt_near_heat(melts)
			end
			meta:set_int("checked_near", meta:get_int("checked_near")+1)
			core.get_node_timer(pos):start(math.random(45, 95))
		else
			if not core.find_node_near(pos, 1, "group:lava") then
				core.set_node(pos, {name = "caverealms:glow_obsidian"})
			else
				core.set_node(pos, {name = "caverealms:glow_obsidian_2"})
				meta:set_int("checked_near", meta:get_int("checked_near")-1)
				core.get_node_timer(pos):start(math.random(50, 100))
			end
		end
	end,
	on_punch = function(pos, node, puncher)
		if( not( pos ) or not( node ) or not( puncher )) then
			return
		end
		local wielded = puncher:get_wielded_item()

		if wielded:get_count() == 0 then
			puncher:set_hp(puncher:get_hp() - 3)
		end
	end,
	groups = {cracky=1, hot=1, level=2},
	sounds = default.node_sound_stone_defaults({
		footstep = {name="default_stone_footstep", gain=.25},
	}),
})

--Glow Obsidian Bricks
core.register_node("caverealms:glow_obsidian_brick", {
	description = "Glow Obsidian Brick",
	tiles = {"caverealms_glow_obsidian_brick.png"},
	light_source = 7,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("caverealms:glow_obsidian_brick_2", {
	description = "Glow Obsidian Brick",
	tiles = {"caverealms_glow_obsidian_brick_2.png"},
	paramtype = "light",
	light_source = 9,
	damage_per_second = 1,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = function(pos, elapsed)
		local meta = core.get_meta(pos)
		local melts = core.find_node_near(pos, 1, {"group:icy", "group:snowy"})
		if meta:get_int("checked_near") < 1 then
			if melts then
				default.melt_near_heat(melts)
			end
			meta:set_int("checked_near", meta:get_int("checked_near")+1)
			core.get_node_timer(pos):start(math.random(45, 95))
		else
			if not core.find_node_near(pos, 1, "group:lava") then
				core.set_node(pos, {name = "caverealms:glow_obsidian_brick"})
			else
				core.set_node(pos, {name = "caverealms:glow_obsidian_brick_2"})
				meta:set_int("checked_near", meta:get_int("checked_near")-1)
				core.get_node_timer(pos):start(math.random(50, 100))
			end
		end
	end,
	on_punch = function(pos, node, puncher)
		if( not( pos ) or not( node ) or not( puncher )) then
			return
		end
		local wielded = puncher:get_wielded_item()

		if wielded:get_count() == 0 then
			puncher:set_hp(puncher:get_hp() - 3)
		end
	end,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

if core.get_modpath("moreblocks") then
	stairsplus:register_all("caverealms", "glow_crystal", "caverealms:glow_crystal", {
		description = "Glow Sapphire",
		tiles = {"caverealms_glow_crystal.png"},
		paramtype="light",
		light_source = 12,
		use_texture_alpha = "blend",
		sunlight_propagates = true,
		groups = {cracky=3},
		sounds = default.node_sound_glass_defaults(),
	})

	stairsplus:register_all("caverealms", "glow_emerald", "caverealms:glow_emerald", {
		description = "Glow Emerald",
		tiles = {"caverealms_glow_emerald.png"},
		paramtype="light",
		light_source = 12,
		use_texture_alpha = "blend",
		sunlight_propagates = true,
		groups = {cracky=3},
		sounds = default.node_sound_glass_defaults(),
	})

	stairsplus:register_all("caverealms", "glow_mese", "caverealms:glow_mese", {
		description = "Glow Mese",
		tiles = {"caverealms_glow_mese.png"},
		paramtype="light",
		light_source = 12,
		use_texture_alpha = "blend",
		sunlight_propagates = true,
		groups = {cracky=3},
		sounds = default.node_sound_glass_defaults(),
	})

	stairsplus:register_all("caverealms", "glow_ruby", "caverealms:glow_ruby", {
		description = "Glow Ruby",
		tiles = {"caverealms_glow_ruby.png"},
		paramtype="light",
		light_source = 12,
		use_texture_alpha = "blend",
		sunlight_propagates = true,
		groups = {cracky=3},
		sounds = default.node_sound_glass_defaults(),
	})

	stairsplus:register_all("caverealms", "glow_amethyst", "caverealms:glow_amethyst", {
		description = "Glow Amethyst",
		tiles = {"caverealms_glow_amethyst.png"},
		paramtype="light",
		light_source = 12,
		use_texture_alpha = "blend",
		sunlight_propagates = true,
		groups = {cracky=3},
		sounds = default.node_sound_glass_defaults(),
	})

	stairsplus:register_all("caverealms", "salt_crystal", "caverealms:salt_crystal", {
		description = "Salt Crystal",
		tiles = {"caverealms_salt_crystal.png"},
		paramtype="light",
		light_source = 9,
		use_texture_alpha = "blend",
		sunlight_propagates = true,
		groups = {cracky=2},
		sounds = default.node_sound_glass_defaults(),
	})
end
stairs.register_stair_and_slab("glow_crystal", "caverealms:glow_crystal",
	{cracky = 3}, {"caverealms_glow_crystal.png"},
	"Glow Sapphire Stair", "Glow Sapphire Slab", default.node_sound_glass_defaults(), true)

stairs.register_stair_and_slab("glow_emerald", "caverealms:glow_emerald",
	{cracky = 3}, {"caverealms_glow_emerald.png"},
	"Glow Emerald Stair", "Glow Emerald Slab", default.node_sound_glass_defaults(), true)

stairs.register_stair_and_slab("glow_mese", "caverealms:glow_mese",
	{cracky = 3}, {"caverealms_glow_mese.png"},
	"Glow Mese Stair", "Glow Mese Slab", default.node_sound_glass_defaults(), true)

stairs.register_stair_and_slab("glow_ruby", "caverealms:glow_ruby",
	{cracky = 3}, {"caverealms_glow_ruby.png"},
	"Glow Ruby Stair", "Glow Ruby Slab", default.node_sound_glass_defaults(), true)

stairs.register_stair_and_slab("glow_amethyst", "caverealms:glow_amethyst",
	{cracky = 3}, {"caverealms_glow_amethyst.png"},
	"Glow Amethyst Stair", "Glow Amethyst Slab", default.node_sound_glass_defaults(), true)

stairs.register_stair_and_slab("salt_crystal", "caverealms:salt_crystal",
	{cracky = 3}, {"caverealms_salt_crystal.png"},
	"Salt Crystal Stair", "Salt Crystal Slab", default.node_sound_glass_defaults(), true)

--Glow Obsidian Stairs/Slabs
stairs.register_stair_and_slab("glow_obsidian_brick", "caverealms:glow_obsidian_brick",
	{cracky = 1, level = 2}, {"caverealms_glow_obsidian_brick.png"},
	"Glow Obsidian Brick Stair", "Glow Obsidian Brick Slab", default.node_sound_stone_defaults(), false)

stairs.register_stair_and_slab("glow_obsidian_brick_2", "caverealms:glow_obsidian_brick_2",
	{cracky = 1, level = 2}, {"caverealms_glow_obsidian_brick_2.png"},
	"Glow Obsidian Brick Stair", "Glow Obsidian Brick Slab", default.node_sound_stone_defaults(), false)

--Glow Obsidian Glass
core.register_node("caverealms:glow_obsidian_glass", {
	description = "Glow Obsidian Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"caverealms_glow_obsidian_glass.png", "default_obsidian_glass_detail.png"},
	paramtype = "light",
	light_source = 13,
	sunlight_propagates = true,
	groups = {cracky = 3},
	sounds = default.node_sound_glass_defaults(),
})

--Coal Dust
core.register_node("caverealms:coal_dust", {
	description = "Coal Dust",
	tiles = {"caverealms_coal_dust.png"},
	groups = {crumbly=3, falling_node=1, falling_node_damage=3, sand=1},
	sounds = default.node_sound_sand_defaults(),
})

--glow worms
core.register_node("caverealms:glow_worm", {
	description = "Blue Glow Worms",
	drawtype = "plantlike",
	tiles = {"caverealms_glow_worm.png"},
	inventory_image = "caverealms_glow_worm.png",
	wield_image = "caverealms_glow_worm.png",
	paramtype = "light",
	light_source = 9,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/6, -1/2, -1/6, 1/6, 1/2, 1/6}
	},
	groups = {oddly_breakable_by_hand=3},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("caverealms:glow_worm_green", {
	description = "Green Glow Worms",
	drawtype = "plantlike",
	tiles = {"caverealms_glow_worm_green.png"},
	inventory_image = "caverealms_glow_worm_green.png",
	wield_image = "caverealms_glow_worm_green.png",
	paramtype = "light",
	light_source = 9,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/6, -1/2, -1/6, 1/6, 1/2, 1/6}
	},
	groups = {oddly_breakable_by_hand=3},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("caverealms:fire_vine", {
	description = "Fire Vine",
	drawtype = "plantlike",
	tiles = {"caverealms_fire_vine.png"},
	inventory_image = "caverealms_fire_vine.png",
	wield_image = "caverealms_fire_vine.png",
	paramtype = "light",
	light_source = 9,
	damage_per_second = 1,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/6, -1/2, -1/6, 1/6, 1/2, 1/6}
	},
	groups = {oddly_breakable_by_hand=3},
	sounds = default.node_sound_leaves_defaults(),
})


--define special flame so that it does not expire
core.register_node("caverealms:constant_flame", {
	description = "Fire",
	drawtype = "plantlike",
	tiles = {{
		name="caverealms_flame_animated.png",
		animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=.4},
	}},
	inventory_image = "caverealms_flame.png",
	wield_image = "caverealms_flame.png",
	paramtype = "light",
	light_source = 14,
	visual_scale = 1.7,
	damage_per_second = 4,
	walkable = false,
	buildable_to = true,
	drop = '',
	on_construct = function(pos)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		core.get_node_timer(above):start(5)
	end,
	groups = {igniter=2, dig_immediate=3, hot=3, not_in_creative_inventory=1},
})

--dungeon master statue (nodebox)
core.register_node("caverealms:dm_statue", {
	description = "Dungeon Master Statue",
	drawtype = "nodebox",
	tiles = {"caverealms_dm.png", "caverealms_dm.png", "caverealms_dm.png",
		"caverealms_dm.png", "caverealms_dm.png", "caverealms_dm_eyes.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-.4375, -.5, -.4375, .4375, -.3125, .4375},
			{-.25, -.125, -.1875, .25, .5, .1875},
			{-.375, 0, -.125, -.25, .4375, .125},
			{.25, .125, -.4375, .375, .375, .1875},
			{-.25, -.5, -.125, -.125, -.125, .125},
			{.125, -.3125, -.125, .25, 0, .125}
		}
	}
})

-- Lichen biome

-- glowing fungi
core.register_node("caverealms:fungus", {
	description = "Glowing Fungus",
	drawtype = "plantlike",
	tiles = {"caverealms_fungi.png"},
	inventory_image = "caverealms_fungi.png",
	wield_image = "caverealms_fungi.png",
	paramtype = "light",
	light_source = 5,
	walkable = false,
	buildable_to = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.2, .3}
	},
	groups = {mushroom = 1, oddly_breakable_by_hand = 3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
})

-- mycena mushroom
core.register_node("caverealms:mycena", {
	description = "Mycena Mushroom",
	drawtype = "plantlike",
	tiles = {"caverealms_mycena.png"},
	inventory_image = "caverealms_mycena.png",
	wield_image = "caverealms_mycena.png",
	paramtype = "light",
	light_source = 6,
	walkable = false,
	buildable_to = true,
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, 0, .1},
	},
	groups = {mushroom = 1, oddly_breakable_by_hand = 3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
})

-- Mushroom grass
core.register_node("caverealms:mushroomgrass_1", {
	description = "Mushroom grass",
	drawtype = "mesh",
	mesh = "grass.obj",
	waving = 1,
	tiles = {"mushroomgrass_1.png"},
	-- Use texture of a taller grass stage in inventory
	inventory_image = "mushroomgrass_2.png",
	wield_image = "mushroomgrass_2.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	on_rotate = screwdriver.rotate_simple,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, mushroom_grass = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.grass_sbox,

	on_place = function(itemstack, placer, pointd)
		-- place a random grass node
		local stack = ItemStack("caverealms:mushroomgrass_".. math.random(1,4))
		local ret = core.item_place(stack, placer, pointd, math.random(0,3))
		return ItemStack("caverealms:mushroomgrass_1 "..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 4 do
	core.register_node("caverealms:mushroomgrass_".. i, {
		description = "Mushroom grass",
		drawtype = "mesh",
		mesh = "grass.obj",
		waving = 1,
		tiles = {"mushroomgrass_".. i ..".png"},
		inventory_image = "mushroomgrass_".. i ..".png",
		wield_image = "mushroomgrass_".. i ..".png",
		use_texture_alpha = "clip",
		paramtype = "light",
		paramtype2 = "facedir",
		light_source = 1,
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		on_rotate = screwdriver.rotate_simple,
		drop = "caverealms:mushroomgrass_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1, mushroom_grass = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = default.grass_sbox,
	})
end

-- giant mushrooms

local T = {name = "caverealms:mushroom_trunk", force_place = true}
local M = {name = "caverealms:mushroom"}
local P = {name = "caverealms:mushroom_pore"}

caverealms.mushroomone = {size = {x = 8, y = 11, z = 8}, data = {
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,M,M,_,_,_,
_,_,_,M,M,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,M,_,_,M,_,_,
_,_,M,_,_,M,_,_,
_,_,_,M,M,_,_,_,
_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,M,_,_,_,_,M,_,
_,M,_,_,_,_,M,_,
_,_,M,P,P,M,_,_,
_,_,_,M,M,_,_,_,

_,_,_,T,T,_,_,_,
_,_,_,T,T,_,_,_,
_,_,_,T,T,_,_,_,
_,_,_,T,T,_,_,_,
_,_,_,T,T,_,_,_,
_,_,_,T,T,_,_,_,
_,_,_,T,T,_,_,_,
M,_,_,T,T,_,_,M,
M,_,_,T,T,_,_,M,
_,M,P,P,P,P,M,_,
_,_,M,M,M,M,_,_,

_,_,_,T,T,_,_,_,
_,_,_,T,T,_,_,_,
_,_,_,T,T,_,_,_,
_,_,_,T,T,_,_,_,
_,_,_,T,T,_,_,_,
_,_,_,T,T,_,_,_,
_,_,_,T,T,_,_,_,
M,_,_,T,T,_,_,M,
M,_,_,T,T,_,_,M,
_,M,P,P,P,P,M,_,
_,_,M,M,M,M,_,_,

_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,M,_,_,_,_,M,_,
_,M,_,_,_,_,M,_,
_,_,M,P,P,M,_,_,
_,_,_,M,M,_,_,_,

_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,M,_,_,M,_,_,
_,_,M,_,_,M,_,_,
_,_,_,M,M,_,_,_,
_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,M,M,_,_,_,
_,_,_,M,M,_,_,_,
_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_},
yslice_prob = {{ypos = 0, prob = 127}, {ypos = 1, prob = 127}, {ypos = 7, prob = 127}}}

local S = {name = "caverealms:mushroom_stem", force_place = true}
local C = {name = "caverealms:mushroom_cap"}
local G = {name = "caverealms:mushroom_gills"}

caverealms.mushroom = {size = {x = 11, y = 9, z = 11}, data = {
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,C,C,C,G,C,C,C,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,C,C,G,G,G,G,G,C,C,_,
_,_,_,C,C,C,C,C,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,C,G,G,G,G,G,G,G,C,_,
_,_,C,C,C,C,C,C,C,_,_,
_,_,_,C,C,C,C,C,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,

_,_,_,_,_,S,_,_,_,_,_,
_,_,_,_,_,S,_,_,_,_,_,
_,_,_,_,_,S,_,_,_,_,_,
_,_,_,_,_,S,_,_,_,_,_,
_,_,_,_,_,S,_,_,_,_,_,
_,C,G,G,G,S,G,G,G,C,_,
_,_,C,C,C,C,C,C,C,_,_,
_,_,_,C,C,C,C,C,_,_,_,
_,_,_,_,C,C,C,_,_,_,_,

_,_,_,_,S,S,S,_,_,_,_,
_,_,_,_,S,S,S,_,_,_,_,
_,_,_,_,S,S,S,_,_,_,_,
_,_,_,_,S,S,S,_,_,_,_,
_,_,_,_,S,S,S,_,_,_,_,
C,G,G,G,S,S,S,G,G,G,C,
_,C,C,C,C,C,C,C,C,C,_,
_,_,C,C,C,C,C,C,C,_,_,
_,_,_,C,C,C,C,C,_,_,_,

_,_,_,_,_,S,_,_,_,_,_,
_,_,_,_,_,S,_,_,_,_,_,
_,_,_,_,_,S,_,_,_,_,_,
_,_,_,_,_,S,_,_,_,_,_,
_,_,_,_,_,S,_,_,_,_,_,
_,C,G,G,G,S,G,G,G,C,_,
_,_,C,C,C,C,C,C,C,_,_,
_,_,_,C,C,C,C,C,_,_,_,
_,_,_,_,C,C,C,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,C,G,G,G,G,G,G,G,C,_,
_,_,C,C,C,C,C,C,C,_,_,
_,_,_,C,C,C,C,C,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,C,C,G,G,G,G,G,C,C,_,
_,_,_,C,C,C,C,C,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,C,C,C,G,C,C,C,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,C,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos = 0, prob = 254}, {ypos = 1, prob = 254}, {ypos = 2, prob = 254},
	{ypos = 3, prob = 254}, {ypos = 4, prob = 254}, {ypos = 5, prob = 254},
	{ypos = 6, prob = 254}, {ypos = 7, prob = 254}, {ypos = 8, prob = 254}}}

-- giant mushrooms
function grow_mushroom_tree(pos)
	add_tree(pos, 4, 0, 4, caverealms.mushroomone, "0")
end

function grow_caverealms_mushroom(pos)
	add_tree(pos, 5, 0, 5, caverealms.mushroom, "0")
end

core.register_node("caverealms:mushroom_trunk", {
	description = "Mushroom",
	tiles = {"mushroom_trunk_top.png", "mushroom_trunk_top.png", "mushroom_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("caverealms:mushroom", {
	description = "Mushroom Cap",
	tiles = {"mushroom_block.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, leafdecay = 3},
	drop = {
		max_items = 1,
		items = {
			{items = {"caverealms:e_mushroom_sapling"}, rarity = 20},
			{items = {"caverealms:mushroom"}}
		}
	},
	sounds = default.node_sound_wood_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_craft({
	type = "fuel",
	recipe = "caverealms:mushroom",
	burntime = 10,
})

core.register_node("caverealms:mushroom_pore", {
	description = "Mushroom Pore",
	tiles = {"mushroom_pore.png"},
	groups = {snappy = 3, cracky = 3, choppy = 3, oddly_breakable_by_hand = 3,
		flammable = 2, disable_jump = 1, fall_damage_add_percent = -100, leafdecay = 3},
	sounds = default.node_sound_dirt_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_craft({
	type = "fuel",
	recipe = "caverealms:mushroom_pore",
	burntime = 3,
})

default.register_leafdecay({
	trunks = {"caverealms:mushroom_trunk"},
	leaves = {"caverealms:mushroom", "caverealms:mushroom_pore"},
	radius = 3
})

core.register_node("caverealms:e_mushroom_sapling", {
	description = "Ethereal Mushroom Tree Sapling",
	drawtype = "plantlike",
	tiles = {"mushroom_sapling.png"},
	inventory_image = "mushroom_sapling.png",
	wield_image = "mushroom_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, .1, .1}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_timer = function(pos)
		if (core.get_node_light(pos) or 0) > 10 then-- check light level
			core.get_node_timer(pos):start(math.random(60, 300))
			return
		end
		-- get node under sapling
		local under = core.get_node({x = pos.x, y = pos.y - 1, z = pos.z}).name
		if not core.registered_nodes[under] then-- check if registered
			core.get_node_timer(pos):start(math.random(60, 300))
			return
		end
		if under == "caverealms:rocks_with_lichen" and enough_height(pos, 8) then
			grow_mushroom_tree(pos)
		else
			core.get_node_timer(pos):start(math.random(60, 300))
		end
	end
})

core.register_node("caverealms:mushroom_stem", {
	description = "Giant Mushroom Stem",
	tiles = {"caverealms_mushroom_stem.png"},
	groups = {choppy=2, oddly_breakable_by_hand=1},
})

core.register_node("caverealms:mushroom_cap", {
	description = "Giant Mushroom Cap",
	tiles = {"caverealms_mushroom_cap.png"},
	groups = {choppy=2, oddly_breakable_by_hand=1},
	drop = {
		max_items = 1,
		items = {
			{items = {"caverealms:mushroom_sapling"}, rarity = 20},
			{items = {"caverealms:mushroom_cap"}}
		}
	},
})

core.register_node("caverealms:mushroom_sapling", {
	description = "Mushroom Tree Sapling",
	drawtype = "plantlike",
	tiles = {"caverealms_mushroom_sapling.png"},
	inventory_image = "caverealms_mushroom_sapling.png",
	wield_image = "caverealms_mushroom_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, .1, .1}
	},
	groups = {snappy = 2, dig_immediate = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_timer = function(pos)
		if (core.get_node_light(pos) or 0) > 10 then-- check light level
			core.get_node_timer(pos):start(math.random(60, 300))
			return
		end
		-- get node under sapling
		local under = core.get_node({x = pos.x, y = pos.y - 1, z = pos.z}).name
		if not core.registered_nodes[under] then-- check if registered
			core.get_node_timer(pos):start(math.random(60, 300))
			return
		end
		if under == "caverealms:rocks_with_lichen" and enough_height(pos, 6) then
			grow_caverealms_mushroom(pos)
		else
			core.get_node_timer(pos):start(math.random(60, 300))
		end
	end
})

-- gills
core.register_node("caverealms:mushroom_gills", {
	description = "Giant Mushroom Gills",
	drawtype = "plantlike",
	tiles = {"caverealms_mushroom_gills.png"},
	paramtype = "light",
	light_source = 10,
	groups = {choppy=2, oddly_breakable_by_hand=1},
})

default.register_fence("caverealms:fence_mushroom", {
	description = "Mushroom Fence",
	texture = "mushroom_trunk.png",
	material = "caverealms:mushroom_trunk",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

doors.register_fencegate("caverealms:fencegate_mushroom", {
	description = "Mushroom Trunk Fence Gate",
	texture = "mushroom_trunk.png",
	material = "caverealms:mushroom_trunk",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2}
})

stairs.register_stair_and_slab("mushroom_trunk", "caverealms:mushroom_trunk", {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	{"mushroom_trunk_top.png", "mushroom_trunk_top.png", "mushroom_trunk.png"},
	"Mushroom Trunk Stair", "Mushroom Trunk Slab", default.node_sound_wood_defaults(), false)

stairs.register_stair_and_slab("mushroom", "caverealms:mushroom",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2}, {"mushroom_block.png"},
	"Mushroom Top Stair", "Mushroom Top Slab", default.node_sound_wood_defaults(), false)

-- mushroom soup
core.register_craftitem("caverealms:mushroom_soup", {
	description = "Mushroom Soup",
	inventory_image = "mushroom_soup.png",
	groups = {drink = 1, flammable = 1},
	on_use = core.item_eat(5, "vessels:wood_bowl")
})

core.register_craft({
	output = "caverealms:mushroom_soup",
	recipe = {
		{"flowers:mushroom_brown"},
		{"flowers:mushroom_brown"},
		{"vessels:wood_bowl"}
	}
})

-- spread moss/lichen/algae to nearby rocks
core.register_abm({
	label = "Caverealms stone spread",
	nodenames = {"caverealms:rocks_with_moss", "caverealms:rocks_with_lichen", "caverealms:rocks_with_algae"},
	neighbors = {"air"},
	interval = 16,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		local num = core.find_nodes_in_area_under_air({x = pos.x - 1, y = pos.y - 2, z = pos.z - 1},
			{x = pos.x + 1, y = pos.y + 1, z = pos.z + 1}, "default:rocks")
		if #num > 0 and search_face_lighting(pos, 2) and (search_faces(pos, "air")
		or search_faces(pos, "attached_node") or search_faces(pos, "leaves")) then
			core.set_node(num[math.random(#num)], {name = node.name})
		end
	end,
})

-- Speleothems

core.register_node("caverealms:stalagtite", {
	description = "Stalagtite",
	drawtype = "plantlike",
	tiles = {"mapgen_stalagmite.png"},
	inventory_image = "mapgen_stalagmite.png",
	wield_image = "mapgen_stalagmite.png",
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, .2, -.3, .3, .5, .3}
	},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("caverealms:stalagtite1", {
	description = "Stalagtite",
	drawtype = "plantlike",
	tiles = {"mapgen_stalagmite1.png"},
	inventory_image = "mapgen_stalagmite1.png",
	wield_image = "mapgen_stalagmite1.png",
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, .2, -.3, .3, .5, .3}
	},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("caverealms:stalagmite", {
	description = "Stalagmite",
	drawtype = "plantlike",
	tiles = {"mapgen_stalagmite.png^[transformFY"},
	inventory_image = "mapgen_stalagmite.png^[transformFY",
	wield_image = "mapgen_stalagmite.png^[transformFY",
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.2, .3}
	},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("caverealms:stalagmite1", {
	description = "Stalagmite",
	drawtype = "plantlike",
	tiles = {"mapgen_stalagmite1.png^[transformFY"},
	inventory_image = "mapgen_stalagmite1.png^[transformFY",
	wield_image = "mapgen_stalagmite1.png^[transformFY",
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.2, .3}
	},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	output = "default:rocks",
	recipe = {
		{"caverealms:stalagtite", "caverealms:stalagtite"},
		{"caverealms:stalagtite", "caverealms:stalagtite"}
	}
})

core.register_craft({
	output = "default:rocks",
	recipe = {
		{"caverealms:stalagtite1", "caverealms:stalagtite1"},
		{"caverealms:stalagtite1", "caverealms:stalagtite1"}
	}
})

core.register_craft({
	output = "default:rocks",
	recipe = {
		{"caverealms:stalagmite", "caverealms:stalagmite"},
		{"caverealms:stalagmite", "caverealms:stalagmite"}
	}
})

core.register_craft({
	output = "default:rocks",
	recipe = {
		{"caverealms:stalagmite1", "caverealms:stalagmite1"},
		{"caverealms:stalagmite1", "caverealms:stalagmite1"}
	}
})

local load_time_start = os.clock()
local MAX_SIZE = 3

if caverealms.info then
	function caverealms.inform(msg, spam, t)
		if spam <= caverealms.max_spam then
			local info
			if t then
				info = string.format("[caverealms] "..msg.." after ca. %.2fs", os.clock() - t)
			else
				info = "[caverealms] "..msg
			end
			print(info)
			if caverealms.inform_all then
				core.chat_send_all(info)
			end
		end
	end
else
	function caverealms.inform()
	end
end


-- Growing Functions

local function r_area(manip, width, height, pos)
	local emerged_pos1, emerged_pos2 = manip:read_from_map(
		{x=pos.x-width, y=pos.y, z=pos.z-width},
		{x=pos.x+width, y=pos.y+height, z=pos.z+width}
	)
	return VoxelArea:new({MinEdge=emerged_pos1, MaxEdge=emerged_pos2})
end

-- contents become added later
local c

-- cache buildable_to ids
local re_al_cache = {[core.get_content_id("ignore")] = true}
local function replacing_allowed(id)
	if re_al_cache[id] ~= nil then
		return re_al_cache[id]
	end
	local def = core.registered_nodes[core.get_name_from_content_id(id)]
	if not def
	or def.buildable_to then
		re_al_cache[id] = true
		return true
	end
	re_al_cache[id] = false
	return false
end

local set_vm_nodes
if caverealms.giant_restrict_area then
	function set_vm_nodes(manip, pznodes)
		local nodes = manip:get_data()
		for vi,id in pairs(pznodes) do
			if not replacing_allowed(nodes[vi]) then
				return false
			end
			nodes[vi] = id
		end
		manip:set_data(nodes)
		return true
	end
else
	function set_vm_nodes(manip, pznodes)
		local nodes = manip:get_data()
		for vi,id in pairs(pznodes) do
			if replacing_allowed(nodes[vi]) then
				nodes[vi] = id
			end
		end
		manip:set_data(nodes)
		return true
	end
end

local function set_vm_data(manip, pznodes, pos, t1, name)
	if not set_vm_nodes(manip, pznodes) then
		return
	end
	manip:write_to_map()
	caverealms.inform("a giant "..name.." mushroom grew at "..core.pos_to_string(pos), 3, t1)
	local t1 = os.clock()
	manip:update_map()
	caverealms.inform("map updated", 3, t1)
end

function caverealms.red(pos, nodes, area, w)
	local w = w or math.random(MAX_SIZE)
	local h = w+2

	for i = 0, h do
		nodes[area:index(pos.x, pos.y+i, pos.z)] = c.stem
	end

	local br = w+1
	for k = -1, 1, 2 do
		for l = -br+1, br do
			nodes[area:index(pos.x+br*k, pos.y+h, pos.z-l*k)] = c.head_red
			nodes[area:index(pos.x+l*k, pos.y+h, pos.z+br*k)] = c.head_red
		end
	end

	for k = -w, w do
		for l = -w, w do
			nodes[area:index(pos.x+l, pos.y+h+1, pos.z+k)] = c.head_red
			nodes[area:index(pos.x+l, pos.y+h, pos.z+k)] = c.lamellas
		end
	end
end

local function caverealms_hybridpilz(pos)
	local t1 = os.clock()

	local w = math.random(MAX_SIZE)

	local manip = core.get_voxel_manip()
	local area = r_area(manip, w+1, w+3, pos)

	local pznodes = {}
	caverealms.red(pos, pznodes, area, w)

	set_vm_data(manip, pznodes, pos, t1, "red")
end

function caverealms.brown(pos, nodes, area, br)
	local br = br or math.random(MAX_SIZE-1)+1
	local h = br+2

	for i in area:iterp(pos, {x=pos.x, y=pos.y+h, z=pos.z}) do
		nodes[i] = c.stem
	end

	local w = br+1
	for l = -br, br do
		for k = -w, w, w*2 do
			nodes[area:index(pos.x+k, pos.y+h+1, pos.z+l)] = c.head_brown
			nodes[area:index(pos.x+l, pos.y+h+1, pos.z+k)] = c.head_brown
		end
		for k = -br, br do
			nodes[area:index(pos.x+l, pos.y+h+1, pos.z+k)] = c.head_brown
		end
	end
end

local function caverealms_brauner_minecraftpilz(pos)
	local t1 = os.clock()

	local br = math.random(MAX_SIZE-1)+1

	local manip = core.get_voxel_manip()
	local area = r_area(manip, br+1, br+3, pos)

	local pznodes = {}
	caverealms.brown(pos, pznodes, area, br)

	set_vm_data(manip, pznodes, pos, t1, "brown")
end

function caverealms.fly_agaric(pos, nodes, area, param2s)
	local h = 3

	for i = 0, h do
		nodes[area:index(pos.x, pos.y+i, pos.z)] = c.stem
	end

	for j = -1, 1 do
		for k = -1, 1 do
			nodes[area:index(pos.x+j, pos.y+h+1, pos.z+k)] = c.head_red
		end
		for l = 1, h do
			local y = pos.y+l
			for _,p in pairs({
				{area:index(pos.x+j, y, pos.z+2), 0},
				{area:index(pos.x+j, y, pos.z-2), 2},
				{area:index(pos.x+2, y, pos.z+j), 1},
				{area:index(pos.x-2, y, pos.z+j), 3},
			}) do
				local tmp = p[1]
				nodes[tmp] = c.head_red_side
				param2s[tmp] = p[2]
			end
		end
	end
end

local function caverealms_minecraft_fliegenpilz(pos)
	local t1 = os.clock()

	local manip = core.get_voxel_manip()
	local area = r_area(manip, 2, 4, pos)
	local param2s = manip:get_param2_data()

	local pznodes = {}
	caverealms.fly_agaric(pos, pznodes, area, param2s)

	if not set_vm_nodes(manip, pznodes) then
		return
	end
	manip:set_param2_data(param2s)
	manip:write_to_map()
	manip:update_map()
	caverealms.inform("a fly agaric grew at "..core.pos_to_string(pos), 3, t1)
end

local function ran_node(a, b, ran)
	if math.random(ran) == 1 then
		return a
	end
	return b
end

function caverealms.lavashroom(pos, nodes, area, h)
	local h = h or 3+math.random(MAX_SIZE-2)

	-- remove the mushroom
	nodes[area:indexp(pos)] = c.air

	for i = -1, 1, 2 do
		-- set the stem
		for n = 0, h do
			nodes[area:index(pos.x+i, pos.y+n, pos.z)] = c.stem_brown
			nodes[area:index(pos.x, pos.y+n, pos.z+i)] = c.stem_brown
		end

		local o = 2*i
		for l = -1, 1 do
			for k = 2, 3 do
				nodes[area:index(pos.x+k*i, pos.y+h+2, pos.z+l)] = c.head_brown_full
				nodes[area:index(pos.x+l, pos.y+h+2, pos.z+k*i)] = c.head_brown_full
			end
			nodes[area:index(pos.x+l, pos.y+h+1, pos.z+o)] = c.head_brown_full
			nodes[area:index(pos.x+o, pos.y+h+1, pos.z+l)] = c.head_brown_full
		end

		for m = -1, 1, 2 do
			for k = 2, 3 do
				for j = 2, 3 do
					nodes[area:index(pos.x+j*i, pos.y+h+2, pos.z+k*m)] = ran_node(c.head_yellow, c.head_orange, 7)
				end
			end
			nodes[area:index(pos.x+i, pos.y+h+1, pos.z+m)] = c.head_brown_full
			nodes[area:index(pos.x+m*2, pos.y+h+1, pos.z+o)] = c.head_brown_full
		end

		for l = -3+1, 3 do
			nodes[area:index(pos.x+3*i, pos.y+h+5, pos.z-l*i)] = ran_node(c.head_yellow, c.head_orange, 5)
			nodes[area:index(pos.x+l*i, pos.y+h+5, pos.z+3*i)] = ran_node(c.head_yellow, c.head_orange, 5)
		end

		for j = 0, 1 do
			for l = -3, 3 do
				nodes[area:index(pos.x+i*4, pos.y+h+3+j, pos.z+l)] = ran_node(c.head_yellow, c.head_orange, 6)
				nodes[area:index(pos.x+l, pos.y+h+3+j, pos.z+i*4)] = ran_node(c.head_yellow, c.head_orange, 6)
			end
		end

	end

	for k = -2, 2 do
		for l = -2, 2 do
			nodes[area:index(pos.x+k, pos.y+h+6, pos.z+l)] = ran_node(c.head_yellow, c.head_orange, 4)
		end
	end
end

local function caverealms_lavashroom(pos)
	local t1 = os.clock()

	local h = 3+math.random(MAX_SIZE-2)

	local manip = core.get_voxel_manip()
	local area = r_area(manip, 4, h+6, pos)

	local pznodes = {}
	caverealms.lavashroom(pos, pznodes, area, h)

	set_vm_data(manip, pznodes, pos, t1, "lavashroom")
end

function caverealms.glowshroom(pos, nodes, area, h)
	local h = h or 2+math.random(MAX_SIZE)

	for i = 0, h do
		nodes[area:index(pos.x, pos.y+i, pos.z)] = c.stem_blue
	end

	local br = 2
	for i = -1, 1, 2 do

		for k = -br, br, 2*br do
			for l = 2, h do
				nodes[area:index(pos.x+i*br, pos.y+l, pos.z+k)] = c.head_blue
			end
			nodes[area:index(pos.x+i*br, pos.y+1, pos.z+k)] = c.head_blue_bright
		end

		for l = -br+1, br do
			nodes[area:index(pos.x+i*br, pos.y+h, pos.z-l*i)] = c.head_blue
			nodes[area:index(pos.x+l*i, pos.y+h, pos.z+br*i)] = c.head_blue
		end

	end

	for l = 0, br do
		for i = -br+l, br-l do
			for k = -br+l, br-l do
				nodes[area:index(pos.x+i, pos.y+h+1+l, pos.z+k)] = c.head_blue
			end
		end
	end

end

local function caverealms_glowshroom(pos)
	local t1 = os.clock()

	local h = 2+math.random(MAX_SIZE)

	local manip = core.get_voxel_manip()
	local area = r_area(manip, 2, h+3, pos)

	local pznodes = {}
	caverealms.glowshroom(pos, pznodes, area, h)

	set_vm_data(manip, pznodes, pos, t1, "glowshroom")
end

function caverealms.parasol(pos, nodes, area, w, h)
	local h = h or 6+math.random(MAX_SIZE)

	--stem
	for i in area:iterp(pos, {x=pos.x, y=pos.y+h-2, z=pos.z}) do
		nodes[i] = c.stem
	end

	local w = w or MAX_SIZE+math.random(2)
	local bhead1 = w-1
	local bhead2 = math.random(1,w-2)

	for _,j in pairs({
		{bhead2, 0, c.head_brown_bright},
		{bhead1, -1, c.head_binge}
	}) do
		for i in area:iter(pos.x-j[1], pos.y+h+j[2], pos.z-j[1], pos.x+j[1], pos.y+h+j[2], pos.z+j[1]) do
			nodes[i] = j[3]
		end
	end

	local rh = math.random(2,3)
	for k = -1, 1, 2 do
		for l = 0, 1 do
			nodes[area:index(pos.x+k, pos.y+rh, pos.z-l*k)] = c.head_white
			nodes[area:index(pos.x+l*k, pos.y+rh, pos.z+k)] = c.head_white
		end
		for l = -w+1, w do
			nodes[area:index(pos.x+w*k, pos.y+h-2, pos.z-l*k)] = c.head_binge
			nodes[area:index(pos.x+l*k, pos.y+h-2, pos.z+w*k)] = c.head_binge
		end
		for l = -bhead1+1, bhead1 do
			nodes[area:index(pos.x+bhead1*k, pos.y+h-2, pos.z-l*k)] = c.head_white
			nodes[area:index(pos.x+l*k, pos.y+h-2, pos.z+bhead1*k)] = c.head_white
		end
	end
end

local function caverealms_parasol(pos)
	local t1 = os.clock()

	local w = MAX_SIZE+math.random(2)
	local h = 6+math.random(MAX_SIZE)

	local manip = core.get_voxel_manip()
	local area = r_area(manip, w, h, pos)

	local pznodes = {}
	caverealms.parasol(pos, pznodes, area, w, h)

	set_vm_data(manip, pznodes, pos, t1, "parasol")
end

function caverealms.red45(pos, nodes, area, h1, h2)
	local walkspace = h1 or math.random(2,MAX_SIZE)
	local toph = h2 or math.random(MAX_SIZE)
	local h = walkspace+toph+4

	-- stem
	for i in area:iterp(pos, {x=pos.x, y=pos.y+h, z=pos.z}) do
		nodes[i] = c.stem_red
	end

	for i = -1,1,2 do
		for l = 0, 1 do
			if math.random(2) == 1 then
				nodes[area:index(pos.x+i, pos.y, pos.z-l*i)] = c.stem_red
				if math.random(2) == 1 then
					nodes[area:index(pos.x+i, pos.y+1, pos.z-l*i)] = c.stem_red
				end
			end
			if math.random(2) == 1 then
				nodes[area:index(pos.x+l*i, pos.y, pos.z+i)] = c.stem_red
				if math.random(2) == 1 then
					nodes[area:index(pos.x+l*i, pos.y+1, pos.z+i)] = c.stem_red
				end
			end
			nodes[area:index(pos.x+i, pos.y+walkspace+2, pos.z-l*i)] = c.head_red
			nodes[area:index(pos.x+l*i, pos.y+walkspace+2, pos.z+i)] = c.head_red
		end
		nodes[area:index(pos.x, pos.y+walkspace+3, pos.z+i)] = c.head_red
		nodes[area:index(pos.x+i, pos.y+walkspace+3, pos.z)] = c.head_red
		for j = -1,1,2 do
			nodes[area:index(pos.x+j, pos.y+walkspace+1, pos.z+i)] = c.head_red
			nodes[area:index(pos.x+j*3, pos.y+walkspace+1, pos.z+i*3)] = c.head_red
			for z = 1,2 do
				for x = 1,2 do
					for y = h-toph, h-1 do
						nodes[area:index(pos.x+x*j, pos.y+y, pos.z+z*i)] = c.head_red
					end
					if z ~= 2
					or x ~= 2
					or math.random(4) ~= 2 then
						nodes[area:index(pos.x+x*j, pos.y+h, pos.z+z*i)] = c.head_red
					end
					local z = z+1
					x = x+1
					nodes[area:index(pos.x+x*j, pos.y+walkspace+2, pos.z+z*i)] = c.head_red
					if z ~= 3
					or x ~= 3
					or math.random(2) == 1 then
						nodes[area:index(pos.x+x*j, pos.y+walkspace+3, pos.z+z*i)] = c.head_red
					end
				end
			end
		end
	end

	-- top
	for z = -1,1 do
		for x = -1,1 do
			nodes[area:index(pos.x+x, pos.y+h+1, pos.z+z)] = c.head_red
		end
	end
end

local function caverealms_red45(pos)
	local t1 = os.clock()

	local h1 = math.random(2,MAX_SIZE)
	local h2 = math.random(MAX_SIZE)
	local h = h1+h2+5

	local manip = core.get_voxel_manip()
	local area = r_area(manip, 3, h, pos)

	local pznodes = {}
	caverealms.red45(pos, pznodes, area, h1, h2)

	set_vm_data(manip, pznodes, pos, t1, "red45")
end

local circle_tables = {}
function vector.circle(r)
	local table = circle_tables[r]
	if table then
		return table
	end

	local t1 = os.clock()
	local tab, n = {}, 1

	for i = -r, r do
		for j = -r, r do
			if math.floor(math.sqrt(i*i+j*j)+.5) == r then
				tab[n] = {x=i, y=0, z=j}
				n = n+1
			end
		end
	end
	circle_tables[r] = tab
	core.log("info", string.format("[caverealms] table created after ca. %.2fs", os.clock() - t1))
	return tab
end

-- Mushroom Nodes

local abm_allowed = true
local disallowed_ps = {}

for name,i in pairs({
	brown = {
		description = "brown mushroom",
		box = {
			{-.15, -.2, -.15, .15, -.1, .15},
			{-.2, -.3, -.2, .2, -.2, .2},
			{-.05, -.5, -.05, .05, -.3, .05}
		},
		growing = {
			r = {min=3, max=4},
			grounds = {soil=1, crumbly=3},
			neighbours = {"default:beech_trunk"},
			light = {min=1, max=7},
			interval = 100,
			chance = 18,
		},
		hp = 2,
	},
	red = {
		description = "red mushroom",
		box = {
			{-1/16, -8/16, -1/16, 1/16, -6/16, 1/16},
			{-3/16, -6/16, -3/16, 3/16, -5/16, 3/16},
			{-4/16, -5/16, -4/16, 4/16, -4/16, 4/16},
			{-3/16, -4/16, -3/16, 3/16, -3/16, 3/16},
			{-2/16, -3/16, -2/16, 2/16, -2/16, 2/16}
		},
		growing = {
			r = {min=4, max=5},
			grounds = {soil=2},
			neighbours = {"default:water_flowing"},
			light = {min=4, max=13},
			interval = 50,
			chance = 30,
		},
		hp = -2,
	},
	fly_agaric = {
		description = "fly agaric",
		box = {
			{-.05, -.5, -.05, .05, 1/20, .05},
			{-3/20, -6/20, -3/20, 3/20, 0, 3/20},
			{-4/20, -2/20, -4/20, 4/20, -4/20, 4/20}
		},
		growing = {
			r = 4,
			grounds = {soil=1, crumbly=3},
			neighbours = {"default:pine_trunk"},
			light = {min=2, max=10},
			interval = 101,
			chance = 30,
		},
		hp = -6,
	},
	lavashroom = {
		description = "Lavashroom",
		box = {
			{-1/16, -8/16, -1/16, 1/16, -6/16, 1/16},
			{-2/16, -6/16, -2/16, 2/16,     0, 2/16},
			{-3/16, -5/16, -3/16, 3/16, -1/16, 3/16},
			{-4/16, -4/16, -4/16, 4/16, -2/16, 4/16}
		},
		growing = {
			r = {min=5, max=6},
			grounds = {cracky=3},
			neighbours = {"default:lava_source"},
			light = {min=10, max=12},
			interval = 1010,
			chance = 60,
		},
		hp = -1,
	},
	glowshroom = {
		description = "Glowshroom",
		box = {
			{-1/16, -8/16, -1/16,  1/16, -1/16, 1/16},
			{-2/16, -3/16, -2/16,  2/16, -2/16, 2/16},
			{-3/16, -5/16, -3/16,  3/16, -3/16, 3/16},
			{-3/16, -7/16, -3/16, -2/16, -5/16, -2/16},
			{3/16,  -7/16, -3/16,  2/16, -5/16, -2/16},
			{-3/16, -7/16,  3/16, -2/16, -5/16, 2/16},
			{3/16,  -7/16,  3/16,  2/16, -5/16, 2/16}
		},
		growing = {
			r = 3,
			grounds = {soil=1, crumbly=3},
			neighbours = {"default:stone"},
			light = 0,
			interval = 710,
			chance = 320,
		},
		hp = -2,
	},
	nether_shroom = {
		description = "Nether mushroom",
		box = {
			{-1/16, -8/16, -1/16, 1/16, -2/16, 1/16},
			{-2/16, -6/16, -2/16, 2/16, -5/16, 2/16},
			{-3/16, -2/16, -3/16, 3/16,     0, 3/16},
			{-4/16, -1/16, -4/16, 4/16,  1/16,-2/16},
			{-4/16, -1/16,  2/16, 4/16,  1/16, 4/16},
			{-4/16, -1/16, -2/16,-2/16,  1/16, 2/16},
			{ 2/16, -1/16, -2/16, 4/16,  1/16, 2/16}
		},
		burntime = 6,
		hp = -3,
	},
	parasol = {
		description = "white parasol mushroom",
		box = {
			{-1/16, -8/16, -1/16, 1/16,  0, 1/16},
			{-2/16, -6/16, -2/16, 2/16, -5/16, 2/16},
			{-5/16, -4/16, -5/16, 5/16, -3/16, 5/16},
			{-4/16, -3/16, -4/16, 4/16, -2/16, 4/16},
			{-3/16, -2/16, -3/16, 3/16, -1/16, 3/16}
		},
		growing = {
			r = {min=3, max=5},
			grounds = {soil=1, crumbly=3},
			neighbours = {"default:pine_trunk"},
			light = {min=1, max=11},
			interval = 51,
			chance = 36,
		},
		hp = 3,
	},
	red45 = {
		description = "45 red mushroom",
		box = {
			{-1/16, -.5, -1/16,  1/16, 1/8, 1/16},
			{-3/16,  1/8, -3/16,  3/16, 1/4, 3/16},
			{-5/16, -1/4, -5/16, -1/16, 1/8, -1/16},
			{1/16,  -1/4, -5/16,  5/16, 1/8, -1/16},
			{-5/16, -1/4,  1/16, -1/16, 1/8, 5/16},
			{1/16,  -1/4,  1/16,  5/16, 1/8, 5/16}
		},
		growing = {
			r = {min=3, max=4},
			grounds = {soil=2},
			neighbours = {"default:water_source"},
			light = {min=2, max=7},
			interval = 1000,
			chance = 180,
		},
		hp = 1,
	},
	brown45 = {
		description = "45 brown mushroom",
		box = {
			{-1/16, -.5, -1/16, 1/16, 1/16, 1/16},
			{-3/8,   1/8, -7/16,  3/8,  1/4, 7/16},
			{-7/16,  1/8,  -3/8, 7/16,  1/4, 3/8},
			{-3/8,   1/4,  -3/8,  3/8, 5/16, 3/8},
			{-3/8,  1/16,  -3/8,  3/8,  1/8, 3/8}
		},
		growing = {
			r = {min=2, max=3},
			grounds = {tree=1},
			neighbours = {"default:water_flowing"},
			light = {min=7, max=11},
			interval = 100,
			chance = 20,
		},
		hp = 1,
	},
}) do
	local burntime = i.burntime or 1
	local box = {
		type = "fixed",
		fixed = i.box
	}
	local nd = "caverealms:"..name
	core.register_node(nd, {
		description = i.description,
		drawtype = "nodebox",
tiles = {"caverealms_"..name.."_top.png", "caverealms_"..name.."_bottom.png", "caverealms_"..name.."_side.png"},
		inventory_image = "caverealms_"..name.."_side.png",
		use_texture_alpha = "clip",
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		groups = {mushroom=1, snappy=3,flammable=2,attached_node=1},
		sounds =  default.node_sound_leaves_defaults(),
		node_box = box,
		selection_box = box,
		furnace_burntime = burntime,
		on_secondary_use = core.item_eat(i.hp),
	})

	local g = i.growing

	if g then
		local grounds = g.grounds
		local nds = {}
		for n in pairs(grounds) do
			table.insert(nds, "group:"..n)
		end

		local nbs = table.copy(g.neighbours)
		table.insert(nbs, "air")

		local rmin, rmax, lmin, lmax

		local r = g.r
		if type(r) == "table" then
			rmin = r.min
			rmax = r.max
		else
			rmin = r or 3
			rmax = rmin
		end

		local l = g.light
		if type(l) == "table" then
			lmin = l.min
			lmax = l.max
		else
			lmin = l or 3
			lmax = lmin
		end

		core.register_abm({
			nodenames = nds,
			neighbors = g.neighbours,
			interval = g.interval,
			chance = g.chance,
			catch_up = false,
			action = function(pos, node)
				if not abm_allowed then
					return
				end

			-- don't try to spawn them on the same positions again
				for _,p in pairs(disallowed_ps) do
					if vector.equals(p, pos) then
						return
					end
				end

			-- don't spawn mushroom circles next to other ones
				if core.find_node_near(pos, rmax, nd) then
					return
				end

			-- spawn them around the right nodes
				local data = core.registered_nodes[node.name]
				if not data
				or not data.groups then
					return
				end
				local groups = data.groups
				for n,i in pairs(grounds) do
					if groups[n] ~= i then
						return
					end
				end

			-- find their neighbours
				for _,n in pairs(nbs) do
					if not core.find_node_near(pos, rmin, n) then
						return
					end
				end

			-- should disallow lag
				abm_allowed = false
				core.after(2, function() abm_allowed = true end)
				disallowed_ps[#disallowed_ps+1] = pos

			-- witch circles
				local ps = {}
				for _,p in pairs(vector.circle(math.random(rmin, rmax))) do
					local p = vector.add(pos, p)

				-- currently 3 is used here, approved by its use in the mapgen
					if math.random(3) == 1 then

					-- don't only use the current y for them
						for y = 1,-1,-1 do
							local pos = {x=p.x, y=p.y+y, z=p.z}
							if core.get_node(pos).name ~= "air" then
								break
							end
							local f = core.get_node({x=p.x, y=p.y+y-1, z=p.z}).name
							if f ~= "air" then

							-- they grown on specific nodes
								local data = core.registered_nodes[f]
								if data
								and data.walkable
								and data.groups
								and (not data.drawtype
									or data.drawtype == "normal"
								) then
									local ground_disallowed
									for n,i in pairs(grounds) do
										if data.groups[n] ~= i then
											ground_disallowed = true
											break
										end
									end
									if not ground_disallowed then

									-- they also need specific light strengths
										local light = core.get_node_light(pos, .5)
										if light >= lmin
										and light <= lmax then
											ps[#ps+1] = pos
										end
									end
								end
								break
							end
						end
					end
				end
				if not ps[1] then
					return
				end

			-- place them
				for _,p in pairs(ps) do
					core.set_node(p, {name=nd})
				end
				core.log("info", "[caverealms] "..nd.." mushrooms grew at "..core.pos_to_string(pos))
			end
		})
	end
end

-- disallow abms when the server is lagging
core.register_globalstep(function(dtime)
	if dtime > .5
	and abm_allowed then
		abm_allowed = false
		core.after(2, function() abm_allowed = true end)
		--core.chat_send_all(dtime)
	end
end)

-- Big Mushroom Nodes

local head_sounds = default.node_sound_wood_defaults({
	footstep = {name="caverealms_head", gain=.1},
	place = {name="default_place_node", gain=.5},
	dig = {name="caverealms_head", gain=.2},
	dug = {name="caverealms_stem", gain=.1}
})
local add_fence = core.register_fence
local node_groups = {oddly_breakable_by_hand=3,flammable=1, fall_damage_add_percent=-80, bouncy=10}

for _,i in pairs({
	{
		typ = "stem",
		description = "white",
		textures = {"stem_top.png", "stem_top.png", "stem_white.png"},
	},
	{
		typ = "stem",
		name = "brown",
		textures = {"stem_top.png", "stem_top.png", "stem_brown.png"},
		fence = false,
	},
	{
		typ = "stem",
		name = "blue",
		textures = {"stem_top.png","stem_top.png","stem_blue.png"},
		fence = false,
	},
	{
		typ = "stem",
		name = "red",
		textures = {"stem_red45_top.png","stem_red45_top.png","stem_red45.png"},
	},
	{
		name = "lamellas",
		description = "giant mushroom lamella",
		textures = "lamellas.png",
		sapling = "lamellas"
	},
	{
		typ = "head",
		name = "red",
		textures = {"head.png", "lamellas.png", "head.png"},
		sapling = "red"
	},
	{
		typ = "head",
		name = "orange",
		textures = "head_orange.png",
		sapling = "lavashroom"
	},
	{
		typ = "head",
		name = "yellow",
		textures = "head_yellow.png",
		sapling = "lavashroom"
	},
	{
		typ = "head",
		name = "brown",
		textures = {"brown_top.png", "lamellas.png", "brown_top.png"},
		sapling = "brown",
	},
	{
		typ = "head",
		name = "brown_full",
		description = "full brown",
		textures = "brown_top.png",
		sapling = "brown",
		fence = false,
	},
	{
		typ = "head",
		name = "blue_bright",
		description = "blue bright",
		textures = "head_blue_bright.png",
		sapling = "glowshroom"
	},
	{
		typ = "head",
		name = "blue",
		textures = "head_blue.png",
		sapling = "glowshroom"
	},
	{
		typ = "head",
		name = "white",
		textures = "head_white.png",
		sapling = "parasol"
	},
	{
		typ = "head",
		name = "binge",
		textures = {"head_binge.png", "head_white.png", "head_binge.png"},
		sapling = "parasol"
	},
	{
		typ = "head",
		name = "brown_bright",
		description = "brown bright",
		textures = {"head_brown_bright.png", "head_white.png", "head_brown_bright.png"},
		sapling = "parasol"
	},
}) do
	-- fill missing stuff
	local textures = i.textures
	i.description = i.description or i.name
	if type(textures) == "string" then
		textures = {textures}
	end
	for i = 1,#textures do
		textures[i] = "caverealms_"..textures[i]
	end
	local nodename = "caverealms:"
	local desctiption,sounds = "giant mushroom "
	if i.typ == "stem" then
		desctiption = desctiption.."stem "..i.description
		nodename = nodename.."stem"..((i.name and "_"..i.name) or "")
		sounds = default.node_sound_wood_defaults({
			footstep = {name="caverealms_stem", gain=.2},
			place = {name="default_place_node", gain=.5},
			dig = {name="caverealms_stem", gain=.4},
			dug = {name="default_wood_footstep", gain=.3}
		})
	elseif i.typ == "head" then
		desctiption = desctiption.."head "..i.description
		nodename = nodename.."head_"..i.name
		sounds = head_sounds
	else
		nodename = nodename..i.name
		desctiption = desctiption..i.description
	end
	local drop = i.sapling and {max_items = 1, items = {
		{items = {"caverealms:"..i.sapling}, rarity = 20},
		{items = {nodename}, rarity = 1}
	}}
	core.register_node(nodename, {
		description = desctiption,
		tiles = textures,
		groups = node_groups,
		drop = drop,
		sounds = sounds,
	})

	if add_fence
	and i.fence ~= false then
		add_fence({fence_of = nodename})
	end
end

core.register_node("caverealms:head_red_side", {
	description = "Giant mushroom head red side",
	tiles = {"caverealms_head.png",	"caverealms_lamellas.png",	"caverealms_head.png",
		"caverealms_head.png",	"caverealms_head.png",	"caverealms_lamellas.png"},
	paramtype2 = "facedir",
	groups = node_groups,
	drop = {max_items = 1,
		items = {{items = {"caverealms:fly_agaric"},rarity = 20,},
		{items = {"caverealms:head_red"},rarity = 1,}}},
	sounds = head_sounds
})

c = {
	air = core.get_content_id("air"),

	stem = core.get_content_id("caverealms:stem"),
	head_red = core.get_content_id("caverealms:head_red"),
	lamellas = core.get_content_id("caverealms:lamellas"),

	head_brown = core.get_content_id("caverealms:head_brown"),

	head_red_side = core.get_content_id("caverealms:head_red_side"),

	stem_brown = core.get_content_id("caverealms:stem_brown"),
	head_brown_full = core.get_content_id("caverealms:head_brown_full"),
	head_orange = core.get_content_id("caverealms:head_orange"),
	head_yellow = core.get_content_id("caverealms:head_yellow"),

	stem_blue = core.get_content_id("caverealms:stem_blue"),
	head_blue = core.get_content_id("caverealms:head_blue"),
	head_blue_bright = core.get_content_id("caverealms:head_blue_bright"),

	head_white = core.get_content_id("caverealms:head_white"),
	head_binge = core.get_content_id("caverealms:head_binge"),
	head_brown_bright = core.get_content_id("caverealms:head_brown_bright"),

	stem_red = core.get_content_id("caverealms:stem_red"),
}

-- Growing

core.register_tool("caverealms:growingtool", {
	description = "Growing Tool",
	inventory_image = "caverealms_growingtool.png",
})

local grow_functions = {
	["caverealms:red"] = caverealms_hybridpilz,
	["caverealms:fly_agaric"] = caverealms_minecraft_fliegenpilz,
	["caverealms:brown"] = caverealms_brauner_minecraftpilz,
	["caverealms:lavashroom"] = caverealms_lavashroom,
	["caverealms:glowshroom"] = caverealms_glowshroom,
	["caverealms:parasol"] = caverealms_parasol,
	["caverealms:red45"] = caverealms_red45
}
local function get_grow(name)
	if grow_functions[name] then
		return grow_functions[name]
	end

	local is = {}
	for i = 1,#core.registered_abms do
		local ad = core.registered_abms[i]
		if ad.chance > 1
		and table.indexof(ad.nodenames, name) ~= -1 then
			is[#is+1] = ad.action
		end
	end

	local func
	if is[1] then
		function func(pos, node)
			for i = 1,#is do
				is[i](pos, node)
			end
		end
	else
		local def = core.registered_nodes[name]
		if def then
			if def.on_timer then
				func = def.on_timer
			else
				func = function(pos, node, player)
					if def.on_place then
						def.on_place(ItemStack(name), player, {
							type = "node",
							under = vector.new(pos),--{x=pos.x, y=pos.y-1, z=pos.z},
							above = vector.new(pos)
						})
					end
					if def.after_place_node then
						def.after_place_node(pos)
					end
				end
			end
		else
			func = function() end
		end
	end

	grow_functions[name] = func
	return func
end

core.register_on_punchnode(function(pos, node, player)
	if player:get_wielded_item():get_name() ~= "caverealms:growingtool"
	or core.is_protected(pos, player:get_player_name()) then
		return
	end

	local func = get_grow(node.name)
	if func then
		func(pos, node, player)
	end
end)

-- mush45's meal
core.register_craftitem("caverealms:mush45_meal", {
	description = "Mushroom Meal",
	inventory_image = "caverealms_mush45_meal.png",
	on_use = core.item_eat(6),
})

core.register_craft({
	output = "caverealms:mush45_meal 4",
	recipe = {
		{"caverealms:brown45", "caverealms:red45"},
		{"caverealms:red45", "caverealms:brown45"}
	}
})
