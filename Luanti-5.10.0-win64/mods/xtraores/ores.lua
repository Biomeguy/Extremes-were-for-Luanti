
-- Nickel

core.register_node("xtraores:nickel_ore", {
	description = "" ..core.colorize("#68fff6", "Nickel ore\n").. "Xtraores ore level: 1",
	tiles = {"default_stone.png^xtraores_nickel_ore.png"},
	inventory_image = "xtraores_nickel_lump.png",
	stack_max = 999,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

local stoneNdiamite = {"default:stone", "default:diamite", "default:bedrock"}

	core.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores:nickel_ore",
		wherein        = {stoneNdiamite},
		clust_scarcity = 16 * 16 * 16,
		clust_num_ores = 4,
		clust_size     = 4,
		y_max          = 100,
		y_min          = -31000,
	})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores:nickel_ore",
		wherein        = {stoneNdiamite},
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 4,
		clust_size     = 4,
		y_max          = -1,
		y_min          = -31000,
	})

core.register_craft({
	type = "cooking",
	cooktime = 2,
	output = "xtraores:nickel_ingot",
	recipe = "xtraores:nickel_ore",
})

-- Platinum

core.register_node("xtraores:platinum_ore", {
	description = "" ..core.colorize("#68fff6", "Platinum ore\n").. "Xtraores ore level: 2",
	tiles = {"default_stone.png^xtraores_platinum_ore.png"},
	inventory_image = "xtraores_platinum_lump.png",
	stack_max = 999,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores:platinum_ore",
		wherein        = {stoneNdiamite},
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 4,
		clust_size     = 4,
		y_max          = -85,
		y_min          = -31000,
	})

core.register_craft({
	type = "cooking",
	cooktime = 5,
	output = "xtraores:platinum_ingot",
	recipe = "xtraores:platinum_ore",
})

-- Palladium

core.register_node("xtraores:palladium_ore", {
	description = "" ..core.colorize("#68fff6", "Palladium ore\n").. "Xtraores ore level: 3",
	tiles = {"default_stone.png^xtraores_palladium_ore.png"},
	inventory_image = "xtraores_palladium_lump.png",
	stack_max = 999,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores:palladium_ore",
		wherein        = {stoneNdiamite},
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 4,
		clust_size     = 4,
		y_max          = -250,
		y_min          = -31000,
	})

core.register_craft({
	type = "cooking",
	cooktime = 12,
	output = "xtraores:palladium_ingot",
	recipe = "xtraores:palladium_ore",
})

-- Cobalt

core.register_node("xtraores:cobalt_ore", {
	description = "" ..core.colorize("#68fff6", "Cobalt ore\n").. "Xtraores ore level: 4",
	tiles = {"default_stone.png^xtraores_cobalt_ore.png"},
	inventory_image = "xtraores_cobalt_lump.png",
	stack_max = 999,
	groups = {cracky = 4},
	sounds = default.node_sound_stone_defaults(),
})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores:cobalt_ore",
		wherein        = {stoneNdiamite},
		clust_scarcity = 17 * 17 * 17,
		clust_num_ores = 4,
		clust_size     = 4,
		y_max          = -600,
		y_min          = -31000,
	})

core.register_craft({
	type = "cooking",
	cooktime = 20,
	output = "xtraores:cobalt_ingot",
	recipe = "xtraores:cobalt_ore",
})

-- Thorium

core.register_node("xtraores:thorium_ore", {
	description = "" ..core.colorize("#68fff6", "Thorium ore\n").. "Xtraores ore level: 5",
	tiles = {"default_stone.png^xtraores_thorium_ore.png"},
	inventory_image = "xtraores_thorium_lump.png",
	stack_max = 999,
	groups = {cracky = 5},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores:thorium_ore",
		wherein        = {stoneNdiamite},
		clust_scarcity = 19 * 19 * 19,
		clust_num_ores = 4,
		clust_size     = 4,
		y_max          = -1250,
		y_min          = -31000,
	})

core.register_craft({
	type = "cooking",
	cooktime = 32,
	output = "xtraores:thorium_ingot",
	recipe = "xtraores:thorium_ore",
})

-- Antracite ore

core.register_node("xtraores:antracite_ore", {
	description = "" ..core.colorize("#68fff6", "Antracite\n").. "Xtraores ore level: 5",
	tiles = {"default_stone.png^xtraores_antracite_ore.png"},
	inventory_image = "xtraores_antracite_lump.png",
	stack_max = 999,
	groups = {cracky = 5},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores:antracite_ore",
		wherein        = {stoneNdiamite},
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 6,
		clust_size     = 5,
		y_max          = -2000,
		y_min          = -31000,
	})

core.register_craft({
	output = "xtraores:antracite_torch 5",
	recipe = {
		{"xtraores:antracite_ore"},
		{"xtraores:steel_handle"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "xtraores:antracite_ore",
	burntime = 164,
})

-- Osmium

core.register_node("xtraores:osmium_ore", {
	description = "" ..core.colorize("#68fff6", "Osmium ore\n").. "Xtraores ore level: 6",
	tiles = {"default_stone.png^xtraores_osmium_ore.png"},
	inventory_image = "xtraores_osmium_lump.png",
	stack_max = 999,
	groups = {cracky = 6},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores:osmium_ore",
		wherein        = {stoneNdiamite},
		clust_scarcity = 21 * 21 * 21,
		clust_num_ores = 4,
		clust_size     = 4,
		y_max          = -3500,
		y_min          = -31000,
	})

core.register_craft({
	type = "cooking",
	cooktime = 45,
	output = "xtraores:osmium_ingot",
	recipe = "xtraores:osmium_ore",
})

-- Rhenium

core.register_node("xtraores:rhenium_ore", {
	description = "" ..core.colorize("#68fff6", "Rhenium ore\n").. "Xtraores ore level: 7",
	tiles = {"default_stone.png^xtraores_rhenium_ore.png"},
	inventory_image = "xtraores_rhenium_lump.png",
	stack_max = 999,
	groups = {cracky = 7},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores:rhenium_ore",
		wherein        = {stoneNdiamite},
		clust_scarcity = 23 * 23 * 23,
		clust_num_ores = 4,
		clust_size     = 4,
		y_max          = -5750,
		y_min          = -31000,
	})

core.register_craft({
	type = "cooking",
	cooktime = 60,
	output = "xtraores:rhenium_ingot",
	recipe = "xtraores:rhenium_ore",
})

-- Vanadium

core.register_node("xtraores:vanadium_ore", {
	description = "" ..core.colorize("#68fff6", "Vanadium ore\n").. "Xtraores ore level: 8",
	tiles = {"default_stone.png^xtraores_vanadium_ore.png"},
	inventory_image = "xtraores_vanadium_lump.png",
	stack_max = 999,
	groups = {cracky = 8},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores:vanadium_ore",
		wherein        = {stoneNdiamite},
		clust_scarcity = 26 * 26 * 26,
		clust_num_ores = 4,
		clust_size     = 4,
		y_max          = -8000,
		y_min          = -31000,
	})

core.register_craft({
	type = "cooking",
	cooktime = 75,
	output = "xtraores:vanadium_ingot",
	recipe = "xtraores:vanadium_ore",
})

-- Rarium

core.register_node("xtraores:rarium_ore", {
	description = "" ..core.colorize("#68fff6", "Rarium ore\n").. "Xtraores ore level: 9",
	tiles = {{
		name = "xtraores_rarium_ore.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.0}
	}},
	light_source = 4,
	inventory_image = "xtraores_rarium_lump.png",
	stack_max = 999,
	groups = {cracky = 9},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores:rarium_ore",
		wherein        = {stoneNdiamite},
		clust_scarcity = 30 * 30 * 30,
		clust_num_ores = 3,
		clust_size     = 3,
		y_max          = -10000,
		y_min          = -31000,
	})

core.register_craft({
	type = "cooking",
	cooktime = 90,
	output = "xtraores:rarium_ingot",
	recipe = "xtraores:rarium_ore",
})

-- Orichalcum

core.register_node("xtraores:orichalcum_ore", {
	description = "" ..core.colorize("#68fff6", "Orichalcum ore\n").. "Xtraores ore level: 10",
	tiles = {"default_stone.png^xtraores_orichalcum_ore.png"},
	inventory_image = "xtraores_orichalcum_lump.png",
	stack_max = 999,
	groups = {cracky = 10},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores:orichalcum_ore",
		wherein        = {stoneNdiamite},
		clust_scarcity = 34 * 34 * 34,
		clust_num_ores = 3,
		clust_size     = 3,
		y_max          = -12500,
		y_min          = -31000,
	})

core.register_craft({
	type = "cooking",
	cooktime = 120,
	output = "xtraores:orichalcum_ingot",
	recipe = "xtraores:orichalcum_ore",
})

-- Titanium

core.register_node("xtraores:titanium_ore", {
	description = "" ..core.colorize("#68fff6", "Titanium ore\n").. "Xtraores ore level: 11",
	tiles = {"default_stone.png^xtraores_titanium_ore.png"},
	inventory_image = "xtraores_titanium_lump.png",
	stack_max = 999,
	groups = {cracky = 11},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores:titanium_ore",
		wherein        = {stoneNdiamite},
		clust_scarcity = 36 * 36 * 36,
		clust_num_ores = 3,
		clust_size     = 3,
		y_max          = -15000,
		y_min          = -31000,
	})

core.register_craft({
	type = "cooking",
	cooktime = 145,
	output = "xtraores:titanium_ingot",
	recipe = "xtraores:titanium_ore",
})

-- Uranium

core.register_node("xtraores:uranium_ore", {
	description = "" ..core.colorize("#68fff6", "Uranium ore\n").. "Xtraores ore level: 11",
	tiles = {{
		name = "xtraores_uranium_ore.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.0}
	}},
	light_source = 7,
	inventory_image = "xtraores_uranium_lump.png",
	stack_max = 999,
	groups = {cracky = 11},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores:uranium_ore",
		wherein        = {stoneNdiamite},
		clust_scarcity = 37 * 37 * 37,
		clust_num_ores = 2,
		clust_size     = 3,
		y_max          = -15000,
		y_min          = -31000,
	})

core.register_craft({
	type = "cooking",
	cooktime = 145,
	output = "xtraores:uranium_ingot",
	recipe = "xtraores:uranium_ore",
})

-- Chromium

core.register_node("xtraores:chromium_ore", {
	description = "" ..core.colorize("#68fff6", "Chromium ore\n").. "Xtraores ore level: 12",
	tiles = {"default_stone.png^xtraores_chromium_ore.png"},
	inventory_image = "xtraores_chromium_lump.png",
	stack_max = 999,
	groups = {cracky = 12},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

	core.register_ore({
		ore_type       = "scatter",
		ore            = "xtraores:chromium_ore",
		wherein        = {stoneNdiamite},
		clust_scarcity = 38 * 38 * 38,
		clust_num_ores = 3,
		clust_size     = 3,
		y_max          = -18000,
		y_min          = -31000,
	})

core.register_craft({
	type = "cooking",
	cooktime = 180,
	output = "xtraores:chromium_ingot",
	recipe = "xtraores:chromium_ore",
})

core.register_node("xtraores:gobalt_brick", {
	description = "Gobalt brick",
	tiles = {"xtraores_gobalt_brick.png"},
	is_ground_content = false,
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})
core.register_craftitem("xtraores:gobalt_lump", {
	description = "Gobalt lump",
	inventory_image = "xtraores_gobalt_lump.png",
})
core.register_craftitem("xtraores:gobalt_ingot", {
	description = "Gobalt ingot",
	inventory_image = "xtraores_gobalt_ingot.png",
})
core.register_craft({
	type = "cooking",
	output = "xtraores:gobalt_ingot",
	recipe = "xtraores:gobalt_lump",
})
core.register_craft({
	output = "xtraores:gobalt_brick",
	recipe = {
		{"xtraores:gobalt_lump"},
		{"default:cobble"}
	}
})

core.register_node("xtraores:geminite_ore", {
	description = "Geminite ore",
	tiles = {"default_stone.png^xtraores_geminite_ore.png"},
	groups = {cracky=0},
	drop = "xtraores:geminite_lump",
	sounds = default.node_sound_stone_defaults(),
})
core.register_node("xtraores:geminite_brick", {
	description = "Geminite brick",
	tiles = {{
		name="xtraores_geminite_brick.png",
		animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1},
	}},
	is_ground_content = false,
	light_source = default.LIGHT_MAX - 1,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})
core.register_craftitem("xtraores:geminite_lump", {
	description = "Geminite crystals (you'll have to smelt those before using, and they'll take a lot of time to smelt)",
	inventory_image = "xtraores_geminite_lump.png",
})
core.register_craftitem("xtraores:geminite_ingot", {
	description = "Geminite ingot",
	inventory_image = "xtraores_geminite_ingot.png",
})
core.register_craft({
	type = "cooking",
	cooktime = 200,
	output = "xtraores:geminite_ingot",
	recipe = "xtraores:geminite_lump",
})
core.register_craft({
	output = "xtraores:geminite_brick",
	recipe = {
		{"xtraores:geminite_lump"},
		{"default:cobble"}
	}
})
core.register_ore({
	ore_type       = "scatter",
	ore            = "xtraores:geminite_ore",
	wherein        = {"default:stone", "default:diamite", "default:bedrock"},
	clust_scarcity = 30*30*30,
	clust_num_ores = 5,
	clust_size     = 3,
	y_max     = -20000,
	y_min     = -21000,
})
core.register_tool("xtraores:drill_geminite", {
	description = "Geminite drill",
	inventory_image = "xtraores_drill_geminite.png",
	tool_capabilities = {
		full_punch_interval = 0.001,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=0.01, [2]=0.01, [3]=0.01}, uses=1000, maxlevel=3},
			crumbly = {times={[1]=0.01, [2]=0.01, [3]=0.01}, uses=1000, maxlevel=3},
		},
		damage_groups = {fleshy=20},
	},
})
core.register_tool("xtraores:sword_geminite", {
	description = "Geminite sword",
	inventory_image = "xtraores_sword_geminite.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.01, [2]=0.03, [3]=0.002}, uses=1000, maxlevel=3},
		},
		damage_groups = {fleshy=50},
	}
})
core.register_tool("xtraores:spear_geminite", {
	description = "Geminite spear",
	inventory_image = "xtraores_spear_geminite.png",
	range = 12,
	tool_capabilities = {
		full_punch_interval = 0.3,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3},
		},
		damage_groups = {fleshy=50},
	}
})
core.register_craft({
	output = "xtraores:drill_geminite",
	recipe = {
		{"xtraores:geminite_ingot", "xtraores:geminite_ingot", "xtraores:geminite_ingot"},
		{"", "xtraores:titanium_ingot", ""},
		{"", "default:diamond", ""},
	}
})
core.register_craft({
	output = "xtraores:sword_geminite",
	recipe = {
		{"xtraores:geminite_ingot"},
		{"xtraores:geminite_ingot"},
		{"group:stick"},
	}
})
core.register_craft({
	output = "xtraores:spear_geminite",
	recipe = {
		{"", "xtraores:geminite_ingot", "xtraores:geminite_ingot"},
		{"", "group:stick", "xtraores:geminite_ingot"},
		{"group:stick", "", ""},
	}
})

core.register_node("xtraores:rainbow", {
	description = "Rainbow block",
	drawtype = "glasslike",
	tiles = {"xtraores_window.png"},
	paramtype = "light",
	use_texture_alpha = "opaque",
	light_source = default.LIGHT_MAX - 1,
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

doors.register("xtraores:door_rainbow", {
	tiles = {{ name = "xtraores_rainbow_door.png", backface_culling = true }},
	description = "Rainbow Door",
	inventory_image = "xtraores_rainbow_door_item.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	light_source = default.LIGHT_MAX - 1,
	recipe = {
		{"xtraores:rainbow", "default:glass"},
		{"xtraores:rainbow", "xtraores:rainbow"},
		{"xtraores:rainbow", "xtraores:rainbow"},
	}
})

if core.get_modpath("hell") then
core.register_node("xtraores:hell_rack_black_carved", {
	description = "Black Hell Rack Carved",
	tiles = {"hell_rack_black_crvd.png"},
	is_ground_content = false,
	groups = {cracky=3, hell=3},
	sounds = default.node_sound_stone_defaults(),
})
core.register_craft({
	output = "xtraores:hell_rack_black_carved 4",
	recipe = {
		{"hell:rack_brick_black", "hell:rack_brick_black"},
		{"hell:rack_brick_black", "hell:rack_brick_black"}
	}
})

core.register_node("xtraores:hell_rack_blue_carved", {
	description = "Blue Hell Rack Carved",
	tiles = {"hell_rack_blue_crvd.png"},
	is_ground_content = false,
	groups = {cracky=3, hell=3},
	sounds = default.node_sound_stone_defaults(),
})
core.register_craft({
	output = "xtraores:hell_rack_blue_carved 4",
	recipe = {
		{"hell:rack_brick_blue", "hell:rack_brick_blue"},
		{"hell:rack_brick_blue", "hell:rack_brick_blue"}
	}
})
end

core.register_node("xtraores:glass", {
	description = "Rainbow glass",
	drawtype = "glasslike",
	tiles = {"xtraores_window.png"},
	inventory_image = core.inventorycube("xtraores_window.png"),
	paramtype = "light",
	use_texture_alpha = "blend",
	light_source = default.LIGHT_MAX,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3, slippery = 20},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "xtraores:glass 2",
	recipe = {{"xtraores:rainbow", "default:crystal_ingot"}}
})

core.register_tool("xtraores:rainbowgun", {
	description = "Rainbow gun (the most colorful death possible, 1000 dmg each shot)",
	inventory_image = "xtraores_rainbowgun.png",
	on_use = function(item, user, pointd)
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_horizontal()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = core.add_entity(pos, "xtraores:rb")
			if obj then
				core.sound_play("Nope", {object=obj})
				obj:set_velocity({x=dir.x * 25, y=dir.y * 25, z=dir.z * 25})
				obj:set_acceleration({x=dir.x * 0, y=0, z=dir.z * 0})
			end
		end
		return item
	end,
})

local XTRAORES_MDWP_RB = {
	initial_properties = {
physical = false,
visual = "sprite",
visual_size = {x=.9, y=.9},
textures = {"xtraores_rainbow.png"},
collisionbox = {0,0,0, 0,0,0},
	},
	timer = 0,
	lastpos= {},
}
XTRAORES_MDWP_RB.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = core.get_node(pos)
	core.add_particlespawner({
		amount = 20,
		time = .5,
		pos = pos,
		minvel = {x=-1, y=-1, z=-1},
		maxvel = {x=1, y=-.5, z=1},
		exptime = {min = 1., max = 1.5},
		minsize = 4.3,
		maxsize = .5,
		texture = "xtraores_rainbow.png",
		glow = 9 })

	if self.timer > .2 then
		local objs = core.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "xtraores:rb" and obj:get_luaentity().name ~= "__builtin:item" then
					obj:punch(self.object, 1., {
						full_punch_interval = 1.,
						damage_groups= {fleshy = 1000},
					}, nil)
					core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = .8})
					self.object:remove()
				end
			else
				obj:punch(self.object, 1., {
					full_punch_interval = 1.,
					damage_groups= {fleshy = 1000},
				}, nil)
				core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = .8})
				self.object:remove()
			end
		end
	end

	if self.lastpos.x ~= nil then
		if core.registered_nodes[node.name].walkable then
			if not core.settings:get_bool("creative_mode") then
				core.add_item(self.lastpos, "")
			end
			core.sound_play("default_dig_cracky", {pos = self.lastpos, gain = .8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

core.register_entity("xtraores:rb", XTRAORES_MDWP_RB )

core.register_node("xtraores:treasure_box", {
	description = "Treasure box",
	tiles = {"xtraores_tbox.png"},
	drop = {
		max_items = 6,
		items = {
		{items = {"xtraores:treasure_box"},rarity = 50},
		{items = {"xtraores:rainbow 20"},rarity = 150},
		{items = {"xtraores:geminite_brick 10"},rarity = 100},
		{items = {"xtraores:legendary_sword"},rarity = 500},
		{items = {"xtraores:gapple"},rarity = 150},
		{items = {"xtraores:rainbowgun"},rarity = 2000},
		{items = {"default:coal_lump 20"},rarity = 5},
		{items = {"default:torch 25"},rarity = 5},
		{items = {"default:steel_ingot 20"},rarity = 5},
		{items = {"xtraores:goblet"},rarity = 150},
		{items = {"spawn:anak"},rarity = 1500},
		{items = {"default:gold_ingot 18"},rarity = 10},
		{items = {"default:bronze_ingot 20"},rarity = 5},
		{items = {"default:copper_ingot 20"},rarity = 5},
		{items = {"default:diamond 15"},rarity = 25},
		{items = {"default:mese 3"},rarity = 20},
		{items = {"xtraores:platinum_ingot 16"},rarity = 15},
		{items = {"xtraores:gobalt_ingot 12"},rarity = 75},
		{items = {"xtraores:osmium_ingot 10"},rarity = 40},
		{items = {"xtraores:antracite_ore 10"},rarity = 50},
		{items = {"xtraores:rarium_ingot 5"},rarity = 60},
		{items = {"xtraores:titanium_ingot 3"},rarity = 125},
		{items = {"xtraores:geminite_lump"},rarity = 200},
		{items = {"xtraores:geminite_ingot"},rarity = 300},
		{items = {"xtraores:treasure"},rarity = 150},
		{items = {"default:apple 5"},rarity = 10},
		{items = {"default:stick 5"},rarity = 10},
		{items = {"default:beech_trunk 5"},rarity = 10},
		{items = {"xtraores:gobalt_lump 40"},rarity = 30},
		{items = {"xtraores:glass 30"},rarity = 140},
		{items = {"xtraores:amber_block 40"},rarity = 30},
		{items = {"xtraores:crap 4"},rarity = 30},
		{items = {"default:brick 50"},rarity = 50},
		}
	},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "xtraores:treasure_box",
	wherein        = {"default:stone", "default:diamite", "default:bedrock"},
	clust_scarcity = 30*30*30,
	clust_num_ores = 1,
	clust_size     = 1,
	y_max     = -10,
	y_min     = -30748,
})


core.register_node("xtraores:gapple", {
	description = "Golden apple (artefact!|full of minerals!, restores full health if used)",
	drawtype = "plantlike",
	tiles = {"xtraores_gapple.png"},
	inventory_image = "xtraores_gapple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {snappy=3},
	on_use = core.item_eat(20),
})

core.register_node("xtraores:goblet", {
	description = "Golden goblet",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.05, -0.50, -0.05, 0.05, -0.1, 0.05},
			{-0.15, -0.50, -0.15, 0.15, -0.45, 0.15},
			{-0.12, -0.50, -0.12, 0.12, -0.42, 0.12},
			{-0.12, -0.14, -0.12, 0.12, -0.06, 0.12},
			{-0.07, -0.50, -0.07, 0.07, -0.38, 0.07},
			{-0.15, -0.1, -0.15, 0.15, -0.05, 0.15},
			{0.15, -0.05, -0.15, 0.20, 0.3, 0.15},
			{0.15, -0.05, 0.15, -0.15, 0.3, 0.20},
			{0.15, -0.05, -0.15, -0.15, 0.3, -0.2},
			{-0.15, -0.05, -0.15, -0.2, 0.3, 0.15},
			{-0.125, -0.05, 0.125, -0.175, 0.3, 0.175},
			{-0.125, -0.05, -0.125, -0.175, 0.3, -0.175},
			{0.125, -0.05, -0.125, 0.175, 0.3, -0.175},
			{0.125, -0.05, 0.125, 0.175, 0.3, 0.175}
		}
	},
	tiles = {"xtraores_gold.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky=3},
	on_use = core.item_eat(20, "xtraores:legendary_sword"),
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("xtraores:crap", {
	description = "CRAP! (yuck! this thing stinks!)",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.50, -0.25, 0.25, -0.35, 0.25},
			{-0.2, -0.50, -0.2, 0.2, -0.2, 0.2},
			{-0.15, -0.50, -0.15, 0.15, -0.1, 0.15},
			{0.0, -0.50, -0.05, -0.1, 0.05, 0.1}
		}
	},
	tiles = {"xtraores_crap.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("xtraores:treasure", {
	description = "Treasure (artefact|very shiny!)",
	drawtype = "nodebox",
	tiles = {{
		name="xtraores_treasure.png",
		animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1},
	}},
	is_ground_content = false,
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-.4, -.50, -.4, .4, .0, .4},
			{-.5, -.50, -.5, .3, -.3125, .5},
			{-.3, -.1, -.3, .3, .1, .3}
		}
	},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_tool("xtraores:legendary_sword", {
	description = "Legendary sword 250 dmg!",
	inventory_image = "xtraores_legendary_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.0125, [2]=0.05, [3]=0.006}, uses=500, maxlevel=3},
		},
		damage_groups = {fleshy=250},
	}
})

core.register_node("xtraores:amber_block", {
	description = "Amber block",
	tiles = {"xtraores_amber.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
