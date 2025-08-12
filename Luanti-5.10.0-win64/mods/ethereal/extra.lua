
local S = ethereal.intllib

-- Frost Crystal Gilly Staff (replenishes air supply when used)
core.register_tool("ethereal:crystal_gilly_staff", {
	description = S("Frost Crystal Gilly Staff"),
	inventory_image = "crystal_gilly_staff.png",
	on_use = function(item, user, pointd)
		if user:get_breath() < 10 then
			user:set_breath(10)
		end
	end,
})

core.register_craft({
	type = "shapeless",
	output = "ethereal:crystal_gilly_staff",
	recipe = {"ethereal:green_moss", "ethereal:gray_moss", "ethereal:fiery_moss", "default:dirt_with_blue_moss",
		"default:crystal_ingot", "default:crystal_ingot"},
	replacements = {{"default:dirt_with_blue_moss", "default:dirt"}}
})

-- Add [toolranks] mod support if found
if core.get_modpath("toolranks") then

	-- Helper function
	local function add_tool(name, desc, afteruse)
		core.override_item(name, {
			original_description = desc,
			description = toolranks.create_description(desc, 0, 1),
			after_use = afteruse and toolranks.new_afteruse
		})
	end

	add_tool("default:pick_crystal", "Frost Crystal Pickaxe", true)
	add_tool("default:axe_crystal", "Frost Crystal Axe", true)
	add_tool("default:shovel_crystal", "Frost Crystal Shovel", true)
	add_tool("default:sword_crystal", "Frost Crystal Sword", true)
end

-- Etherium Dust
core.register_craftitem("ethereal:etherium_dust", {
	description = S("Etherium Dust"),
	inventory_image = "ethereal_etherium_dust.png",
	wield_image = "ethereal_etherium_dust.png",
})

-- Ethereium Ore
core.register_node("ethereal:etherium_ore", {
	description = S("Etherium Ore"),
	tiles = {"default_desert_stone.png^ethereal_etherium_ore.png"},
	groups = {cracky = 3},
	drop = "ethereal:etherium_dust",
	sounds = default.node_sound_stone_defaults(),
})

-- Blue Marble Nodes
core.register_node("ethereal:blue_marble", {
	description = S("Blue Marble"),
	tiles = {"ethereal_blue_marble.png"},
	groups = {cracky = 1, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("ethereal:blue_marble_tile", {
	description = S("Blue Marble Tile"),
	tiles = {"ethereal_blue_marble_tile.png"},
	groups = {cracky = 1, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = "ethereal:blue_marble_tile 9",
	recipe = {
		{"ethereal:blue_marble", "ethereal:blue_marble", "ethereal:blue_marble"},
		{"ethereal:blue_marble", "ethereal:blue_marble", "ethereal:blue_marble"},
		{"ethereal:blue_marble", "ethereal:blue_marble", "ethereal:blue_marble"}
	}
})

-- Icecles
core.register_node("ethereal:icecle_1", {
	description = "Icecles",
	drawtype = "plantlike",
	tiles = {"icecle_1.png"},
	inventory_image = "icecle_3.png",
	wield_image = "icecle_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {cracky = 3, falling_node=1, falling_node_damage=7, cools_lava = 1, icy = 1},
	sounds = default.node_sound_ice_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-.31, .5, -.31, .31, .2, .31}
	},
	on_place = function(itemstack, placer, pointd)
	-- Call on_rightclick if the pointed node defines it
	if pointd.type == "node" and placer and
			not placer:get_player_control().sneak then
		local node_ptu = core.get_node(pointd.under)
		local def_ptu = core.registered_nodes[node_ptu.name]
		if def_ptu and def_ptu.on_rightclick then
			return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
				itemstack, pointd)
		end
	end

	local pos = pointd.under
	if core.get_node(pos).name ~= "default:cave_ice" and core.get_node(pos).name ~= "default:ice" then
		return itemstack
	end

	if pointd.above.y ~= pos.y-1 then
		return itemstack
	end

		-- place a random icecle node
		local stack = ItemStack("ethereal:icecle_".. math.random(1,5))
		local ret = core.item_place(stack, placer, pointd)
		return ItemStack("ethereal:icecle_1 "..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})
for i = 2, 5 do
	core.register_node("ethereal:icecle_".. i, {
		description = "Icecles",
		drawtype = "plantlike",
		tiles = {"icecle_".. i ..".png"},
		inventory_image = "icecle_".. i ..".png",
		wield_image = "icecle_".. i ..".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		drop = "ethereal:icecle_1",
		on_construct = function(pos)
			core.get_node_timer(pos):start(5)
		end,
		on_timer = default.melt_near_heat,
		groups = {cracky = 3, falling_node=1, falling_node_damage=7,
	cools_lava = 1, icy = 1, not_in_creative_inventory = 1},
		sounds = default.node_sound_ice_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-.31, .5, -.31, .31, .2, .31}
		},
	})
end

-- Bamboo Flooring
core.register_node("ethereal:bamboo_floor", {
	description = S("Bamboo Floor"),
	drawtype = "nodebox",
	tiles = {"bamboo_floor.png"},
	inventory_image = "bamboo_floor.png",
	wield_image = "bamboo_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = true,
	node_box = {
		type = "wallmounted",
		wall_top    = {-.5, .4375, -.5, .5, .5, .5},
		wall_bottom = {-.5, -.5, -.5, .5, -.4375, .5},
		wall_side   = {-.5, -.5, -.5, -.4375, .5, .5},
	},
	selection_box = {type = "wallmounted"},
	groups = {snappy = 3, choppy = 3 , flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

-- Craft Bamboo into Bamboo Flooring
core.register_craft({
	output = "ethereal:bamboo_floor 2",
	recipe = {
		{"ethereal:bamboo", "ethereal:bamboo"},
		{"ethereal:bamboo", "ethereal:bamboo"}
	}
})

-- Bamboo Block
core.register_node("ethereal:bamboo_block", {
	description = S("Bamboo Block"),
	tiles = {"bamboo_floor.png"},
	paramtype = "light",
	groups = {snappy = 3, choppy = 3 , flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_craft({
	output = "ethereal:bamboo_block 2",
	recipe = {
		{"ethereal:bamboo", "ethereal:bamboo", "ethereal:bamboo"},
		{"ethereal:bamboo", "ethereal:bamboo", "ethereal:bamboo"},
		{"ethereal:bamboo", "ethereal:bamboo", "ethereal:bamboo"}
	}
})

core.register_craft({
	output = "ethereal:bamboo_block",
	recipe = {
		{"ethereal:bamboo_floor"},
		{"ethereal:bamboo_floor"}
	}
})

default.chest.register_chest("ethereal:bamboo_chest", {
	description = S("Bamboo Chest"),
	tiles = {
		"bamboo_chest_top.png",
		"bamboo_chest_top.png",
		"bamboo_chest_side.png",
		"bamboo_chest_side.png",
		"bamboo_chest_front.png",
		"default_chest_inside.png"
	},
	sounds = default.node_sound_wood_defaults({
		dig = {name = "default_dig_choppyhollow", gain= .4}
	}),
	sound_open = "default_chest_open",
	sound_close = "default_chest_close",
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
})

core.register_craft({
	output = "default:bamboo_chest",
	recipe = {
		{"ethereal:bamboo", "ethereal:bamboo", "ethereal:bamboo"},
		{"ethereal:bamboo", "", "ethereal:bamboo"},
		{"ethereal:bamboo", "ethereal:bamboo", "ethereal:bamboo"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "default:bamboo_chest",
	burntime = 30,
})

-- Craft Bamboo into Paper
core.register_craft({
	output = "default:paper 6",
	recipe = {
		{"ethereal:bamboo", "ethereal:bamboo"},
		{"ethereal:bamboo", "ethereal:bamboo"},
		{"ethereal:bamboo", "ethereal:bamboo"}
	}
})

-- Palm Wax
core.register_craftitem("ethereal:palm_wax", {
	description = S("Palm Wax"),
	inventory_image = "palm_wax.png",
	groups = {wax = 1, flammable = 1},
})

core.register_craft({
	type = "cooking",
	output = "ethereal:palm_wax",
	recipe = "default:coco_palm_leaves",
	cooktime = 10,
})

-- Candle from Wax and String
core.register_node("ethereal:candle", {
	description = S("Candle"),
	drawtype = "plantlike",
	tiles = {
		{name= "candle.png", animation={type= "vertical_frames", aspect_w = 32, aspect_h = 32, length = 1.}}
	},
	inventory_image = "candle_static.png",
	wield_image = "candle_static.png",
	paramtype = "light",
	light_source = 11,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.15, -.5, -.15, .15, -.2, .15}
	},
	groups = {dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
})

core.register_craft({
	output = "ethereal:candle 2",
	recipe = {
		{"fabric:string"},
		{"group:wax"},
		{"group:wax"}
	}
})

-- Paper Wall
core.register_node("ethereal:paper_wall", {
	description = S("Paper Wall"),
	drawtype = "nodebox",
	tiles = {"paper_wall.png"},
	inventory_image = "paper_wall.png",
	wield_image = "paper_wall.png",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, 5/11, .5, .5, 8/16}
	},
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, 5/11, .5, .5, 8/16}
	},
	groups = {snappy = 3},
	sounds = default.node_sound_wood_defaults(),
})

core.register_craft({
	output = "ethereal:paper_wall",
	recipe = {
		{"group:stick", "default:paper", "group:stick"},
		{"group:stick", "default:paper", "group:stick"},
		{"group:stick", "default:paper", "group:stick"}
	}
})

-- Glostone (A little bit of light decoration)
core.register_node("ethereal:glostone", {
	description = S("Glo Stone"),
	tiles = {"glostone.png"},
	light_source = 13,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "ethereal:glostone",
	recipe = {"default:torch", "default:stone", "dye:yellow"}
})

core.register_craft({
	output = "fire:charcoal_lump 4",
	recipe = {{"ethereal:scorched_trunk"}}
})

-- Staff of Light (by Xanthin)
core.register_tool("ethereal:light_staff", {
	description = S("Staff of Light"),
	inventory_image = "light_staff.png",
	sound = {breaks = "default_tool_breaks"},
	on_use = function(item, user, pointd)

		if pointd.type ~= "node" then
			return
		end
		local pos = pointd.under
		local pname = user:get_player_name()

		if core.is_protected(pos, pname) then
			core.record_protection_violation(pos, pname)
			return
		end

		local node = core.get_node(pos).name
		local def = core.registered_nodes[node]
		local stone = def and def.groups and def.groups.stone

		if stone then
			core.swap_node(pos, {name = "ethereal:glostone"})

			if not core.is_creative_enabled(pname) then
				item:add_wear(65535 / 149) -- 150 uses
			end

			return item
		end
	end,
})

core.register_craft({
	output = "ethereal:light_staff",
	recipe = {
		{"ethereal:illumishroom", "default:mese_crystal", "ethereal:illumishroom"},
		{"ethereal:illumishroom2", "default:steel_ingot", "ethereal:illumishroom2"},
		{"ethereal:illumishroom3", "default:steel_ingot", "ethereal:illumishroom3"}
	}
})
