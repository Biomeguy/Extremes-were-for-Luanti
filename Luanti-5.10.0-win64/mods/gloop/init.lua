-- Gloop
-- Originally written by GloopMaster

-- Maintained by VanessaE.

gloop = {}

-- Load support for intllib.
local MP = core.get_modpath("gloop")
local S, NS = dofile(MP.."/intllib.lua")

dofile(MP.."/api.lua")

core.register_node("gloop:angled_spectrum", {
	description = S("Angled Light Spectrum"),
	drawtype = "glasslike",
	tiles = {"gloop_angled_spectrum.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = default.LIGHT_MAX,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "gloop:angled_spectrum",
	recipe = {
		{"", "", "default:mese_crystal"},
		{"", "moreblocks:slope_glass", ""},
		{"default:torch", "", ""}
	},
	replacements = {
		{"default:torch", "default:torch"},
		{"moreblocks:slope_glass", "moreblocks:slope_glass"}
	}
})

core.register_node("gloop:evil_block", {
	description = S("Evil Block"),
	tiles = {"gloop_evil_block.png"},
	light_source = 5,
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gloop:diavered_pumice", {
	description = S("Diavered Pumice"),
	tiles = {"gloop_pumice.png"},
	is_ground_content = false,
	groups = {cracky=3, crumbly=1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gloop:pavement", {
	description = S("Pavement"),
	tiles = {"gloop_pavement.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("gloop:scaffolding", {
	description = S("Wooden Scaffold"),
	drawtype = "allfaces",
	tiles = {"gloop_scaffold.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {choppy=3, oddly_breakable_by_hand=3, flammable=2},
	sounds = default.node_sound_wood_defaults(),
})

local stone_sounds = default.node_sound_stone_defaults()

-- HUGE NOTE HERE:
-- I did not make the textures. celeron55/erlehmann made the textures which were licensed under CC-BY-SA, and then edited by me.
-- The textures for non-gem ores are thus CC-BY-SA, with respect to celeron55/erlehmann
-- Suck it, luanti community.

local BasicStones = {"default:stone", "default:diamite", "default:bedrock"}

gloop.register_ore("gloop", "kalite", "Kalite", {
	ore = {
		makes = true, 
		drop = {
			max_items = 1,
			items = {
				{items = {'gloop:kalite_lump 5', 'default:rock 4'}, rarity = 9},
				{items = {'gloop:kalite_lump 4', 'default:rock 5'}, rarity = 6},
				{items = {'gloop:kalite_lump 3', 'default:rock 6'}, rarity = 3},
				{items = {'gloop:kalite_lump 2', 'default:rock 7'}},
			}
		},
		texture = {
			base = "default_stone.png",
			overlay = "gloop_mineral_kalite.png",
		}, 
		groups = {cracky=3},
		sounds = stone_sounds,
		generate = {
			generate_inside_of = BasicStones,
			chunks_per_mapblock = 9*9*9,
			chunk_size = 6,
			max_blocks_per_chunk = 7,
			maxy = 10,
			miny = -31000
		},
	},
})

core.register_craftitem("gloop:kalite_lump", {
	description = "Kalite Lump",
	inventory_image = "gloop_kalite_lump.png",
	on_use = core.item_eat(1),
})

core.register_craftitem("gloop:compressed_kalite", {
	description = "Compressed Kalite",
	inventory_image = "gloop_compressed_kalite.png",
	on_use = core.item_eat(8),
})

register_nine('gloop:compressed_kalite', 'gloop:kalite_lump')

core.register_node("gloop:kalite_torch", {
	description = "Kalite Torch",
	drawtype = "mesh",
	mesh = "torch_floor.obj",
	inventory_image = "gloop_kalite_torch_on_floor.png",
	wield_image = "gloop_kalite_torch_on_floor.png",
	tiles = {{
		name = "gloop_kalite_torch_on_floor_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.0}
	}},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = LIGHT_MAX-1,
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {choppy=2, dig_immediate=3, attached_node=1, torch=1, timer_check=1},
	selection_box = {
		type = "wallmounted",
		wall_bottom = {-1/8, -1/2, -1/8, 1/8, 2/16, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local def = core.registered_nodes[node.name]
		if def and def.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointd) or itemstack
		end

		local above = pointd.above
		local wdir = core.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			fakestack:set_name("gloop:kalite_torch_ceiling")
		elseif wdir == 1 then
			fakestack:set_name("gloop:kalite_torch")
		else
			fakestack:set_name("gloop:kalite_torch_wall")
		end

		itemstack = core.item_place(fakestack, placer, pointd, wdir)
		itemstack:set_name("gloop:kalite_torch")

		return itemstack
	end,
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(torch_min, torch_max))
	end,
	on_timer = function(pos, elapsed)
		local p2 = core.get_node(pos).param2
		core.set_node(pos, {name = "default:torch_spent", param2 = p2})
		core.sound_play({name="real_torch_burnout", gain = 0.1},
			{pos = pos, max_hear_distance = 10})
	end,
	on_rotate = false
})

core.register_node("gloop:kalite_torch_wall", {
	drawtype = "mesh",
	mesh = "torch_wall.obj",
	tiles = {{
		name = "gloop_kalite_torch_on_floor_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.0}
	}},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = LIGHT_MAX-1,
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {choppy=2, dig_immediate=3, not_in_creative_inventory=1, attached_node=1, torch=1, timer_check=1},
	drop = "gloop:kalite_torch",
	selection_box = {
		type = "wallmounted",
		wall_side = {-1/2, -1/2, -1/8, -1/8, 1/8, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(torch_min, torch_max))
	end,
	on_timer = function(pos, elapsed)
		local p2 = core.get_node(pos).param2
		core.set_node(pos, {name = "default:torch_spent_wall", param2 = p2})
		core.sound_play({name="real_torch_burnout", gain = 0.1},
			{pos = pos, max_hear_distance = 10})
	end,
	on_rotate = false
})

core.register_node("gloop:kalite_torch_ceiling", {
	drawtype = "mesh",
	mesh = "torch_ceiling.obj",
	tiles = {{
		name = "gloop_kalite_torch_on_floor_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.0}
	}},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = LIGHT_MAX-1,
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {choppy=2, dig_immediate=3, not_in_creative_inventory=1, attached_node=1, torch=1, timer_check=1},
	drop = "gloop:kalite_torch",
	selection_box = {
		type = "wallmounted",
		wall_top = {-1/8, -1/16, -5/16, 1/8, 1/2, 1/8},
	},
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(torch_min, torch_max))
	end,
	on_timer = function(pos, elapsed)
		local p2 = core.get_node(pos).param2
		core.set_node(pos, {name = "default:torch_spent_ceiling", param2 = p2})
		core.sound_play({name="real_torch_burnout", gain = 0.1},
			{pos = pos, max_hear_distance = 10})
	end,
	on_rotate = false
})

core.register_lbm({
	name = "gloop:3dtorch",
	nodenames = {"gloop:kalite_torch"},
	action = function(pos, node)
		if node.param2 == 0 then
			core.set_node(pos, {name = "gloop:kalite_torch_ceiling", param2 = node.param2})
		elseif node.param2 == 1 then
			core.set_node(pos, {name = "gloop:kalite_torch", param2 = node.param2})
		else
			core.set_node(pos, {name = "gloop:kalite_torch_wall", param2 = node.param2})
		end
	end
})

core.register_craft({
	type = "shapeless",
	output = "gloop:kalite_torch 4",
	recipe = {"group:stick", "gloop:kalite_lump", "default:glue"}
})

core.register_craft({
	type = "shapeless",
	output = "gloop:kalite_torch 4",
	recipe = {"default:torch_spent", "default:torch_spent", "default:torch_spent",
		"default:torch_spent", "gloop:kalite_lump", "default:glue"}
})

core.register_craft({
	type = "fuel",
	recipe = "gloop:kalite_lump",
	burntime = 30,
})

gloop.register_ore("gloop", "alatro", "Alatro", {
	ore = {
		makes = true,
		drop = {
			max_items = 1,
			items = {
				{items = {'gloop:alatro_lump 5', 'default:rock 4'}, rarity = 9},
				{items = {'gloop:alatro_lump 4', 'default:rock 5'}, rarity = 6},
				{items = {'gloop:alatro_lump 3', 'default:rock 6'}, rarity = 3},
				{items = {'gloop:alatro_lump 2', 'default:rock 7'}},
			}
		},
		texture = {
			base = "default_stone.png",
			overlay = "gloop_mineral_alatro.png",
		},
		groups = {cracky=2},
		sounds = stone_sounds,
		generate = {
			generate_inside_of = BasicStones,
			chunks_per_mapblock = 9*9*9,
			chunk_size = 2,
			max_blocks_per_chunk = 6,
			maxy = 256,
			miny = 0
		},
	},
	lump = {
		makes = true,
		name = "lump",
		desc = "Lump",
		texture = "gloop_alatro_lump.png"
	},
	ingot = {
		makes = true,
		texture = "gloop_alatro_ingot.png",
		smeltrecipe = true
	},
	block = {
		makes = true,
		texture = "gloop_alatro_block.png",
		groups = {snappy=1,bendy=2,cracky=1,melty=2,level=2},
		sounds = stone_sounds,
		fromingots = true
	},
	tools = {
		make = {
			sword = true,
			axe = true,
			pick = true,
			shovel = true
		},
		texture = {
			sword = "gloop_tool_alatrosword.png",
			axe = "gloop_tool_alatroaxe.png",
			pick = "gloop_tool_alatropick.png",
			shovel = "gloop_tool_alatroshovel.png"
		},
		caps = {
			sword = {
				full_punch_interval = 1.0,
				max_drop_level = 0,
				groupcaps={
					fleshy={times={[2]=0.80, [3]=0.60}, uses=40, maxlevel=1},
					snappy={times={[2]=0.80, [3]=0.60}, uses=40, maxlevel=1},
					choppy={times={[3]=0.80}, uses=40, maxlevel=0}
				},
				damage_groups = {fleshy=5},
			},
			axe = {
				full_punch_interval = 1.0,
				max_drop_level = 0,
				groupcaps = {
					choppy = {times={[2]=0.65, [3]=0.40}, uses=40, maxlevel=1},
					fleshy = {times={[2]=0.65, [3]=0.40}, uses=40, maxlevel=1}
				},
				damage_groups = {fleshy=3},
			},
			pick = {
				full_punch_interval = 1.0,
				max_drop_level = 0,
				groupcaps = {
					cracky = {times={[2]=0.65, [3]=0.40}, uses=40, maxlevel=1}
				},
				damage_groups = {fleshy=3},
			},
			shovel = {
				full_punch_interval = 1.0,
				max_drop_level = 0,
				groupcaps = {
					crumbly = {times={[2]=0.60, [3]=0.35}, uses=40, maxlevel=1}
				},
				damage_groups = {fleshy=3},
			},
		}
	}
})

gloop.register_ore("gloop", "talinite", "Talinite", {
	ore = {
		makes = true,
		drop = {
			max_items = 1,
			items = {
				{items = {'gloop:talinite_lump 5', 'default:rock 4'}, rarity = 9},
				{items = {'gloop:talinite_lump 4', 'default:rock 5'}, rarity = 6},
				{items = {'gloop:talinite_lump 3', 'default:rock 6'}, rarity = 3},
				{items = {'gloop:talinite_lump 2', 'default:rock 7'}},
			}
		},
		groups = {cracky=1},
		sounds = stone_sounds,
		light = 6,
		generate = {
			generate_inside_of = BasicStones,
			chunks_per_mapblock = 12*12*12,
			chunk_size = 2,
			max_blocks_per_chunk = 4,
			maxy = -250,
			miny = -31000
		}
	},
	lump = {
		makes = true,
		name = "lump",
		desc = "Lump",
		texture = "gloop_talinite_lump.png"
	},
	ingot = {
		makes = true,
		texture = "gloop_talinite_ingot.png",
		smeltrecipe = true
	},
	block = {
		makes = true,
		texture = "gloop_talinite_block.png",
		groups = {snappy=1,bendy=2,cracky=1,melty=2,level=2},
		sounds = stone_sounds,
		light = 14,
		fromingots = true
	}
})

gloop.register_ore("gloop", "akalin", "Akalin", {
	ore = {
		makes = true,
		drop = {
			max_items = 1,
			items = {
				{items = {'gloop:akalin_lump 5', 'default:desert_rock 4'}, rarity = 9},
				{items = {'gloop:akalin_lump 4', 'default:desert_rock 5'}, rarity = 6},
				{items = {'gloop:akalin_lump 3', 'default:desert_rock 6'}, rarity = 3},
				{items = {'gloop:akalin_lump 2', 'default:desert_rock 7'}},
			}
		},
		texture = {
			base = "default_desert_stone.png",
			overlay = "gloop_mineral_akalin.png"
		},
		groups = {cracky=3},
		sounds = stone_sounds,
		generate = {
			generate_inside_of = "default:desert_stone",
			chunks_per_mapblock = 7*7*7,
			chunk_size = 3,
			max_blocks_per_chunk = 9,
			maxy = 256,
			miny = 0
		}
	},
	lump = {
		makes = true,
		name = "lump",
		desc = "Lump",
		texture = "gloop_akalin_lump.png"
	},
	ingot = {
		makes = true,
		texture = "gloop_akalin_ingot.png",
		smeltrecipe = true
	},
	block = {
		makes = true,
		texture = "gloop_akalin_block.png",
		groups = {snappy=1,bendy=2,cracky=1,melty=2,level=2},
		sounds = stone_sounds,
		fromingots = true
	}
})

gloop.register_ore("gloop", "arol", "Arol", {
	ore = {
		makes = true,
		drop = {
			max_items = 1,
			items = {
				{items = {'gloop:arol_lump 5', 'default:rock 4'}, rarity = 9},
				{items = {'gloop:arol_lump 4', 'default:rock 5'}, rarity = 6},
				{items = {'gloop:arol_lump 3', 'default:rock 6'}, rarity = 3},
				{items = {'gloop:arol_lump 2', 'default:rock 7'}},
			}
		},
		texture = {
			base = "default_stone.png",
			overlay = "gloop_mineral_arol.png"
		},
		groups = {cracky=1},
		sounds = stone_sounds,
		generate = {
			generate_inside_of = BasicStones,
			chunks_per_mapblock = 10*10*10,
			chunk_size = 2,
			max_blocks_per_chunk = 2,
			maxy = -20,
			miny = -31000
		}
	},
	lump = {
		makes = true,
		name = "lump",
		desc = "Lump",
		texture = "gloop_arol_lump.png"
	},
	ingot = {
		makes = true,
		texture = "gloop_arol_ingot.png",
		smeltrecipe = true
	},
	tools = {
		make = {
			sword = true,
			axe = true,
			pick = true,
			shovel = true
		},
		texture = {
			sword = "gloop_tool_arolsword.png",
			axe = "gloop_tool_arolaxe.png",
			pick = "gloop_tool_arolpick.png",
			shovel = "gloop_tool_arolshovel.png"
		},
		caps = {
			sword = {
				full_punch_interval = 0.5,
				max_drop_level = 2,
				groupcaps = {
					fleshy = {times={[2]=1.30, [3]=1.10}, uses=300, maxlevel=2},
					snappy = {times={[2]=1.30, [3]=1.10}, uses=300, maxlevel=2},
					choppy = {times={[3]=1.60}, uses=300, maxlevel=1}
				},
				damage_groups = {fleshy=6},
			},
			axe = {
				full_punch_interval = 0.5,
				max_drop_level = 2,
				groupcaps = {
					choppy = {times={[1]=3.30, [2]=1.30, [3]=1.00}, uses=300, maxlevel=2},
					fleshy = {times={[2]=1.60, [3]=1.00}, uses=300, maxlevel=2}
				},
				damage_groups = {fleshy=3},
			},
			pick = {
				full_punch_interval = 0.5,
				max_drop_level = 2,
				groupcaps = {
					cracky = {times={[1]=3.60, [2]=1.90, [3]=1.40}, uses=300, maxlevel=2}
				},
				damage_groups = {fleshy=3},
			},
			shovel = {
				full_punch_interval = 0.5,
				max_drop_level = 2,
				groupcaps = {
					crumbly = {times={[1]=2.70, [2]=1.45, [3]=0.85}, uses=300, maxlevel=2}
				},
				damage_groups = {fleshy=3},
			}
		}
	}
})

gloop.register_ore("gloop", "topaz", "Topaz", {
	ore = {
		makes = true, 
		drop = {
			max_items = 1,
			items = {
				{items = {'gloop:topaz 5', 'default:rock 4'}, rarity = 9},
				{items = {'gloop:topaz 4', 'default:rock 5'}, rarity = 6},
				{items = {'gloop:topaz 3', 'default:rock 6'}, rarity = 3},
				{items = {'gloop:topaz 2', 'default:rock 7'}},
			}
		},
		texture = {
			base = "default_stone.png",
			overlay = "gloop_mineral_topaz.png",
		}, 
		groups = {cracky=1},
		sounds = stone_sounds,
		generate = {
			generate_inside_of = BasicStones,
			chunks_per_mapblock = 15*15*15,
			chunk_size = 4,
			max_blocks_per_chunk = 4,
			maxy = -70,
			miny = -5000
		},
	},
	block = {
		makes = true,
		texture = "gloop_topaz_block.png",
		groups = {bendy=3,cracky=2,level=1},
		sounds = stone_sounds,
		fromingots = false
	}
})

core.register_craftitem("gloop:topaz", {
	description = "Topaz",
	inventory_image = "gloop_topaz.png",
	groups = {gem=1},
})

register_nine('gloop:topazblock', 'gloop:topaz')

gloop.register_tools("gloop", "wood", "Wooden", "group:wood", {
	hammer = {
		makes = true,
		texture = "gloop_tool_woodhammer.png",
		caps = {
			full_punch_interval = 1.0,
			max_drop_level = 0,
			groupcaps = {
				bendy = {times={[2]=1.00, [3]=0.55}, uses=10, maxlevel=1},
				cracky = {times={[3]=1.10}, uses=10, maxlevel=0}
			},
			damage_groups = {fleshy=2, bendy=2, cracky=1},
		},
	},
})

gloop.register_tools("gloop", "stone", "Stone", "group:rock", {
	handsaw = {
		makes = true,
		texture = "gloop_tool_stonehandsaw.png",
		caps = {
			full_punch_interval = 1.1,
			max_drop_level = 0,
			groupcaps = {
				snappy = {times={[2]=0.80, [3]=0.40}, uses=20, maxlevel=1},
				fleshy = {times={[3]=0.70}, uses=20, maxlevel=0}
			},
			damage_groups = {fleshy=3, snappy=3},
		},
	},
	hammer = {
		makes = true,
		texture = "gloop_tool_stonehammer.png",
		caps = {
			full_punch_interval = 1.1,
			max_drop_level = 0,
			groupcaps = {
				bendy = {times={[2]=0.90, [3]=0.60}, uses=20, maxlevel=1},
				cracky = {times={[3]=1.00}, uses=20, maxlevel=0}
			},
			damage_groups = {fleshy=2, bendy=2, cracky=1},
		},
	},
})

gloop.register_tools("gloop", "steel", "Steel", "default:steel_ingot", {
	handsaw = {
		makes = true,
		texture = "gloop_tool_steelhandsaw.png",
		caps = {
			full_punch_interval = 0.9,
			max_drop_level = 0,
			groupcaps = {
				snappy = {times={[1]=1.00, [2]=0.65, [3]=0.25}, uses=30, maxlevel=2},
				fleshy = {times={[2]=1.10, [3]=0.60}, uses=30, maxlevel=1}
			},
			damage_groups = {fleshy=4, snappy=5},
		},
	},
	hammer = {
		makes = true,
		texture = "gloop_tool_steelhammer.png",
		caps = {
			full_punch_interval = 1.0,
			max_drop_level = 0,
			groupcaps = {
				bendy = {times={[1]=1.30, [2]=0.80, [3]=0.50}, uses=30, maxlevel=2},
				cracky = {times={[2]=1.80, [3]=0.90}, uses=30, maxlevel=0}
			},
			damage_groups = {fleshy=3, bendy=3, cracky=2},
		},
	},
})

gloop.register_tools("gloop", "bronze", "Bronze", "default:bronze_ingot", {
	handsaw = {
		makes = true,
		texture = "gloop_tool_bronzehandsaw.png",
		caps = {
			full_punch_interval = 0.9,
			max_drop_level = 0,
			groupcaps = {
				snappy = {times={[1]=1.00, [2]=0.65, [3]=0.25}, uses=40, maxlevel=2},
				fleshy = {times={[2]=1.10, [3]=0.60}, uses=40, maxlevel=1}
			},
			damage_groups = {fleshy=4, snappy=5},
		},
	},
	hammer = {
		makes = true,
		texture = "gloop_tool_bronzehammer.png",
		caps = {
			full_punch_interval = 1.0,
			max_drop_level = 0,
			groupcaps = {
				bendy = {times={[1]=1.30, [2]=0.80, [3]=0.50}, uses=40, maxlevel=2},
				cracky = {times={[2]=1.80, [3]=0.90}, uses=40, maxlevel=0}
			},
			damage_groups = {fleshy=3, bendy=3, cracky=2},
		},
	},
})

gloop.register_tools("gloop", "mese", "Mese", "default:mese_crystal", {
	handsaw = {
		makes = true,
		texture = "gloop_tool_mesehandsaw.png",
		caps = {
			full_punch_interval = 0.9,
			max_drop_level = 0,
			groupcaps = {
				snappy = {times={[1]=0.70, [2]=0.40, [3]=0.20}, uses=30, maxlevel=3},
				fleshy = {times={[2]=1.00, [3]=0.55}, uses=30, maxlevel=1}
			},
			damage_groups = {fleshy=5, snappy=6},
		},
	},
	hammer = {
		makes = true,
		texture = "gloop_tool_mesehammer.png",
		caps = {
			full_punch_interval = 1.0,
			max_drop_level = 0,
			groupcaps = {
				bendy = {times={[1]=1.00, [2]=0.60, [3]=0.40}, uses=30, maxlevel=3},
				cracky = {times={[2]=1.70, [3]=0.85}, uses=30, maxlevel=0}
			},
			damage_groups = {fleshy=4, bendy=4, cracky=2},
		},
	},
})

gloop.register_tools("gloop", "diamond", "Diamond", "default:diamond", {
	handsaw = {
		makes = true,
		texture = "gloop_tool_diamondhandsaw.png",
		caps = {
			full_punch_interval = 0.9,
			max_drop_level = 0,
			groupcaps = {
				snappy = {times={[1]=0.60, [2]=0.30, [3]=0.20}, uses=30, maxlevel=3},
				fleshy = {times={[2]=0.90, [3]=0.55}, uses=30, maxlevel=1}
			},
			damage_groups = {fleshy=5, snappy=7},
		},
	},
	hammer = {
		makes = true,
		texture = "gloop_tool_diamondhammer.png",
		caps = {
			full_punch_interval = 1.0,
			max_drop_level = 0,
			groupcaps = {
				bendy = {times={[1]=0.90, [2]=0.50, [3]=0.40}, uses=30, maxlevel=3},
				cracky = {times={[2]=1.70, [3]=0.85}, uses=30, maxlevel=0}
			},
			damage_groups = {fleshy=4, bendy=5, cracky=2},
		},
	},
})

gloop.register_tools("gloop", "alatro", "Alatro", "gloop:alatro_ingot", {
	handsaw = {
		makes = true,
		texture = "gloop_tool_alatrohandsaw.png",
		caps = {
			full_punch_interval = 1.0,
			max_drop_level = 0,
			groupcaps = {
				snappy = {times={[2]=0.70, [3]=0.30}, uses=40, maxlevel=1},
				fleshy = {times={[3]=0.65}, uses=40, maxlevel=0}
			},
			damage_groups = {fleshy=3, snappy=3},
		},
	},
	hammer = {
		makes = true,
		texture = "gloop_tool_alatrohammer.png",
		caps = {
			full_punch_interval = 1.0,
			max_drop_level = 0,
			groupcaps = {
				bendy = {times={[2]=0.85, [3]=0.55}, uses=40, maxlevel=1},
				cracky = {times={[3]=0.95}, uses=40, maxlevel=0}
			},
			damage_groups = {fleshy=2, bendy=2, cracky=1},
		},
	},
})

gloop.register_tools("gloop", "arol", "Arol", "gloop:arol_ingot", {
	handsaw = {
		makes = true,
		texture = "gloop_tool_arolhandsaw.png",
		caps = {
			full_punch_interval = 0.5,
			max_drop_level = 0,
			groupcaps = {
				snappy = {times={[2]=1.00, [3]=0.80}, uses=300, maxlevel=1},
				fleshy = {times={[3]=1.20}, uses=300, maxlevel=0}
			},
			damage_groups = {fleshy=3, snappy=3},
		},
	},
	hammer = {
		makes = true,
		texture = "gloop_tool_arolhammer.png",
		caps = {
			full_punch_interval = 0.5,
			max_drop_level = 0,
			groupcaps = {
				bendy = {times={[2]=1.65, [3]=1.00}, uses=300, maxlevel=1},
				cracky = {times={[3]=1.65}, uses=300, maxlevel=0}
			},
			damage_groups = {fleshy=2, bendy=2, cracky=1},
		},
	},
})

core.register_node("gloop:crystal_glass", {
	description = "Crystal Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"gloop_crystal_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "gloop:crystal_glass 4",
	recipe = {
		{"default:glass", "default:desert_stone"},
		{"default:desert_stone", "default:glass"},
	}
})

core.register_craft({
	output = "gloop:crystal_glass 4",
	recipe = {
		{"default:desert_stone", "default:glass"},
		{"default:glass", "default:desert_stone"},
	}
})

core.register_node("gloop:reinforced_crystal_glass", {
	description = "Steel-Reinforced Crystal Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"gloop_reinforced_crystal_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "gloop:reinforced_crystal_glass 8",
	recipe = {
		{"gloop:crystal_glass", "gloop:crystal_glass", "gloop:crystal_glass"},
		{"gloop:crystal_glass", "default:steel_ingot", "gloop:crystal_glass"},
		{"gloop:crystal_glass", "gloop:crystal_glass", "gloop:crystal_glass"}
	}
})

core.register_node("gloop:akalin_crystal_glass", {
	description = "Akalin-Reinforced Crystal Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"gloop_akalin_crystal_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "gloop:akalin_crystal_glass 8",
	recipe = {
		{"gloop:crystal_glass", "gloop:crystal_glass", "gloop:crystal_glass"},
		{"gloop:crystal_glass", "gloop:akalin_ingot", "gloop:crystal_glass"},
		{"gloop:crystal_glass", "gloop:crystal_glass", "gloop:crystal_glass"}
	}
})

core.register_node("gloop:heavy_crystal_glass", {
	description = "Heavily Reinforced Crystal Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"gloop_reinforced_akalin_crystal_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "gloop:heavy_crystal_glass 4",
	recipe = {
		{"gloop:reinforced_crystal_glass", "gloop:akalin_crystal_glass"},
		{"gloop:akalin_crystal_glass", "gloop:reinforced_crystal_glass"},
	}
})

core.register_craft({
	output = "gloop:heavy_crystal_glass 4",
	recipe = {
		{"gloop:akalin_crystal_glass", "gloop:reinforced_crystal_glass"},
		{"gloop:reinforced_crystal_glass", "gloop:akalin_crystal_glass"},
	}
})

core.register_node("gloop:alatro_crystal_glass", {
	description = "Alatro-Reinforced Crystal Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"gloop_alatro_crystal_glass.png"},
	use_texture_alpha = "blend",
	paramtype = "light",
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "gloop:alatro_crystal_glass 8",
	recipe = {
		{"gloop:crystal_glass", "gloop:crystal_glass", "gloop:crystal_glass"},
		{"gloop:crystal_glass", "gloop:alatro_ingot", "gloop:crystal_glass"},
		{"gloop:crystal_glass", "gloop:crystal_glass", "gloop:crystal_glass"}
	}
})

core.register_node("gloop:arol_crystal_glass", {
	description = "Arol-Reinforced Crystal Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"gloop_arol_crystal_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "gloop:arol_crystal_glass 8",
	recipe = {
		{"gloop:crystal_glass", "gloop:crystal_glass", "gloop:crystal_glass"},
		{"gloop:crystal_glass", "gloop:arol_ingot", "gloop:crystal_glass"},
		{"gloop:crystal_glass", "gloop:crystal_glass", "gloop:crystal_glass"}
	}
})

core.register_node("gloop:talinite_crystal_glass", {
	description = "Talinite-Reinforced Crystal Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"gloop_talinite_crystal_glass.png"},
	paramtype = "light",
	light_source = 14,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "gloop:talinite_crystal_glass 8",
	recipe = {
		{"gloop:crystal_glass", "gloop:crystal_glass", "gloop:crystal_glass"},
		{"gloop:crystal_glass", "gloop:talinite_ingot", "gloop:crystal_glass"},
		{"gloop:crystal_glass", "gloop:crystal_glass", "gloop:crystal_glass"}
	}
})

if core.get_modpath("moreblocks") then
stairsplus:register_all("gloop", "pavement", "gloop:pavement", {
	description = S("Pavement"),
	tiles = {"gloop_pavement.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("gloop", "evil_block", "gloop:evil_block", {
	description = S("Evil Block"),
	tiles = {"gloop_evil_block.png"},
	light_source = 5,
	groups = {cracky=2},
	sounds = default.node_sound_defaults(),
})

stairsplus:register_all("gloop", "diavered_pumice", "gloop:diavered_pumice", {
	description = S("Diavered Pumice"),
	tiles = {"gloop_pumice.png"},
	groups = {cracky=3, crumbly=1},
	sounds = default.node_sound_stone_defaults(),
})

stairsplus:register_all("gloop", "gravel", "default:gravel", {
	description = S("Gravel"),
	tiles = {"default_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = default.node_sound_stone_defaults(),
})
end
if core.get_modpath("stairs") then
stairs.register_stair_and_slab("pavement", "gloop:pavement",
	{cracky=3},
	{"gloop_pavement.png"},
	S("Pavement Stair"),
	S("Pavement Slab"),
	default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("evil_block", "gloop:evil_block",
	{cracky=2},
	{"gloop_evil_block.png"},
	S("Evil Block Stair"),
	S("Evil Block Slab"),
	default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("diavered_pumice", "gloop:diavered_pumice",
	{cracky=3, crumbly=1},
	{"gloop_pumice.png"},
	S("Diavered Pumice Stair"),
	S("Diavered Pumice Slab"),
	default.node_sound_stone_defaults(), true)

stairs.register_stair_and_slab("gravel", "default:gravel",
	{crumbly = 2, falling_node = 1},
	{"default_gravel.png"},
	S("Gravel Stair"),
	S("Gravel Slab"),
	default.node_sound_stone_defaults(), true)
end

-- Tools
core.register_tool("gloop:pick_cement", {
	description = S("Cement Pickaxe"),
	inventory_image = "gloop_cement_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=3.50, [2]=1.40, [3]=0.90}, uses=25, maxlevel=2}
		},
		damage_groups = {fleshy=4},
	},
})

core.register_tool("gloop:shovel_cement", {
	description = S("Cement Shovel"),
	inventory_image = "gloop_cement_shovel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.50, [2]=0.60, [3]=0.45}, uses=25, maxlevel=2}
		},
		damage_groups = {fleshy=4},
	},
})

core.register_tool("gloop:axe_cement", {
	description = S("Cement Axe"),
	inventory_image = "gloop_cement_axe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.00, [2]=1.30, [3]=0.80}, uses=25, maxlevel=2},
			fleshy={times={[2]=1.20, [3]=0.65}, uses=30, maxlevel=1}
		},
		damage_groups = {fleshy=4},
	},
})

core.register_tool("gloop:sword_cement", {
	description = S("Cement Sword"),
	inventory_image = "gloop_cement_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[1]=1.60, [2]=0.80, [3]=0.40}, uses=15, maxlevel=2},
			snappy={times={[2]=0.75, [3]=0.35}, uses=30, maxlevel=1},
			choppy={times={[3]=0.80}, uses=30, maxlevel=0}
		},
		damage_groups = {fleshy=6},
	}
})

core.register_tool("gloop:pick_evil", {
	description = S("Evil Pickaxe"),
	inventory_image = "gloop_evil_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=0.10, [2]=0.10, [3]=0.10}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
})

core.register_tool("gloop:shovel_evil", {
	description = S("Evil Shovel"),
	inventory_image = "gloop_evil_shovel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly={times={[1]=0.05, [2]=0.05, [3]=0.05}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
})

core.register_tool("gloop:axe_evil", {
	description = S("Evil Axe"),
	inventory_image = "gloop_evil_axe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			choppy={times={[1]=0.15, [2]=0.15, [3]=0.15}, uses=10, maxlevel=2},
			fleshy={times={[1]=0.15, [2]=0.15, [3]=0.15}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
})

core.register_tool("gloop:sword_evil", {
	description = S("Evil Sword"),
	inventory_image = "gloop_evil_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			fleshy={times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=10, maxlevel=2},
			snappy={times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=10, maxlevel=2},
			choppy={times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=8},
	}
})

-- Other items
core.register_craftitem("gloop:evil_stick", {
	description = S("Evil Stick"),
	inventory_image = "gloop_evil_stick.png",
})

local fence_texture =
	"default_fence_overlay.png^default_steel_block.png^default_fence_overlay.png^[makealpha:255,126,126"

core.register_node("gloop:fence_steel", {
	description = S("Steel Fence"),
	drawtype = "nodebox",
	node_box = {
		type = "connected",
		fixed = {{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}},
		connect_front = {{-1/16,3/16,-1/2,1/16,5/16,-1/8},
			{-1/16,-5/16,-1/2,1/16,-3/16,-1/8}},
		connect_left = {{-1/2,3/16,-1/16,-1/8,5/16,1/16},
			{-1/2,-5/16,-1/16,-1/8,-3/16,1/16}},
		connect_back = {{-1/16,3/16,1/8,1/16,5/16,1/2},
			{-1/16,-5/16,1/8,1/16,-3/16,1/2}},
		connect_right = {{1/8,3/16,-1/16,1/2,5/16,1/16},
			{1/8,-5/16,-1/16,1/2,-3/16,1/16}},
	},
	connects_to = {"group:fence", "group:wood", "group:trunk", "group:wall", "group:stone"},
	tiles = {"default_steel_block.png"},
	inventory_image = fence_texture,
	wield_image = fence_texture,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {fence = 1, cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

gloop.extragen = {}
gloop.extragen.treasure = {}

-- {item name, max stack size, item rarity}
gloop.extragen.treasure[1] = {
	{"default:stick", 30, 1},
	{"default:wood", 10, 1},
	{"default:beech_trunk", 5, 2},
	{"default:jungle_trunk", 3, 6},
	{"default:cobble", 10, 2},
	{"default:rock", 1, 12},
	{"default:hand_axe_stone", 1, 12},
	{"default:pick_stone", 1, 24},
	{"default:shovel_stone", 1, 24},
	{"default:sword_stone", 1, 24},
	{"default:axe_stone", 1, 24},
	{"default:furnace", 1, 8},
}

gloop.extragen.treasure[2] = {
	{"default:stick", 40, 1},
	{"default:cobble", 30, 1},
	{"default:glass", 20, 4},
	{"default:stone", 15, 2},
	{"default:desert_stone", 15, 5},
	{"default:coal_lump", 15, 6},
	{"default:steel_ingot", 2, 8},
	{"default:obsidian_shard", 1, 10},
	{"default:pick_stone", 1, 12},
	{"default:shovel_stone", 1, 12},
	{"default:sword_stone", 1, 12},
	{"default:axe_stone", 1, 12},
}

gloop.extragen.treasure[3] = {
	{"default:cobble", 40, 1},
	{"default:stick", 20, 3},
	{"default:torch", 15, 3},
	{"default:coal_lump", 20, 4},
	{"default:iron_lump", 10, 7},
	{"default:copper_lump", 10, 7},
	{"default:obsidian_shard", 5, 24},
	{"default:mese_crystal_fragment", 3, 24},
	{"default:pick_bronze", 1, 12},
	{"default:shovel_bronze", 1, 12},
	{"default:sword_bronze", 1, 12},
	{"default:axe_bronze", 1, 12},
}

gloop.extragen.treasure[4] = {
	{"default:torch", 50, 3},
	{"default:coal_lump", 30, 3},
	{"default:iron_lump", 20, 5},
	{"default:gold_lump", 5, 16},
	{"default:mese_crystal_fragment", 5, 10},
	{"default:mese_crystal", 1, 25},
	{"default:ocealite_crystal_fragment", 5, 10},
	{"default:diamond", 1, 100},
	{"default:pick_mese", 1, 18},
	{"default:shovel_mese", 1, 18},
	{"default:sword_mese", 1, 18},
	{"default:axe_mese", 1, 18},
}

gloop.extragen.treasure[5] = {
	{"default:torch", 70, 3},
	{"default:iron_lump", 30, 3},
	{"default:gold_lump", 8, 15},
	{"default:mese_crystal_fragment", 15, 10},
	{"default:mese_crystal", 1, 17},
	{"default:diamond", 1, 24},
	{"default:pick_mese", 1, 12},
	{"default:shovel_mese", 1, 12},
	{"default:sword_mese", 1, 12},
	{"default:axe_mese", 1, 12},
	{"default:pick_diamond", 1, 60},
	{"default:shovel_diamond", 1, 60},
	{"default:sword_diamond", 1, 60},
	{"default:axe_diamond", 1, 60},
}

local treasure_chest_nodebox = {
	{-7/16, -8/16, -7/16, 7/16, 6/16, 7/16},
	{-8/16, -8/16, -8/16, 8/16, -7/16, 8/16},
	{-8/16, 1/16, -8/16, 8/16, 3/16, 8/16}
}

local function treasure_chest_populate(rank, pos)
	for i = 1,32 do
		for _ = 1,math.random(1,2) do
			local item = gloop.extragen.treasure[rank][math.random(1, #gloop.extragen.treasure[rank])]
			local item_rarity = item[3]
			if math.random(1, item_rarity+math.random(1,3)) == 1 then
				local item_name = item[1]
				local item_stacksize = item[2]-math.random(0,item[2]-1)
				core.get_inventory({type="node",pos={x=pos.x,y=pos.y,z=pos.z}}):set_stack("main", i, ItemStack({name=item_name,count=item_stacksize}))
				break
			else
			end
		end
	end
end

function gloop.extragen.register_chest_loot(rank, entry)
	if core.registered_items[entry[1]] ~= nil then
		table.insert(gloop.extragen.treasure[rank], entry)
	end
end

gloop.extragen.register_chest_loot(1, {"default:hand_axe_stone", 1, 12})
gloop.extragen.register_chest_loot(1, {"gloop:hammer_wood", 1, 12})
gloop.extragen.register_chest_loot(1, {"gloop:handsaw_stone", 1, 24})
gloop.extragen.register_chest_loot(1, {"gloop:hammer_stone", 1, 24})

gloop.extragen.register_chest_loot(2, {"gloop:handsaw_stone", 1, 12})
gloop.extragen.register_chest_loot(2, {"gloop:hammer_stone", 1, 12})

gloop.extragen.register_chest_loot(3, {"gloop:handsaw_bronze", 1, 12})
gloop.extragen.register_chest_loot(3, {"gloop:hammer_bronze", 1, 12})

gloop.extragen.register_chest_loot(4, {"gloop:handsaw_mese", 1, 18})
gloop.extragen.register_chest_loot(4, {"gloop:hammer_mese", 1, 18})

gloop.extragen.register_chest_loot(5, {"gloop:handsaw_mese", 1, 12})
gloop.extragen.register_chest_loot(5, {"gloop:hammer_mese", 1, 12})
gloop.extragen.register_chest_loot(5, {"gloop:handsaw_diamond", 1, 60})
gloop.extragen.register_chest_loot(5, {"gloop:hammer_diamond", 1, 60})

core.register_node("gloop:treasure_chest_1", {
	description = "Treasure Chest Rank 1",
	drawtype = "nodebox",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "default:chest",
	groups = {choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = treasure_chest_nodebox,
	},
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec", default.chest.get_chest_formspec(pos))
		meta:set_string("infotext", "Treasure Chest Rank I")
		local inv = meta:get_inventory()
		inv:set_size("main", 32)
		treasure_chest_populate(1, pos)
	end,
	can_dig = function(pos,player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		core.log("action", player:get_player_name() ..
			" moves stuff in R1 treasure chest at " .. core.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" moves " .. stack:get_name() ..
			" to R1 treasure chest at " .. core.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" takes " .. stack:get_name() ..
			" from R1 treasure chest at " .. core.pos_to_string(pos))
	end,
})

core.register_node("gloop:treasure_chest_2", {
	description = "Treasure Chest Rank 2",
	drawtype = "nodebox",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "default:chest",
	groups = {choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = treasure_chest_nodebox,
	},
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec", default.chest.get_chest_formspec(pos))
		meta:set_string("infotext", "Treasure Chest Rank II")
		local inv = meta:get_inventory()
		inv:set_size("main", 32)
		treasure_chest_populate(2, pos)
	end,
	can_dig = function(pos,player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		core.log("action", player:get_player_name() ..
			" moves stuff in R2 treasure chest at " .. core.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" moves " .. stack:get_name() ..
			" to R2 treasure chest at " .. core.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" takes " .. stack:get_name() ..
			" from R2 treasure chest at " .. core.pos_to_string(pos))
	end,
})

core.register_node("gloop:treasure_chest_3", {
	description = "Treasure Chest Rank 3",
	drawtype = "nodebox",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "default:chest",
	groups = {choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = treasure_chest_nodebox,
	},
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec", default.chest.get_chest_formspec(pos))
		meta:set_string("infotext", "Treasure Chest Rank III")
		local inv = meta:get_inventory()
		inv:set_size("main", 32)
		treasure_chest_populate(3, pos)
	end,
	can_dig = function(pos,player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		core.log("action", player:get_player_name() ..
			" moves stuff in R3 treasure chest at " .. core.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" moves " .. stack:get_name() ..
			" to R3 treasure chest at " .. core.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" takes " .. stack:get_name() ..
			" from R3 treasure chest at " .. core.pos_to_string(pos))
	end,
})

core.register_node("gloop:treasure_chest_4", {
	description = "Treasure Chest Rank 4",
	drawtype = "nodebox",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "default:chest",
	groups = {choppy=2,oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = treasure_chest_nodebox,
	},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec", default.chest.get_chest_formspec(pos))
		meta:set_string("infotext", "Treasure Chest Rank IV")
		local inv = meta:get_inventory()
		inv:set_size("main", 32)
		treasure_chest_populate(4, pos)
	end,
	can_dig = function(pos,player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		core.log("action", player:get_player_name() ..
			" moves stuff in R4 treasure chest at " .. core.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" moves " .. stack:get_name() ..
			" to R4 treasure chest at " .. core.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" takes " .. stack:get_name() ..
			" from R4 treasure chest at " .. core.pos_to_string(pos))
	end,
})

core.register_node("gloop:treasure_chest_5", {
	description = "Treasure Chest Rank 5",
	drawtype = "nodebox",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "default:chest",
	groups = {choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = treasure_chest_nodebox,
	},
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec", default.chest.get_chest_formspec(pos))
		meta:set_string("infotext", "Treasure Chest Rank V")
		local inv = meta:get_inventory()
		inv:set_size("main", 32)
		treasure_chest_populate(5, pos)
	end,
	can_dig = function(pos,player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		core.log("action", player:get_player_name() ..
			" moves stuff in R5 treasure chest at " .. core.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" moves " .. stack:get_name() ..
			" to R5 treasure chest at " .. core.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name() ..
			" takes " .. stack:get_name() ..
			" from R5 treasure chest at " .. core.pos_to_string(pos))
	end,
})

core.register_on_generated(function(minp, maxp)
	local coords = {}
	coords.x = {}
	coords.y = {}
	coords.z = {}
	for i = minp.x,maxp.x do
		table.insert(coords.x, i)
	end
	for i = minp.y,maxp.y do
		table.insert(coords.y, i)
	end
	for i = minp.z,maxp.z do
		table.insert(coords.z, i)
	end
	for x = 1,#coords.x do
	for y = 1,#coords.y do
	for z = 1,#coords.z do
		if core.get_node({x=coords.x[x],y=coords.y[y]+1,z=coords.z[z]}).name == "air" and core.get_node({x=coords.x[x],y=coords.y[y],z=coords.z[z]}).name ~= "air" and core.registered_nodes[core.get_node({x=coords.x[x],y=coords.y[y],z=coords.z[z]}).name].drawtype == "normal" then
			if coords.y[y] >=0 then
				if math.random(1,5000) == 1 then
					core.place_node({x=coords.x[x],y=coords.y[y]+1,z=coords.z[z]}, {name="gloop:treasure_chest_1", param2=math.random(0,3)})
				elseif math.random(1,8000) == 1 then
					core.place_node({x=coords.x[x],y=coords.y[y]+1,z=coords.z[z]}, {name="gloop:treasure_chest_2", param2=math.random(0,3)})
				end
			elseif coords.y[y] <=-30 then
				if math.random(1,1000) == 1 then
					core.place_node({x=coords.x[x],y=coords.y[y]+1,z=coords.z[z]}, {name="gloop:treasure_chest_3", param2=math.random(0,3)})
				elseif coords.y[y] <=-1000 then
					if math.random(1,1300) == 1 then
						core.place_node({x=coords.x[x],y=coords.y[y]+1,z=coords.z[z]}, {name="gloop:treasure_chest_4", param2=math.random(0,3)})
					elseif coords.y[y] <=-2500 then
						if math.random(1,2000) == 1 then
							core.place_node({x=coords.x[x],y=coords.y[y]+1,z=coords.z[z]}, {name="gloop:treasure_chest_5", param2=math.random(0,3)})
						end
					end
				end
			end
		end
	end
	end
	end
end)

if core.get_modpath("worldedit") then
	function gloop.liquid_ungrief(pos1, pos2, name)
		local count
		local p1to2 = core.pos_to_string(pos1).." and "..core.pos_to_string(pos2)
		local volume = worldedit.volume(pos1, pos2)
		core.chat_send_player(name, "Cleaning-up lava/water griefing between "..p1to2.."...")
		if volume > 1000000 then
			core.chat_send_player(name, "This operation could affect up to "..volume.." nodes.  It may take a while.")
		end
		core.log("action", name.." performs lava/water greifing cleanup between "..p1to2..".")
		count = worldedit.replace(pos1, pos2, "default:lava_source", "air")
		count = worldedit.replace(pos1, pos2, "default:lava_flowing", "air")
		count = worldedit.replace(pos1, pos2, "default:water_source", "air")
		count = worldedit.replace(pos1, pos2, "default:water_flowing", "air")
		count = worldedit.replace(pos1, pos2, "default:fresh_water_source", "air")
		count = worldedit.replace(pos1, pos2, "default:fresh_water_flowing", "air")
		count = worldedit.fixlight(pos1, pos2)
		core.chat_send_player(name, "Operation completed.")
	end

	core.register_chatcommand("/liquid_ungrief", {
		params = "[size]",
		privs = {worldedit = true},
		description = "Repairs greifing caused by spilling lava and water (and their \"cooling\" results)",
		func = function(name, params)
			local pos1 = worldedit.pos1[name]
			local pos2 = worldedit.pos2[name]
			if not pos1 or not pos2 then return end
			gloop.liquid_ungrief(pos1, pos2, name)
		end
	})
end

core.register_craft({
	type = "shapeless",
	output = "gloop:evil_stick",
	recipe = {"gloop:kalite_lump", "default:gold_lump", "default:coal_lump", "group:stick"}
})

core.register_craft({
	output = "gloop:evil_block",
	recipe = {
		{"gloop:evil_stick", "gloop:evil_stick"},
		{"gloop:evil_stick", "gloop:evil_stick"}
	}
})

core.register_craft({
	output = "gloop:evil_stick 4",
	recipe = {{"gloop:evil_block"}}
})

register_tools('evil', 'gloop:evil_block', 'gloop:evil_stick')

register_tools('cement', 'default:cement_block', 'group:stick')

core.register_craft({
	type = "shapeless",
	output = "gloop:diavered_pumice 2",
	recipe = {"default:pumice", "default:pumice", "default:diamite_dust", "default:silver_lump"}
})

core.register_craft({
	output = "gloop:pavement 5",
	recipe = {
		{"default:basalt", "default:wet_cement", "default:basalt"},
		{"default:wet_cement", "default:basalt", "default:wet_cement"},
		{"default:basalt", "default:wet_cement", "default:basalt"}
	}
})

core.register_craft({
	output = "gloop:scaffolding 12",
		recipe = {
		{"group:stick", "group:wood", "group:stick"},
		{"", "group:stick", ""},
		{"group:stick", "group:wood", "group:stick"}
	}
})

core.register_craft({
	output = "gloop:fence_steel",
	recipe = {
		{"default:steel_bar", "default:steel_ingot", "default:steel_bar"},
		{"default:steel_bar", "default:steel_ingot", "default:steel_bar"}
	}
})

if core.get_modpath("technic") then
	technic.register_grinder_recipe({input={"default:pumice"},output="default:sand"})
	technic.register_grinder_recipe({input={"default:basalt"},output="default:cobble"})
end

print("Gloop Loaded!")
