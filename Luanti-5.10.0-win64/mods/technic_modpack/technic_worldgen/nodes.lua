
local S = technic.worldgen.gettext

core.register_node(":technic:mineral_uranium", {
	description = S("Uranium Ore"),
	tiles = {"default_stone.png^technic_mineral_uranium.png"},
	groups = {cracky=3, radioactive=1},
	drop = {
		max_items = 1,
		items = {
			{items = {'technic:uranium_lump 5', 'default:rock 4'}, rarity = 9},
			{items = {'technic:uranium_lump 4', 'default:rock 5'}, rarity = 6},
			{items = {'technic:uranium_lump 3', 'default:rock 6'}, rarity = 3},
			{items = {'technic:uranium_lump 2', 'default:rock 7'}},
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node(":technic:mineral_lead", {
	description = S("Lead Ore"),
	tiles = {"default_stone.png^technic_mineral_lead.png"},
	groups = {cracky=3},
	drop = {
		max_items = 1,
		items = {
			{items = {'technic:lead_lump 5', 'default:rock 4'}, rarity = 9},
			{items = {'technic:lead_lump 4', 'default:rock 5'}, rarity = 6},
			{items = {'technic:lead_lump 3', 'default:rock 6'}, rarity = 3},
			{items = {'technic:lead_lump 2', 'default:rock 7'}},
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node(":technic:uranium_block", {
	description = S("Uranium Block"),
	tiles = {"technic_uranium_block.png"},
	groups = {uranium_block=1, cracky=1, level=2, radioactive=2},
	sounds = default.node_sound_stone_defaults()
})

core.register_craftitem(":technic:uranium_lump", {
	description = S("Uranium Lump"),
	inventory_image = "technic_uranium_lump.png",
})

core.register_craftitem(":technic:uranium_ingot", {
	description = S("Uranium Ingot"),
	inventory_image = "technic_uranium_ingot.png",
	groups = {uranium_ingot = 1},
})

core.register_node(":technic:lead_block", {
	description = S("Lead Block"),
	tiles = {"technic_lead_block.png"},
	groups = {cracky=1, level=2},
	sounds = default.node_sound_stone_defaults()
})

core.register_craftitem(":technic:lead_lump", {
	description = S("Lead Lump"),
	inventory_image = "technic_lead_lump.png",
})

core.register_craftitem(":technic:lead_ingot", {
	description = S("Lead Ingot"),
	inventory_image = "technic_lead_ingot.png",
})

register_nine("technic:uranium_block", "technic:uranium_ingot")
register_nine("technic:lead_block", "technic:lead_ingot")

core.register_craft({
	type = 'cooking',
	recipe = "technic:uranium_lump",
	output = "technic:uranium_ingot",
})

core.register_craft({
	type = 'cooking',
	recipe = "technic:lead_lump",
	output = "technic:lead_ingot",
})
