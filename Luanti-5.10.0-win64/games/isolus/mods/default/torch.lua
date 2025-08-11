-- default/torch.lua

-- support for MT game translation.
local S = default.get_translator

local function on_flood(pos, oldnode, newnode)
	core.add_item(pos, ItemStack("default:torch 1"))
	-- Play flame-extinguish sound if liquid is not an 'igniter'
	local nodedef = core.registered_items[newnode.name]
	if not (nodedef and nodedef.groups and
			nodedef.groups.igniter and nodedef.groups.igniter > 0) then
		core.sound_play("default_cool_lava",
			{pos = pos, max_hear_distance = 16, gain = .07}, true)
	end
	-- Remove the torch node
	return false
end

-- check for valid torch settings or use defaults
torch_min = tonumber(core.settings:get("torch_min_duration")) or 3000
torch_max = tonumber(core.settings:get("torch_max_duration")) or 3600
if torch_min <=5 then	torch_min = 3000 end
if torch_max <=5 then	torch_max = 3600 end

core.register_node("default:torch", {
	description = S("Torch"),
	drawtype = "mesh",
	mesh = "torch_floor.obj",
	inventory_image = "default_torch_on_floor.png",
	wield_image = "default_torch_on_floor.png",
	tiles = {{
		name = "default_torch_on_floor_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = 12,
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {choppy=2, dig_immediate=3, flammable=1, attached_node=1, torch=1, timer_check=1},
	selection_box = {
		type = "wallmounted",
		wall_bottom = {-1/8, -.5, -1/8, 1/8, 2/16, 1/8}
	},
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local def = core.registered_nodes[node.name]
		if def and def.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointd) or itemstack
		end

		local above = pointd.above
		local wdir = core.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			fakestack:set_name("default:torch_ceiling")
		elseif wdir == 1 then
			fakestack:set_name("default:torch")
		else
			fakestack:set_name("default:torch_wall")
		end

		itemstack = core.item_place(fakestack, placer, pointd, wdir)
		itemstack:set_name("default:torch")

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		local meta = core.get_meta(pos)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local p2 = core.get_node(pos).param2
		if meta:get_int("torch_check_above") < 1 then
			default.melt_near_heat(above)
			meta:set_int("torch_check_above",1)
			core.get_node_timer(pos):start(math.random(torch_min, torch_max)-5)
		else
			core.set_node(pos, {name = "default:torch_spent", param2 = p2})
			core.sound_play({name="real_torch_burnout", gain = .1},
				{pos = pos, max_hear_distance = 10})
		end
	end,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	floodable = true,
	on_flood = on_flood,
	on_rotate = false
})

core.register_node("default:torch_wall", {
	drawtype = "mesh",
	mesh = "torch_wall.obj",
	tiles = {{
		name = "default_torch_on_floor_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = 12,
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1, timer_check=1},
	drop = "default:torch",
	selection_box = {
		type = "wallmounted",
		wall_side = {-1/2, -.5, -1/8, -1/8, 1/8, 1/8}
	},
	sounds = default.node_sound_wood_defaults(),
	on_timer = function(pos, elapsed)
		local meta = core.get_meta(pos)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local p2 = core.get_node(pos).param2
		if meta:get_int("torch_check_above") < 1 then
			default.melt_near_heat(above)
			meta:set_int("torch_check_above",1)
			core.get_node_timer(pos):start(math.random(torch_min, torch_max)-5)
		else
			core.set_node(pos, {name = "default:torch_spent_wall", param2 = p2})
			core.sound_play({name="real_torch_burnout", gain = .1},
				{pos = pos, max_hear_distance = 10})
		end
	end,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	floodable = true,
	on_flood = on_flood,
	on_rotate = false
})

core.register_node("default:torch_ceiling", {
	drawtype = "mesh",
	mesh = "torch_ceiling.obj",
	tiles = {{
		name = "default_torch_on_floor_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = 12,
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1, timer_check=1},
	drop = "default:torch",
	selection_box = {
		type = "wallmounted",
		wall_top = {-1/8, -1/16, -5/16, 1/8, .5, 1/8}
	},
	sounds = default.node_sound_wood_defaults(),
	on_timer = function(pos, elapsed)
		local meta = core.get_meta(pos)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local p2 = core.get_node(pos).param2
		if meta:get_int("torch_check_above") < 1 then
			default.melt_near_heat(above)
			meta:set_int("torch_check_above",1)
			core.get_node_timer(pos):start(math.random(torch_min, torch_max)-5)
		else
			core.set_node(pos, {name = "default:torch_spent_ceiling", param2 = p2})
			core.sound_play({name="real_torch_burnout", gain = .1},
				{pos = pos, max_hear_distance = 10})
		end
	end,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	floodable = true,
	on_flood = on_flood,
	on_rotate = false
})

core.register_lbm({
	name = "default:3dtorch",
	nodenames = {"default:torch", "torches:floor", "torches:wall"},
	action = function(pos, node)
		if node.param2 == 0 then
			core.set_node(pos, {name = "default:torch_ceiling", param2 = node.param2})
		elseif node.param2 == 1 then
			core.set_node(pos, {name = "default:torch", param2 = node.param2})
		else
			core.set_node(pos, {name = "default:torch_wall", param2 = node.param2})
		end
	end
})

core.register_node("default:torch_spent", {
	description = S("Spent Torch"),
	drawtype = "mesh",
	mesh = "torch_floor.obj",
	inventory_image = "default_torch_on_floor_spent.png",
	wield_image = "default_torch_on_floor_spent.png",
	tiles = {"default_torch_on_floor_spent.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {choppy=2, dig_immediate=3, flammable=1, attached_node=1, torch_spent=1},
	selection_box = {
		type = "wallmounted",
		wall_bottom = {-1/8, -.5, -1/8, 1/8, 2/16, 1/8}
	},
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local def = core.registered_nodes[node.name]
		if def and def.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointd) or itemstack
		end

		local above = pointd.above
		local wdir = core.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			fakestack:set_name("default:torch_spent_ceiling")
		elseif wdir == 1 then
			fakestack:set_name("default:torch_spent")
		else
			fakestack:set_name("default:torch_spent_wall")
		end

		itemstack = core.item_place(fakestack, placer, pointd, wdir)
		itemstack:set_name("default:torch_spent")

		return itemstack
	end,
	on_rotate = false
})

core.register_node("default:torch_spent_wall", {
	drawtype = "mesh",
	mesh = "torch_wall.obj",
	tiles = {"default_torch_on_floor_spent.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch_spent=1},
	drop = "default:torch_spent",
	selection_box = {
		type = "wallmounted",
		wall_side = {-1/2, -.5, -1/8, -1/8, 1/8, 1/8}
	},
	sounds = default.node_sound_wood_defaults(),
	on_rotate = false
})

core.register_node("default:torch_spent_ceiling", {
	drawtype = "mesh",
	mesh = "torch_ceiling.obj",
	tiles = {"default_torch_on_floor_spent.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch_spent=1},
	drop = "default:torch_spent",
	selection_box = {
		type = "wallmounted",
		wall_top = {-1/8, -1/16, -5/16, 1/8, .5, 1/8}
	},
	sounds = default.node_sound_wood_defaults(),
	on_rotate = false
})

-- start timer on any already placed torches
core.register_lbm({
	name = "default:convert_torch_to_node_timer",
	nodenames = {"default:torch", "default:torch_wall", "default:torch_ceiling",
		"gloop:kalite_torch", "gloop:kalite_torch_wall", "gloop:kalite_torch_ceiling",
		"xtraores:antracite_torch", "xtraores:antracite_torch_wall", "xtraores:antracite_torch_ceiling"},
	action = function(pos)
		if not core.get_node_timer(pos):is_started() then
			core.get_node_timer(pos):start(5)
		end
	end
})

core.register_craft({
	type = "shapeless",
	output = "default:torch 4",
	recipe = {"group:stick", "group:coal", "group:grinder", "default:glue"},
	replacements = {
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:torch 4",
	recipe = {"default:torch_spent", "default:torch_spent", "default:torch_spent",
		"default:torch_spent", "group:coal", "group:grinder", "default:glue"},
	replacements = {
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "default:torch",
	burntime = 4,
})

core.register_craft({
	type = "fuel",
	recipe = "default:torch_spent",
	burntime = 1,
})

core.register_node("default:meselamp_torch", {
	description = S("Mese Lamp Torch"),
	drawtype = "mesh",
	mesh = "torch_floor.obj",
	inventory_image = "default_meselamp_torch.png",
	wield_image = "default_meselamp_torch.png",
	tiles = {"default_meselamp_torch.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = default.LIGHT_MAX-1,
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {choppy=2, dig_immediate=3, flammable=1, attached_node=1},
	selection_box = {
		type = "wallmounted",
		wall_bottom = {-1/8, -.5, -1/8, 1/8, 2/16, 1/8},
		wall_top = {-1/8, -1/16, -1/8, 1/8, .5, 1/8}
	},
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local def = core.registered_nodes[node.name]
		if def and def.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointd) or itemstack
		end

		local above = pointd.above
		local wdir = core.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 or wdir == 1 then
			fakestack:set_name("default:meselamp_torch")
		else
			fakestack:set_name("default:meselamp_torch_wall")
		end

		itemstack = core.item_place(fakestack, placer, pointd, wdir)
		itemstack:set_name("default:meselamp_torch")

		return itemstack
	end,
	on_rotate = false
})

core.register_node("default:meselamp_torch_wall", {
	drawtype = "mesh",
	mesh = "torch_wall.obj",
	tiles = {"default_meselamp_torch.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = default.LIGHT_MAX-1,
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1},
	drop = "default:meselamp_torch",
	selection_box = {
		type = "wallmounted",
		wall_side = {-1/2, -.5, -1/8, -1/8, 1/8, 1/8}
	},
	sounds = default.node_sound_wood_defaults(),
	on_rotate = false
})

core.register_craft({
	output = "default:meselamp_torch 16",
	recipe = {
		{"default:meselamp"},
		{"group:wood"}
	}
})
