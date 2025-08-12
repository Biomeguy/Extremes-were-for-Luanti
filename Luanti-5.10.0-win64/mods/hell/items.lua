local hell_sound = default.node_sound_stone_defaults({
	dig = {name="hell_dig", gain=.7},
	dug = {name="hell_dug", gain=1},
	footstep = {name="hell_footstep", gain=.4}
})

-- The fence registration function from fence_registration
local add_fence = core.register_fence
local stairs_exist = core.global_exists("stairs")

-- A function which registers a fence and stairs nodes for a hell node if the
-- mods for these node registrations are available
local function add_more_nodes(name)
	local nd = "hell:"..name
	if not string.find(name, "hell") then
		name = "hell_"..name
	end
	local data = core.registered_nodes[nd]
	if stairs_exist then
		stairs.register_stair_and_slab(name, nd,
			data.groups,
			data.tiles,
			data.description.." Stair",
			data.description.." Slab",
			data.sounds
		)
	end
	if add_fence then
		add_fence({fence_of = nd})
	end
end

--[[
local function add_fence(name)
	local def = core.registered_nodes[name]
	local fencedef = {}
	for _,i in pairs({"walkable", "sunlike_propagates"}) do
		if def[i] ~= nil then
			fencedef[i] = def[i]
		end
	end
end
--]]

local function digging_allowed(player, v)
	if not player then
		return false
	end
	if core.is_creative_enabled(player:get_player_name()) then
		return true
	end
	local tool = player:get_wielded_item():get_name()
	tool = core.registered_tools[tool] or tool == ""
		and core.registered_items[tool]
	if not tool
	or not tool.tool_capabilities then
		return false
	end
	local groups = tool.tool_capabilities.groupcaps
	if not groups then
		return false
	end
	if groups.hell
	and groups.hell.times[v] then
		return true
	end
	return false
end

-- Hell rack
core.register_node("hell:rack", {
	description = "Hell Rack",
	tiles = {"hell_rack.png"},
	groups = {hell=2},
	sounds = hell_sound,
	can_dig = function(_, player)
		return digging_allowed(player, 2)
	end,
})
add_more_nodes("rack")

core.register_node("hell:rack_tiled", {
	description = "Tiled Hell Rack",
	tiles = {"hell_rack_tiled.png"},
	groups = {hell=2},
	sounds = hell_sound,
	can_dig = function(_, player)
		return digging_allowed(player, 2)
	end,
})
add_more_nodes("rack_tiled")

core.register_node("hell:rack_black", {
	description = "Black Hell Rack",
	tiles = {"hell_rack_black.png"},
	groups = {hell=2},
	sounds = hell_sound,
	can_dig = function(_, player)
		return digging_allowed(player, 2)
	end,
})
add_more_nodes("rack_black")

core.register_node("hell:rack_blue", {
	description = "Blue Hell Rack",
	tiles = {"hell_rack_blue.png"},
	groups = {hell=1},
	sounds = hell_sound,
	can_dig = function(_, player)
		return digging_allowed(player, 1)
	end,
})
add_more_nodes("rack_blue")

-- Hell rack brick
core.register_node("hell:rack_brick", {
	description = "Hell Rack Brick",
	tiles = {"hell_rack_brick.png"},
	groups = {hell=3},
	sounds = hell_sound,
	can_dig = function(_, player)
		return digging_allowed(player, 3)
	end,
})
add_more_nodes("rack_brick")

core.register_node("hell:rack_brick_blue", {
	description = "Blue Hell Rack Brick",
	tiles = {"hell_rack_brick_blue.png"},
	groups = {hell=3},
	sounds = hell_sound,
	can_dig = function(_, player)
		return digging_allowed(player, 3)
	end,
})
add_more_nodes("rack_brick_blue")

core.register_node("hell:rack_brick_black", {
	description = "Black Hell Rack Brick",
	tiles = {"hell_rack_brick_black.png"},
	groups = {hell=3},
	sounds = hell_sound,
	can_dig = function(_, player)
		return digging_allowed(player, 3)
	end,
})
add_more_nodes("rack_brick_black")

core.register_node("hell:ivory", {
	description = "Ivory block",
	tiles = {"hell_ivory.png"},
	groups = {hell=1},
	sounds = hell_sound,
	can_dig = function(_, player)
		return digging_allowed(player, 1)
	end,
})
add_more_nodes("ivory")


-- Hell blood
core.register_node("hell:sapling", {
	description = "Hell Blood Child",
	drawtype = "plantlike",
	tiles = {"hell_sapling.png"},
	inventory_image = "hell_sapling.png",
	wield_image = "hell_sapling.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .35, .3}
	},
	groups = {snappy=2, oddly_breakable_by_hand=2, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("hell:gills", {
	description = "Hell Blood Gills",
	drawtype = "plantlike",
	tiles = {"hell_gills.png"},
	inventory_image = "hell_gills.png",
	wield_image = "hell_gills.png",
	paramtype = "light",
	walkable = false,
	drop = {
		max_items = 1,
		items = {
			{items = {"hell:sapling"}, rarity = 30},
			{items = {"hell:gills"}}
		}
	},
	groups = {snappy=2, choppy=3, oddly_breakable_by_hand=2},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("hell:blood", {
	description = "Hell Blood",
	tiles = {"hell_blood.png"},
	groups = {snappy=2, choppy=2, oddly_breakable_by_hand=1},
	sounds = default.node_sound_wood_defaults(),
})
add_more_nodes("blood")

core.register_node("hell:blood_empty", {
	description = "Empty Hell Blood",
	tiles = {"hell_blood_empty.png"},
	groups = {snappy=2, choppy=2, oddly_breakable_by_hand=1},
	sounds = default.node_sound_wood_defaults(),
})
add_more_nodes("blood_empty")


core.register_node("hell:blood_top", {
	description = "Hell Blood Head",
	tiles = {"hell_blood_top.png", "hell_blood.png",
		"hell_blood.png^hell_blood_side.png"},
	groups = {snappy=2, choppy=2, oddly_breakable_by_hand=1},
	sounds = default.node_sound_wood_defaults(),
})
add_more_nodes("blood_top")

core.register_node("hell:blood_top_empty", {
	description = "Empty Hell Blood Head",
	tiles = {"hell_blood_top_empty.png", "hell_blood_empty.png",
		"hell_blood_empty.png^hell_blood_side_empty.png"},
	groups = {snappy=2, choppy=2, oddly_breakable_by_hand=1},
	sounds = default.node_sound_wood_defaults(),
})
add_more_nodes("blood_top_empty")


core.register_node("hell:blood_stem", {
	description = "Hell Blood Stem",
	tiles = {"hell_blood_stem_top.png", "hell_blood_stem_top.png",
		"hell_blood_stem.png"},
	groups = {snappy=2, choppy=2, oddly_breakable_by_hand=1},
	sounds = default.node_sound_wood_defaults(),
})
add_more_nodes("blood_stem")

core.register_node("hell:blood_stem_cooked", {
	description = "Cooked Hell Blood Stem",
	tiles = {"hell_blood_stem_top_cooked.png",
		"hell_blood_stem_top_cooked.png", "hell_blood_stem_cooked.png"},
	groups = {hell=3},
	sounds = hell_sound,
	can_dig = function(_, player)
		return digging_allowed(player, 3)
	end,
})
add_more_nodes("blood_stem_cooked")

core.register_node("hell:blood_stem_empty", {
	description = "Empty Hell Blood Stem",
	tiles = {"hell_blood_stem_top_empty.png",
		"hell_blood_stem_top_empty.png", "hell_blood_stem_empty.png"},
	groups = {choppy=2, oddly_breakable_by_hand=1, trunk=1},
	sounds = default.node_sound_wood_defaults(),
})
add_more_nodes("blood_stem_empty")


core.register_node("hell:blood_wood", {
	description = "Hell Blood Wood",
	tiles = {"hell_wood.png"},
	groups = {choppy=2, oddly_breakable_by_hand=2},
	sounds = default.node_sound_wood_defaults(),
})
add_more_nodes("blood_wood")

core.register_node("hell:blood_wood_cooked", {
	description = "Cooked Hell Blood Wood",
	tiles = {"hell_wood_cooked.png"},
	groups = {hell=3},
	sounds = hell_sound,
	can_dig = function(_, player)
		return digging_allowed(player, 3)
	end,
})
add_more_nodes("blood_wood_cooked")

core.register_node("hell:blood_wood_empty", {
	description = "Empty Hell Blood Wood",
	tiles = {"hell_wood_empty.png"},
	groups = {choppy=2, oddly_breakable_by_hand=2, wood=1},
	sounds = default.node_sound_wood_defaults(),
})
add_more_nodes("blood_wood_empty")

-- Hell fruit
core.register_node("hell:fruit_leaves", {
	description = "Hell Fruit Leaves",
	tiles = {"hell_fruit_leaves.png"},
	groups = {fleshy=3, dig_immediate=2},
	sounds = default.node_sound_defaults(),
})
add_more_nodes("fruit_leaves")

local function room_for_items(inv)
	local free_slots = 0
	for _,i in ipairs(inv:get_list("main")) do
		if i:get_count() == 0 then
			free_slots = free_slots+1
		end
	end
	if free_slots < 2 then
		return false
	end
	return true
end

if core.get_modpath("caverealms") then
core.override_item("caverealms:nether_shroom", {on_drop = function(itemstack, dropper, pos)
	if dropper:get_player_control().aux1 then
		return core.item_drop(itemstack, dropper, pos)
	end
	local inv = dropper:get_inventory()
	if not inv then
		return
	end
	if not room_for_items(inv) then
		return
	end
	core.sound_play("hell_remove_leaf", {pos = pos,  gain = .25})
	itemstack:take_item()
	inv:add_item("main", "hell:shroom_head")
	inv:add_item("main", "hell:shroom_stem")
	return itemstack
end})
end

core.register_node("hell:fruit", {
	description = "Hell Fruit",
	drawtype = "plantlike",
	tiles = {"hell_fruit.png"},
	inventory_image = "hell_fruit.png",
	paramtype = "light",
	groups = {fleshy=3, dig_immediate=3, flammable=1},
	on_use = function(itemstack, user)
		local inv = user:get_inventory()
		if not inv then
			return
		end
		itemstack:take_item()
		if hell.teleport_player(user) then
			return itemstack
		end
		local amount = math.random(4, 6)
		inv:add_item("main", {name="hell:blood_item", count=math.floor(amount/3)})
		user:set_hp(user:get_hp()-amount)
		return itemstack
	end,
	sounds = default.node_sound_defaults(),
	on_drop = function(itemstack, dropper, pos)
	if dropper:get_player_control().aux1 then
		return core.item_drop(itemstack, dropper, pos)
	end
	local inv = dropper:get_inventory()
	if not inv then
		return
	end
	if not room_for_items(inv) then
		return
	end
	core.sound_play("hell_remove_leaf", {pos = pos,  gain = .25})
	itemstack:take_item()
	inv:add_item("main", "hell:fruit_leaf")
	inv:add_item("main", "hell:fruit_no_leaf")
	return itemstack
	end
})

-- Hell fruit vine
core.register_node("hell:vine", {
	description = "Hell vine",
	drawtype = "plantlike",
	tiles = {"hell_vine.png"},
	inventory_image = "hell_vine.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drop = {
		items = {
			{items = {"hell:fruit"}, rarity = 9},
			{items = {"hell:fruit"}, rarity = 3},
			{items = {"hell:fruit"}}
		}
	},
	groups = {snappy = 3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
	after_dig_node = function(pos, _, _, digger)
		if digger then
			local p = {x=pos.x, y=pos.y-1, z=pos.z}
			local nn = core.get_node(p)
			if nn.name == "hell:vine" then
				core.node_dig(p, nn, digger)
			end
		end
	end
})


-- forest stuff

for n,i in pairs({"small", "middle", "big"}) do
	core.register_node("hell:grass_"..i, {
		description = "Hell Grass",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"hell_grass_"..i..".png"},
		inventory_image = "hell_grass_"..i..".png",
		wield_image = "hell_grass_"..i..".png",
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		drop = "hell:grass "..n,
		groups = {snappy=3,flora=1,attached_node=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-.5, -.5, -.5, .5, -5/16, .5},
		},
	})
end

core.register_node("hell:glowflower", {
	description = "Glowing Flower",
	drawtype = "plantlike",
	tiles = {"hell_glowflower.png"},
	inventory_image = "hell_glowflower.png",
	wield_image = "hell_glowflower.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	light_source = 10,
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-.15, -.5, -.15, .15, .2, .15},
	},
})

core.register_node("hell:tree_sapling", {
	description = "Hell Tree Sapling",
	drawtype = "plantlike",
	tiles = {"hell_tree_sapling.png"},
	inventory_image = "hell_tree_sapling.png",
	wield_image = "hell_tree_sapling.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .35, .3}
	},
	groups = {snappy=2, oddly_breakable_by_hand=2, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("hell:tree", {
	description = "Hell Trunk",
	tiles = {"hell_tree_top.png", "hell_tree_top.png", "hell_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=1,trunk=1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("hell:tree_corner", {
	description = "Hell Trunk Corner",
	tiles = {"hell_tree.png^[transformR180", "hell_tree_top.png",
		"hell_tree_corner.png^[transformFY",
		"hell_tree_corner.png^[transformR180", "hell_tree.png",
		"hell_tree_top.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=1,trunk=1,not_in_creative_inventory=1},
	drop = "hell:tree",
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("hell:forest_wood", {
	description = "Hell Wood Block",
	tiles = {"hell_forest_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,wood=1},
	sounds = default.node_sound_wood_defaults(),
})
add_more_nodes("forest_wood")

core.register_node("hell:leaves", {
	description = "Hell Leaves",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = math.sqrt(2) + .01,
	tiles = {"hell_leaves.png"},
	inventory_image = "hell_leaves.png",
	wield_image = "hell_leaves.png",
	paramtype = "light",
	paramtype2 = "degrotate",
	is_ground_content = false,
	groups = {snappy=3, leafdecay=3, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{items = {"hell:tree_sapling"}, rarity = 30},
			{items = {"hell:leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("hell:dirt", {
	description = "Hell Dirt",
	tiles = {"hell_dirt.png"},
	groups = {crumbly=3,soil=1,hell_dirt=1},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("hell:dirt_top", {
	description = "Hell Dirt Top",
	tiles = {"hell_dirt_top.png", "hell_dirt.png",
		{name="hell_dirt.png^hell_dirt_top_side.png", tileable_vertical = false}
	},
	groups = {crumbly=3,soil=1,hell_dirt=1},
	drop = "hell:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=.25},
	}),
})

core.register_node("hell:dirt_bottom", {
	description = "Hell Rack Dirt Transition",
	tiles = {"hell_dirt.png", "hell_rack.png",
		{name="hell_rack.png^hell_dirt_transition.png", tileable_vertical = false}
	},
	groups = {hell=2},
	drop = "hell:rack",
	sounds = default.node_sound_dirt_defaults({
		dig = {name="hell_dig", gain=.7},
		dug = {name="hell_dug", gain=1},
	}),
	can_dig = function(_, player)
		return digging_allowed(player, 2)
	end,
})


-- Hell torch
core.register_node("hell:torch", {
	description = "Hell Torch",
	drawtype = "torchlike",
	tiles = {"hell_torch_on_floor.png", "hell_torch_on_ceiling.png", {
		name = "hell_torch.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.},
	}},
	inventory_image = "hell_torch_on_floor.png",
	wield_image = "hell_torch_on_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 13,
	selection_box = {
		type = "wallmounted",
		wall_top = {-.1, .5-.6, -.1, .1, .5, .1},
		wall_bottom = {-.1, -.5, -.1, .1, -.5+.6, .1},
		wall_side = {-.5, -.3, -.1, -.5+.3, .3, .1},
	},
	groups = {choppy=2, dig_immediate=3, attached_node=1, hot=3, igniter=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})


core.register_craftitem("hell:grass", {
	description = "Hell Grass",
	inventory_image = "hell_grass.png",
	groups = {flammable = 1},
})

core.register_craftitem("hell:grass_dried", {
	description = "Dried Hell Grass",
	inventory_image = "hell_grass_dried.png",
	groups = {flammable = 2},
})

core.register_craftitem("hell:forest_planks", {
	description = "Hell Wooden Planks",
	inventory_image = "hell_forest_planks.png",
	groups = {flammable = 2},
	stack_max = 990,
})

core.register_craftitem("hell:bark", {
	description = "Hell Trunk Bark",
	inventory_image = "hell_bark.png",
	groups = {flammable = 1},
})

core.register_craftitem("hell:stick", {
	description = "Hell Stick",
	inventory_image = "hell_stick.png",
	groups = {stick=1, flammable = 1},
})

core.register_craftitem("hell:shroom_head", {
	description = "Nether Mushroom Head",
	inventory_image = "hell_shroom_top.png",
	groups = {flammable = 2},
})

core.register_craftitem("hell:shroom_stem", {
	description = "Nether Mushroom Stem",
	inventory_image = "hell_shroom_stem.png",
	groups = {flammable = 2},
})

core.register_craftitem("hell:fruit_leaf", {
	description = "Hell Fruit Leaf",
	inventory_image = "hell_fruit_leaf.png",
	groups = {flammable = 3},
})

core.register_craftitem("hell:fruit_no_leaf", {
	description = "Hell Fruit Without Leaf",
	inventory_image = "hell_fruit_no_leaf.png",
	groups = {flammable = 1},
})

core.register_craftitem("hell:fim", {
	description = "Hell FIM",	--fruit in mushroom
	inventory_image = "hell_fim.png",
	groups = {flammable = 1},
})

core.register_craftitem("hell:blood_item", {
	description = "Blood",
	inventory_image = "hell_blood_item.png",
	groups = {flammable = 1},
	on_place = function(itemstack, _, pointd)
		if not pointd then
			return
		end

		if pointd.type ~= "node" then
			return
		end

		local pos = core.get_pointed_thing_position(pointd)
		local node = core.get_node_or_nil(pos)

		if not node then
			return
		end

		if node.name == "hell:vine" then
			pos = {x=pos.x, y=pos.y-1, z=pos.z}
			if core.get_node(pos).name == "air" then
				core.set_node(pos, {name = "hell:vine"})
			end
			itemstack:take_item()
			return itemstack
		end

		return itemstack
	end
})

core.register_craftitem("hell:blood_cooked", {
	description = "Cooked Blood",
	inventory_image = "hell_blood_cooked.png",
	groups = {flammable = 3},
})


local blood_exno = {}
for _,i in ipairs({"hell:blood", "hell:blood_top", "hell:blood_stem"}) do
	blood_exno[i] = i.."_empty"
end

core.register_tool("hell:bloodtap", {
	description = "Hell Blood Tap",
	inventory_image = "hell_blood_tap.png",
	groups = {flammable = 1},
	on_use = function(itemstack, user, pointd)
		if pointd.type ~= "node" then
			return
		end
		local pos = pointd.under
		if core.is_protected(pos, user:get_player_name()) then
			core.record_protection_violation(pos, user:get_player_name())
			return
		end
		local node = core.get_node(pos)
		local node_name = blood_exno[node.name]
		if node_name then
		core.set_node(pos, {name = node_name})
		core.sound_play("hell_extract_blood", {pos = pos,  gain = 1})
		core.handle_node_drops(pointd.above, {"hell:blood_item"}, user)
		if not core.is_creative_enabled(user:get_player_name()) then
			local item_wear = tonumber(itemstack:get_wear())
			item_wear = item_wear + 819
			if item_wear > 65535 then
				itemstack:clear()
				return itemstack
			end
			itemstack:set_wear(item_wear)
		end
		end
		return itemstack
	end,
})

core.register_tool("hell:pick_blood_top", {
	description = "Hell Blood Head Pickaxe",
	inventory_image = "hell_pick_blood_top.png",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky = {times={[3]=3}, uses=1, maxlevel=1},
			hell = {times={[3]=3}, uses=1, maxlevel=1},
		},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1, flammable = 2}
})

core.register_tool("hell:pick_blood_wood", {
	description = "Cooked Hell Blood Wood Pickaxe",
	inventory_image = "hell_pick_blood_wood.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[3]=1.6}, uses=10, maxlevel=1},
			hell = {times={[2]=6, [3]=1.6}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1, flammable = 2}
})

core.register_tool("hell:pick_rack", {
	description = "Hell Rack Pickaxe",
	inventory_image = "hell_pick_rack.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.20}, uses=20, maxlevel=1},
			hell = {times={[1]=16, [2]=2, [3]=1.20}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

core.register_tool("hell:pick_rack_blue", {
	description = "Blue Hell Rack Pickaxe",
	inventory_image = "hell_pick_rack_blue.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=30, maxlevel=2},
			hell = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

core.register_tool("hell:pick_ivory", {
	description = "Ivory Pickaxe",
	inventory_image = "hell_pick_ivory.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=1, [2]=0.8, [3]=0.3}, uses=180, maxlevel=3},
			hell = {times={[1]=1, [2]=0.5, [3]=0.3}, uses=180, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

core.register_tool("hell:axe_rack", {
	description = "Hell Rack Axe",
	inventory_image = "hell_axe_rack.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=2.9, [2]=1.9, [3]=1.4}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

core.register_tool("hell:axe_rack_blue", {
	description = "Blue Hell Rack Axe",
	inventory_image = "hell_axe_rack_blue.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.5, [2]=1.5, [3]=1}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

core.register_tool("hell:axe_ivory", {
	description = "Ivory Axe",
	inventory_image = "hell_axe_ivory.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.2, [2]=0.5, [3]=0.3}, uses=180, maxlevel=2},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

core.register_tool("hell:shovel_rack", {
	description = "Hell Rack Shovel",
	inventory_image = "hell_shovel_rack.png",
	wield_image = "hell_shovel_rack.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=1.7, [2]=1.1, [3]=0.45}, uses=22, maxlevel=2},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

core.register_tool("hell:shovel_rack_blue", {
	description = "Blue Hell Rack Shovel",
	inventory_image = "hell_shovel_rack_blue.png",
	wield_image = "hell_shovel_rack_blue.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.4, [2]=0.8, [3]=0.35}, uses=50, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

core.register_tool("hell:shovel_ivory", {
	description = "Ivory Shovel",
	inventory_image = "hell_shovel_ivory.png",
	wield_image = "hell_shovel_ivory.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=0.95, [2]=0.45, [3]=0.1}, uses=151, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

core.register_tool("hell:sword_rack", {
	description = "Hell Rack Sword",
	inventory_image = "hell_sword_rack.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.3, [3]=0.38}, uses=40, maxlevel=1},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

core.register_tool("hell:sword_rack_blue", {
	description = "Blue Hell Rack Sword",
	inventory_image = "hell_sword_rack_blue.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.1, [3]=0.33}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

core.register_tool("hell:sword_ivory", {
	description = "Ivory Sword",
	inventory_image = "hell_sword_ivory.png",
	wield_image = "hell_sword_ivory.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.7, [2]=0.8, [3]=0.2}, uses=100, maxlevel=3},
		},
		damage_groups = {fleshy=11},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})


-- override creative hand
if core.settings:get_bool("creative_mode") then
	local capas = core.registered_items[""].tool_capabilities
	capas.groupcaps.hell = capas.groupcaps.cracky
	core.override_item("", {tool_capabilities = capas})
end
