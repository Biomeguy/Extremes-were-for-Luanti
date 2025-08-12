
local S = ethereal.intllib

local willow_leaf
local leaf_type = tonumber(core.settings:get("mesh_leaves")) or 0

if leaf_type ~= 0 then
	willow_leaf = "willow_twig.png^[transformFY"
end

-- willow twig
core.register_node("ethereal:willow_twig", {
	description = S("Willow Twig"),
	drawtype = leaf_drawtype,
	mesh = "leaf_droop.obj",
	waving = waving_style,
	tiles = {willow_leaf or "willow_leaves.png"},
	special_tiles = {"willow_leaves_simple.png"},
	inventory_image = leaf_image("willow_twig.png"),
	wield_image = leaf_image("willow_twig.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:willow_sapling"}, rarity = 50},
			{items = {"ethereal:willow_twig"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})
willow_leaf = nil

-- redwood leaves
core.register_node("ethereal:redwood_leaves", {
	description = S("Redwood Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"redwood_leaves.png"},
	inventory_image = leaf_image("redwood_leaves.png"),
	wield_image = leaf_image("redwood_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, resinous = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:redwood_sapling"}, rarity = 50},
			{items = {"ethereal:redwood_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- banana tree leaves
core.register_node("ethereal:bananaleaves", {
	description = S("Banana Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"banana_leaf.png"},
	inventory_image = leaf_image("banana_leaf.png"),
	wield_image = leaf_image("banana_leaf.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:banana_tree_sapling"}, rarity = 10},
			{items = {"ethereal:bananaleaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_node("ethereal:banana_mark", {
	description = "Banana Marker",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	groups = {leafdecay = 3, not_in_creative_inventory = 1},
})

core.register_node("ethereal:banana_cluster_1", {
	description = S("Banana Flowers"),
	drawtype = "plantlike",
	visual_scale = 1.12,
	tiles = {"banana_cluster_1.png"},
	inventory_image = "banana_cluster_1.png",
	paramtype = "light",
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .5, .2}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.1, -.3, -.1, .1, .5, .1},
	},
	drop = "",
	after_dig_node = function(pos)
		core.set_node(pos, {name = "ethereal:banana_mark"})
		local f = core.find_node_near(pos, 1, "ethereal:banana_corm")
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 2, oddly_breakable_by_hand = 3, leafdecay = 3, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ethereal:banana_cluster_2", {
	description = S("Banana Cluster"),
	drawtype = "plantlike",
	visual_scale = 1.12,
	tiles = {"banana_cluster_2.png"},
	inventory_image = "banana_cluster_2.png",
	paramtype = "light",
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.31, -.5, -.31, .31, .5, .31}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.31, -.5, -.31, .31, .5, .31},
	},
	drop = "",
	after_dig_node = function(pos)
		core.set_node(pos, {name = "ethereal:banana_mark"})
		local f = core.find_node_near(pos, 1, "ethereal:banana_corm")
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {fleshy = 3, oddly_breakable_by_hand = 3, leafdecay = 3, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ethereal:banana_cluster_3", {
	description = S("Ripe Banana Cluster"),
	drawtype = "plantlike",
	visual_scale = 1.12,
	tiles = {"banana_cluster_3.png"},
	inventory_image = "banana_cluster_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.31, -.5, -.31, .31, .5, .31}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.31, -.5, -.31, .31, .5, .31},
	},
	drop = {
		items = {
			{items = {"ethereal:banana 34"}},
			{items = {"ethereal:banana 17"}, rarity = 5}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "ethereal:banana_mark"})
		local f = core.find_node_near(pos, 1, "ethereal:banana_corm")
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {fleshy = 3, oddly_breakable_by_hand = 2, leafdecay = 3,
		leafdecay_drop = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
})

-- healing tree leaves
core.register_node("ethereal:yellowleaves", {
	description = S("Healing Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"yellow_leaves.png"},
	inventory_image = leaf_image("yellow_leaves.png"),
	wield_image = leaf_image("yellow_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:yellow_tree_sapling"}, rarity = 50},
			{items = {"ethereal:yellowleaves"}}
		}
	},
	on_use = core.item_eat(1),
	light_source = 9,
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_node("ethereal:golden_apple_mark", {
	description = "Golden Apple Marker",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	groups = {leafdecay = 3, not_in_creative_inventory = 1},
})

-- frost tree leaves
core.register_node("ethereal:frost_leaves", {
	description = S("Frost Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"ethereal_frost_leaves.png"},
	inventory_image = leaf_image("ethereal_frost_leaves.png"),
	wield_image = leaf_image("ethereal_frost_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:frost_tree_sapling"}, rarity = 15},
			{items = {"ethereal:frost_leaves"}}
		}
	},
	light_source = 9,
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- bamboo stalk leaves
core.register_node("ethereal:bamboo_leaves", {
	description = S("Bamboo Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"bamboo_leaves.png"},
	inventory_image = leaf_image("bamboo_leaves.png"),
	wield_image = leaf_image("bamboo_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:bamboo_sprout_1"}, rarity = 15},
			{items = {"ethereal:bamboo_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

local sprout_box = {
	type = "fixed",
	fixed = {
		{-1/16, -.5, -1/16, 1/16, .5, 1/16},
		{-1/16, -.5, -1/8, 1/16, 7/16, 1/8},
		{-1/8, -.5, -1/16, 1/8, 7/16, 1/16},
		{-2/16, -.5, -2/16, 2/16, 4/16, 2/16},
		{-3/16, -.5, -2/16, 3/16, 2/16, 2/16},
		{-2/16, -.5, -3/16, 2/16, 2/16, 3/16},
		{-3/16, -.5, -3/16, 3/16, -1/16, 3/16},
		{-4/16, -.5, -2/16, 4/16, -4/16, 2/16},
		{-2/16, -.5, -4/16, 2/16, -4/16, 4/16}
	}
}

local sprout_cs_box = {
	type = "fixed",
	fixed = {-3/16, -.5, -3/16, 3/16, .5, 3/16}
}

-- Bamboo Sprouts
core.register_node("ethereal:bamboo_sprout_1", {
	description = S("Bamboo Sprout"),
	drawtype = "nodebox",
	tiles = {"bamboo_sprout_top.png", "bamboo_top.png", "bamboo_sprout.png"},
	inventory_image = "bamboo_sprout.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
	node_box = sprout_box,
	collision_box = sprout_cs_box,
	selection_box = sprout_cs_box,
	on_use = core.item_eat(2),
	groups = {snappy = 3, dig_immediate = 3, attached_node = 1, flammable = 2, bamboo_sprout = 1},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(240, 300))
	end,
	on_timer = function(pos, elapsed)
		if not default.can_grow(pos) then
			core.get_node_timer(pos):start(200)
		else
			core.set_node(pos, {name = "ethereal:bamboo"})
			pos.y = pos.y+1
			if core.get_node(pos).name == "air" then
				core.set_node(pos, {name = "ethereal:bamboo_sprout_2"})
				core.get_node_timer(pos):start(math.random(240, 300))
			end
		end
	end,
	grown_height = 2,
	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"ethereal:bamboo_sprout_1",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 18, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	sounds = default.node_sound_defaults(),
})

core.register_node("ethereal:bamboo_sprout_2", {
	drawtype = "nodebox",
	tiles = {"bamboo_sprout_top.png", "bamboo_top.png", "bamboo_sprout.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	node_box = sprout_box,
	collision_box = sprout_cs_box,
	selection_box = sprout_cs_box,
	drop = "ethereal:bamboo_sprout_1",
	groups = {snappy = 3, oddly_breakable_by_hand = 1, attached_node = 1, flammable = 2},
	on_timer = function(pos, elapsed)
		if core.get_node_light(pos) < 13 then
			core.get_node_timer(pos):start(200)
		elseif not enough_height(pos, 4) then
			core.get_node_timer(pos):start(200)
		else
			core.set_node(pos, {name = "ethereal:bamboo"})
			pos.y = pos.y+1
			if core.get_node(pos).name == "air" then
				core.set_node(pos, {name = "ethereal:bamboo"})
			end
			pos.y = pos.y+1
			if core.get_node(pos).name == "air" then
				core.set_node(pos, {name = "ethereal:bamboo"})
			end
			pos.y = pos.y+1
			if core.get_node(pos).name == "air" then
				core.set_node(pos, {name = "ethereal:bamboo_sprout_3"})
			end
			pos.y = pos.y+1
			if core.get_node(pos).name == "air" then
				core.set_node(pos, {name = "ethereal:bamboo_sprout_3"})
				core.get_node_timer(pos):start(math.random(240, 300))
			end
		end
	end,
	sounds = default.node_sound_defaults(),
})

core.register_node("ethereal:bamboo_sprout_3", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"bamboo_leaves.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	collision_box = leaf_cbox,
	groups = {snappy = 3, attached_node = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:bamboo_sprout_1"}, rarity = 15},
			{items = {"ethereal:bamboo_leaves"}}
		}
	},
	on_timer = function(pos, elapsed)
		if core.get_node_light(pos) < 13 then
			core.get_node_timer(pos):start(200)
		elseif not enough_height(pos, 8) then
			core.get_node_timer(pos):start(200)
		else
			add_tree(pos, 1, 5, 1, ethereal.bambootreesprout, "0")
			pos.y = pos.y+6
			core.set_node(pos, {name = "ethereal:bamboo_sprout_4"})
			core.get_node_timer(pos):start(math.random(240, 300))
		end
	end,
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("ethereal:bamboo_sprout_4", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"bamboo_leaves.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	collision_box = leaf_cbox,
	groups = {snappy = 3, attached_node = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:bamboo_sprout_1"}, rarity = 15},
			{items = {"ethereal:bamboo_leaves"}}
		}
	},
	on_timer = function(pos, elapsed)
		if core.get_node_light(pos) < 13 then
			core.get_node_timer(pos):start(200)
		elseif not enough_height(pos, 6) then
			core.get_node_timer(pos):start(200)
		else
			add_tree(pos, 2, 12, 2, ethereal.bambootree)
		end
	end,
	sounds = default.node_sound_leaves_defaults(),
})

core.register_lbm({
	name = "ethereal:convert_bamboo_sprouts_to_node_timer",
	nodenames = {"ethereal:bamboo_sprout_1"},
	action = function(pos)
		core.get_node_timer(pos):start(200)
	end
})

-- sakura leaves
core.register_node("ethereal:sakura_leaves", {
	description = S("Sakura Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"ethereal_sakura_leaves.png"},
	inventory_image = leaf_image("ethereal_sakura_leaves.png"),
	wield_image = leaf_image("ethereal_sakura_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:sakura_sapling"}, rarity = 30},
			{items = {"ethereal:sakura_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

core.register_node("ethereal:sakura_leaves2", {
	description = S("Sakura Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"ethereal_sakura_leaves2.png"},
	inventory_image = leaf_image("ethereal_sakura_leaves2.png"),
	wield_image = leaf_image("ethereal_sakura_leaves2.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:sakura_sapling"}, rarity = 30},
			{items = {"ethereal:sakura_leaves2"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

-- hedge block
core.register_node("ethereal:bush", {
	description = S("Bush"),
	tiles = {"ethereal_bush.png"},
	groups = {snappy = 3, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	output = "ethereal:bush",
	recipe = {
		{"group:leaves", "group:leaves", "group:leaves"},
		{"group:leaves", "ethereal:bamboo_leaves", "group:leaves"},
		{"group:leaves", "group:leaves", "group:leaves"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "ethereal:bush",
	burntime = 1,
})

-- aspen bush
core.register_node("ethereal:bush2", {
	description = S("Aspen Bush"),
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"ethereal_aspen_bush_leaves.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	output = "ethereal:bush2",
	recipe = {
		{"group:leaves", "group:leaves", "group:leaves"},
		{"group:leaves", "default:aspen_leaves", "group:leaves"},
		{"group:leaves", "group:leaves", "group:leaves"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "ethereal:bush2",
	burntime = 1,
})

default.register_leafdecay({
	trunks = {"ethereal:willow_trunk"},
	leaves = {"ethereal:willow_twig"},
	radius = 3
})

default.register_leafdecay({
	trunks = {"ethereal:redwood_trunk"},
	leaves = {"ethereal:redwood_leaves"},
	radius = 3
})

default.register_leafdecay({
	trunks = {"ethereal:frost_trunk"},
	leaves = {"ethereal:frost_leaves"},
	radius = 3
})

default.register_leafdecay({
	trunks = {"ethereal:yellow_trunk"},
	leaves = {"ethereal:yellowleaves", "ethereal:golden_apple", "ethereal:golden_apple_mark"},
	radius = 1
})

default.register_leafdecay({
	trunks = {"ethereal:banana_corm"},
	leaves = {"ethereal:bananaleaves", "ethereal:banana_mark", "ethereal:banana_cluster_1",
		"ethereal:banana_cluster_2", "ethereal:banana_cluster_3"},
	radius = 3
})

default.register_leafdecay({
	trunks = {"ethereal:bamboo", "ethereal:bamboo_sprout_3", "ethereal:bamboo_sprout_4"},
	leaves = {"ethereal:bamboo_leaves"},
	radius = 2
})

default.register_leafdecay({
	trunks = {"ethereal:sakura_trunk"},
	leaves = {"ethereal:sakura_leaves", "ethereal:sakura_leaves2"},
	radius = 3
})
