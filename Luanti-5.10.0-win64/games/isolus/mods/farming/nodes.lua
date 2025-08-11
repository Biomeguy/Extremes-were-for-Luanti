-- farming/nodes.lua

-- support for MT game translation.
local S = farming.get_translator

function farming.soil_func(pos, elapsed)
	local node = core.get_node(pos)
	local ndef = core.registered_nodes[node.name]
	if not ndef or not ndef._soil and (not ndef._soil.dry
	or not ndef._soil.base and not ndef._soil.wet) then
		return
	end

	pos.y = pos.y + 1
	local nn = core.get_node_or_nil(pos)
	if not nn or not nn.name then
		return
	end
	local nn_def = core.registered_nodes[nn.name] or nil
	pos.y = pos.y - 1

	if nn_def and nn_def.walkable and core.get_item_group(nn.name, "plant") == 0 then
		core.set_node(pos, {name = ndef._soil.base})
		return
	end
	-- check if there is water nearby
	local wet_lvl = core.get_item_group(node.name, "wet")
	if #core.find_nodes_in_area({x = pos.x + 4, y = pos.y + 4, z = pos.z + 4},
		{x = pos.x - 4, y = pos.y - 1, z = pos.z - 4}, {"group:water"}) > 0 then

		if wet_lvl == 0 then	-- if dry soil then turn it into wet soil
			core.set_node(pos, {name = ndef._soil.wet})
		end
		core.get_node_timer(pos):start(math.random(30, 80))
	else
		-- only turn back if there are no unloaded blocks (and therefore
		-- possible water sources) nearby
		if not core.find_node_near(pos, 3, {"ignore"}) then
			-- turn it back into base if it is already dry
			if wet_lvl == 0 then
				-- only turn it back if there is no plant/seed on top of it
				if core.get_item_group(nn.name, "plant") == 0 and core.get_item_group(nn.name, "seed") == 0 then
					core.set_node(pos, {name = ndef._soil.base})
				end

			elseif wet_lvl == 1 then	-- if it's wet turn it back into dry soil
				core.set_node(pos, {name = ndef._soil.dry})
			end
		end
		core.get_node_timer(pos):start(math.random(15, 60))
	end
end

core.register_node("farming:soil", {
	description = S("Soil (Loam)"),
	tiles = {"default_dirt.png^farming_soil.png", "default_dirt.png"},
	drop = "default:dirt",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(15, 60))
	end,
	on_timer = farming.soil_func,
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 2, field = 1},
	sounds = default.node_sound_dirt_defaults(),
	_soil = {base = "default:dirt", wet = "farming:soil_wet"}
})

core.register_node("farming:soil_wet", {
	description = S("Wet Soil (Loam)"),
	tiles = {"default_dirt.png^farming_soil_wet.png", "default_dirt.png^farming_soil_wet_side.png"},
	drop = "default:dirt",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(15, 60))
	end,
	on_timer = farming.soil_func,
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 3, wet = 1, field = 1},
	sounds = default.node_sound_dirt_defaults(),
	_soil = {dry = "farming:soil"}
})

core.register_node("farming:clay_soil", {
	description = S("Clay Soil (Clay Loam)"),
	tiles = {"default_clay_dirt.png^farming_soil.png", "default_clay_dirt.png"},
	drop = "default:clay_dirt",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(15, 60))
	end,
	on_timer = farming.soil_func,
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 2, field = 1},
	sounds = default.node_sound_dirt_defaults(),
	_soil = {base = "default:clay_dirt", wet = "farming:clay_soil_wet"}
})

core.register_node("farming:clay_soil_wet", {
	description = S("Wet Clay Soil (Clay Loam)"),
	tiles = {"default_clay_dirt.png^farming_soil_wet.png", "default_clay_dirt.png^farming_soil_wet_side.png"},
	drop = "default:clay_dirt",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(15, 60))
	end,
	on_timer = farming.soil_func,
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 3, wet = 1, field = 1},
	sounds = default.node_sound_dirt_defaults(),
	_soil = {dry = "farming:clay_soil"}
})

-- Start timer on any already placed soils
core.register_lbm({
	name = "farming:convert_soils_to_node_timer",
	nodenames = {"farming:soil", "farming:soil_wet", "farming:clay_soil", "farming:clay_soil_wet"},
	run_at_every_load = true,
	action = function(pos)
		local timer = core.get_node_timer(pos)
		if not timer:is_started() then
			timer:start(math.random(15, 30))
		end
	end
})

-- Straw
core.register_node("farming:straw_pile", {
	description = S("Straw Pile"),
	drawtype = "nodebox",
	tiles = {"farming_straw_pile.png"},
	inventory_image = "farming_straw_pile.png",
	wield_image = "farming_straw_pile.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	buildable_to = true,
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.4375, .5}
	},
	groups = {snappy = 3, flammable = 4, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:straw", {
	description = S("Straw"),
	tiles = {"farming_straw.png"},
	is_ground_content = false,
	groups = {snappy = 3, flammable = 4, fall_damage_add_percent = -30, hay = 3},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	output = "farming:straw 3",
	recipe = {
		{"farming:straw_pile", "farming:straw_pile", "farming:straw_pile"},
		{"farming:straw_pile", "farming:straw_pile", "farming:straw_pile"},
		{"farming:straw_pile", "farming:straw_pile", "farming:straw_pile"}
	}
})

core.register_craft({
	output = "farming:straw_pile 3",
	recipe = {{"farming:straw"}}
})

core.register_craft({
	type = "fuel",
	recipe = "farming:straw_pile",
	burntime = 2,
})

-- Registered before the stairs so the stairs get fuel recipes.
core.register_craft({
	type = "fuel",
	recipe = "farming:straw",
	burntime = 18,
})

do
	local recipe = "farming:straw"
	local groups = {snappy = 3, flammable = 4, fall_damage_add_percent = -30, hay = 3}
	local images = {"farming_straw.png"}
	local sounds = default.node_sound_leaves_defaults()

	stairs.register_stair("straw", recipe, groups, images, S("Straw Stair"),
		sounds, true)
	stairs.register_stair_inner("straw", recipe, groups, images, "",
		sounds, true, S("Inner Straw Stair"))
	stairs.register_stair_outer("straw", recipe, groups, images, "",
		sounds, true, S("Outer Straw Stair"))
	stairs.register_slab("straw", recipe, groups, images, S("Straw Slab"),
		sounds, true)
end

core.register_node("farming:straw_bale", {
	description = S("Straw Bale"),
	tiles = {"farming_straw_bale.png"},
	is_ground_content = false,
	groups = {snappy = 2, oddly_breakable_by_hand = 2, flammable = 3, fall_damage_add_percent = -20, hay = 2},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	output = "farming:straw_bale",
	recipe = {
		{"farming:straw", "farming:straw"},
		{"farming:straw", "farming:straw"}
	}
})

core.register_craft({
	output = "farming:straw 4",
	recipe = {{"farming:straw_bale"}}
})

-- Cut grass
core.register_node("farming:cut_grass", {
	description = S("Cut Grass"),
	drawtype = "nodebox",
	tiles = {"farming_cut_grass.png"},
	inventory_image = "farming_cut_grass.png",
	wield_image = "farming_cut_grass.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	buildable_to = true,
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.4375, .5}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(60, 300))
	end,
	on_timer = function(pos, elapsed)
		if not core.find_node_near(pos, 1, "group:water") then
			core.set_node(pos, {name = "farming:hay_pile"})
		else
			core.get_node_timer(pos):start(math.random(60, 300))
		end
	end,
	groups = {snappy = 3, flammable = 2, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

-- Recipes (remove roots)
core.register_craft({
	output = "farming:cut_grass",
	recipe = {{"default:grass_1"}}
})

core.register_craft({
	output = "farming:cut_grass",
	recipe = {{"default:jungle_grass_1"}}
})

core.register_craft({
	output = "farming:cut_grass",
	recipe = {{"default:subtrop_grass"}}
})

-- Hay
core.register_node("farming:hay_pile", {
	description = S("Hay Pile"),
	drawtype = "nodebox",
	tiles = {"farming_straw_pile.png^[multiply:#88BB88"},
	inventory_image = "farming_straw_pile.png^[multiply:#88BB88",
	wield_image = "farming_straw_pile.png^[multiply:#88BB88",
	use_texture_alpha = "clip",
	paramtype = "light",
	buildable_to = true,
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.4375, .5}
	},
	groups = {snappy = 3, flammable = 4, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:hay", {
	description = S("Hay"),
	tiles = {"farming_straw.png^[multiply:#88BB88"},
	is_ground_content = false,
	groups = {snappy = 3, flammable = 3, fall_damage_add_percent = -30, hay = 3},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	output = "farming:hay 3",
	recipe = {
		{"farming:hay_pile", "farming:hay_pile", "farming:hay_pile"},
		{"farming:hay_pile", "farming:hay_pile", "farming:hay_pile"},
		{"farming:hay_pile", "farming:hay_pile", "farming:hay_pile"}
	}
})

core.register_craft({
	output = "farming:hay_pile 3",
	recipe = {{"farming:hay"}}
})

core.register_craft({
	type = "fuel",
	recipe = "farming:hay_pile",
	burntime = 2,
})

core.register_craft({
	type = "fuel",
	recipe = "farming:hay",
	burntime = 18,
})

do
	local recipe = "farming:hay"
	local groups = {snappy = 3, flammable = 3, fall_damage_add_percent = -30, hay = 3}
	local images = {"farming_straw.png^[multiply:#88BB88"}
	local sounds = default.node_sound_leaves_defaults()

	stairs.register_stair("hay", recipe, groups, images, S("Hay Stair"),
		sounds, true)
	stairs.register_stair_inner("hay", recipe, groups, images, "",
		sounds, true, S("Inner Hay Stair"))
	stairs.register_stair_outer("hay", recipe, groups, images, "",
		sounds, true, S("Outer Hay Stair"))
	stairs.register_slab("hay", recipe, groups, images, S("Hay Slab"),
		sounds, true)
end

core.register_node("farming:hay_bale", {
	description = S("Hay Bale"),
	tiles = {"farming_straw_bale.png^[multiply:#88BB88"},
	is_ground_content = false,
	groups = {snappy = 2, oddly_breakable_by_hand = 2, flammable = 3, fall_damage_add_percent = -20, hay = 2},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	output = "farming:hay_bale",
	recipe = {
		{"farming:hay", "farming:hay"},
		{"farming:hay", "farming:hay"}
	}
})

core.register_craft({
	output = "farming:hay 4",
	recipe = {{"farming:hay_bale"}}
})

core.register_craft({
	type = "cooking",
	output = "farming:hay_pile",
	recipe = "farming:cut_grass",
	cooktime = 2,
})

core.register_craftitem("farming:spent_biomasse", {--	place holder for inedible spent grain/banana peel/stems etc.
	description = S("Spent Biomasse"),
	inventory_image = "farming_spent_biomasse.png",
})

core.register_node("farming:threshing_floor", {
	description = S("Threshing Floor"),
	drawtype = "nodebox",
	tiles = {"farming_threshwood.png"},
	paramtype  = "light",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, -.4, .5},
			{-.5, -.4, -.5, -.44, -.2, .5},-- -.2 or 0
			{.44, -.4, -.5, .5, -.2, .5},
			{-.44, -.4, -.5, .44, -.2, -.44},
			{-.44, -.4, .44, .44, -.2, .5}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.2, .5}
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:handmill", {
	description = S("Handmill"),
	drawtype = "mesh",
	mesh = "handmill.obj",
	tiles = {"default_stone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 0, .5}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 0, .5}
	},
	on_punch = function(pos, node, puncher)
		node.param2 = node.param2 + 1
		if node.param2 > 3 then
			node.param2 = 0
		end
		core.swap_node(pos, node)
	end,
	groups = {cracky = 2, grinder = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = "farming:threshing_floor",
	recipe = {
		{"default:axe_steel"},
		{"stairs:slab_jungle_wood"}
	},
	replacements = {{"default:axe_steel", "default:axe_steel"}}
})

core.register_craft({
	output = "farming:handmill",
	recipe = {
		{"group:stick", "stairs:slab_stone"},
		{"", "default:steel_ingot"},
		{"", "stairs:slab_stone"}
	}
})


for i = 4, 5 do
	-- Make default:grass_* occasionally drop Wheat/Oat Seed
	core.override_item("default:grass_" .. i, {drop = {
		max_items = 1,
		items = {
			{items = {"farming:seed_wheat", "farming:spent_biomasse"}, rarity = 5},
			{items = {"farming:seed_oat", "farming:spent_biomasse"}, rarity = 5},
			{items = {"default:grass_1"}}
		}
	}})

	-- Make default:savanna_grass_* occasionally drop Rye/Flax Seed
	core.override_item("default:savanna_grass_" .. i, {drop = {
		max_items = 1,
		items = {
			{items = {"farming:seed_rye", "farming:spent_biomasse"}, rarity = 5},
			{items = {"farming:seed_flax", "farming:spent_biomasse"}, rarity = 5},
			{items = {"default:savanna_grass_1"}}
		}
	}})

	-- Make default:swamp_grass_* occasionally drop Barley Seed
	core.override_item("default:swamp_grass_" .. i, {drop = {
		max_items = 1,
		items = {
			{items = {"farming:seed_barley", "farming:spent_biomasse"}, rarity = 5},
			{items = {"default:swamp_grass_1"}}
		}
	}})
end

for i = 2, 3 do
	-- Make default:jungle_grass_* occasionally drop Cotton/Hops Seed
	core.override_item("default:jungle_grass_" .. i, {drop = {
		max_items = 1,
		items = {
			{items = {"farming:seed_cotton", "farming:spent_biomasse"}, rarity = 8},
			{items = {"farming:hops_seed", "farming:spent_biomasse"}, rarity = 7},
			{items = {"default:jungle_grass_1"}}
		}
	}})
end
