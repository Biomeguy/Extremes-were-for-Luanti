
-- Ingots

core.register_craftitem("xtraores:nickel_ingot", {
	description = "".. core.colorize("#68fff6", "Nickel ingot\n").. "Xtraores material level: 1",
	inventory_image = "xtraores_nickel_ingot.png",
	stack_max = 999,
})

core.register_craftitem("xtraores:platinum_ingot", {
	description = "".. core.colorize("#68fff6", "Platinum ingot\n").. "Xtraores material level: 2",
	inventory_image = "xtraores_platinum_ingot.png",
	stack_max = 999,
})

core.register_craftitem("xtraores:palladium_ingot", {
	description = "".. core.colorize("#68fff6", "Palladium ingot\n").. "Xtraores material level: 3",
	inventory_image = "xtraores_palladium_ingot.png",
	stack_max = 999,
})

core.register_craftitem("xtraores:cobalt_ingot", {
	description = "".. core.colorize("#68fff6", "Cobalt ingot\n").. "Xtraores material level: 4",
	inventory_image = "xtraores_cobalt_ingot.png",
	stack_max = 999,
})

core.register_craftitem("xtraores:thorium_ingot", {
	description = "".. core.colorize("#68fff6", "Thorium ingot\n").. "Xtraores material level: 5",
	inventory_image = "xtraores_thorium_ingot.png",
	stack_max = 999,
})

core.register_craftitem("xtraores:osmium_ingot", {
	description = "".. core.colorize("#68fff6", "Osmium ingot\n").. "Xtraores material level: 6",
	inventory_image = "xtraores_osmium_ingot.png",
	stack_max = 999,
})

core.register_craftitem("xtraores:rhenium_ingot", {
	description = "".. core.colorize("#68fff6", "Rhenium ingot\n").. "Xtraores material level: 7",
	inventory_image = "xtraores_rhenium_ingot.png",
	stack_max = 999,
})

core.register_craftitem("xtraores:vanadium_ingot", {
	description = "".. core.colorize("#68fff6", "Vanadium ingot\n").. "Xtraores material level: 8",
	inventory_image = "xtraores_vanadium_ingot.png",
	stack_max = 999,
})

core.register_craftitem("xtraores:rarium_ingot", {
	description = "".. core.colorize("#68fff6", "Rarium ingot\n").. "Xtraores material level: 9",
	inventory_image = "xtraores_rarium_ingot.png",
	stack_max = 999,
})

core.register_craftitem("xtraores:orichalcum_ingot", {
	description = "".. core.colorize("#68fff6", "Orichalcum ingot\n").. "Xtraores material level: 10",
	inventory_image = "xtraores_orichalcum_ingot.png",
	stack_max = 999,
})

core.register_craftitem("xtraores:titanium_ingot", {
	description = "".. core.colorize("#68fff6", "Titanium ingot\n").. "Xtraores material level: 11",
	inventory_image = "xtraores_titanium_ingot.png",
	stack_max = 999,
})

core.register_craftitem("xtraores:uranium_ingot", {
	description = "".. core.colorize("#68fff6", "Uranium ingot\n").. "Xtraores material level: 11",
	inventory_image = "xtraores_uranium_ingot.png",
	stack_max = 999,
})

core.register_craftitem("xtraores:chromium_ingot", {
	description = "".. core.colorize("#68fff6", "Chromium ingot\n").. "Xtraores material level: 12",
	inventory_image = "xtraores_chromium_ingot.png",
	stack_max = 999,
})

-- Handles

core.register_craftitem("xtraores:steel_handle", {
	description = "".. core.colorize("#68fff6", "Steel handle\n").. "Xtraores material level: 5-8",
	inventory_image = "xtraores_steel_handle.png",
	stack_max = 999,
})

core.register_craft({
	output = "xtraores:steel_handle 6",
	recipe = {
		{"", "", "default:steel_bar"},
		{"", "default:steel_bar", ""},
		{"default:steel_bar", "", ""}
	}
})

core.register_craftitem("xtraores:duraglass_handle", {
	description = "".. core.colorize("#68fff6", "Duraglass handle\n").. "Xtraores material level: 9-12",
	inventory_image = "xtraores_duraglass_handle.png",
	stack_max = 999,
})

core.register_craft({
	output = "xtraores:duraglass_handle 3",
	recipe = {
		{"", "", "default:obsidian_shard"},
		{"", "xtraores:osmium_ingot", ""},
		{"default:glass", "", ""},
	}
})

-- Platinum revolver parts

core.register_craftitem("xtraores:platinum_mag", {
	description = "".. core.colorize("#68fff6", "Platinum revolver magazine\n").. "Xtraores material level: 2",
	inventory_image = "xtraores_platinum_mag.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:platinum_mag",
	recipe = {
		{"xtraores:platinum_ingot", "xtraores:platinum_ingot", ""},
		{"xtraores:platinum_ingot", "xtraores:platinum_ingot", ""},
		{"xtraores:platinum_ingot", "xtraores:platinum_ingot", ""},
	}
})

core.register_craftitem("xtraores:platinum_revolver_base", {
	description = "".. core.colorize("#68fff6", "Platinum revolver base\n").. "Xtraores material level: 2",
	inventory_image = "xtraores_platinum_revolver_base.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:platinum_revolver_base",
	recipe = {
		{"xtraores:platinum_ingot", "xtraores:platinum_ingot", "xtraores:platinum_ingot"},
		{"", "xtraores:platinum_ingot", "xtraores:platinum_ingot"},
		{"", "xtraores:platinum_ingot", ""},
	}
})

core.register_craftitem("xtraores:revolver_handle", {
	description = "".. core.colorize("#68fff6", "Revolver handle\n").. "Xtraores material level: 2",
	inventory_image = "xtraores_revolver_handle.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:revolver_handle",
	recipe = {
		{"", "group:wood", "group:wood"},
		{"", "xtraores:platinum_ingot", "group:wood"},
		{"", "group:wood", "group:wood"},
	}
})

-- Cobalt handgun parts

core.register_craftitem("xtraores:cobalt_base", {
	description = "".. core.colorize("#68fff6", "Cobalt handgun base\n").. "Xtraores material level: 4",
	inventory_image = "xtraores_cobalt_base.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:cobalt_base",
	recipe = {
		{"xtraores:cobalt_ingot", "xtraores:cobalt_ingot", ""},
		{"xtraores:cobalt_ingot", "xtraores:cobalt_ingot", "xtraores:cobalt_ingot"},
		{"", "xtraores:cobalt_ingot", ""},
	}
})

core.register_craftitem("xtraores:cobalt_top", {
	description = "".. core.colorize("#68fff6", "Cobalt handgun top\n").. "Xtraores material level: 4",
	inventory_image = "xtraores_cobalt_top.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:cobalt_top",
	recipe = {
		{"", "", "xtraores:cobalt_ingot"},
		{"xtraores:cobalt_ingot", "xtraores:cobalt_ingot", "xtraores:cobalt_ingot"},
	}
})

core.register_craftitem("xtraores:cobalt_handle", {
	description = "".. core.colorize("#68fff6", "Cobalt handgun handle\n").. "Xtraores material level: 4",
	inventory_image = "xtraores_cobalt_handle.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:cobalt_handle",
	recipe = {
		{"xtraores:cobalt_ingot", "default:coal_lump", "default:coal_lump"},
		{"xtraores:cobalt_ingot", "default:coal_lump", "default:coal_lump"},
		{"xtraores:cobalt_ingot", "xtraores:cobalt_ingot", "xtraores:cobalt_ingot"},
	}
})

--- Orichalcum rifle parts

core.register_craftitem("xtraores:orichalcum_rifle_base", {
	description = "".. core.colorize("#68fff6", "Orichalcum rifle base\n").. "Xtraores material level: 10",
	inventory_image = "xtraores_orichalcum_rifle_base.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:orichalcum_rifle_base",
	recipe = {
		{"xtraores:orichalcum_ingot", "xtraores:orichalcum_ingot", "xtraores:orichalcum_ingot"},
		{"", "xtraores:orichalcum_ingot", "xtraores:orichalcum_ingot"},
	}
})

core.register_craftitem("xtraores:orichalcum_rifle_scope", {
	description = "".. core.colorize("#68fff6", "Orichalcum rifle scope\n").. "Xtraores material level: 10",
	inventory_image = "xtraores_orichalcum_rifle_scope.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:orichalcum_rifle_scope",
	recipe = {
		{"xtraores:orichalcum_ingot", "", "xtraores:orichalcum_ingot"},
		{"default:diamond", "xtraores:orichalcum_ingot", "default:diamond"},
		{"xtraores:orichalcum_ingot", "", "xtraores:orichalcum_ingot"},
	}
})

core.register_craftitem("xtraores:orichalcum_rifle_stock", {
	description = "".. core.colorize("#68fff6", "Orichalcum rifle stock\n").. "Xtraores material level: 10",
	inventory_image = "xtraores_orichalcum_rifle_stock.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:orichalcum_rifle_stock",
	recipe = {
		{"xtraores:orichalcum_ingot", "xtraores:orichalcum_ingot", "xtraores:orichalcum_ingot"},
		{"xtraores:orichalcum_ingot", "", "xtraores:orichalcum_ingot"},
		{"", "xtraores:orichalcum_ingot", "xtraores:orichalcum_ingot"},
	}
})

core.register_craftitem("xtraores:orichalcum_rifle_barrel", {
	description = "".. core.colorize("#68fff6", "Orichalcum rifle barrel\n").. "Xtraores material level: 10",
	inventory_image = "xtraores_orichalcum_rifle_barrel.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:orichalcum_rifle_barrel",
	recipe = {
		{"xtraores:orichalcum_ingot", "xtraores:orichalcum_ingot", "xtraores:orichalcum_ingot"},
	}
})

core.register_craftitem("xtraores:orichalcum_rifle_grip", {
	description = "".. core.colorize("#68fff6", "Orichalcum rifle grip\n").. "Xtraores material level: 10",
	inventory_image = "xtraores_orichalcum_rifle_grip.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:orichalcum_rifle_grip",
	recipe = {
		{"xtraores:orichalcum_ingot", "xtraores:orichalcum_ingot", "xtraores:orichalcum_ingot"},
		{"xtraores:orichalcum_ingot", "xtraores:orichalcum_ingot", "xtraores:orichalcum_ingot"},
	}
})

core.register_craftitem("xtraores:orichalcum_rifle_handle", {
	description = "".. core.colorize("#68fff6", "Orichalcum rifle handle\n").. "Xtraores material level: 10",
	inventory_image = "xtraores_orichalcum_rifle_handle.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:orichalcum_rifle_handle",
	recipe = {
		{"", "xtraores:orichalcum_ingot", "xtraores:orichalcum_ingot"},
		{"", "", "xtraores:orichalcum_ingot"},
	}
})

-- Titanium gun parts

core.register_craftitem("xtraores:titanium_gun_barrel", {
	description = "".. core.colorize("#68fff6", "Titanium gun barrel\n").. "Xtraores material level: 11",
	inventory_image = "xtraores_titanium_gun_barrel.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:titanium_gun_barrel",
	recipe = {
		{"xtraores:titanium_ingot","xtraores:titanium_ingot","xtraores:titanium_ingot"},
	}
})

core.register_craftitem("xtraores:titanium_handgun_base", {
	description = "".. core.colorize("#68fff6", "Titanium handgun base\n").. "Xtraores material level: 11",
	inventory_image = "xtraores_titanium_handgun_base.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:titanium_handgun_base",
	recipe = {
		{"xtraores:titanium_ingot","xtraores:titanium_ingot","xtraores:titanium_ingot"},
		{"xtraores:titanium_ingot","xtraores:titanium_ingot",""},
	}
})

core.register_craftitem("xtraores:titanium_gun_handle", {
	description = "".. core.colorize("#68fff6", "Titanium gun handle\n").. "Xtraores material level: 11",
	inventory_image = "xtraores_titanium_gun_handle.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:titanium_gun_handle",
	recipe = {
		{"","xtraores:titanium_ingot","xtraores:titanium_ingot"},
		{"","","xtraores:titanium_ingot"},
		{"","","xtraores:titanium_ingot"},
	}
})

core.register_craftitem("xtraores:titanium_machinegun_base", {
	description = "".. core.colorize("#68fff6", "Titanium machinegun base\n").. "Xtraores material level: 11",
	inventory_image = "xtraores_titanium_machinegun_base.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:titanium_machinegun_base",
	recipe = {
		{"xtraores:titanium_ingot","xtraores:titanium_ingot","xtraores:titanium_ingot"},
		{"xtraores:titanium_ingot","xtraores:titanium_ingot","xtraores:titanium_ingot"},
		{"","","xtraores:titanium_ingot"},
	}
})

core.register_craftitem("xtraores:titanium_machinegun_stock", {
	description = "".. core.colorize("#68fff6", "Titanium machinegun stock\n").. "Xtraores material level: 11",
	inventory_image = "xtraores_titanium_machinegun_stock.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:titanium_machinegun_stock",
	recipe = {
		{"xtraores:titanium_ingot","xtraores:titanium_ingot","xtraores:titanium_ingot"},
		{"","","xtraores:titanium_ingot"},
		{"","","xtraores:titanium_ingot"},
	}
})

core.register_craftitem("xtraores:titanium_machinegun_mag", {
	description = "".. core.colorize("#68fff6", "Titanium machinegun mag\n").. "Xtraores material level: 11",
	inventory_image = "xtraores_titanium_machinegun_mag.png",
	stack_max = 10,
})

core.register_craft({
	output = "xtraores:titanium_machinegun_mag",
	recipe = {
		{"","xtraores:titanium_ingot","xtraores:titanium_ingot"},
		{"","xtraores:titanium_ingot","xtraores:titanium_ingot"},
		{"","","xtraores:titanium_ingot"},
	}
})

-- Antracite torch

local function on_flood(pos, oldnode, newnode)
	core.add_item(pos, ItemStack("xtraores:antracite_torch 1"))
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

core.register_node("xtraores:antracite_torch", {
	description = "" ..core.colorize("#68fff6", "Antracite torch\n").. "Range: 5\nLasts twice as long as normal or kalite torches",
	drawtype = "mesh",
	range = 5.,
	stack_max = 999,
	mesh = "torch_floor.obj",
	inventory_image = "xtraores_antracite_torch.png",
	wield_image = "xtraores_antracite_torch.png",
	tiles = {{
		name = "xtraores_antracite_torch_on_floor_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	light_source = 14,
	groups = {choppy=2, dig_immediate=3, attached_node=1, antracite_torch=1, timer_check=1},
	selection_box = {
		type = "wallmounted",
		wall_bottom = {-1/8, -1/2, -1/8, 1/8, 2/16, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local def = core.registered_nodes[node.name]
		if def and def.on_rightclick and
			not (placer and placer:is_player() and placer:get_player_control().sneak) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointd) or itemstack
		end

		local above = pointd.above
		local wdir = core.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			fakestack:set_name("xtraores:antracite_torch_ceiling")
		elseif wdir == 1 then
			fakestack:set_name("xtraores:antracite_torch")
		else
			fakestack:set_name("xtraores:antracite_torch_wall")
		end

		itemstack = core.item_place(fakestack, placer, pointd, wdir)
		itemstack:set_name("xtraores:antracite_torch")

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		local meta = core.get_meta(pos)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local p2 = core.get_node(pos).param2
		if meta:get_int("torch_check_above") < 1 then
			default.melt_near_heat(above)
			meta:set_int("torch_check_above",1)
			core.get_node_timer(pos):start(math.random(torch_min, torch_max)*2-3)
		else
			core.set_node(pos, {name = "xtraores:torch_spent", param2 = p2})
			core.sound_play({name="real_torch_burnout", gain = .1},
				{pos = pos, max_hear_distance = 10})
		end
	end,
	on_construct = function(pos)
		core.get_node_timer(pos):start(3)
	end,
	floodable = true,
	on_flood = on_flood,
	on_rotate = false
})

core.register_node("xtraores:antracite_torch_wall", {
	drawtype = "mesh",
	mesh = "torch_wall.obj",
	tiles = {{
		name = "xtraores_antracite_torch_on_floor_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	light_source = 14,
	groups = {choppy=2, dig_immediate=3, not_in_creative_inventory=1, attached_node=1, antracite_torch=1, timer_check=1},
	drop = "xtraores:antracite_torch",
	selection_box = {
		type = "wallmounted",
		wall_side = {-1/2, -1/2, -1/8, -1/8, 1/8, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
	on_timer = function(pos, elapsed)
		local meta = core.get_meta(pos)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local p2 = core.get_node(pos).param2
		if meta:get_int("torch_check_above") < 1 then
			default.melt_near_heat(above)
			meta:set_int("torch_check_above",1)
			core.get_node_timer(pos):start(math.random(torch_min, torch_max)*2-3)
		else
			core.set_node(pos, {name = "xtraores:torch_spent_wall", param2 = p2})
			core.sound_play({name="real_torch_burnout", gain = .1},
				{pos = pos, max_hear_distance = 10})
		end
	end,
	on_construct = function(pos)
		core.get_node_timer(pos):start(3)
	end,
	floodable = true,
	on_flood = on_flood,
	on_rotate = false
})

core.register_node("xtraores:antracite_torch_ceiling", {
	drawtype = "mesh",
	mesh = "torch_ceiling.obj",
	tiles = {{
		name = "xtraores_antracite_torch_on_floor_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	light_source = 14,
	groups = {choppy=2, dig_immediate=3, not_in_creative_inventory=1, attached_node=1, antracite_torch=1, timer_check=1},
	drop = "xtraores:antracite_torch",
	selection_box = {
		type = "wallmounted",
		wall_top = {-1/8, -1/16, -5/16, 1/8, 1/2, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
	on_timer = function(pos, elapsed)
		local meta = core.get_meta(pos)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local p2 = core.get_node(pos).param2
		if meta:get_int("torch_check_above") < 1 then
			default.melt_near_heat(above)
			meta:set_int("torch_check_above",1)
			core.get_node_timer(pos):start(math.random(torch_min, torch_max)*2-3)
		else
			core.set_node(pos, {name = "xtraores:torch_spent_ceiling", param2 = p2})
			core.sound_play({name="real_torch_burnout", gain = .1},
				{pos = pos, max_hear_distance = 10})
		end
	end,
	on_construct = function(pos)
		core.get_node_timer(pos):start(3)
	end,
	floodable = true,
	on_flood = on_flood,
	on_rotate = false
})

core.register_node("xtraores:torch_spent", {
	description = "Spent antracite torch",
	drawtype = "mesh",
	stack_max = 999,
	mesh = "torch_floor.obj",
	inventory_image = "xtraores_torch_on_floor_spent.png",
	wield_image = "xtraores_torch_on_floor_spent.png",
	tiles = {"xtraores_torch_on_floor_spent.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {choppy=2, dig_immediate=3, attached_node=1, antracite_torch_spent=1},
	selection_box = {
		type = "wallmounted",
		wall_bottom = {-1/8, -1/2, -1/8, 1/8, 2/16, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local def = core.registered_nodes[node.name]
		if def and def.on_rightclick and
			not (placer and placer:is_player() and placer:get_player_control().sneak) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointd) or itemstack
		end

		local above = pointd.above
		local wdir = core.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			fakestack:set_name("xtraores:torch_spent_ceiling")
		elseif wdir == 1 then
			fakestack:set_name("xtraores:torch_spent")
		else
			fakestack:set_name("xtraores:torch_spent_wall")
		end

		itemstack = core.item_place(fakestack, placer, pointd, wdir)
		itemstack:set_name("xtraores:torch_spent")

		return itemstack
	end,
	on_rotate = false
})

core.register_node("xtraores:torch_spent_wall", {
	drawtype = "mesh",
	mesh = "torch_wall.obj",
	tiles = {"xtraores_torch_on_floor_spent.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {choppy=2, dig_immediate=3, not_in_creative_inventory=1, attached_node=1, antracite_torch_spent=1},
	drop = "xtraores:torch_spent",
	selection_box = {
		type = "wallmounted",
		wall_side = {-1/2, -1/2, -1/8, -1/8, 1/8, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
	on_rotate = false
})

core.register_node("xtraores:torch_spent_ceiling", {
	drawtype = "mesh",
	mesh = "torch_ceiling.obj",
	tiles = {"xtraores_torch_on_floor_spent.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {choppy=2, dig_immediate=3, not_in_creative_inventory=1, attached_node=1, antracite_torch_spent=1},
	drop = "xtraores:torch_spent",
	selection_box = {
		type = "wallmounted",
		wall_top = {-1/8, -1/16, -5/16, 1/8, 1/2, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
	on_rotate = false
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:antracite_torch 5",
	recipe = {"xtraores:torch_spent", "xtraores:torch_spent", "xtraores:torch_spent",
		"xtraores:torch_spent", "xtraores:torch_spent", "xtraores:antracite_ore"}
})
