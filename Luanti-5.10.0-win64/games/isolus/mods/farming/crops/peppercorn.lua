
local S = core.get_translator("farming")

-- place peppercorn
place_peppercorn = function(itemstack, placer, pointd, plantname)
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

-- peppercorn
core.register_craftitem("farming:peppercorn", {
	description = S("Peppercorn"),
	inventory_image = "farming_peppercorn.png",
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

		return place_peppercorn(itemstack, placer, pointd, "farming:peppercorn_S1")
	end,
})

-- ground peppercorn
core.register_node("farming:peppercorn_ground", {
	description = S("Ground Peppercorn"),
	drawtype = "plantlike",
	tiles = {"farming_peppercorn_ground.png"},
	inventory_image = "farming_peppercorn_ground.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(1, "vessels:glass_bottle"),
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "farming:peppercorn_ground",
	recipe = {"farming:peppercorn", "vessels:glass_bottle", "group:grinder"},
	replacements = {
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"}
	}
})

-- peppercorn definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_peppercorn_1.png"},
	visual_scale = 2.,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:crop_poles",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 3, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:peppercorn_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:peppercorn_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_peppercorn_2.png"}
def.next_plant = "farming:peppercorn_S3"
core.register_node("farming:peppercorn_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_peppercorn_3.png"}
def.next_plant = "farming:peppercorn_S4"
def.drop = {
	items = {
		{items = {"farming:crop_poles", "farming:spent_biomasse"}},
	}
}
core.register_node("farming:peppercorn_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_peppercorn_4.png"}
def.next_plant = "farming:peppercorn_S5"
core.register_node("farming:peppercorn_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_peppercorn_5.png"}
def.next_plant = "farming:peppercorn_S6"
core.register_node("farming:peppercorn_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_peppercorn_6.png"}
def.next_plant = "farming:peppercorn_S7"
core.register_node("farming:peppercorn_S6", table.copy(def))

-- stage 7 (final)
def.tiles = {"farming_peppercorn_7.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:crop_poles", "farming:spent_biomasse"}},
		{items = {"farming:peppercorn 2"}},
		{items = {"farming:peppercorn"}, rarity = 2},
		{items = {"farming:peppercorn 2"}, rarity = 2},
		{items = {"farming:peppercorn"}, rarity = 3},
	}
}
core.register_node("farming:peppercorn_S7", table.copy(def))

-- wild peppercorn vine
core.register_node("farming:peppercorn_bush", {
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"farming_peppercorn_bush.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = {
		items = {
			{items = {"farming:peppercorn", "farming:spent_biomasse"}},
			{items = {"farming:peppercorn 2"}, rarity = 2},
			{items = {"farming:peppercorn 4"}, rarity = 3},
		}
	},
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})
