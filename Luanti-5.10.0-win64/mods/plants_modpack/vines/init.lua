vines = {}

-- support for i18n
local S = core.get_translator("vines")

core.register_craftitem("vines:vines", {
	description = S("Vines"),
	inventory_image = "vines_item.png",
	groups = {vines = 1, flammable = 2}
})


local function dig_down(pos, node, digger)

	if digger == nil then return end

	local np = {x = pos.x, y = pos.y - 1, z = pos.z}
	local nn = core.get_node(np)

	if core.get_item_group(nn.name, "vines") > 0 then
		core.node_dig(np, nn, digger)
	end
end

vines.register_vine = function( name, defs, biome )

	local groups = {vines = 1, snappy = 3, flammable = 2, attached_node = 1}
	local vine_name_end = 'vines:' .. name .. '_end'
	local vine_name_middle = 'vines:' .. name .. '_middle'
	local vine_image_end = "vines_" .. name .. "_end.png"
	local vine_image_middle = "vines_" .. name .. "_middle.png"

	biome.spawn_plants = {vine_name_end}

	local vine_group = 'group:' .. name .. '_vines'

	biome.spawn_surfaces[#biome.spawn_surfaces + 1] = vine_group

	local selection_box = {
		type = "fixed", fixed = {-.3, -.5, -.3, .3, .3, .3}
	}
	local collision_box = {
		type = "fixed", fixed = {-.01, -.5, -.01, .01, -.49, .01}
	}

	core.register_node(vine_name_end, {
		description = defs.description,
		drawtype = 'plantlike',
		climbable = true,
		wield_image = vine_image_end,
		drop = vine_name_end,--"vines:vines",
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "wallmounted",
		tiles = {vine_image_end..'^[transformR180'},
		inventory_image = vine_image_end,
		groups = groups,
		sounds = default.node_sound_leaves_defaults(),
		collision_box = collision_box,
		selection_box = selection_box,

		on_construct = function(pos)
			core.get_node_timer(pos):start(math.random(5, 10))
		end,

		on_timer = function(pos)
	local bottom = {x = pos.x, y = pos.y - 1, z = pos.z}

			if core.get_node(bottom).name == "air" then
	local spos = {x = pos.x, y = pos.y + 1, z = pos.z}
	local snode = core.get_node(spos)
	local height = 0
	while snode.name == vine_name_middle and height < defs.average_length do
		height = height + 1
		spos.y = spos.y + 1
		snode = core.get_node(spos)
	end
	if height == defs.average_length then
		core.get_node_timer(pos):stop()
		return
	end
	local light_level = 13
	local meta = core.get_meta(pos)
	if meta:get_int("light_level") > 0 then
		light_level = light_level - (meta:get_int("light_level") * 3)
		meta:set_int("light_level", 0)
	end
	local light = core.get_node_light(pos)
	if not light or light < light_level then
		core.get_node_timer(pos):start(300)
		return
	end
	local node = core.get_node(pos)
	core.set_node(pos, {name = vine_name_middle})
	core.set_node(bottom, {name = node.name})
	core.get_node_timer(bottom):start(math.random(5, 10))
			end
		end,

		on_place = function(itemstack, placer, pointd)
	if pointd.type ~= "node" or not placer then
		return itemstack
	end

	local pname = placer:get_player_name()
	local pos_under = pointd.under
	local pos_above = pointd.above
	local node_under = core.get_node(pos_under)
	local def_under = core.registered_nodes[node_under.name]

	if def_under and def_under.on_rightclick and not placer:get_player_control().sneak then
		return def_under.on_rightclick(pos_under, node_under,
			placer, itemstack, pointd) or itemstack
	end

	if pos_above.y ~= pos_under.y-1 then
		return itemstack
	end

	if core.is_protected(pos_under, pname) or core.is_protected(pos_above, pname) then
		core.log("action", pname .. " tried to place " .. itemstack:get_name()
			.. " at protected position " .. core.pos_to_string(pos_under))
		core.record_protection_violation(pos_under, pname)
		return itemstack
	end

	core.set_node(pos_above, {name = vine_name_end})
	if not core.is_creative_enabled(pname) then
		itemstack:take_item()
	end

			return itemstack
		end,

		after_dig_node = function(pos, node, metadata, digger)
			dig_down(pos, node, digger)
		end,
	})

	core.register_node(vine_name_middle, {
		description = S("Matured") .. " " .. defs.description,
		drawtype = 'plantlike',
		climbable = true,
		drop = "vines:vines",
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "wallmounted",
		tiles = {vine_image_middle..'^[transformR180'},
		wield_image = vine_image_middle,
		inventory_image = vine_image_middle,
		groups = groups,
		sounds = default.node_sound_leaves_defaults(),
		collision_box = collision_box,
		selection_box = selection_box,

		after_dig_node = function(pos, node, metadata, digger)
			dig_down(pos, node, digger)
		end,
	})

	biome_lib:spawn_on_surfaces(biome)
end

-- CRAFTS

core.register_craft({
	output = 'vines:rope_block',
	recipe = {
		{'group:vines', 'group:vines', 'group:vines'},
		{'group:vines', 'group:wood', 'group:vines'},
		{'group:vines', 'group:vines', 'group:vines'},
	}
})

if core.get_modpath("moreblocks") then

	core.register_craft({
		output = 'vines:rope_block',
		recipe = {
			{'moreblocks:rope', 'moreblocks:rope', 'moreblocks:rope'},
			{'moreblocks:rope', 'group:wood', 'moreblocks:rope'},
			{'moreblocks:rope', 'moreblocks:rope', 'moreblocks:rope'},
		}
	})
end

core.register_craft({
	output = 'vines:shears',
	recipe = {
		{'', 'default:steel_ingot', ''},
		{'group:stick', 'group:wood', 'default:steel_ingot'},
		{'', '', 'group:stick'}
	}
})

-- NODES

core.register_node("vines:rope_block", {
	description = S("Rope"),
	sunlight_propagates = true,
	paramtype = "light",
	tiles = {
		"default_wood.png^vines_rope.png",
		"default_wood.png^vines_rope.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png^vines_rope.png",
		"default_wood.png^vines_rope.png",
	},
	groups = {flammable = 2, choppy = 2, oddly_breakable_by_hand = 1},

	after_place_node = function(pos)

		local p = {x = pos.x, y = pos.y - 1, z = pos.z}
		local n = core.get_node(p)

		if n.name == "air" then
			core.add_node(p, {name = "vines:rope_end"})
		end
	end,

	after_dig_node = function(pos, node, digger)

		local p = {x = pos.x, y = pos.y - 1, z = pos.z}
		local n = core.get_node(p)

		while n.name == 'vines:rope' or n.name == 'vines:rope_end' do

			core.remove_node(p)

			p = {x = p.x, y = p.y - 1, z = p.z}
			n = core.get_node(p)
		end
	end
})

core.register_node("vines:rope", {
	description = S("Rope"),
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	drop = {},
	tiles = {"vines_rope.png"},
	drawtype = "plantlike",
	groups = {flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -.5, -1/7, 1/7, .5, 1/7},
	},
})

core.register_node("vines:rope_end", {
	description = S("Rope"),
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	drop = {},
	tiles = {"vines_rope_end.png"},
	drawtype = "plantlike",
	groups = {flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos)

		local yesh = {x = pos.x, y = pos.y - 1, z = pos.z}

		core.add_node(yesh, {name = "vines:rope"})
	end,

	selection_box = {
		type = "fixed",
		fixed = {-1/7, -.5, -1/7, 1/7, .5, 1/7},
	},

	on_construct = function(pos)
		core.get_node_timer(pos):start(1)
	end,

	on_timer = function( pos, elapsed )

		local p = {x = pos.x, y = pos.y - 1, z = pos.z}
		local n = core.get_node(p)

		if	n.name == "air" then

			core.set_node(pos, {name = "vines:rope"})
			core.add_node(p, {name = "vines:rope_end"})
		else
			core.get_node_timer(pos):start(1)
		end
	end
})

-- SHEARS

core.register_tool("vines:shears", {
	description = S("Shears"),
	inventory_image = "vines_shears.png",
	wield_image = "vines_shears.png",
	stack_max = 1,
	max_drop_level = 3,
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level = 1,
		groupcaps = {
			snappy = {times = {[3] = 0.2}, uses = 60, maxlevel = 3},
		}
	},
})

-- VINES
local spawn_root_surfaces = {}

if core.settings:get_bool("vines_enable_roots") ~= false then
	spawn_root_surfaces = {"default:dirt_with_grass", "default:dirt"}
end

vines.register_vine('root',
	{description = S("Roots"), average_length = 9}, {
	choose_random_wall = true,
	avoid_nodes = {"vines:root_middle"},
	avoid_radius = 5,
	spawn_delay = 500,
	spawn_chance = 10,
	spawn_surfaces = spawn_root_surfaces,
	spawn_on_bottom = true,
	plantlife_limit = -0.6,
	humidity_min = 0.4,
})

vines.register_vine('vine',
	{description = S("Vines"), average_length = 5}, {
	choose_random_wall = true,
	avoid_nodes = {"group:vines"},
	avoid_radius = 5,
	spawn_delay = 500,
	spawn_chance = 100,
	spawn_surfaces = {"default:jungle_leaves"},
	spawn_on_bottom = true,
	plantlife_limit = -0.9,
	humidity_min = 0.7,
})

vines.register_vine('side',
	{description = S("Vines"), average_length = 6}, {
	choose_random_wall = true,
	avoid_nodes = {"group:vines", "default:apple"},
	avoid_radius = 3,
	spawn_delay = 500,
	spawn_chance = 100,
	spawn_surfaces = {"default:jungle_leaves"},
	spawn_on_bottom = true,
	plantlife_limit = -0.9,
	humidity_min = 0.4,
})

vines.register_vine("jungle",
	{description = S("Jungle Vines"), average_length = 7}, {
	choose_random_wall = true,
	neighbors = {"default:jungle_leaves"},
	avoid_nodes = {
		"vines:jungle_middle",
		"vines:jungle_end",
	},
	avoid_radius = 5,
	spawn_delay = 500,
	spawn_chance = 100,
	spawn_surfaces = {"default:jungle_trunk"},
	spawn_on_bottom = true,
	plantlife_limit = -0.9,
	humidity_min = 0.2,
})

vines.register_vine('willow',
	{description = S("Willow Vines"), average_length = 9}, {
	choose_random_wall = true,
	avoid_nodes = {"vines:willow_middle"},
	avoid_radius = 5,
	near_nodes = {'default:water_source'},
	near_nodes_size = 1,
	near_nodes_count = 1,
	near_nodes_vertical = 7,
	plantlife_limit = -0.8,
	spawn_chance = 10,
	spawn_delay = 500,
	spawn_on_bottom = true,
	spawn_surfaces = {"black_willow:leaves"},
	humidity_min = 0.5
})

vines.register_vine('hyrule',
	{description = S("Hyrule Vines"), average_length = 5}, {
	choose_random_wall = true,
	avoid_nodes = {"group:vines"},
	avoid_radius = 5,
	spawn_delay = 500,
	spawn_chance = 100,
	spawn_surfaces = {"default:beech_leaves"},
	spawn_on_bottom = true,
	plantlife_limit = -0.7,
	humidity_min = 0.4,
})


print("[Vines] Loaded!")
