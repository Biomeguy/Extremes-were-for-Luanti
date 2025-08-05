
local S = core.get_translator("farming")

-- place grapes
place_grapes = function(itemstack, placer, pointd, plantname)
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

	-- check if pointing at trellis
	if under.name ~= "farming:trellis" then
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

farming.place_grapes_check = function(itemstack, placer, pointd)
	local under = pointd.under
	local node = core.get_node(under)
	local udef = core.registered_nodes[node.name]
	if udef and udef.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
		return udef.on_rightclick(under, node, placer, itemstack,
			pointd) or itemstack
	end

	return place_grapes(itemstack, placer, pointd, "farming:grapes_S1")
end

-- grapes
core.register_craftitem("farming:grapes_green", {
	description = S("Green Grapes"),
	inventory_image = "farming_grapes_green.png",
	groups = {grapes = 1},
	on_use = core.item_eat(2, "farming:spent_biomasse"),
})

core.register_craftitem("farming:grapes_red", {
	description = S("Red Grapes"),
	inventory_image = "farming_grapes_red.png",
	groups = {grapes = 1},
	on_use = core.item_eat(2, "farming:spent_biomasse"),

	on_place = farming.place_grapes_check,
})

core.register_craftitem("farming:grapes_purple", {
	description = S("Purple Grapes"),
	inventory_image = "farming_grapes_purple.png",
	groups = {grapes = 1},
	on_use = core.item_eat(2, "farming:spent_biomasse"),

	on_place = farming.place_grapes_check,
})

core.register_craftitem("farming:grapes_black", {
	description = S("Black Grapes"),
	inventory_image = "farming_grapes_black.png",
	groups = {grapes = 1},
	on_use = core.item_eat(2, "farming:spent_biomasse"),

	on_place = farming.place_grapes_check,
})

-- grapes can be used for dyes
core.register_craft({
	output = "dye:red",
	recipe = {
		{"farming:grapes_red"},
	},
	replacements = {{"farming:grapes_red", "farming:spent_biomasse"}}
})
core.register_craft({
	output = "dye:violet",
	recipe = {
		{"farming:grapes_purple"},
	},
	replacements = {{"farming:grapes_purple", "farming:spent_biomasse"}}
})
core.register_craft({
	output = "dye:black",
	recipe = {
		{"farming:grapes_black"},
	},
	replacements = {{"farming:grapes_black", "farming:spent_biomasse"}}
})

-- trellis
core.register_node("farming:trellis", {
	description = S("Trellis (place on soil before planting grapes)"),
	drawtype = "plantlike",
	tiles = {"farming_trellis.png"},
	inventory_image = "farming_trellis.png",
	paramtype = "light",
	visual_scale = 2.,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:trellis",
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

		core.set_node(pointd.above, {name = "farming:trellis"})

		if not core.is_creative_enabled(pname) then
			itemstack:take_item()
		end

		return itemstack
	end
})

core.register_craft({
	output = "farming:trellis",
	recipe = {
		{"default:stick", "default:stick", "default:stick"},
		{"default:stick", "default:stick", "default:stick"},
		{"default:stick", "default:stick", "default:stick"},
	}
})

core.register_craft({
	type = "fuel",
	recipe = "farming:trellis",
	burntime = 15,
})

-- grapes definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_grapes_1.png"},
	paramtype = "light",
	visual_scale = 2.,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:trellis",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 3, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:grapes_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:grapes_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_grapes_2.png"}
def.next_plant = "farming:grapes_S3"
core.register_node("farming:grapes_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_grapes_3.png"}
def.next_plant = "farming:grapes_S4"
def.drop = {
	items = {
		{items = {"farming:trellis", "farming:spent_biomasse 2"}},
	}
}
core.register_node("farming:grapes_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_grapes_4.png"}
def.next_plant = "farming:grapes_S5"
core.register_node("farming:grapes_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_grapes_5.png"}
def.next_plant = "farming:grapes_S6"
core.register_node("farming:grapes_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_grapes_6.png"}
def.next_plant = "farming:grapes_S7"
core.register_node("farming:grapes_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_grapes_7.png"}
def.next_plant = "farming:grapes_S8"
core.register_node("farming:grapes_S7", table.copy(def))

-- stage 8
def.tiles = {"farming_grapes_8.png"}
def.next_plant = "farming:grapes_S9"
def.drop = {
	items = {
		{items = {"farming:trellis", "farming:spent_biomasse 2"}},
		{items = {"farming:grapes_green 6"}},
		{items = {"farming:grapes_green 2"}, rarity = 2},
		{items = {"farming:grapes_green 3"}, rarity = 3},
	}
}
core.register_node("farming:grapes_S8", table.copy(def))

-- stage 9
def.tiles = {"farming_grapes_9.png"}
def.next_plant = "farming:grapes_S10"
def.drop = {
	items = {
		{items = {"farming:trellis", "farming:spent_biomasse 2"}},
		{items = {"farming:grapes_red 6"}},
		{items = {"farming:grapes_red 2"}, rarity = 2},
		{items = {"farming:grapes_red 3"}, rarity = 3},
	}
}
core.register_node("farming:grapes_S9", table.copy(def))

-- stage 10
def.tiles = {"farming_grapes_10.png"}
def.next_plant = "farming:grapes_S11"
def.drop = {
	items = {
		{items = {"farming:trellis", "farming:spent_biomasse 2"}},
		{items = {"farming:grapes_purple 6"}},
		{items = {"farming:grapes_purple 2"}, rarity = 2},
		{items = {"farming:grapes_purple 3"}, rarity = 3},
	}
}
core.register_node("farming:grapes_S10", table.copy(def))

-- stage 11 (final)
def.tiles = {"farming_grapes_11.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:trellis", "farming:spent_biomasse 2"}},
		{items = {"farming:grapes_black 6"}},
		{items = {"farming:grapes_black 2"}, rarity = 2},
		{items = {"farming:grapes_black 3"}, rarity = 3},
	}
}
core.register_node("farming:grapes_S11", table.copy(def))

-- wild grape vine
core.register_node("farming:grape_bush", {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_grape_bush.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"farming:grapes_purple", "farming:spent_biomasse"}},
			{items = {"farming:grapes_purple 2"}, rarity = 2},
			{items = {"farming:grapes_purple 3"}, rarity = 3},
		}
	},
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})
