
local S = core.get_translator("farming")

-- celery
core.register_craftitem("farming:celery", {
	description = S("Celery"),
	inventory_image = "farming_celery.png",
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

		return farming.place_seed(itemstack, placer, pointd, "farming:celery_S1")
	end,
})

-- peanut butter on celery
core.register_craftitem("farming:celery_pb", {
	description = S("Peanut Butter on Celery"),
	inventory_image = "farming_celery_pb.png",
	on_use = core.item_eat(4),
})

core.register_craft({
	type = "shapeless",
	output = "farming:celery_pb 5",
	recipe = {"farming:celery", "farming:celery", "farming:celery",
		"farming:celery", "farming:celery", "farming:peanut_butter"},
	replacements = {{"farming:peanut_butter", "vessels:glass_jar"}}
})

-- bleeding hearts gives celery and pink dye
core.register_craft({
	output = "farming:celery 12",
	recipe = {
		{"farming:celery_S5"},
	},
	replacements = {{"farming:celery_S5", "dye:pink 4"}}
})

-- celery definition
local def = {
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"farming_celery_1.png"},
	waving = 1,
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "farming:celery",
	selection_box = farming.select,
	groups = {snappy = 3, flammable = 2, plant = 1,
		attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "farming:celery_S2",
	on_timer = farming.grow_plant,
}

-- stage 1
core.register_node("farming:celery_S1", table.copy(def))

-- stage 2
def.tiles = {"farming_celery_2.png"}
def.next_plant = "farming:celery_S3"
core.register_node("farming:celery_S2", table.copy(def))

-- stage 3
def.tiles = {"farming_celery_3.png"}
def.next_plant = "farming:celery_S4"
def.drop = "farming:celery 3"
core.register_node("farming:celery_S3", table.copy(def))

-- stage 4
def.tiles = {"farming_celery_4.png"}
def.next_plant = "farming:celery_S5"
def.drop = {
	items = {
		{items = {"farming:celery 3"}},
		{items = {"farming:celery 2"}, rarity = 2},
		{items = {"farming:celery 1"}, rarity = 2},
	}
}
core.register_node("farming:celery_S4", table.copy(def))

-- stage 5 (final)
def.description = S("Bleeding Hearts (Dicentra Spectabilis)")
def.tiles = {"farming_bleeding_hearts.png"}
def.inventory_image = "farming_bleeding_hearts.png"
def.wield_image = "farming_bleeding_hearts.png"
def.next_plant = nil
def.drop = nil
def.selection_box = {
	type = "fixed",
	fixed = {-5/16, -0.5, -5/16, 5/16, -1/16, 5/16}
}
def.on_construct = function(pos)
	core.get_node_timer(pos):start(math.random(.3, .5))
end
def.on_timer = default.attack_heal
def.groups = {snappy = 3, flammable = 2, plant = 1, attached_node = 1, timer_check = 1}
core.register_node("farming:celery_S5", table.copy(def))
