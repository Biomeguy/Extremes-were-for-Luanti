
core.register_node("sponge:sponge", {
	description = "Sponge",
	tiles = {"sponge.png"},
	groups = {oddly_breakable_by_hand=3, flammable=1},

	on_construct = function(pos)
		core.get_node_timer(pos):start(1)
	end,
	on_timer = function(pos, elapsed)
		if core.find_node_near(pos, 1, {"default:water_source", "default:water_flowing"}) then
	for i=-1,1 do
	for j=-1,1 do
	for k=-1,1 do
		p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		n = core.get_node(p)
		if n.name == "default:water_source" or n.name == "default:water_flowing" then
			core.set_node(p, {name="air"})
			core.set_node(pos, {name="sponge:sponge_wet"})
			core.get_node_timer(pos):start(270)
		end
	end
	end
	end
		else
			core.get_node_timer(pos):start(3)
		end
	end,
})

core.register_node("sponge:sponge_wet", {
	description = "Soaked Sponge",
	tiles = {"sponge.png^[colorize:#0000AC:60"},
	groups = {oddly_breakable_by_hand=3},

	on_construct = function(pos)
		core.get_node_timer(pos):start(270)
	end,
	on_timer = function(pos, elapsed)
		if not core.find_node_near(pos, 1, {"default:water_source", "default:water_flowing"}) then
			core.set_node(pos, {name="sponge:sponge"})
			core.get_node_timer(pos):start(3)
		else
			core.get_node_timer(pos):start(270)
		end
	end,
})

core.register_node("sponge:iron_sponge", {
	description = "Iron Sponge",
	tiles = {"iron_sponge.png"},
	groups = {oddly_breakable_by_hand=2},

	on_construct = function(pos)
		core.get_node_timer(pos):start(1)
	end,
	on_timer = function(pos, elapsed)
		if core.find_node_near(pos, 1, {"default:water_source", "default:water_flowing",
			"default:lava_source", "default:lava_flowing"}) then
	for i=-2,2 do
	for j=-2,2 do
	for k=-2,2 do
		p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		n = core.get_node(p)
		if n.name == "default:water_source" or n.name == "default:water_flowing" then
			core.set_node(p, {name="air"})
			core.set_node(pos, {name="sponge:iron_sponge_water"})
			core.get_node_timer(pos):start(270)
		elseif n.name == "default:lava_source" or n.name == "default:lava_flowing" then
			core.set_node(p, {name="air"})
			core.set_node(pos, {name="sponge:iron_sponge_lava"})
		end
	end
	end
	end
		else
			core.get_node_timer(pos):start(3)
		end
	end,
})

core.register_node("sponge:iron_sponge_water", {
	description = "Soaked Iron Sponge",
	tiles = {"iron_sponge.png^[colorize:#0000AC:20"},
	groups = {oddly_breakable_by_hand=2},

	on_construct = function(pos)
		core.get_node_timer(pos):start(270)
	end,
	on_timer = function(pos, elapsed)
		if not core.find_node_near(pos, 1, {"default:water_source", "default:water_flowing"}) then
			core.set_node(pos, {name="sponge:iron_sponge"})
			core.get_node_timer(pos):start(3)
		else
			core.get_node_timer(pos):start(270)
		end
	end,
})

core.register_node("sponge:iron_sponge_lava", {
	description = "Soaked Iron Sponge",
	tiles = {"iron_sponge.png^[colorize:orange:110^[colorize:red:60"},
	light_source = 13,
	groups = {oddly_breakable_by_hand=2},
})

core.register_craftitem("sponge:sponge_fiber_base", {
	description = "Unprocessed Sponge Base",
	inventory_image = "basic_materials_paraffin.png^[colorize:yellow:150",
})

core.register_craftitem("sponge:sponge_fibers", {
	description = "Plastic Sponge Fibers",
	inventory_image = "sponge_fibers.png",
})

core.register_craftitem("sponge:iron_sponge_fibers", {
	description = "Iron Sponge Fibers",
	inventory_image = "iron_sponge_fibers.png",
})

-- start node timers at mapgen
core.register_lbm({
	name = "sponge:convert_sponges_to_node_timer",
	nodenames = {"sponge:sponge", "sponge:iron_sponge"},
	action = function(pos)
		core.get_node_timer(pos):start(2)
	end
})

-- crafts
core.register_craft({
	type = "shapeless",
	output = "sponge:sponge_fiber_base",
	recipe = {"basic_materials:paraffin", "dye:yellow", "basic_materials:paraffin"}
})

core.register_craft({
	type = "cooking",
	output = "sponge:sponge_fibers 3",
	recipe = "sponge:sponge_fiber_base",
})

core.register_craft({
	output = "sponge:sponge",
	recipe = {
		{"sponge:sponge_fibers", "sponge:sponge_fibers", "sponge:sponge_fibers"},
		{"sponge:sponge_fibers", "sponge:sponge_fibers", "sponge:sponge_fibers"},
		{"sponge:sponge_fibers", "sponge:sponge_fibers", "sponge:sponge_fibers"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "sponge:iron_sponge_fibers 3",
	recipe = {"default:steel_ingot", "default:mese_crystal_fragment"},
	replacements = {{"default:mese_crystal_fragment", "default:mese_crystal_fragment"}}
})

core.register_craft({
	output = "sponge:iron_sponge",
	recipe = {
		{"sponge:iron_sponge_fibers", "sponge:iron_sponge_fibers", "sponge:iron_sponge_fibers"},
		{"sponge:iron_sponge_fibers", "sponge:iron_sponge_fibers", "sponge:iron_sponge_fibers"},
		{"sponge:iron_sponge_fibers", "sponge:iron_sponge_fibers", "sponge:iron_sponge_fibers"}
	}
})

core.register_craft({
	type = "cooking",
	output = "default:water_source 17",
	recipe = "sponge:sponge_wet",
	cooktime = 5,
	replacements = {{"sponge:sponge_wet", "sponge:sponge"}}
})

core.register_craft({
	type = "cooking",
	output = "default:water_source 49",
	recipe = "sponge:iron_sponge_water",
	cooktime = 5,
	replacements = {{"sponge:iron_sponge_water", "sponge:iron_sponge"}}
})

core.register_craft({
	type = "cooking",
	output = "default:lava_source 49",
	recipe = "sponge:iron_sponge_lava",
	cooktime = 5,
	replacements = {{"sponge:iron_sponge_lava", "sponge:iron_sponge"}}
})
