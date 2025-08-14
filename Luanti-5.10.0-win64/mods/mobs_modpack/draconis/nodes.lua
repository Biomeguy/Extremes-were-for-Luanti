-- Draconis Nodes

core.register_node("draconis:fire_wyvern_nest", {
	description = "Fire Wyvern Nest",
	tiles = {"draconis_fire_wyvern_nest.png"},
	drawtype = "mesh",
	mesh = "draconis_nest.obj",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, -.4375, .5},
			{-.5, -.5, -.5, .5, -.25, -.375},
			{.375, -.5, -.5, .5, -.25, .5},
			{-.5, -.5, .375, .5, -.25, .5},
			{-.5, -.5, -.5, -.375, -.25, .5},
		}
	},
	sunlight_propagates = true,
	is_ground_content = false,
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 2},
	sounds = default.node_sound_leaves_defaults(),
	drop = "draconis:fire_wyvern_egg",
	after_dig_node = function(pos)
-- Make Wyvern spawn above the nest
		core.add_entity({x= pos.x, y= pos.y+ 3.5, z= pos.z}, "draconis:fire_wyvern")
	end,
})

core.register_node("draconis:ice_wyvern_nest", {
	description = "Ice Wyvern Nest",
	tiles = {"draconis_ice_wyvern_nest.png"},
	drawtype = "mesh",
	mesh = "draconis_nest.obj",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, -.4375, .5},
			{-.5, -.5, -.5, .5, -.25, -.375},
			{.375, -.5, -.5, .5, -.25, .5},
			{-.5, -.5, .375, .5, -.25, .5},
			{-.5, -.5, -.5, -.375, -.25, .5},
		}
	},
	sunlight_propagates = true,
	is_ground_content = false,
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 2},
	sounds = default.node_sound_leaves_defaults(),
	drop = "draconis:ice_wyvern_egg",
	after_dig_node = function(pos)
-- Make Wyvern spawn above the nest
		core.add_entity({x= pos.x, y= pos.y+ 3.5, z= pos.z}, "draconis:ice_wyvern")
	end,
})

core.register_node("draconis:dragon_fire", {
	description = "Dragon Fire",
	drawtype = "firelike",
	tiles = {{
		name = "draconis_dragon_fire_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1},
	}},
	inventory_image = "draconis_dragon_fire.png",
	paramtype = "light",
	light_source = 14,
	groups = {igniter = 3, snappy=1},
	drop = '',
	walkable = false,
	sunlight_propagates = true,
	damage_per_second = 8,
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.min(10), math.max(10))
	end,
	on_timer = function(pos)
		local f = core.find_node_near(pos, 1, {"group:flammable"})
		if not fire_enabled or not f then
			core.remove_node(pos)
			return
		end
		return true
	end,
})

-- Hatching Blocks

core.register_node("draconis:hot_obsidian", {
	description = "Super-Heated Obsidian",
	tiles = {"draconis_hot_obsidian.png"},
	damage_per_second = 2,
	on_construct = function(pos)
		core.get_node_timer(pos):start(1)
	end,
	on_timer = function(pos)
		core.add_particlespawner({
			amount = 32,
			time = 4,
			minpos = {x=pos.x-.4, y=pos.y-.4, z=pos.z-.4},
			maxpos = {x=pos.x+.4, y=pos.y+.4, z=pos.z+.4},
			minvel = {x=-.2, y=-.8, z=-.2},
			maxvel = {x=.2, y=.8, z=.2},
			exptime = {min = 1.4, max = 1.5},
			minsize = 1,
			maxsize = 2,
			texture = "draconis_dragon_fire.png"})
		core.get_node_timer(pos):start(math.random(1,4))
	end,
	groups = {cracky = 1, level = 2, igniter = 1, timer_check=1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("draconis:cold_ice", {
	description = "Super-Cooled Ice",
	tiles = {"draconis_cold_ice.png"},
	paramtype = "light",
	is_ground_content = false,
	damage_per_second = 2,
	on_construct = function(pos)
		core.get_node_timer(pos):start(1)
	end,
	on_timer = function(pos)
		core.add_particlespawner({
			amount = 32,
			time = 4,
			minpos = {x=pos.x-.4, y=pos.y-.4, z=pos.z-.4},
			maxpos = {x=pos.x+.4, y=pos.y+.4, z=pos.z+.4},
			minvel = {x=-.2, y=-.8, z=-.2},
			maxvel = {x=.2, y=.8, z=.2},
			exptime = {min = 1.4, max = 1.5},
			minsize = 1,
			maxsize = 2,
			texture = "draconis_frost_flame.png"})
		core.get_node_timer(pos):start(math.random(1,4))
	end,
	groups = {cracky = 3, cools_lava = 1, slippery = 1, timer_check=1},
	sounds = default.node_sound_glass_defaults(),
})
