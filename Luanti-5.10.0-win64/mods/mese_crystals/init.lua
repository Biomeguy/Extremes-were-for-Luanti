
local function check_lava(pos)
	local name = core.get_node(pos).name
	if name == "default:lava_source" or name == "default:lava_flowing" then
		return 1
	else
		return 0
	end
end

local function grow_mese_crystal_ore(pos)
	local node = core.get_node(pos)
	local pos1 = {x = pos.x, y = pos.y, z = pos.z}
	pos1.y = pos1.y - 1
	local name = core.get_node(pos1).name
	if name ~= "default:obsidian" then
		return
	end

	local lava_count = 0
	pos1.z = pos.z - 1
	lava_count = lava_count + check_lava(pos1)
	pos1.z = pos.z + 1
	lava_count = lava_count + check_lava(pos1)
	pos1.z = pos.z
	pos1.x = pos.x - 1
	lava_count = lava_count + check_lava(pos1)
	pos1.x = pos.x + 1
	lava_count = lava_count + check_lava(pos1)
	if lava_count < 2 then
		return
	end

	if node.name == "mese_crystals:mese_crystal_ore3" then
		node.name = "mese_crystals:mese_crystal_ore4"
		core.swap_node(pos, node)
	elseif node.name == "mese_crystals:mese_crystal_ore2" then
		node.name = "mese_crystals:mese_crystal_ore3"
		core.swap_node(pos, node)
	elseif node.name == "mese_crystals:mese_crystal_ore1" then
		node.name = "mese_crystals:mese_crystal_ore2"
		core.swap_node(pos, node)
	end
	core.get_node_timer(pos):start(math.random(300, 1500))
end

core.register_node("mese_crystals:mese_crystal_ore1", {
	description = "Mese Crystal Ore",
	mesh = "mese_crystal_ore1.obj",
	tiles = {"crystal.png"},
	paramtype = "light",
	drawtype = "mesh",
	groups = {cracky = 1, fall_damage_add_percent = 5, mineral_life = 1},
	drop = "default:mese_crystal",
	use_texture_alpha = "blend",
	light_source = 7,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, -.2, .2}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, -.2, .1}
	},
	on_timer = grow_mese_crystal_ore,
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("mese_crystals:mese_crystal_ore2", {
	description = "Mese Crystal Ore",
	mesh = "mese_crystal_ore2.obj",
	tiles = {"crystal.png"},
	paramtype = "light",
	drawtype = "mesh",
	groups = {cracky = 1, fall_damage_add_percent = 7, mineral_life = 1},
	drop = "default:mese_crystal 2",
	use_texture_alpha = "blend",
	light_source = 8,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, -.05, .2}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, -.1, .1}
	},
	on_timer = grow_mese_crystal_ore,
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("mese_crystals:mese_crystal_ore3", {
	description = "Mese Crystal Ore",
	mesh = "mese_crystal_ore3.obj",
	tiles = {"crystal.png"},
	paramtype = "light",
	drawtype = "mesh",
	groups = {cracky = 1, fall_damage_add_percent = 9, mineral_life = 1},
	drop = "default:mese_crystal 3",
	use_texture_alpha = "blend",
	light_source = 9,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, .1, .1}
	},
	on_timer = grow_mese_crystal_ore,
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("mese_crystals:mese_crystal_ore4", {
	description = "Mese Crystal Ore",
	mesh = "mese_crystal_ore4.obj",
	tiles = {"crystal.png"},
	paramtype = "light",
	drawtype = "mesh",
	groups = {cracky = 1, fall_damage_add_percent = 11, mineral_life = 1},
	drop = "default:mese_crystal 4",
	use_texture_alpha = "blend",
	light_source = 10,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .3, .2}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, .2, .1}
	},
	sounds = default.node_sound_glass_defaults(),
})

core.register_tool("mese_crystals:crystaline_bell", {
	description = "Crystaline Bell",
	inventory_image = "crystalline_bell.png",
	on_use = function(item, user, pointd)
		if pointd.type ~= "node" then
			return
		end
		local pos = pointd.under
if core.is_protected(pos, user:get_player_name()) then return end-- don't allow harvest if position protected
		local node = core.get_node(pos)
		local growth_stage = 0
		if node.name == "mese_crystals:mese_crystal_ore4" then
			growth_stage = 4
		elseif node.name == "mese_crystals:mese_crystal_ore3" then
			growth_stage = 3
		elseif node.name == "mese_crystals:mese_crystal_ore2" then
			growth_stage = 2
		elseif node.name == "mese_crystals:mese_crystal_ore1" then
			growth_stage = 1
		end
		if growth_stage == 4 then
			node.name = "mese_crystals:mese_crystal_ore3"
			core.swap_node(pos, node)
		elseif growth_stage == 3 then
			node.name = "mese_crystals:mese_crystal_ore2"
			core.swap_node(pos, node)
		elseif growth_stage == 2 then
			node.name = "mese_crystals:mese_crystal_ore1"
			core.swap_node(pos, node)
		end
		core.get_node_timer(pos):start(math.random(300, 1500))
		if growth_stage > 1 then
			item:add_wear(65535 / 100)
			local inv = user:get_inventory()
			local stack = ItemStack("default:mese_crystal")
			if inv:room_for_item("main", stack) then
				inv:add_item("main", stack)
			end
			return item
		end
	end,
})

core.register_craftitem("mese_crystals:mese_crystal_seed", {
	description = "Mese Crystal Seed",
	inventory_image = "mese_crystal_seed.png",
	groups = {mineral_life = 1},
	on_place = function(item, user, pointd)
		if pointd.type ~= "node" then
			return
		end
		local pos = pointd.under
	if pointd.above.y ~= pos.y+1 then
		return item
	end
		local node = core.get_node(pos)
		if node.name == "default:obsidian" then
			local pos1 = pointd.above
			local node1 = core.get_node(pos1)
			if node1.name == "air" and not core.is_protected(pos1, user:get_player_name())then
	core.set_node(pos1, {name="mese_crystals:mese_crystal_ore1"})
	core.get_node_timer(pos1):start(math.random(300, 1500))
if not core.is_creative_enabled(user:get_player_name()) then
	item:take_item()
	return item
end
			end
		end
		return item
	end,
})

local stoneNdiamite = {"default:stone", "default:diamite", "default:bedrock"}

core.register_ore({
	ore_type       = "scatter",
	ore            = "mese_crystals:mese_crystal_ore1",
	wherein        = stoneNdiamite,
	clust_scarcity = 18 * 18 * 18,
	clust_num_ores = 1,
	clust_size     = 1,
	y_max          = -64,
	y_min          = -255,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "mese_crystals:mese_crystal_ore2",
	wherein        = stoneNdiamite,
	clust_scarcity = 20 * 20 * 20,
	clust_num_ores = 1,
	clust_size     = 1,
	y_max          = -256,
	y_min          = -31000,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "mese_crystals:mese_crystal_ore3",
	wherein        = stoneNdiamite,
	clust_scarcity = 20 * 20 * 20,
	clust_num_ores = 1,
	clust_size     = 1,
	y_max          = -256,
	y_min          = -31000,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "mese_crystals:mese_crystal_ore4",
	wherein        = stoneNdiamite,
	clust_scarcity = 20 * 20 * 20,
	clust_num_ores = 1,
	clust_size     = 1,
	y_max          = -256,
	y_min          = -31000,
})

core.register_lbm({
	name = "mese_crystals:activate_node_timers",
	nodenames = {"mese_crystals:mese_crystal_ore1", "mese_crystals:mese_crystal_ore2", "mese_crystals:mese_crystal_ore3"},
	neighbors = {"default:obsidian", "default:lava_source"},
	run_at_every_load = true,
	action = function(pos)
		if not core.get_node_timer(pos):is_started() then
			core.get_node_timer(pos):start(2)
		end
	end
})

core.register_craft({
	output = "mese_crystals:mese_crystal_seed",
	recipe = {
		{"default:mese_crystal","default:mese_crystal","default:mese_crystal"},
		{"default:mese_crystal","default:obsidian_shard","default:mese_crystal"},
		{"default:mese_crystal","default:mese_crystal","default:mese_crystal"}
	}
})

core.register_craft({
	output = "mese_crystals:crystaline_bell",
	recipe = {
		{"default:diamond"},
		{"default:glass"},
		{"default:stick"}
	}
})

