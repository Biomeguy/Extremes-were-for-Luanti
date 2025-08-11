
local S = core.get_translator("farming")

-- place beans
place_beans = function(itemstack, placer, pointd, plantname)
	local pt = pointd
	-- check if pointing at a node
	if not pt then
		return itemstack
	end
	if pt.type ~= "node" then
		return itemstack
	end

	local under = core.get_node(pt.under)

	-- return if any of the nodes are not registered
	if not core.registered_nodes[under.name] then
		return
	end

	-- is player planting crop?
	local pname = placer and placer:get_player_name() or ""

	-- check for protection
	if core.is_protected(pt.under, pname) then
		core.record_protection_violation(pt.under, pname)
		return
	end

	-- check if pointing at crop poles
	if under.name ~= "farming:crop_poles" then
		return
	end

	-- add the node and remove 1 item from the itemstack
	core.set_node(pt.under, {name = plantname})

	core.sound_play("default_place_node", {pos = pt.under, gain = .25})
	core.get_node_timer(pt.under):start(math.random(166, 286))
	if not core.is_creative_enabled(pname) then
		itemstack:take_item()
	end
	return itemstack
end

-- green / yellow beans
core.register_craftitem("farming:beans_green", {
	description = S("Green Beans"),
	inventory_image = "farming_beans_green.png",
	groups = {beans = 1},
	on_use = core.item_eat(1),
})

core.register_craftitem("farming:beans_yellow", {
	description = S("Yellow Beans"),
	inventory_image = "farming_beans_yellow.png",
	groups = {beans = 1},
	on_use = core.item_eat(1),

	on_place = function(itemstack, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local udef = core.registered_nodes[node.name]
		if udef and udef.on_rightclick and
				not (placer and placer:is_player() and
				placer:get_player_control().sneak) then
			return udef.on_rightclick(under, node, placer, itemstack,
				pointd) or itemstack
		end

		return place_beans(itemstack, placer, pointd, "farming:beanpole_S1")
	end,
})

-- green beans to green dye
core.register_craft({
	output = "dye:green",
	recipe = {{"farming:beans_green"}}
})

-- crop poles
core.register_node("farming:crop_poles", {
	description = S("Crop Poles (place on soil before planting climbing crops)"),
	drawtype = "plantlike",
	tiles = {"farming_crop_poles.png"},
	inventory_image = "farming_crop_poles.png",
	paramtype = "light",
	visual_scale = 2.,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:crop_poles",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_place = function(itemstack, placer, pointd)
		local pt = pointd
		-- check if pointing at a node and top of node
		if not pt or pt.type ~= "node"
		or pt.above.y ~= pt.under.y + 1 then
			return
		end

		local under = core.get_node(pt.under)

		local pname = placer and placer:get_player_name() or ""

		-- return if any of the nodes are not registered
		if not core.registered_nodes[under.name] then
			return
		end

		-- am I right-clicking on something that has a custom on_place set?
		-- thanks to Krock for helping with this issue :)
		local def = core.registered_nodes[under.name]
		if placer and itemstack and def and def.on_rightclick then
			return def.on_rightclick(pt.under, under, placer, itemstack)
		end

		if core.is_protected(pt.above, placer:get_player_name()) then
			return
		end

		local nodename = under.name

		if core.get_item_group(nodename, "soil") < 2 then
			return
		end

		local top = {
			x = pointd.above.x,
			y = pointd.above.y + 1,
			z = pointd.above.z
		}

		nodename = core.get_node(top).name

		if nodename ~= "air" then
			return
		end

		core.set_node(pointd.above, {name = "farming:crop_poles"})

		if not core.is_creative_enabled(pname) then
			itemstack:take_item()
		end

		return itemstack
	end
})

core.register_craft({
	output = "farming:crop_poles",
	recipe = {
		{"", "", ""},
		{"default:stick", "", "default:stick"},
		{"default:stick", "", "default:stick"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "farming:crop_poles",
	burntime = 10,
})

--	textures 1 to 5 by
--	(C) Auke Kok <sofar@foo-projects.org>
--	CC-BY-SA-3.0

-- green / yellow bean definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_beanpole_1.png"},
	paramtype = "light",
	visual_scale = 2.,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:crop_poles",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 3, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:beanpole_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:beanpole_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_beanpole_2.png"}
def.next_plant = "farming:beanpole_S3"
core.register_node("farming:beanpole_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_beanpole_3.png"}
def.next_plant = "farming:beanpole_S4"
def.drop = {
	items = {
		{items = {"farming:crop_poles", "farming:spent_biomasse"}},
	}
}
core.register_node("farming:beanpole_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_beanpole_4.png"}
def.next_plant = "farming:beanpole_S5"
core.register_node("farming:beanpole_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_beanpole_5.png"}
def.next_plant = "farming:beanpole_S6"
def.drop = {
	items = {
		{items = {"farming:crop_poles", "farming:spent_biomasse"}},
		{items = {"farming:beans_green 5"}},
		{items = {"farming:beans_green 7"}, rarity = 2},
		{items = {"farming:beans_green 9"}, rarity = 3},
	}
}
core.register_node("farming:beanpole_S5", table.copy(def))

-- stage 6 (final)
def.tiles = {"farming_beanpole_6.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:crop_poles", "farming:spent_biomasse"}},
		{items = {"farming:beans_yellow 5"}},
		{items = {"farming:beans_yellow 7"}, rarity = 2},
		{items = {"farming:beans_yellow 9"}, rarity = 3},
	}
}
core.register_node("farming:beanpole_S6", table.copy(def))

-- wild yellow bean bush
core.register_node("farming:bean_bush", {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_bean_bush.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"farming:beans_yellow", "farming:spent_biomasse"}},
			{items = {"farming:beans_yellow 2"}, rarity = 2},
			{items = {"farming:beans_yellow 4"}, rarity = 3},
		}
	},
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})
