
local S = core.get_translator("farming")

-- tomato
core.register_craftitem("farming:tomato", {
	description = S("Tomato"),
	inventory_image = "farming_tomato.png",
	groups = {flammable = 2},
	on_use = core.item_eat(4, "farming:spent_biomasse"),

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

		return farming.place_seed(itemstack, placer, pointd, "farming:tomato_S1")
	end,
})

--	Textures edited from:
--	http://www.minecraftforum.net/forums/mapping-and-modding/minecraft-mods/1288375-food-plus-mod-more-food-than-you-can-imagine-v2-9)

-- tomato definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_tomato_1.png"},
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:spent_biomasse",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:tomato_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:tomato_S1", table.copy(def))

-- stage2
def.tiles = {"farming_tomato_2.png"}
def.visual_scale = 1.3
def.next_plant = "farming:tomato_S3"
def.drop = "farming:spent_biomasse 2"
core.register_node("farming:tomato_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_tomato_3.png"}
def.next_plant = "farming:tomato_S4"
core.register_node("farming:tomato_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_tomato_4.png"}
def.next_plant = "farming:tomato_S5"
core.register_node("farming:tomato_S4", table.copy(def))

-- stage 5
def.tiles = {"farming_tomato_5.png"}
def.next_plant = "farming:tomato_S6"
core.register_node("farming:tomato_S5", table.copy(def))

-- stage 6
def.tiles = {"farming_tomato_6.png"}
def.next_plant = "farming:tomato_S7"
core.register_node("farming:tomato_S6", table.copy(def))

-- stage 7
def.tiles = {"farming_tomato_7.png"}
def.next_plant = "farming:tomato_S8"
core.register_node("farming:tomato_S7", table.copy(def))

-- stage 8
def.tiles = {"farming_tomato_8.png"}
def.next_plant = "farming:tomato_S9"
def.drop = {
	items = {
		{items = {"farming:tomato", "farming:spent_biomasse 2"}},
		{items = {"farming:tomato 3"}, rarity = 3},
	}
}
core.register_node("farming:tomato_S8", table.copy(def))

-- stage 9 (final)
def.tiles = {"farming_tomato_9.png"}
def.next_plant = nil
def.drop = {
	items = {
		{items = {"farming:tomato 5"}},
		{items = {"farming:tomato 2"}, rarity = 2},
	}
}
def.after_dig_node = function(pos)
	if math.random(10) == 1 then
	else
		core.set_node(pos, {name="farming:tomato_S5"})
		core.get_node_timer(pos):start(math.random(166, 286))
	end
end
core.register_node("farming:tomato_S9", table.copy(def))
