
local S = core.get_translator("farming")

-- rose bush starter
core.register_craftitem("farming:rosebush_starter", {
	description = S("Rose Starter"),
	inventory_image = "farming_rosebush_starter.png",
	groups = {flammable = 2},
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

		return farming.place_seed(itemstack, placer, pointd, "farming:rosebush_S1")
	end,
})

-- rose to starter
core.register_craft({
	output = "farming:rosebush_starter",
	recipe = {
		{"flowers:rose"},
		{"default:dirt"}
	},
    replacements = {{"default:dirt", "default:dirt"}}
})

-- rose bush definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"farming_rosebush_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:rosebush_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:rosebush_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_rosebush_2.png"}
def.next_plant = "farming:rosebush_S3"
core.register_node("farming:rosebush_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_rosebush_3.png"}
def.next_plant = "farming:rosebush_S4"
def.drop = "farming:spent_biomasse 2"
core.register_node("farming:rosebush_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_rosebush_4.png"}
def.next_plant = "farming:rosebush_S5"
core.register_node("farming:rosebush_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_rosebush_5.png"}
def.next_plant = "farming:rosebush_S6"
core.register_node("farming:rosebush_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_rosebush_6.png"}
def.next_plant = "farming:rosebush_S7"
core.register_node("farming:rosebush_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_rosebush_7.png"}
def.next_plant = "farming:rosebush_S8"
core.register_node("farming:rosebush_S7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_rosebush_8.png"}
def.next_plant = nil
def.node_dig_prediction = "farming:rosebush_S4"
def.drop = {
	items = {
		{items = {"flowers:rose 6"}},
		{items = {"flowers:rose 2"}, rarity = 2},
		{items = {"flowers:rose 4"}, rarity = 3},
	}
}
def.after_dig_node = function(pos)
	core.set_node(pos, {name="farming:rosebush_S4"})
	core.get_node_timer(pos):start(math.random(166, 286))
end
core.register_node("farming:rosebush_S8", table.copy(def))

-- fuel
core.register_craft({
	type = "fuel",
	recipe = "farming:rosebush_starter",
	burntime = 2,
})
