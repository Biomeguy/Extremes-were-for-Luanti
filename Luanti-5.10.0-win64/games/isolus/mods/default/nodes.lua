-- mods/default/nodes.lua

-- support for MT game translation.
local S = default.get_translator

-- Required wrapper to allow customization of default.after_place_leaves
local function after_place_leaves(...)
	return default.after_place_leaves(...)
end

-- Required wrapper to allow customization of default.grow_sapling
local function grow_sapling(...)
	return default.grow_sapling(...)
end


--- Mapgen materials

core.register_node("default:stone", {
	description = S("Stone"),
	tiles = {"default_stone.png"},
	drop = "default:rocks",
	legacy_mineral = true,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:rocks", {
	description = S("Rocks"),
	tiles = {"default_rocks.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1, falling_node=1, falling_node_damage=5, stone=2},
	sounds = default.node_sound_stone_defaults(),
	_tnt_loss = 4,
})

core.register_node("default:rock", {
	description = S("Rock"),
	drawtype = "mesh",
	mesh = "rock.obj",
	tiles = {"default_stone.png"},
	inventory_image = "default_stone_rock.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	tool_capabilities = {
		full_punch_interval = 1.2,
		damage_groups = {fleshy=4},
	},
	on_rotate = screwdriver.rotate_simple,
	groups = {cracky=3, oddly_breakable_by_hand=3, falling_node=1, falling_node_damage=3, grinder=1, rock=1},
	selection_box = default.plant_sbox,
	collision_box = default.plant_sbox,
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:cobble", {
	description = S("Cobblestone"),
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
	_tnt_loss = 4,
})

core.register_node("default:stone_brick", {
	description = S("Stone Brick"),
	tiles = {"default_stone_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:stone_block", {
	description = S("Stone Block"),
	tiles = {"default_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:mossystone", {
	description = S("Mossy Stone"),
	tiles = {"default_stone.png^default_mossy.png"},
	drop = "default:rocks",
	legacy_mineral = true,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:mossycobble", {
	description = S("Mossy Cobblestone"),
	tiles = {"default_mossycobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
	_tnt_loss = 4,
})

core.register_node("default:mossystone_brick", {
	description = S("Mossy Stone Brick"),
	tiles = {"default_mossy_stone_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:mossystone_block", {
	description = S("Mossy Stone Block"),
	tiles = {"default_stone_block.png^default_mossy.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:basalt", {
	description = S("Basalt"),
	tiles = {"default_basalt.png"},
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})


core.register_node("default:desert_stone", {
	description = S("Desert Stone"),
	tiles = {"default_desert_stone.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:desert_stone"}, rarity = 2},
			{items = {"default:desert_rocks"}}
		}
	},
	legacy_mineral = true,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:desert_rocks", {
	description = S("Desert Rocks"),
	tiles = {"default_desert_rocks.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1, falling_node=1, falling_node_damage=5, stone=2},
	sounds = default.node_sound_stone_defaults(),
	_tnt_loss = 4,
})

core.register_node("default:desert_rock", {
	description = S("Desert Rock"),
	drawtype = "mesh",
	mesh = "rock.obj",
	tiles = {"default_desert_stone.png"},
	inventory_image = "default_desert_rock.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	tool_capabilities = {
		full_punch_interval = 1.2,
		damage_groups = {fleshy=4},
	},
	on_rotate = screwdriver.rotate_simple,
	groups = {cracky=3, oddly_breakable_by_hand=3, falling_node=1, falling_node_damage=3, grinder=1, rock=1},
	selection_box = default.plant_sbox,
	collision_box = default.plant_sbox,
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:desert_cobble", {
	description = S("Desert Cobblestone"),
	tiles = {"default_desert_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
	_tnt_loss = 4,
})

core.register_node("default:desert_stone_brick", {
	description = S("Desert Stone Brick"),
	tiles = {"default_desert_stone_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:desert_stone_block", {
	description = S("Desert Stone Block"),
	tiles = {"default_desert_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:molten_rock", {
	description = S("Molten Rock"),
	tiles = {"default_molten_rock.png"},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 4,
	is_ground_content = false,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = function(pos, elapsed)
		local meta = core.get_meta(pos)
		local melts = core.find_node_near(pos, 1, {"group:icy", "group:snowy"})
		if meta:get_int("checked_near") < 1 then
	if melts then
		default.melt_near_heat(melts)
	end
	meta:set_int("checked_near", 1)
	-- check altitude for heat
	local timer = core.get_node_timer(pos)
	if default.h_h_h(pos, -31000, -10) then
		if default.h_h_h(pos, -10, 110) then
			timer:start(math.random(15, 32))
			return
		else
	if default.h_h_h(pos, -31000, 31000, 49) and not core.find_node_near(pos, 1, "group:lava") then
		timer:start(math.random(23, 48))
		return
	end
		end
	end
	timer:start(math.random(45, 95))
		else
	if not core.find_node_near(pos, 1, "group:lava") and pos.y > -1000 then
		local rock_choice = math.random(1, 5)
		local rock_name = "default:stone"
		if rock_choice == 2 then
			rock_name = "default:desert_stone"
		elseif rock_choice == 3 then
			rock_name = "default:stone_with_iron"
		elseif rock_choice == 4 then
			rock_name = "default:desert_stone_with_iron"
		end
		core.set_node(pos, {name = rock_name})
	else
		core.set_node(pos, {name = "default:lava_flowing", param2 = math.random(3, 6)})
	end
		end
	end,
	on_punch = function(pos, node, puncher)
		local wielded = puncher:get_wielded_item()

		if wielded:get_count() == 0 then
			puncher:set_hp(puncher:get_hp() - 3)
		end
	end,
	groups = {cracky = 2, hot = 3, igniter = 1, timer_check = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:pumice", {
	description = S("Pumice"),
	tiles = {"default_pumice.png"},
	is_ground_content = false,
	groups = {cracky=3, crumbly=2},
	sounds = default.node_sound_stone_defaults(),
	_tnt_loss = 4,
})

core.register_node("default:ocean_stone", {
	description = S("Ocean Stone"),
	tiles = {"default_ocean_stone.png"},
	drop = "default:ocean_cobble",
	groups = {cracky = 3, cools_lava = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:ocean_cobble", {
	description = S("Ocean Cobblestone"),
	tiles = {"default_ocean_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, cools_lava = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:ocean_stone_carved", {
	description = S("Carved Ocean Stone"),
	tiles = {"default_ocean_stone_carved.png"},
	is_ground_content = false,
	groups = {cracky = 2, cools_lava = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:ocean_stone_circular", {
	description = S("Circular Ocean Stone"),
	tiles = {"default_ocean_stone_circular.png"},
	is_ground_content = false,
	groups = {cracky = 2, cools_lava = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:ocean_stone_pillar", {
	description = S("Ocean Stone Pillar"),
	tiles = {"default_ocean_stone_circular.png", "default_ocean_stone_circular.png", "default_ocean_stone_pillar.png"},
	is_ground_content = false,
	groups = {cracky = 2, cools_lava = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:ocean_stone_brick", {
	description = S("Ocean Stone Brick"),
	tiles = {"default_ocean_stone_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {cracky = 2, cools_lava = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:sandstone", {
	description = S("Sandstone"),
	tiles = {"default_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:sandstone_brick", {
	description = S("Sandstone Brick"),
	tiles = {"default_sandstone_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:sandstone_block", {
	description = S("Sandstone Block"),
	tiles = {"default_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:desert_sandstone", {
	description = S("Desert Sandstone"),
	tiles = {"default_desert_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:desert_sandstone_brick", {
	description = S("Desert Sandstone Brick"),
	tiles = {"default_desert_sandstone_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:desert_sandstone_block", {
	description = S("Desert Sandstone Block"),
	tiles = {"default_desert_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:silver_sandstone", {
	description = S("Silver Sandstone"),
	tiles = {"default_silver_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:silver_sandstone_brick", {
	description = S("Silver Sandstone Brick"),
	tiles = {"default_silver_sandstone_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:silver_sandstone_block", {
	description = S("Silver Sandstone Block"),
	tiles = {"default_silver_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:obsidian", {
	description = S("Obsidian"),
	tiles = {"default_obsidian.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:obsidian_brick", {
	description = S("Obsidian Brick"),
	tiles = {"default_obsidian_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:obsidian_block", {
	description = S("Obsidian Block"),
	tiles = {"default_obsidian_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:white_marble", {
	description = S("White Marble"),
	tiles = {"default_white_marble.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:white_marble_block", {
	description = S("White Marble Block"),
	tiles = {"default_white_marble_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:marble", {
	description = S("Marble"),
	tiles = {"default_marble.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:marble_brick", {
	description = S("Marble Brick"),
	tiles = {"default_marble_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:diamite", {
	description = S("Diamite"),
	tiles = {"default_diamite.png"},
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:granite", {
	description = S("Granite"),
	tiles = {"default_granite.png"},
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:bedrock", {
	description = S("Bedrock"),
	tiles = {"default_bedrock.png"},
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:bedrock_barrier", {
	description = S("Bedrock Barrier"),
	tiles = {"default_bedrock_barrier.png"},
	diggable = false,
	is_ground_content = false,
	on_blast = function() end,
	can_dig = function() return false end,
	post_effect_color = "black",
	groups = {immortal = 1, unbreakable = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults(),
})

local exen = core.get_modpath("extra_energy")

core.register_node("default:stone_with_coal", {
	description = S("Coal Ore"),
	tiles = {"default_stone.png^default_mineral_coal.png"},
	groups = {cracky = 3, xn = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:coal_lump 5", "default:rock 4"}, rarity = 9},
			{items = {"default:coal_lump 4", "default:rock 5"}, rarity = 6},
			{items = {"default:coal_lump 3", "default:rock 6"}, rarity = 3},
			{items = {"default:coal_lump 2", "default:rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
	after_destruct = exen and function(pos, oldnode)
		core.add_entity(pos, "extra_energy:orb")
	end
})

core.register_node("default:desert_stone_with_coal", {
	description = S("Coal Ore"),
	tiles = {"default_desert_stone.png^default_mineral_coal.png"},
	groups = {cracky = 3, xn = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:coal_lump 5", "default:desert_rock 4"}, rarity = 9},
			{items = {"default:coal_lump 4", "default:desert_rock 5"}, rarity = 6},
			{items = {"default:coal_lump 3", "default:desert_rock 6"}, rarity = 3},
			{items = {"default:coal_lump 2", "default:desert_rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
	after_destruct = exen and function(pos, oldnode)
		core.add_entity(pos, "extra_energy:orb")
	end
})

core.register_node("default:coal_block", {
	description = S("Coal Block"),
	tiles = {"default_coal_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	after_destruct = function(pos)
		pos.y = pos.y + 1
		if core.get_node(pos).name == "fire:permanent_flame" then
			core.remove_node(pos)
		end
	end,
	on_ignite = function(pos)
		local flame_pos = {x = pos.x, y = pos.y + 1, z = pos.z}
		if core.get_node(flame_pos).name == "air" then
			core.set_node(flame_pos, {name = "fire:permanent_flame"})
		end
	end,
	sounds = default.node_sound_stone_defaults(),
})


core.register_node("default:stone_with_sulfur", {
	description = S("Sulfur Ore"),
	tiles = {"default_stone.png^default_mineral_sulfur.png"},
	groups = {cracky = 3},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:sulfur 5", "default:rock 4"}, rarity = 9},
			{items = {"default:sulfur 4", "default:rock 5"}, rarity = 6},
			{items = {"default:sulfur 3", "default:rock 6"}, rarity = 3},
			{items = {"default:sulfur 2", "default:rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})


core.register_node("default:stone_with_iron", {
	description = S("Iron Ore"),
	tiles = {"default_stone.png^default_mineral_iron.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:iron_lump 5", "default:rock 4"}, rarity = 9},
			{items = {"default:iron_lump 4", "default:rock 5"}, rarity = 6},
			{items = {"default:iron_lump 3", "default:rock 6"}, rarity = 3},
			{items = {"default:iron_lump 2", "default:rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:desert_stone_with_iron", {
	description = S("Iron Ore"),
	tiles = {"default_desert_stone.png^default_mineral_iron.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:iron_lump 5", "default:desert_rock 4"}, rarity = 9},
			{items = {"default:iron_lump 4", "default:desert_rock 5"}, rarity = 6},
			{items = {"default:iron_lump 3", "default:desert_rock 6"}, rarity = 3},
			{items = {"default:iron_lump 2", "default:desert_rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

-- carbon content (less than .25%)
core.register_node("default:wrought_iron_block", {
	description = S("Wrought Iron Block"),
	tiles = {"default_wrought_iron_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})
-- carbon content (2.1% to 4%)
core.register_node("default:cast_iron_block", {
	description = S("Cast Iron Block"),
	tiles = {"default_cast_iron_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})
-- carbon content (.25% to 2.1%) was carbon_steel_block
core.register_node("default:steel_block", {
	description = S("Steel Block"),
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})
-- carbon content (.25% to 2.1%)
core.register_node("default:stainless_steel_block", {
	description = S("Stainless Steel Block"),
	tiles = {"default_stainless_steel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})


core.register_node("default:stone_with_copper", {
	description = S("Copper Ore"),
	tiles = {"default_stone.png^default_mineral_copper.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:copper_lump 5", "default:rock 4"}, rarity = 9},
			{items = {"default:copper_lump 4", "default:rock 5"}, rarity = 6},
			{items = {"default:copper_lump 3", "default:rock 6"}, rarity = 3},
			{items = {"default:copper_lump 2", "default:rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:copper_block", {
	description = S("Copper Block"),
	tiles = {"default_copper_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})


core.register_node("default:stone_with_tin", {
	description = S("Tin Ore"),
	tiles = {"default_stone.png^default_mineral_tin.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:tin_lump 5", "default:rock 4"}, rarity = 9},
			{items = {"default:tin_lump 4", "default:rock 5"}, rarity = 6},
			{items = {"default:tin_lump 3", "default:rock 6"}, rarity = 3},
			{items = {"default:tin_lump 2", "default:rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:tin_block", {
	description = S("Tin Block"),
	tiles = {"default_tin_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})


core.register_node("default:brass_block", {
	description = S("Brass Block"),
	tiles = {"default_brass_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults()
})


core.register_node("default:bronze_block", {
	description = S("Bronze Block"),
	tiles = {"default_bronze_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})


core.register_node("default:stone_with_chromium", {
	description = S("Chromium Ore"),
	tiles = {"default_stone.png^default_mineral_chromium.png"},
	groups = {cracky = 3},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:chromium_lump 5", "default:rock 4"}, rarity = 9},
			{items = {"default:chromium_lump 4", "default:rock 5"}, rarity = 6},
			{items = {"default:chromium_lump 3", "default:rock 6"}, rarity = 3},
			{items = {"default:chromium_lump 2", "default:rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:chromium_block", {
	description = S("Chromium Block"),
	tiles = {"default_chromium_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults()
})


core.register_node("default:stone_with_zinc", {
	description = S("Zinc Ore"),
	tiles = {"default_stone.png^default_mineral_zinc.png"},
	groups = {cracky = 3},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:zinc_lump 5", "default:rock 4"}, rarity = 9},
			{items = {"default:zinc_lump 4", "default:rock 5"}, rarity = 6},
			{items = {"default:zinc_lump 3", "default:rock 6"}, rarity = 3},
			{items = {"default:zinc_lump 2", "default:rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:zinc_block", {
	description = S("Zinc Block"),
	tiles = {"default_zinc_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})


core.register_node("default:stone_with_silver", {
	description = S("Silver Ore"),
	tiles = {"default_stone.png^default_mineral_silver.png"},
	groups = {cracky = 3},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:silver_lump 5", "default:rock 4"}, rarity = 9},
			{items = {"default:silver_lump 4", "default:rock 5"}, rarity = 6},
			{items = {"default:silver_lump 3", "default:rock 6"}, rarity = 3},
			{items = {"default:silver_lump 2", "default:rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:silver_block", {
	description = S("Silver Block"),
	tiles = {"default_silver_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})


core.register_node("default:stone_with_gold", {
	description = S("Gold Ore"),
	tiles = {"default_stone.png^default_mineral_gold.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:gold_lump 5", "default:rock 4"}, rarity = 9},
			{items = {"default:gold_lump 4", "default:rock 5"}, rarity = 6},
			{items = {"default:gold_lump 3", "default:rock 6"}, rarity = 3},
			{items = {"default:gold_lump 2", "default:rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:desert_stone_with_gold", {
	description = S("Gold Ore"),
	tiles = {"default_desert_stone.png^default_mineral_gold.png"},
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:gold_lump 5", "default:desert_rock 4"}, rarity = 9},
			{items = {"default:gold_lump 4", "default:desert_rock 5"}, rarity = 6},
			{items = {"default:gold_lump 3", "default:desert_rock 6"}, rarity = 3},
			{items = {"default:gold_lump 2", "default:desert_rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:gold_block", {
	description = S("Gold Block"),
	tiles = {"default_gold_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_metal_defaults(),
})


core.register_node("default:stone_with_mese", {
	description = S("Mese Ore"),
	tiles = {"default_stone.png^default_mineral_mese.png"},
	groups = {cracky = 1, xn = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:mese_crystal 5", "default:rock 4"}, rarity = 9},
			{items = {"default:mese_crystal 4", "default:rock 5"}, rarity = 6},
			{items = {"default:mese_crystal 3", "default:rock 6"}, rarity = 3},
			{items = {"default:mese_crystal 2", "default:rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
	after_destruct = exen and function(pos, oldnode)
		core.add_entity(pos, "extra_energy:orb"):get_luaentity().value = 2
	end
})

core.register_node("default:mese", {
	description = S("Mese Block"),
	tiles = {"default_mese_block.png"},
	paramtype = "light",
	light_source = 3,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})


core.register_node("default:stone_with_mithril", {
	description = S("Mithril Ore"),
	tiles = {"default_stone.png^default_mineral_mithril.png"},
	groups = {cracky = 2, xn = 3},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:mithril_lump 5", "default:rock 4"}, rarity = 9},
			{items = {"default:mithril_lump 4", "default:rock 5"}, rarity = 6},
			{items = {"default:mithril_lump 3", "default:rock 6"}, rarity = 3},
			{items = {"default:mithril_lump 2", "default:rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
	after_destruct = exen and function(pos, oldnode)
		core.add_entity(pos, "extra_energy:orb"):get_luaentity().value = 3
	end
})

core.register_node("default:mithril_block", {
	description = S("Mithril Block"),
	tiles = {"default_mithril_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})


core.register_node("default:stone_with_diamond", {
	description = S("Diamond Ore"),
	tiles = {"default_stone.png^default_mineral_diamond.png"},
	groups = {cracky = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:diamond 5", "default:rock 4"}, rarity = 9},
			{items = {"default:diamond 4", "default:rock 5"}, rarity = 6},
			{items = {"default:diamond 3", "default:rock 6"}, rarity = 3},
			{items = {"default:diamond 2", "default:rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:diamond_block", {
	description = S("Diamond Block"),
	tiles = {"default_diamond_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:stone_with_blue_diamond", {
	description = S("Blue Diamond Ore"),
	tiles = {"default_stone.png^default_mineral_blue_diamond.png"},
	groups = {cracky = 1, level = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:blue_diamond 5", "default:rock 4"}, rarity = 9},
			{items = {"default:blue_diamond 4", "default:rock 5"}, rarity = 6},
			{items = {"default:blue_diamond 3", "default:rock 6"}, rarity = 3},
			{items = {"default:blue_diamond 2", "default:rock 7"}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:blue_diamond_block", {
	description = S("Blue Diamond Block"),
	tiles = {"default_blue_diamond_block.png"},
	is_ground_content = false,
	groups = {cracky = 4},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:orichalc_block", {
	description = S("Orichalc Block"),
	tiles = {"default_orichalc_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_metal_defaults(),
})

core.register_node("default:ocealite", {
	description = S("Ocealite Block"),
	tiles = {"default_ocealite_block.png"},
	paramtype = "light",
	light_source = 3,
	groups = {cracky = 1, level = 2, cools_lava = 1},
	sounds = default.node_sound_stone_defaults(),
})

local def = {
	drawtype = "plantlike_rooted",
	tiles = {"default_sand.png"},
	special_tiles = {"default_ocealite_1.png"},
	paramtype = "light",
	light_source = 2,
	groups = {cracky = 3, cools_lava = 1, mineral_life = 1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	drop = "default:ocealite_crystal",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-2/16, .5, -2/16, 2/16, .7, 2/16},
		},
	},
	on_timer = function(pos, elapsed)
		default.under_water_growth(pos, 1, 0, "default:sand_with_ocealite_2", 0, math.random(332, 572))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_glass_defaults(),
}

core.register_node("default:sand_with_ocealite_1", table.copy(def))

def.special_tiles = {"default_ocealite_2.png"}
def.light_source = 3
def.node_dig_prediction = "default:sand_with_ocealite_1"
def.selection_box = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, .5, .5},
		{-2/16, .5, -2/16, 2/16, .8, 2/16},
	},
}
def.on_timer = function(pos, elapsed)
	default.under_water_growth(pos, 1, 0, "default:sand_with_ocealite_3", 0, math.random(332, 572))
end
def.after_destruct = function(pos, oldnode)
	core.set_node(pos, {name = "default:sand_with_ocealite_1"})
	core.get_node_timer(pos):start(math.random(332, 572))
end
core.register_node("default:sand_with_ocealite_2", table.copy(def))

def.special_tiles = {"default_ocealite_3.png"}
def.drop = "default:ocealite_crystal 2"
def.selection_box = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, .5, .5},
		{-2/16, .5, -2/16, 2/16, 1., 2/16},
	},
}
def.on_timer = function(pos, elapsed)
	default.under_water_growth(pos, 1, 0, "default:sand_with_ocealite_4", 0, math.random(332, 572))
end
core.register_node("default:sand_with_ocealite_3", table.copy(def))

def.special_tiles = {"default_ocealite_4.png"}
def.drop = "default:ocealite_crystal 3"
def.selection_box = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, .5, .5},
		{-3/16, .5, -3/16, 3/16, 1.1, 3/16},
	},
}
def.on_timer = function(pos, elapsed)
	default.under_water_growth(pos, 1, 0, "default:sand_with_ocealite_5", 0, math.random(332, 572))
end
core.register_node("default:sand_with_ocealite_4", table.copy(def))

def.special_tiles = {"default_ocealite_5.png"}
def.drop = "default:ocealite_crystal 4"
def.selection_box = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, .5, .5},
		{-4/16, .5, -4/16, 4/16, 1.3, 4/16},
	},
}
def.on_timer = function(pos, elapsed)
	default.under_water_growth(pos, 1, 0, "default:sand_with_ocealite_6", 0, 0)
end
core.register_node("default:sand_with_ocealite_5", table.copy(def))

def.special_tiles = {"default_ocealite_6.png"}
def.drop = {
	items = {
		{items = {"default:ocealite_crystal 5"}},
		{items = {"default:ocealite_crystal"}, rarity = 5},
		{items = {"default:ocealite_crystal_fragment 4"}},
		{items = {"default:ocealite_crystal_fragment 3"}, rarity = 5},
	}
}
def.selection_box = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, .5, .5},
		{-5/16, .5, -5/16, 5/16, 1.4, 5/16},
	},
}
core.register_node("default:sand_with_ocealite_6", table.copy(def))

core.register_node("default:crystal_block", {
	description = S("Frost Crystal Block"),
	tiles = {"crystal_block.png"},
	paramtype = "light",
	light_source = 9,
	is_ground_content = false,
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(12, 24))
	end,
	on_timer = function(pos, elapsed)
		default.cooling_near(pos, math.random(12, 24))
	end,
	after_destruct = default.update_cools,
	groups = {cracky = 1, level = 2, cools_lava = 1, timer_check = 1},
	sounds = default.node_sound_glass_defaults(),
})

-- Thanks to ZonerDarkRevention for his DokuCraft DeviantArt crystal texture
core.register_node("default:crystal_spike", {
	description = S("Frost Crystal Spike"),
	drawtype = "plantlike",
	tiles = {"crystal_spike.png"},
	inventory_image = "crystal_spike.png",
	wield_image = "crystal_spike.png",
	paramtype = "light",
	light_source = 7,
	sunlight_propagates = true,
	damage_per_second = 1,
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(12, 24))
	end,
	on_timer = function(pos, elapsed)
		default.cooling_near(pos, math.random(12, 24))
	end,
	after_destruct = default.update_cools,
	groups = {cracky = 1, falling_node = 1, fall_damage_add_percent = 11, cools_lava = 1, mineral_life = 1, timer_check = 1},
	sounds = default.node_sound_glass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -.5, -5/16, 5/16, 0, 5/16}
	},
	collision_box = {
		type = "fixed",
		fixed = {-5/16, -.5, -5/16, 5/16, 0, 5/16}
	},
	dropped_step = function(self, pos, dtime)

		self.ctimer = (self.ctimer or 0) + dtime
		if self.ctimer < 5. then return end
		self.ctimer = 0

		if self.node_inside and self.node_inside.name ~= "default:water_source" then
			return
		end

		local objs = core.get_objects_inside_radius(pos, .8)

		if not objs or #objs ~= 2 then return end

		local crystal, mese, ent = nil, nil, nil

		for k, obj in pairs(objs) do

			ent = obj:get_luaentity()

			if ent and ent.name == "__builtin:item" then

				if ent.itemstring == "default:mese_crystal 2" and not mese then

					mese = obj

				elseif ent.itemstring == "default:crystal_spike 2" and not crystal then

					crystal = obj
				end
			end
		end

		if mese and crystal then

			mese:remove()
			crystal:remove()

			core.add_item(pos, "default:crystal_ingot 2")

			return false
		end
	end
})


--- Soft / Non-Stone

core.register_node("default:compost_pile", {
	description = S("Compost Pile"),
	tiles = {"default_compost_pile.png"},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(270, 1500))
	end,
	on_timer = function(pos, elapsed)
		if not core.find_node_near(pos, 1, "group:water") or not core.find_node_near(pos, 1, {"air", "trunks:moss_fungus"})
		or default.h_h_h(pos, nil, -10, 19) and default.h_h_h(pos, nil, 110) then
			core.set_node(pos, {name = "default:dirt"})
		else
			core.set_node(pos, {name = "default:compost"})
		end
	end,
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults(),
	_tnt_loss = 3,
})

core.register_node("default:compost", {
	description = S("Compost"),
	tiles = {"default_compost.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("default:dirt", {
	description = S("Dirt"),
	tiles = {"default_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:dirt", "bonemeal:bone"}, rarity = 40},
			{items = {"default:dirt", "default:rock"}, rarity = 30},
			{items = {"default:dirt"}}
		}
	},
	sounds = default.node_sound_dirt_defaults(),
	_soil = {dry = "farming:soil"},
	_tnt_loss = 3
})

core.register_node("default:mud", {
	description = "Mud",
	drawtype = "glasslike",
	tiles = {"default_mud.png"},
	liquidtype = "source",
	liquid_alternative_flowing = "default:mud",
	liquid_alternative_source = "default:mud",
	liquid_renewable = false,
	liquid_range = 0,
	liquid_viscosity = 7,
	drowning = 1,
	walkable = false,
	post_effect_color = {a = 255, r = 30, g = 15, b = 1},
	groups = {crumbly=3, liquid=1},
	sounds = default.node_sound_dirt_defaults(),
	_tnt_loss = 3,
})

core.register_node("default:dirt_with_grass", {
	description = S("Dirt with Grass"),
	tiles = {"default_grass.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = .25},
	}),
	_soil = {dry = "farming:soil"}
})

core.register_node("default:dirt_with_short_grass", {
	description = S("Dirt with Short Grass"),
	tiles = {"default_grass.png^default_grass_short.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png^default_grass_short_side.png",
			tileable_vertical = false}},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(60, 300))
	end,
	on_timer = function(pos)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local light = 13
		local meta = core.get_meta(pos)
		if meta:get_int("light_level") > 0 then
			light = light - (meta:get_int("light_level") * 3)
			meta:set_int("light_level", 0)
		end
		if (core.get_node_light(above) or 0) > light and default.h_h_h(pos, nil, -10, 81, 19) and default.h_h_h(pos, 111) then
			core.set_node(pos, {name = "default:dirt_with_grass"})
		end
		core.get_node_timer(pos):start(math.random(60, 300))
	end,
	groups = {crumbly = 3, soil = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = .25},
	}),
	_soil = {dry = "farming:soil"}
})

core.register_node("default:dirt_with_grass_footsteps", {
	description = S("Dirt with Grass and Footsteps"),
	tiles = {"default_grass.png^default_footprint.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = .25},
	}),
	_soil = {dry = "farming:soil"}
})

core.register_node("default:dirt_with_savanna_grass", {
	description = S("Dirt with Savanna Grass"),
	tiles = {"default_savanna_grass.png", "default_dirt.png",
		{name = "default_dirt.png^default_savanna_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = .4},
	}),
	_soil = {dry = "farming:soil"}
})

core.register_node("default:dirt_with_snow", {
	description = S("Dirt with Snow"),
	tiles = {"default_snow.png", "default_dirt.png",
		{name = "default_dirt.png^default_snow_side.png",
			tileable_vertical = false}},
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1, snowy = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = .2},
	}),
})

core.register_node("default:dirt_with_swamp_grass", {
	description = S("Dirt with Swamp Grass"),
	tiles = {"default_swamp_grass.png", "default_dirt.png",
		{name = "default_dirt.png^default_swamp_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = .25},
	}),
	_soil = {dry = "farming:soil"}
})

core.register_node("default:dirt_with_rainforest_litter", {
	description = S("Dirt with Rainforest Litter"),
	tiles = {"default_rainforest_litter.png", "default_dirt.png",
		{name = "default_dirt.png^default_rainforest_litter_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = .4},
	}),
	_soil = {dry = "farming:soil"}
})

core.register_node("default:dirt_with_coniferous_litter", {
	description = S("Dirt with Coniferous Litter"),
	tiles = {"default_coniferous_litter.png", "default_dirt.png",
		{name = "default_dirt.png^default_coniferous_litter_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = .4},
	}),
	_soil = {dry = "farming:soil"}
})

core.register_node("default:dirt_with_blue_moss", {
	description = S("Dirt with Blue Moss"),
	tiles = {"default_blue_moss.png", "default_dirt.png",
		{name = "default_dirt.png^default_blue_moss_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = .13},
	}),
	_soil = {dry = "farming:soil"}
})

core.register_node("default:dry_dirt", {
	description = S("Dry Dirt"),
	tiles = {"default_dry_dirt.png"},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(4, 6))
	end,
	on_timer = default.hydrate_dry_dirt,
	groups = {crumbly = 3, timer_check = 1},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("default:clay_dirt", {
	description = S("Clay Dirt"),
	tiles = {"default_clay_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:clay_dirt", "bonemeal:bone"}, rarity = 40},
			{items = {"default:clay_dirt", "default:rock"}, rarity = 30},
			{items = {"default:clay_dirt"}}
		}
	},
	sounds = default.node_sound_dirt_defaults(),
	_soil = {dry = "farming:clay_soil"},
	_tnt_loss = 3
})

core.register_node("default:clay_dirt_with_savanna_grass", {
	description = S("Clay Dirt with Savanna Grass"),
	tiles = {"default_savanna_grass.png", "default_clay_dirt.png",
		{name = "default_clay_dirt.png^default_savanna_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:clay_dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = .4},
	}),
	_soil = {dry = "farming:clay_soil"}
})

core.register_node("default:dry_clay_dirt", {
	description = S("Dry Clay Dirt"),
	tiles = {"default_dry_clay_dirt.png"},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(4, 6))
	end,
	on_timer = default.hydrate_dry_dirt,
	groups = {crumbly = 3, timer_check = 1},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("default:dirt_with_leaves_1", {
	description = S("Forest Soil 1"),
	tiles = {"default_dirt.png^woodsoils_ground_cover.png",
		"default_dirt.png", "default_dirt.png^woodsoils_ground_cover_side.png"},
	groups = {crumbly=3, soil=1, not_in_creative_inventory=0},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=.4},
	}),
})

core.register_node("default:dirt_with_leaves_2", {
	description = S("Forest Soil 2"),
	tiles = {"woodsoils_ground.png",
		"default_dirt.png", "default_dirt.png^woodsoils_ground_side.png"},
	groups = {crumbly=3, soil=1, not_in_creative_inventory=0},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=.4},
	}),
})

core.register_node("default:grass_with_leaves_1", {
	description = S("Forest Grass 1"),
	tiles = {"default_grass.png^woodsoils_ground_cover2.png",
		"default_dirt.png", "default_dirt.png^default_grass_side.png^woodsoils_ground_cover_side2.png"},
	groups = {crumbly=3, soil=1, not_in_creative_inventory=0},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=.4},
	}),
})

core.register_node("default:grass_with_leaves_2", {
	description = S("Forest Grass 2"),
	tiles = {"default_grass.png^woodsoils_ground_cover.png",
		"default_dirt.png", "default_dirt.png^default_grass_side.png^woodsoils_ground_cover_side.png"},
	groups = {crumbly=3, soil=1, not_in_creative_inventory=0},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=.4},
	}),
})

core.register_node("default:permafrost", {
	description = S("Permafrost"),
	tiles = {"default_permafrost.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("default:permafrost_with_stones", {
	description = S("Permafrost with Stones"),
	tiles = {"default_permafrost.png^default_stones.png",
		"default_permafrost.png",
		"default_permafrost.png^default_stones_side.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_gravel_defaults(),
})

core.register_node("default:permafrost_with_moss", {
	description = S("Permafrost with Moss"),
	tiles = {"default_moss.png", "default_permafrost.png",
		{name = "default_permafrost.png^default_moss_side.png",
			tileable_vertical = false}},
	groups = {cracky = 3},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = .25},
	}),
})

core.register_node("default:sand", {
	description = S("Sand"),
	tiles = {"default_sand.png"},
	groups = {crumbly = 3, falling_node = 1, falling_node_damage=2, sand = 1},
	drop = {
		items = {
			{items = {"default:rock"}, rarity = 30},
			{items = {"default:sand"}}
		}
	},
	sounds = default.node_sound_sand_defaults(),
	_tnt_loss = 2,
})

core.register_node("default:desert_sand", {
	description = S("Desert Sand"),
	tiles = {"default_desert_sand.png"},
	groups = {crumbly = 3, falling_node = 1, falling_node_damage=2, sand = 1},
	drop = {
		items = {
			{items = {"default:desert_rock"}, rarity = 30},
			{items = {"default:desert_sand"}}
		}
	},
	sounds = default.node_sound_sand_defaults(),
	_tnt_loss = 2,
})

core.register_node("default:silver_sand", {
	description = S("Silver Sand"),
	tiles = {"default_silver_sand.png"},
	groups = {crumbly = 3, falling_node = 1, falling_node_damage=2, sand = 1},
	drop = {
		items = {
			{items = {"default:rock"}, rarity = 30},
			{items = {"default:silver_sand"}}
		}
	},
	sounds = default.node_sound_sand_defaults(),
	_tnt_loss = 2,
})


core.register_node("default:gravel", {
	description = S("Gravel"),
	tiles = {"default_gravel.png"},
	groups = {crumbly = 2, falling_node = 1, falling_node_damage = 3},
	sounds = default.node_sound_gravel_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {"default:flint"}, rarity = 16},
			{items = {"default:gravel"}}
		}
	},
	_tnt_loss = 3
})

core.register_node("default:silt", {
	description = S("Silt"),
	tiles = {"default_silt.png"},
	groups = {crumbly = 3, soil = 1},
	drop = "default:silt_lump 4",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_dirt_footstep", gain = .3},
	}),
})

core.register_node("default:clay", {
	description = S("Clay"),
	tiles = {"default_clay.png"},
	groups = {crumbly = 3},
	drop = "default:clay_lump 4",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_dirt_footstep", gain = .2},
	}),
})

core.register_node("default:terracotta", {
	description = S("Unfired Terracotta"),
	tiles = {"terracotta_unfired.png"},
	groups = {crumbly = 3},
	drop = "default:terracotta_lump 4",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_dirt_footstep", gain = .3},
	}),
})


core.register_node("default:snow", {
	description = S("Snow"),
	tiles = {"default_snow.png"},
	inventory_image = "default_snowball.png",
	wield_image = "default_snowball.png",
	paramtype = "light",
	buildable_to = true,
	floodable = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.25, .5},
	},
	collision_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -6/16, .5},
	},
	drop = {
		max_items = 1,
		items = {
			{tools = {"noel:shrub"}, items = {"default:snow", "noel:moss"}, rarity = 20},
			{items = {"default:snow"}}
		}
	},
	on_timer = default.melt_near_heat,
	groups = {crumbly = 3, falling_node = 1, snowy = 1},
	sounds = default.node_sound_snow_defaults(),
	_tnt_loss = 1,	-- gone

	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
		pos.y = pos.y - 1
		if core.get_node(pos).name == "default:dirt_with_grass" then
			core.set_node(pos, {name = "default:dirt_with_snow"})
			core.get_node_timer(pos):start(5)
		end
	end,
	after_destruct = function(pos)
		pos.y = pos.y - 1
		if core.get_node(pos).name == "default:pine_needles_with_snow" then
			local meta = core.get_meta(pos)
			if meta:get_string("pinecones") == "true" then
	swap_preserved(pos, "default:pinecone_needles")
			else
	swap_preserved(pos, "default:pine_needles")
			end
		elseif core.get_node(pos).name == "white_pine:needles_with_snow" then
			swap_preserved(pos, "white_pine:needles")
		end
	end,
})

core.register_node("default:snow_block", {
	description = S("Snow Block"),
	tiles = {"default_snow.png"},
	on_timer = default.melt_near_heat,
	groups = {crumbly = 3, cools_lava = 1, snowy = 1},
	sounds = default.node_sound_snow_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
		pos.y = pos.y - 1
		if core.get_node(pos).name == "default:dirt_with_grass" then
			core.set_node(pos, {name = "default:dirt_with_snow"})
			core.get_node_timer(pos):start(5)
		end
	end,
})

core.register_node("default:snow_brick", {
	description = S("Snow Brick"),
	tiles = {"default_snow_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	on_timer = default.melt_near_heat,
	groups = {crumbly = 3, cools_lava = 1, snowy = 1},
	sounds = default.node_sound_snow_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
		pos.y = pos.y - 1
		if core.get_node(pos).name == "default:dirt_with_grass" then
			core.set_node(pos, {name = "default:dirt_with_snow"})
			core.get_node_timer(pos):start(5)
		end
	end,
})

-- 'is ground content = false' to avoid tunnels in sea ice or ice rivers
core.register_node("default:ice", {
	description = S("Ice"),
	tiles = {"default_ice.png"},
	paramtype = "light",
	liquids_pointable = true,
	is_ground_content = false,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {cracky = 3, cools_lava = 1, slippery = 3, icy = 1},
	sounds = default.node_sound_ice_defaults(),
})

core.register_node("default:ice_brick", {
	description = S("Ice Brick"),
	tiles = {"default_ice_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	paramtype = "light",
	liquids_pointable = true,
	is_ground_content = false,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {cracky = 3, cools_lava = 1, slippery = 3, icy = 1},
	sounds = default.node_sound_ice_defaults(),
})

core.register_node("default:ice_block", {
	description = S("Ice Block"),
	tiles = {"default_ice_block.png"},
	paramtype = "light",
	liquids_pointable = true,
	is_ground_content = false,
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {cracky = 3, cools_lava = 1, slippery = 3, icy = 1},
	sounds = default.node_sound_ice_defaults(),
})

-- Mapgen-placed ice with 'is ground content = true' to contain tunnels
core.register_node("default:cave_ice", {
	description = S("Cave Ice"),
	tiles = {"default_ice.png"},
	paramtype = "light",
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = default.melt_near_heat,
	groups = {cracky = 3, cools_lava = 1, slippery = 3, icy = 1, not_in_creative_inventory = 1},
	drop = "default:ice",
	sounds = default.node_sound_ice_defaults(),
})


--- Plants

core.register_node("default:acacia_trunk", {
	description = S("Acacia Trunk"),
	tiles = {"default_acacia_trunk_top.png", "default_acacia_trunk_top.png", "default_acacia_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("default:acacia_wood", {
	description = S("Acacia Wood Planks"),
	tiles = {"default_acacia_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("default:acacia_leaves", {
	description = S("Acacia Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_acacia_leaves.png"},
	special_tiles = {"default_acacia_leaves_simple.png"},
	inventory_image = leaf_image("default_acacia_leaves.png"),
	wield_image = leaf_image("default_acacia_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			-- player will get a sapling in 1/20
			{items = {"default:acacia_sapling"}, rarity = 20},

			-- otherwise only leaves, because max_items is 1
			{items = {"default:acacia_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("default:acacia_sapling", {
	description = S("Acacia Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_acacia_sapling.png"},
	inventory_image = "default_acacia_sapling.png",
	wield_image = "default_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:acacia_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 7, z = 5},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 6,
})


core.register_node("default:apple_trunk", {
	description = S("Apple Trunk"),
	tiles = {"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"default:apple_leaves", "default:apple_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "default:apple_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "default:apple_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "default:apple_leaves_blooming" then
					core.set_node(p, {name = "default:apple_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("default:apple_wood", {
	description = S("Apple Wood Planks"),
	tiles = {"default_apple_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("default:apple", {
	description = S("Apple"),
	drawtype = "nodebox",
	tiles = {"default_apple_top.png", "default_apple_bottom.png", "default_apple_side.png"},
	inventory_image = "default_apple.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-3/16, -7/16, -3/16, 3/16, 1/16, 3/16},
			{-4/16, -6/16, -3/16, 4/16, 0, 3/16},
			{-3/16, -6/16, -4/16, 3/16, 0, 4/16},
			{-.02, 0, -.02, .02, 4/16, .02}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.4, -.2, .2, .15, .2}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2},
	on_use = core.item_eat(2, "farming:spent_biomasse"),
	sounds = default.node_sound_fruits_defaults(),
	sound = {eat = "eat_crunchy_juicy"}
})

core.register_node("default:apple_leaves", {
	description = S("Apple Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_apple_leaves.png"},
	inventory_image = leaf_image("default_apple_leaves.png"),
	wield_image = leaf_image("default_apple_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:apple_sapling"}, rarity = 20},
			{items = {"default:apple_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("default:apple_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_apple_leaves.png^default_apple_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:apple_sapling"}, rarity = 20},
			{items = {"default:apple_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("default:apple_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_apple_leaves.png^default_apples.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	node_dig_prediction = "default:apple_leaves",
	drop = {
		items = {
			{items = {"default:apple 5"}},
			{items = {"default:apple 2"}, rarity = 2},
			{items = {"default:apple 4"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "default:apple_leaves"})
		local f = core.find_node_near(pos, 2, "default:apple_trunk")
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("default:apple_sapling", {
	description = S("Apple Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_apple_sapling.png"},
	inventory_image = "default_apple_sapling.png",
	wield_image = "default_apple_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:apple_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 4, z = 5},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 4,
})


core.register_node("default:aspen_trunk", {
	description = S("Aspen Trunk"),
	tiles = {"default_aspen_trunk_top.png", "default_aspen_trunk_top.png", "default_aspen_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 1, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("default:aspen_wood", {
	description = S("Aspen Wood Planks"),
	tiles = {"default_aspen_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 1, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("default:aspen_leaves", {
	description = S("Aspen Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_aspen_leaves.png"},
	inventory_image = leaf_image("default_aspen_leaves.png"),
	wield_image = leaf_image("default_aspen_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:aspen_sapling"}, rarity = 20},
			{items = {"default:aspen_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("default:aspen_sapling", {
	description = S("Aspen Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_aspen_sapling.png"},
	inventory_image = "default_aspen_sapling.png",
	wield_image = "default_aspen_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-3/16, -.5, -3/16, 3/16, .5, 3/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:aspen_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 12, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 10,
})


core.register_node("default:beech_trunk", {
	description = S("Beech Trunk"),
	tiles = {"default_beech_trunk_top.png", "default_beech_trunk_top.png", "default_beech_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("default:wood", {
	description = S("Wood Planks"),
	tiles = {"default_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("default:beech_leaves", {
	description = S("Beech Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_beech_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	inventory_image = leaf_image("default_beech_leaves.png"),
	wield_image = leaf_image("default_beech_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:sapling"}, rarity = 20},
			{items = {"default:beech_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("default:sapling", {
	description = S("Beech Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_beech_sapling.png"},
	inventory_image = "default_beech_sapling.png",
	wield_image = "default_beech_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 7, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 4,
})


core.register_node("default:birch_trunk", {
	description = S("Birch Trunk"),
	tiles = {"default_birch_trunk_top.png", "default_birch_trunk_top.png", "default_birch_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 1, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("default:birch_wood", {
	description = S("Birch Wood Planks"),
	tiles = {"default_birch_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("default:birch_leaves", {
	description = S("Birch Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_birch_leaves.png"},
	inventory_image = leaf_image("default_birch_leaves.png"),
	wield_image = leaf_image("default_birch_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:birch_sapling"}, rarity = 20},
			{items = {"default:birch_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("default:birch_sapling", {
	description = S("Birch Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_birch_sapling.png"},
	inventory_image = "default_birch_sapling.png",
	wield_image = "default_birch_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-3/16, -.5, -3/16, 3/16, .5, 3/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:birch_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 10, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 10,
})


core.register_node("default:coco_palm_trunk", {
	description = S("Coco Palm Trunk"),
	tiles = {"default_coco_palm_trunk_top.png", "default_coco_palm_trunk_top.png", "default_coco_palm_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	on_timer = function(pos, elapsed)
		for i=-1,1 do
		for k=-1,1 do
		local p = {x=pos.x+i, y=pos.y, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 1,
			{"default:coco_mark", "default:coco_0", "default:coco_1", "default:coco_2"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			pos.y = pos.y+1
			if core.get_node(pos).name == "default:coco_palm_leaves" and core.get_node(pos).param2 == 0 then
				pos.y = pos.y-1
				if n.name == "default:coco_mark" then
					core.set_node(p, {name = "default:coco_0"})
					core.get_node_timer(pos):start(math.random(300, 600))
				else
					if n.name == "default:coco_0" then
						core.set_node(p, {name = "default:coco_1"})
						core.get_node_timer(pos):start(math.random(300, 600))
					else
						if n.name == "default:coco_1" then
							core.set_node(p, {name = "default:coco_2"})
							core.get_node_timer(pos):start(math.random(300, 600))
						else
							if n.name == "default:coco_2" then
								core.set_node(p, {name = "default:coco_3"})
								core.get_node_timer(pos):start(math.random(300, 600))
							end
						end
					end
				end
			end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("default:coco_palm_wood", {
	description = S("Coco Palm Wood Planks"),
	tiles = {"default_coco_palm_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("default:coco_palm_leaves", {
	description = S("Coco Palm Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_droop.obj",
	waving = waving_style,
	tiles = {"default_coco_palm_leaves.png"..leaf_image("^[transformFY")},
	inventory_image = leaf_image("default_coco_palm_leaves.png"),
	wield_image = leaf_image("default_coco_palm_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:coco_palm_sapling"}, rarity = 20},
			{items = {"default:coco_palm_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("default:coco_mark", {
	description = S("Coco Marker"),
	inventory_image = "default_coco_0.png^default_invisible_node_overlay.png",
	wield_image = "default_coco_0.png^default_invisible_node_overlay.png",
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

core.register_node("default:coco_0", {
	description = S("Coco Flower"),
	drawtype = "plantlike",
	tiles = {"default_coco_0.png"},
	inventory_image = "default_coco_0.png",
	wield_image = "default_coco_0.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.24, -.3, .3, .3, .3}
	},
	drop = "",
	after_dig_node = function(pos)
		core.set_node(pos, {name = "default:coco_mark"})
		local f = core.find_node_near(pos, 1, "default:coco_palm_trunk")
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 2, dig_immediate = 3, leafdecay = 3, flammable = 2},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("default:coco_1", {
	description = S("Coco 1"),
	drawtype = "nodebox",
	tiles = {"default_coco_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -3/16, -1/16, 1/16, 7/16, 1/16},
			{-2/16, -1/16, -2/16, 2/16, 5/16, 2/16}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.24, -.2, .2, .4, .2}
	},
	drop = {
		items = {
			{items = {"default:coir"}},
			{items = {"default:coir"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "default:coco_mark"})
		local f = core.find_node_near(pos, 1, "default:coco_palm_trunk")
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 1, oddly_breakable_by_hand = 3, choppy = 3, leafdecay = 3, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("default:coco_2", {
	description = S("Coco 2"),
	drawtype = "nodebox",
	tiles = {"default_coco_2.png"},
	paramtype = "light",
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -6/16, -1/16, 1/16, 7/16, 1/16},
			{-2/16, -4/16, -2/16, 2/16, 5/16, 2/16},
			{-3/16, -2/16, -3/16, 3/16, 3/16, 3/16}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.4, -.25, .25, .4, .25}
	},
	drop = {
		items = {
			{items = {"default:coir 2", "default:coconut_young"}},
			{items = {"default:coir"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "default:coco_mark"})
		local f = core.find_node_near(pos, 1, "default:coco_palm_trunk")
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 1, oddly_breakable_by_hand = 2, choppy = 2, leafdecay = 3, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("default:coco_3", {
	description = S("Ripe Coco"),
	drawtype = "nodebox",
	tiles = {"default_coco_3.png"},
	paramtype = "light",
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -9/16, -1/16, 1/16, 7/16, 1/16},
			{-3/16, -7/16, -3/16, 3/16, 5/16, 3/16},
			{-4/16, -5/16, -4/16, 4/16, 3/16, 4/16}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .4, .3}
	},
	drop = {
		items = {
			{items = {"default:coir 3", "default:coconut"}}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "default:coco_mark"})
		local f = core.find_node_near(pos, 1, "default:coco_palm_trunk")
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	is_ground_content = false,
	groups = {snappy = 1, oddly_breakable_by_hand = 1, choppy = 1, leafdecay = 3, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("default:coco_palm_sapling", {
	description = S("Coco Palm Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_coco_palm_sapling.png"},
	inventory_image = "default_coco_palm_sapling.png",
	wield_image = "default_coco_palm_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:coco_palm_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 10, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,

	on_timer = function(pos)
		if not default.can_grow(pos, "sand") then
			core.get_node_timer(pos):start(300)
		else
			core.log("action", "A coco palm sapling grows into a tree at ".. core.pos_to_string(pos))
			default.grow_new_coco_palm(pos)
		end
	end,
	on_punch = function(pos, node, puncher)
		if puncher:get_wielded_item():get_name() == "default:stick" then
		node.param2 = node.param2 + 1
		if node.param2 > 4 then
			node.param2 = 0
		end
		core.swap_node(pos, node)
		end
	end,
	grown_height = 9,
})


core.register_node("default:jungle_trunk", {
	description = S("Jungle Trunk"),
	tiles = {"default_jungle_trunk_top.png", "default_jungle_trunk_top.png", "default_jungle_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("default:jungle_wood", {
	description = S("Jungle Wood Planks"),
	tiles = {"default_jungle_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("default:jungle_leaves", {
	description = S("Jungle Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_jungle_leaves.png"},
	special_tiles = {"default_jungle_leaves_simple.png"},
	inventory_image = leaf_image("default_jungle_leaves.png"),
	wield_image = leaf_image("default_jungle_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:jungle_sapling"}, rarity = 20},
			{items = {"default:jungle_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("default:jungle_sapling", {
	description = S("Jungle Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_jungle_sapling.png"},
	inventory_image = "default_jungle_sapling.png",
	wield_image = "default_jungle_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:jungle_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 15, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 13,
})

core.register_node("default:emergent_jungle_sapling", {
	description = S("Emergent Jungle Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_emergent_jungle_sapling.png"},
	inventory_image = "default_emergent_jungle_sapling.png",
	wield_image = "default_emergent_jungle_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:emergent_jungle_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -3, y = -5, z = -3},
			{x = 3, y = 31, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 29,
})


core.register_node("default:mangrove_trunk", {
	description = S("Mangrove Trunk"),
	tiles = {"default_mangrove_trunk_top.png", "default_mangrove_trunk_top.png", "default_mangrove_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, flammable = 1, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("default:mangrove_wood", {
	description = S("Mangrove Wood Planks"),
	tiles = {"default_mangrove_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("default:mangrove_leaves", {
	description = S("Mangrove Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_mangrove_leaves.png"},
	inventory_image = leaf_image("default_mangrove_leaves.png"),
	wield_image = leaf_image("default_mangrove_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:mangrove_sapling"}, rarity = 20},
			{items = {"default:mangrove_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("default:mangrove_sapling", {
	description = S("Mangrove Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_mangrove_sapling.png"},
	inventory_image = "default_mangrove_sapling.png",
	wield_image = "default_mangrove_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:mangrove_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 14, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,

	on_timer = function(pos)
		if #core.find_nodes_in_area({x = pos.x + 1, y = pos.y, z = pos.z + 1},
			{x = pos.x - 1, y = pos.y - 1, z = pos.z - 1}, {"default:water_source", "default:fresh_water_source"}) > 0 then

			if not default.can_grow(pos) then
				core.get_node_timer(pos):start(math.random(250, 1450))
			else
				core.log("action", "A mangrove sapling grows into a tree at ".. core.pos_to_string(pos))
				default.grow_new_mangrove_tree(pos)
			end
		else
			core.set_node(pos, {name = "default:dry_shrub"})
		end
	end,
	grown_height = 12,
	heat_min = -5,
	heat_max = 500,
	humidity_min = -5,
	humidity_max = 500,
})


core.register_node("default:orange_trunk", {
	description = S("Orange Trunk"),
	tiles = {"default_orange_trunk_top.png", "default_orange_trunk_top.png", "default_apple_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"default:orange_leaves", "default:orange_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "default:orange_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "default:orange_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "default:orange_leaves_blooming" then
					core.set_node(p, {name = "default:orange_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("default:orange_leaves", {
	description = S("Orange Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png"},
	inventory_image = leaf_image("default_citrus_leaves.png"),
	wield_image = leaf_image("default_citrus_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:orange_sapling"}, rarity = 20},
			{items = {"default:orange_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("default:orange_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png^default_orange_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:orange_sapling"}, rarity = 20},
			{items = {"default:orange_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("default:orange_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png^default_oranges.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	node_dig_prediction = "default:orange_leaves",
	drop = {
		items = {
			{items = {"default:orange 5"}},
			{items = {"default:orange 2"}, rarity = 2},
			{items = {"default:orange 4"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "default:orange_leaves"})
		local f = core.find_node_near(pos, 2, "default:orange_trunk")
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("default:orange_sapling", {
	description = S("Orange Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_orange_sapling.png"},
	inventory_image = "default_orange_sapling.png",
	wield_image = "default_orange_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:orange_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 6, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 4,
})


core.register_node("default:pine_trunk", {
	description = S("Pine Trunk"),
	tiles = {"default_pine_trunk_top.png", "default_pine_trunk_top.png", "default_pine_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, "default:pine_needles") then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			local meta = core.get_meta(p)
			if n.name == "default:pine_needles" and meta:get_string("pinecones") == "true" then
				core.set_node(p, {name = "default:pinecone_needles"})
				core.get_node_timer(pos):start(200)
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 3, flammable = 3, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("default:pine_wood", {
	description = S("Pine Wood Planks"),
	tiles = {"default_pine_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 4, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("default:pine_needles", {
	description = S("Pine Needles"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_pine_needles.png"},
	inventory_image = leaf_image("default_pine_needles.png"),
	wield_image = leaf_image("default_pine_needles.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 4, leaves = 1, resinous = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:pine_sapling"}, rarity = 20},
			{items = {"default:pine_needles"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("default:pinecone_needles", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_pine_needles.png^default_pinecones.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 4, leaves = 1},
	node_dig_prediction = "default:pine_needles",
	drop = {
		items = {
			{items = {"default:pine_nuts 3"}},
			{items = {"default:pine_nuts 2"}, rarity = 2},
			{items = {"default:pine_nuts 2"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "default:pine_needles"})
		local f = core.find_node_near(pos, 2, "default:pine_trunk")
		if f then
			local meta = core.get_meta(pos)
			meta:set_string("pinecones", "true")
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("default:pine_sapling", {
	description = S("Pine Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_pine_sapling.png"},
	inventory_image = "default_pine_sapling.png",
	wield_image = "default_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 7/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:pine_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 14, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	grown_height = 12,
	heat_min = 9,
	heat_max = 90,
	humidity_min = 24,
	humidity_max = 500,
})


core.register_node("default:coir_block", {
	description = S("Coir Block"),
	tiles = {"default_coir_block.png"},
	is_ground_content = false,
	on_construct = function(pos)
		core.get_node_timer(pos):start(1)
	end,
	on_timer = function(pos, elapsed)
		local timer = core.get_node_timer(pos)
		if core.find_node_near(pos, 1, {"default:water_source", "default:water_flowing"}) then
	for i=-1,1 do
	for j=-1,1 do
	for k=-1,1 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			timer:start(5)
			return
		end
		if (n.name == "default:water_source") or (n.name == "default:water_flowing") then
			core.remove_node(p)
			core.swap_node(pos, {name="default:coir_block_wet"})
			timer:start(270)
		end
	end
	end
	end
		else
			timer:start(3)
		end
	end,
	groups = {snappy = 2, oddly_breakable_by_hand = 3, flammable = 3, fall_damage_add_percent = -20},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("default:coir_block_wet", {
	description = S("Soaked Coir Block"),
	tiles = {"default_coir_block.png^[colorize:#0000ac:30"},
	is_ground_content = false,
	on_construct = function(pos)
		core.get_node_timer(pos):start(270)
	end,
	on_timer = function(pos, elapsed)
		local timer = core.get_node_timer(pos)
		if not core.find_node_near(pos, 1, {"default:water_source", "default:water_flowing"}) then
			core.swap_node(pos, {name="default:coir_block"})
			timer:start(3)
		else
			timer:start(270)
		end
	end,
	groups = {snappy = 2, oddly_breakable_by_hand = 3, fall_damage_add_percent = -20},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("default:seaweedy_wood", {
	description = S("Seaweed Covered Wood"),
	tiles = {"default_wood.png^[colorize:black:90^default_wood_seaweed.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1500, 12000))
	end,
	on_timer = function(pos)
		if not core.find_node_near(pos, 1, "group:water") then
			core.swap_node(pos, {name = "default:wood"})
		else
			core.get_node_timer(pos):start(math.random(1500, 12000))
		end
	end,
	groups = {choppy = 2, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("default:cactus", {
	description = S("Saguaro Cactus"),
	tiles = {"default_cactus_top.png", "default_cactus_top.png", "default_cactus_side.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, large_cactus = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
	on_punch = function(pos, node, user)
		local wielded = user:get_wielded_item()

		if wielded:get_count() == 0 then
			user:set_hp(user:get_hp() - 1)
		end
	end,
})

core.register_node("default:cactus_fruiting", {
	description = S("Saguaro Cactus Fruiting"),
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"default_cactus_fruiting.png"},
	inventory_image = "default_cactus_fruiting.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	walkable = false,
	sunlight_propagates = true,
	selection_box = default.plant_sbox,
	is_ground_content = false,
	groups = {snappy = 3, fleshy = 1, attached_node = 1},
	drop = {
		items = {
			{items = {"default:cactus_fruit 10", "farming:spent_biomasse"}},
			{items = {"default:cactus_fruit 2"}, rarity = 2}
		}
	},
	sounds = default.node_sound_fruits_defaults(),

	after_place_node = after_place_leaves,

	after_destruct = function(pos, oldnode)
		if oldnode.param2 == 0 then
			core.set_node(pos, {name = "default:cactus_fruit_mark"})
			core.get_node_timer(pos):start(math.random(300, 1500))
		end
	end,
})

core.register_node("default:cactus_fruit_mark", {
	description = S("Cactus Fruit Marker"),
	inventory_image = "default_cactus_fruit.png^default_invisible_node_overlay.png",
	wield_image = "default_cactus_fruit.png^default_invisible_node_overlay.png",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	groups = {attached_node = 1, not_in_creative_inventory = 1},
	on_timer = function(pos, elapsed)
		if core.get_node({x= pos.x, y= pos.y- 1, z= pos.z}).name ~= "default:cactus" then
			core.remove_node(pos)
		elseif core.get_node_light(pos) < 11 then
			core.get_node_timer(pos):start(200)
		else
			core.set_node(pos, {name = "default:cactus_fruiting"})
		end
	end
})

core.register_node("default:large_cactus_seedling", {
	description = S("Large Saguaro Cactus Seedling"),
	drawtype = "plantlike",
	tiles = {"default_large_cactus_seedling.png"},
	inventory_image = "default_large_cactus_seedling.png",
	wield_image = "default_large_cactus_seedling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -.5, -5/16, 5/16, .5, 5/16}
	},
	groups = {choppy = 3, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_wood_defaults(),

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:large_cactus_seedling",
			{x = -2, y = -1, z = -2},
			{x = 2, y = 9, z = 2},
			4)

		return itemstack
	end,

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1859, 3719))
	end,

	on_timer = function(pos)
		if not default.can_grow(pos, "sand") then
			core.get_node_timer(pos):start(300)
		else
			core.log("action", "A large cactus seedling grows into a large cactus at ".. core.pos_to_string(pos))
			default.grow_large_cactus(pos)
		end
	end,
	grown_height = 8,
})

core.register_node("default:reed", {
	description = S("Reed"),
	drawtype = "mesh",
	mesh = "reed.obj",
	tiles = {"default_reed.png"},
	inventory_image = "default_reed.png",
	wield_image = "default_reed.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -.5, -6/16, 6/16, .5, 6/16}
	},
	groups = {snappy = 3, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		default.dig_up(pos, oldnode, digger)
	end,
})

core.register_node("default:reed_block", {
	description = S("Wet Reed Block"),
	tiles = {"default_reed_block.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 1, hay = 2},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("default:reed_block_dry", {
	description = S("Dry Reed Block"),
	tiles = {"default_reed_block_dry.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, hay = 2},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("default:bulrush_1", {
	description = S("Bulrush"),
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.85,
	tiles = {"default_bulrush_1.png"},
	inventory_image = "default_bulrush_1.png",
	wield_image = "default_bulrush_1.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	on_use = core.item_eat(1),
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.25, .3}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_timer = function(pos, elapsed)
		local node = core.get_node(pos)
		flowers.flower_spread(pos, node)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	groups = {snappy = 3, water_flora = 1, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	sound = {eat = "hbhunger_eat_generic"}
})

core.register_node("default:bulrush_2", {
	description = S("Bulrush"),
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.85,
	tiles = {"default_bulrush_2.png"},
	inventory_image = "default_bulrush_2.png",
	wield_image = "default_bulrush_2.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	on_use = core.item_eat(1),
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.25, .3}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_timer = function(pos, elapsed)
		local node = core.get_node(pos)
		flowers.flower_spread(pos, node)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	groups = {snappy = 3, water_flora = 1, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	sound = {eat = "hbhunger_eat_generic"}
})

core.register_node("default:papyrus", {
	description = S("Cyperus Papyrus"),
	drawtype = "mesh",
	mesh = "plant_poof_3.obj",
	waving = 1,
	tiles = {"default_papyrus.png"},
	inventory_image = "default_papyrus.png",
	wield_image = "default_papyrus.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -.5, -6/16, 6/16, .5, 6/16}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_timer = function(pos, elapsed)
		local node = core.get_node(pos)
		flowers.flower_spread(pos, node)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	groups = {snappy = 3, water_flora = 1, attached_node = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("default:dry_shrub", {
	description = S("Dry Shrub"),
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	waving = 1,
	tiles = {"default_dry_shrub.png"},
	inventory_image = "default_dry_shrub.png",
	wield_image = "default_dry_shrub.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.plant_sbox,
})

core.register_node("default:subtrop_grass", {
	description = S("Subtropical Grass"),
	drawtype = "mesh",
	mesh = "grass.obj",
	waving = 1,
	tiles = {"default_subtrop_grass.png"},
	inventory_image = "default_subtrop_grass.png",
	wield_image = "default_subtrop_grass.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	on_rotate = screwdriver.rotate_simple,
	on_construct = function(pos)
		core.get_node_timer(pos):start(7)
	end,
	on_timer = default.fireflies,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.grass_sbox,

	on_place = function(itemstack, placer, pointd)
		-- place and rotate randomly
		local stack = ItemStack("default:subtrop_grass")
		local ret = core.item_place(stack, placer, pointd, math.random(0,3))
		return ItemStack("default:subtrop_grass "..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

core.register_node("default:jungle_grass_1", {
	description = S("Jungle Grass"),
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	waving = 1,
	tiles = {"default_jungle_grass_1.png"},
	inventory_image = "default_jungle_grass_3.png",
	wield_image = "default_jungle_grass_3.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, jungle_grass = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.plant_sbox,

	on_place = function(itemstack, placer, pointd)
		-- place a random grass node
		local stack = ItemStack("default:jungle_grass_".. math.random(1,3))
		local ret = core.item_place(stack, placer, pointd)
		return ItemStack("default:jungle_grass_1 "..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 3 do
	core.register_node("default:jungle_grass_".. i, {
		description = S("Jungle Grass"),
		drawtype = "mesh",
		mesh = "plant_poof_2.obj",
		waving = 1,
		tiles = {"default_jungle_grass_".. i ..".png"},
		inventory_image = "default_jungle_grass_".. i ..".png",
		wield_image = "default_jungle_grass_".. i ..".png",
		use_texture_alpha = "clip",
		paramtype = "light",
		light_source = 1,
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
			jungle_grass = 1, flammable = 1, not_in_creative_inventory = 1},
		drop = "default:jungle_grass_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = default.plant_sbox,
	})
end

core.register_node("default:swamp_grass_1", {
	description = S("Swamp Grass"),
	drawtype = "mesh",
	mesh = "grass.obj",
	waving = 1,
	tiles = {"default_swamp_grass_1.png"},
	inventory_image = "default_swamp_grass_3.png",
	wield_image = "default_swamp_grass_3.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	on_rotate = screwdriver.rotate_simple,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, swamp_grass = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.grass_sbox,

	on_place = function(itemstack, placer, pointd)
		-- place a random swamp grass node
		local stack = ItemStack("default:swamp_grass_".. math.random(1,5))
		local ret = core.item_place(stack, placer, pointd, math.random(0,3))
		return ItemStack("default:swamp_grass_1 "..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	core.register_node("default:swamp_grass_".. i, {
		description = S("Swamp Grass"),
		drawtype = "mesh",
		mesh = "grass.obj",
		waving = 1,
		tiles = {"default_swamp_grass_".. i ..".png"},
		inventory_image = "default_swamp_grass_".. i ..".png",
		wield_image = "default_swamp_grass_".. i ..".png",
		use_texture_alpha = "clip",
		paramtype = "light",
		paramtype2 = "facedir",
		light_source = 1,
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		on_rotate = screwdriver.rotate_simple,
		drop = "default:swamp_grass_1",
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
			swamp_grass = 1, flammable = 1, not_in_creative_inventory = 1},
		on_construct = function(pos)
			core.get_node_timer(pos):start(7)
		end,
		on_timer = default.fireflies,
		sounds = default.node_sound_leaves_defaults(),
		selection_box = default.grass_sbox,
	})
end

core.register_node("default:boston_fern", {
	description = S("Boston Fern"),
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	waving = 1,
	tiles = {"default_boston_fern.png"},
	inventory_image = "default_boston_fern.png",
	wield_image = "default_boston_fern.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.plant_sbox,
})

core.register_node("default:frost_grass", {
	description = S("Frost Grass"),
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"default_frost_grass.png"},
	inventory_image = "default_frost_grass.png",
	wield_image = "default_frost_grass.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	waving = 1,
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -.5, -5/16, 5/16, 5/16, 5/16}
	},
})


core.register_node("default:grass_1", {
	description = S("Grass"),
	drawtype = "mesh",
	mesh = "grass.obj",
	waving = 1,
	tiles = {"default_grass_1.png"},
	-- Use texture of a taller grass stage in inventory
	inventory_image = "default_grass_3.png",
	wield_image = "default_grass_3.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	on_rotate = screwdriver.rotate_simple,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, normal_grass = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.grass_sbox,

	on_place = function(itemstack, placer, pointd)
		-- place a random grass node
		local stack = ItemStack("default:grass_".. math.random(1,5))
		local ret = core.item_place(stack, placer, pointd, math.random(0,3))
		return ItemStack("default:grass_1 "..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	core.register_node("default:grass_".. i, {
		description = S("Grass"),
		drawtype = "mesh",
		mesh = "grass.obj",
		waving = 1,
		tiles = {"default_grass_".. i ..".png"},
		inventory_image = "default_grass_".. i ..".png",
		wield_image = "default_grass_".. i ..".png",
		use_texture_alpha = "clip",
		paramtype = "light",
		paramtype2 = "facedir",
		light_source = 1,
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		on_rotate = screwdriver.rotate_simple,
		drop = "default:grass_1",
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
			normal_grass = 1, flammable = 1, not_in_creative_inventory = 1},
		on_construct = function(pos)
			core.get_node_timer(pos):start(7)
		end,
		on_timer = default.fireflies,
		sounds = default.node_sound_leaves_defaults(),
		selection_box = default.grass_sbox,
	})
end


core.register_node("default:savanna_grass_1", {
	description = S("Savanna Grass"),
	drawtype = "mesh",
	mesh = "grass.obj",
	waving = 1,
	tiles = {"default_savanna_grass_1.png"},
	inventory_image = "default_savanna_grass_3.png",
	wield_image = "default_savanna_grass_3.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	on_rotate = screwdriver.rotate_simple,
	groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1, grass = 1, savanna_grass = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.grass_sbox,

	on_place = function(itemstack, placer, pointd)
		-- place a random savanna grass node
		local stack = ItemStack("default:savanna_grass_".. math.random(1, 5))
		local ret = core.item_place(stack, placer, pointd, math.random(0,3))
		return ItemStack("default:savanna_grass_1 "..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	core.register_node("default:savanna_grass_".. i, {
		description = S("Savanna Grass"),
		drawtype = "mesh",
		mesh = "grass.obj",
		waving = 1,
		tiles = {"default_savanna_grass_".. i ..".png"},
		inventory_image = "default_savanna_grass_".. i ..".png",
		wield_image = "default_savanna_grass_".. i ..".png",
		use_texture_alpha = "clip",
		paramtype = "light",
		paramtype2 = "facedir",
		light_source = 1,
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		on_rotate = screwdriver.rotate_simple,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1,
			grass = 1, savanna_grass = 1, not_in_creative_inventory = 1},
		drop = "default:savanna_grass_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = default.grass_sbox,
	})
end


core.register_node("default:fern_1", {
	description = S("Lady-fern (Athyrium)"),
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	waving = 1,
	tiles = {"default_fern_1.png"},
	inventory_image = "default_fern_3.png",
	wield_image = "default_fern_3.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1, fern = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.plant_sbox,

	on_place = function(itemstack, placer, pointd)
		-- place a random fern node
		local stack = ItemStack("default:fern_".. math.random(1, 3))
		local ret = core.item_place(stack, placer, pointd)
		return ItemStack("default:fern_1 "..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 3 do
	core.register_node("default:fern_" .. i, {
		description = S("Lady-fern (Athyrium)"),
		drawtype = "mesh",
		mesh = "plant_poof_2.obj",
		waving = 1,
		tiles = {"default_fern_" .. i .. ".png"},
		inventory_image = "default_fern_" .. i .. ".png",
		wield_image = "default_fern_" .. i .. ".png",
		use_texture_alpha = "clip",
		paramtype = "light",
		light_source = 1,
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1, fern = 1, not_in_creative_inventory = 1},
		drop = "default:fern_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = default.plant_sbox,
	})
end


core.register_node("default:marram_grass_1", {
	description = S("Marram Grass"),
	drawtype = "mesh",
	mesh = "grass.obj",
	waving = 1,
	tiles = {"default_marram_grass_1.png"},
	inventory_image = "default_marram_grass_1.png",
	wield_image = "default_marram_grass_1.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	on_rotate = screwdriver.rotate_simple,
	groups = {snappy = 3, flammable = 3, flora = 1, grass = 1, marram_grass = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.grass_sbox,

	on_place = function(itemstack, placer, pointd)
		-- place a random marram grass node
		local stack = ItemStack("default:marram_grass_".. math.random(1, 3))
		local ret = core.item_place(stack, placer, pointd, math.random(0,3))
		return ItemStack("default:marram_grass_1 "..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 3 do
	core.register_node("default:marram_grass_".. i, {
		description = S("Marram Grass"),
		drawtype = "mesh",
		mesh = "grass.obj",
		waving = 1,
		tiles = {"default_marram_grass_".. i ..".png"},
		inventory_image = "default_marram_grass_".. i ..".png",
		wield_image = "default_marram_grass_".. i ..".png",
		use_texture_alpha = "clip",
		paramtype = "light",
		paramtype2 = "facedir",
		light_source = 1,
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		on_rotate = screwdriver.rotate_simple,
		groups = {snappy = 3, flammable = 3, flora = 1, grass = 1, marram_grass = 1,
			attached_node = 1, not_in_creative_inventory = 1},
		drop = "default:marram_grass_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = default.grass_sbox,
	})
end


core.register_node("default:poison_ivy_1", {
	description = S("Poison Ivy"),
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	waving = 1,
	tiles = {"default_poison_ivy_1.png"},
	inventory_image = "default_poison_ivy_1.png",
	wield_image = "default_poison_ivy_1.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_timer = function(pos, elapsed)
		local node_under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		local timer = core.get_node_timer(pos)
		if not node_under then
			-- Node under not yet loaded, try later
			timer:start(300)
			return
		end

		-- Replace with dry shrub on desert sand and silver sand.
		if core.get_item_group(node_under.name, "sand") == 1 and
				node_under.name ~= "default:sand" then
			core.set_node(pos, {name = "default:dry_shrub"})
			return
		end

		if core.get_item_group(node_under.name, "soil") == 0 then
			timer:stop()
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
			timer:start(300)
			return
		end
		core.set_node(pos, {name = "default:poison_ivy_2"})
		timer:start(math.random(300, 1500))
	end,
	on_punch = function(pos, node, puncher)
		local wielded = puncher:get_wielded_item()

		if wielded:get_count() == 0 then
			puncher:set_hp(puncher:get_hp() - 1)
		end
	end,
	selection_box = default.plant_sbox,
	groups = {snappy = 3, poison = 1, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("default:poison_ivy_2", {
	description = S("Poison Ivy"),
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	waving = 1,
	tiles = {"default_poison_ivy_2.png"},
	inventory_image = "default_poison_ivy_2.png",
	wield_image = "default_poison_ivy_2.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_timer = function(pos, elapsed)
		local node_under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		local timer = core.get_node_timer(pos)
		if not node_under then
			timer:start(300)
			return
		end

		if core.get_item_group(node_under.name, "sand") == 1 and
				node_under.name ~= "default:sand" then
			core.set_node(pos, {name = "default:dry_shrub"})
			return
		end

		if core.get_item_group(node_under.name, "soil") == 0 then
			timer:stop()
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
			timer:start(300)
			return
		end
		core.set_node(pos, {name = "default:poison_ivy_3"})
		timer:start(math.random(300, 1500))
	end,
	on_punch = function(pos, node, puncher)
		local wielded = puncher:get_wielded_item()

		if wielded:get_count() == 0 then
			puncher:set_hp(puncher:get_hp() - 1)
		end
	end,
	selection_box = default.plant_sbox,
	groups = {snappy = 3, poison = 1, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("default:poison_ivy_3", {
	description = S("Poison Ivy"),
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	waving = 1,
	tiles = {"default_poison_ivy_3.png"},
	inventory_image = "default_poison_ivy_3.png",
	wield_image = "default_poison_ivy_3.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_timer = function(pos, elapsed)
		local node = core.get_node(pos)
		flowers.flower_spread(pos, node)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_punch = function(pos, node, puncher)
		local wielded = puncher:get_wielded_item()

		if wielded:get_count() == 0 then
			puncher:set_hp(puncher:get_hp() - 1)
		end
	end,
	selection_box = default.plant_sbox,
	groups = {snappy = 3, poison = 1, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("default:juncus_1", {
	description = S("Juncus"),
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	waving = 1,
	tiles = {"default_juncus_1.png"},
	inventory_image = "default_juncus_1.png",
	wield_image = "default_juncus_1.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.plant_sbox,

	on_place = function(itemstack, placer, pointd)
		-- place a random juncus node
		local stack = ItemStack("default:juncus_".. math.random(1, 2))
		local ret = core.item_place(stack, placer, pointd)
		return ItemStack("default:juncus_1 "..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

core.register_node("default:juncus_2", {
	description = S("Juncus"),
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	waving = 1,
	tiles = {"default_juncus_2.png"},
	inventory_image = "default_juncus_2.png",
	wield_image = "default_juncus_2.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1,
		flammable = 1, not_in_creative_inventory = 1},
	drop = "default:juncus_1",
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.plant_sbox,
})


core.register_node("default:bush_stem", {
	description = S("Bush Stem"),
	drawtype = "plantlike",
	visual_scale = 1.5,
	tiles = {"default_bush_stem.png"},
	inventory_image = "default_bush_stem.png",
	wield_image = "default_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	on_timer = function(pos, elapsed)
		local timer = core.get_node_timer(pos)
		for i=-1,1 do
		for j=-1,1 do
		for k=-1,1 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			timer:start(200)
			return
		end
		if not core.find_node_near(pos, 1, "default:bush_leaves") then
			timer:stop()
		elseif core.get_node_light(p) < 11 then
			timer:start(200)
		else
			local meta = core.get_meta(p)
			if n.name == "default:bush_leaves" and meta:get_string("bush_fruits") == "true" then
				core.set_node(p, {name = "default:bush_leaves_fruiting"})
				timer:start(200)
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -.5, -7/16, 7/16, .5, 7/16},
	},
})

core.register_node("default:bush_leaves", {
	description = S("Bush Leaves"),
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:bush_sapling"}, rarity = 5},
			{items = {"default:bush_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

core.register_node("default:bush_leaves_fruiting", {
	description = "Bush Leaves with Berries",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves_simple.png^default_bush_berry_overlay.png"},
	paramtype = "light",
	groups = {snappy = 3, dig_immediate = 2, flammable = 2, leaves = 1},
	drop = {
		items = {
			{items = {"default:bush_berry 28"}},
			{items = {"default:bush_berry 4"}, rarity = 2},
			{items = {"default:bush_berry 2"}, rarity = 2},
			{items = {"default:bush_berry 2"}, rarity = 3}
		}
	},
	sounds = default.node_sound_fruits_defaults(),
	node_dig_prediction = "default:bush_leaves",

	after_dig_node = function(pos)
		core.set_node(pos, {name = "default:bush_leaves"})
		local f = core.find_node_near(pos, 1, "default:bush_stem")
		if f then
			local meta = core.get_meta(pos)
			meta:set_string("bush_fruits", "true")
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,

	after_place_node = after_place_leaves,
})

core.register_node("default:bush_sapling", {
	description = S("Bush Sapling"),
	drawtype = "plantlike",
	tiles = {"default_bush_sapling.png"},
	inventory_image = "default_bush_sapling.png",
	wield_image = "default_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 2/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
	grown_height = 1,
})

core.register_node("default:blueberry_bush_leaves_fruiting", {
	description = S("Blueberry Bush Leaves with Berries"),
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_blueberry_bush_leaves.png^default_blueberry_overlay.png"},
	paramtype = "light",
	groups = {snappy = 3, dig_immediate = 2, flammable = 2, leaves = 1},
	drop = "default:blueberries",
	sounds = default.node_sound_fruits_defaults(),
	node_dig_prediction = "default:blueberry_bush_leaves",

	after_dig_node = function(pos)
		core.set_node(pos, {name = "default:blueberry_bush_leaves"})
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
})

core.register_node("default:blueberry_bush_leaves", {
	description = S("Blueberry Bush Leaves"),
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_blueberry_bush_leaves.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:blueberry_bush_sapling"}, rarity = 5},
			{items = {"default:blueberry_bush_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	on_timer = function(pos, elapsed)
		if core.get_node_light(pos) < 11 then
			core.get_node_timer(pos):start(200)
		else
			core.set_node(pos, {name = "default:blueberry_bush_leaves_fruiting"})
		end
	end,
})

core.register_node("default:blueberry_bush_sapling", {
	description = S("Blueberry Bush Sapling"),
	drawtype = "plantlike",
	tiles = {"default_blueberry_bush_sapling.png"},
	inventory_image = "default_blueberry_bush_sapling.png",
	wield_image = "default_blueberry_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 2/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:blueberry_bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
	grown_height = 1,
})

core.register_node("default:acacia_bush_stem", {
	description = S("Acacia Bush Stem"),
	drawtype = "plantlike",
	visual_scale = 1.5,
	tiles = {"default_acacia_bush_stem.png"},
	inventory_image = "default_acacia_bush_stem.png",
	wield_image = "default_acacia_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -.5, -7/16, 7/16, .5, 7/16},
	},
})

core.register_node("default:acacia_bush_leaves", {
	description = S("Acacia Bush Leaves"),
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_acacia_leaves_simple.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:acacia_bush_sapling"}, rarity = 5},
			{items = {"default:acacia_bush_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

core.register_node("default:acacia_bush_sapling", {
	description = S("Acacia Bush Sapling"),
	drawtype = "plantlike",
	tiles = {"default_acacia_bush_sapling.png"},
	inventory_image = "default_acacia_bush_sapling.png",
	wield_image = "default_acacia_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-3/16, -.5, -3/16, 3/16, 2/16, 3/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:acacia_bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
	grown_height = 1,
})

core.register_node("default:pine_bush_stem", {
	description = S("Pine Bush Stem"),
	drawtype = "plantlike",
	visual_scale = 1.5,
	tiles = {"default_pine_bush_stem.png"},
	inventory_image = "default_pine_bush_stem.png",
	wield_image = "default_pine_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -.5, -7/16, 7/16, .5, 7/16},
	},
})

core.register_node("default:pine_bush_needles", {
	description = S("Pine Bush Needles"),
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_pine_needles.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1, resinous = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:pine_bush_sapling"}, rarity = 5},
			{items = {"default:pine_bush_needles"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

core.register_node("default:pine_bush_sapling", {
	description = S("Pine Bush Sapling"),
	drawtype = "plantlike",
	tiles = {"default_pine_bush_sapling.png"},
	inventory_image = "default_pine_bush_sapling.png",
	wield_image = "default_pine_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -.5, -4/16, 4/16, 2/16, 4/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointd)
		itemstack = default.sapling_on_place(itemstack, placer, pointd,
			"default:pine_bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
	grown_height = 1,
})


local get_kelp_height = function(param2)
	return math.floor(param2 / 16)
end

core.register_node("default:kelp_brown", {
	description = S("Brown Kelp"),
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {{name = "default_kelp_brown.png", tileable_vertical = true}},
	inventory_image = "default_kelp_brown.png",
	wield_image = "default_kelp_brown.png",
	paramtype = "light",
	paramtype2 = "leveled",
	groups = {snappy = 3, seaweed = 1, seaweedy = 1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	drop = "",
	on_use = core.item_eat(2),
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-2/16, .5, -2/16, 2/16, 1.3, 2/16}
		}
	},
	on_timer = function(pos, elapsed)
		local p2 = core.get_node(pos).param2
		if p2 == 16 then
	default.under_water_growth(pos, 2, 6, "", 32, math.random(166, 286))
		elseif p2 == 32 then
	default.under_water_growth(pos, 3, 6, "", 48, math.random(166, 286))
		elseif p2 == 48 then
	default.under_water_growth(pos, 4, 6, "", 64, math.random(166, 286))
		elseif p2 == 64 then
	default.under_water_growth(pos, 5, 6, "", 80, math.random(166, 286))
		elseif p2 == 80 then
	default.under_water_growth(pos, 6, 6, "", 96, math.random(166, 286))
		elseif p2 == 96 then
	default.under_water_growth(pos, 7, 6, "", 112, math.random(166, 286))
		elseif p2 == 112 then
	default.under_water_spread(pos, 1, 6, "", math.random(166, 286))
		end
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	on_dig = function(pos, node, digger)
		-- Drop kelp as item; item count depends on height ( from Mineclone2 )
		local dname, inv = "", nil
		if digger then
			dname = digger:get_player_name()
			inv = digger:get_inventory()
		end
		if not core.is_creative_enabled(dname) then
	if inv and inv:room_for_item("main", "default:kelp_brown ".. get_kelp_height(node.param2)) then
		inv:add_item("main", "default:kelp_brown ".. get_kelp_height(node.param2))
	else
		core.add_item({x=pos.x, y=pos.y+1, z=pos.z}, "default:kelp_brown ".. get_kelp_height(node.param2))
	end
		end
		core.node_dig(pos, node, digger)
	end,
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
	if core.get_node(pos).name ~= "default:sand" then
		return itemstack
	end

	if pointd.above.y ~= pos.y+1 then
		return itemstack
	end

	local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
	local node_top = core.get_node(pos_top)
	local def_top = core.registered_nodes[node_top.name]
	local pname = placer:get_player_name()

	if def_top and def_top.liquidtype == "source" and
			core.get_item_group(node_top.name, "water") > 0 then
		if not core.is_protected(pos, pname) and
				not core.is_protected(pos_top, pname) then
			core.set_node(pos, {name = "default:kelp_brown", param2 = 16})
			core.get_node_timer(pos):start(math.random(166, 286))
			if not core.is_creative_enabled(pname) then
				itemstack:take_item()
			end
		else
			core.chat_send_player(pname, "Node is protected")
			core.record_protection_violation(pos, pname)
		end
	end

	return itemstack
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
	sound = {eat = "eat_soft"}
})

core.register_node("default:kelp_dark_green", {
	description = S("Dark Green Kelp"),
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {{name = "default_kelp_dark_green.png", tileable_vertical = true}},
	inventory_image = "default_kelp_dark_green.png",
	wield_image = "default_kelp_dark_green.png",
	paramtype = "light",
	paramtype2 = "leveled",
	groups = {snappy = 3, seaweed = 1, seaweedy = 1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	drop = "",
	on_use = core.item_eat(2),
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-2/16, .5, -2/16, 2/16, 1.3, 2/16}
		}
	},
	on_timer = function(pos, elapsed)
		local p2 = core.get_node(pos).param2
		if p2 == 16 then
	default.under_water_growth(pos, 2, 6, "", 32, math.random(166, 286))
		elseif p2 == 32 then
	default.under_water_growth(pos, 3, 6, "", 48, math.random(166, 286))
		elseif p2 == 48 then
	default.under_water_growth(pos, 4, 6, "", 64, math.random(166, 286))
		elseif p2 == 64 then
	default.under_water_growth(pos, 5, 6, "", 80, math.random(166, 286))
		elseif p2 == 80 then
	default.under_water_growth(pos, 6, 6, "", 96, math.random(166, 286))
		elseif p2 == 96 then
	default.under_water_growth(pos, 7, 6, "", 112, math.random(166, 286))
		elseif p2 == 112 then
	default.under_water_spread(pos, 1, 6, "", math.random(166, 286))
		end
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	on_dig = function(pos, node, digger)
		local dname, inv = "", nil
		if digger then
			dname = digger:get_player_name()
			inv = digger:get_inventory()
		end
		if not core.is_creative_enabled(dname) then
	if inv and inv:room_for_item("main", "default:kelp_dark_green ".. get_kelp_height(node.param2)) then
		inv:add_item("main", "default:kelp_dark_green ".. get_kelp_height(node.param2))
	else
		core.add_item({x=pos.x, y=pos.y+1, z=pos.z}, "default:kelp_dark_green ".. get_kelp_height(node.param2))
	end
		end
		core.node_dig(pos, node, digger)
	end,
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
	if core.get_node(pos).name ~= "default:sand" then
		return itemstack
	end

	if pointd.above.y ~= pos.y+1 then
		return itemstack
	end

	local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
	local node_top = core.get_node(pos_top)
	local def_top = core.registered_nodes[node_top.name]
	local pname = placer:get_player_name()

	if def_top and def_top.liquidtype == "source" and
			core.get_item_group(node_top.name, "water") > 0 then
		if not core.is_protected(pos, pname) and
				not core.is_protected(pos_top, pname) then
			core.set_node(pos, {name = "default:kelp_dark_green", param2 = 16})
			core.get_node_timer(pos):start(math.random(166, 286))
			if not core.is_creative_enabled(pname) then
				itemstack:take_item()
			end
		else
			core.chat_send_player(pname, "Node is protected")
			core.record_protection_violation(pos, pname)
		end
	end

	return itemstack
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
	sound = {eat = "eat_soft"}
})

core.register_node("default:kelp_green", {
	description = S("Green Kelp"),
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {{name = "default_kelp_green.png", tileable_vertical = true}},
	inventory_image = "default_kelp_green_tip.png",
	wield_image = "default_kelp_green.png",
	paramtype = "light",
	paramtype2 = "leveled",
	groups = {snappy = 3, seaweed = 1, seaweedy = 1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	drop = "",
	on_use = core.item_eat(2),
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-2/16, .5, -2/16, 2/16, 1.3, 2/16}
		}
	},
	on_timer = function(pos, elapsed)
		local p2 = core.get_node(pos).param2
		if p2 == 16 then
	default.under_water_growth(pos, 2, 6, "", 32, math.random(166, 286))
		elseif p2 == 32 then
	default.under_water_growth(pos, 3, 6, "", 48, math.random(166, 286))
		elseif p2 == 48 then
	default.under_water_growth(pos, 4, 6, "", 64, math.random(166, 286))
		elseif p2 == 64 then
	default.under_water_growth(pos, 5, 6, "", 80, math.random(166, 286))
		elseif p2 == 80 then
	default.under_water_growth(pos, 6, 6, "", 96, math.random(166, 286))
		elseif p2 == 96 then
	default.under_water_growth(pos, 7, 6, "", 112, math.random(166, 286))
		elseif p2 == 112 then
	default.under_water_spread(pos, 1, 6, "", math.random(166, 286))
		end
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	on_dig = function(pos, node, digger)
		local dname, inv = "", nil
		if digger then
			dname = digger:get_player_name()
			inv = digger:get_inventory()
		end
		if not core.is_creative_enabled(dname) then
	if inv and inv:room_for_item("main", "default:kelp_green ".. get_kelp_height(node.param2)) then
		inv:add_item("main", "default:kelp_green ".. get_kelp_height(node.param2))
	else
		core.add_item({x=pos.x, y=pos.y+1, z=pos.z}, "default:kelp_green ".. get_kelp_height(node.param2))
	end
		end
		core.node_dig(pos, node, digger)
	end,
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
	if core.get_node(pos).name ~= "default:sand" then
		return itemstack
	end

	if pointd.above.y ~= pos.y+1 then
		return itemstack
	end

	local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
	local node_top = core.get_node(pos_top)
	local def_top = core.registered_nodes[node_top.name]
	local pname = placer:get_player_name()

	if def_top and def_top.liquidtype == "source" and
			core.get_item_group(node_top.name, "water") > 0 then
		if not core.is_protected(pos, pname) and
				not core.is_protected(pos_top, pname) then
			core.set_node(pos, {name = "default:kelp_green", param2 = 16})
			core.get_node_timer(pos):start(math.random(166, 286))
			if not core.is_creative_enabled(pname) then
				itemstack:take_item()
			end
		else
			core.chat_send_player(pname, "Node is protected")
			core.record_protection_violation(pos, pname)
		end
	end

	return itemstack
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
	sound = {eat = "eat_soft"}
})

local kelp_image = "default_kelp_yellow.png"

if core.get_modpath("ecology") then
	kelp_image = "xocean_kelp.png"
end

core.register_node("default:kelp_yellow", {
	description = S("Yellow Kelp"),
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {{name = "default_kelp_yellow.png", tileable_vertical = true}},
	inventory_image = kelp_image,
	wield_image = kelp_image,
	paramtype = "light",
	paramtype2 = "leveled",
	groups = {snappy = 3, seaweed = 1, seaweedy = 1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	drop = "",
	on_use = core.item_eat(2),
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-2/16, .5, -2/16, 2/16, 1.3, 2/16}
		}
	},
	on_timer = function(pos, elapsed)
		local p2 = core.get_node(pos).param2
		if p2 == 16 then
	default.under_water_growth(pos, 2, 6, "", 32, math.random(166, 286))
		elseif p2 == 32 then
	default.under_water_growth(pos, 3, 6, "", 48, math.random(166, 286))
		elseif p2 == 48 then
	default.under_water_growth(pos, 4, 6, "", 64, math.random(166, 286))
		elseif p2 == 64 then
	default.under_water_growth(pos, 5, 6, "", 80, math.random(166, 286))
		elseif p2 == 80 then
	default.under_water_growth(pos, 6, 6, "", 96, math.random(166, 286))
		elseif p2 == 96 then
	default.under_water_growth(pos, 7, 6, "", 112, math.random(166, 286))
		elseif p2 == 112 then
	default.under_water_spread(pos, 1, 6, "", math.random(166, 286))
		end
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	on_dig = function(pos, node, digger)
		local dname, inv = "", nil
		if digger then
			dname = digger:get_player_name()
			inv = digger:get_inventory()
		end
		if not core.is_creative_enabled(dname) then
	if inv and inv:room_for_item("main", "default:kelp_yellow ".. get_kelp_height(node.param2)) then
		inv:add_item("main", "default:kelp_yellow ".. get_kelp_height(node.param2))
	else
		core.add_item({x=pos.x, y=pos.y+1, z=pos.z}, "default:kelp_yellow ".. get_kelp_height(node.param2))
	end
		end
		core.node_dig(pos, node, digger)
	end,
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
	if core.get_node(pos).name ~= "default:sand" then
		return itemstack
	end

	if pointd.above.y ~= pos.y+1 then
		return itemstack
	end

	local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
	local node_top = core.get_node(pos_top)
	local def_top = core.registered_nodes[node_top.name]
	local pname = placer:get_player_name()

	if def_top and def_top.liquidtype == "source" and
			core.get_item_group(node_top.name, "water") > 0 then
		if not core.is_protected(pos, pname) and
				not core.is_protected(pos_top, pname) then
			core.set_node(pos, {name = "default:kelp_yellow", param2 = 16})
			core.get_node_timer(pos):start(math.random(166, 286))
			if not core.is_creative_enabled(pname) then
				itemstack:take_item()
			end
		else
			core.chat_send_player(pname, "Node is protected")
			core.record_protection_violation(pos, pname)
		end
	end

	return itemstack
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
	sound = {eat = "eat_soft"}
})

core.register_node("default:seaweed", {
	description = S("Seaweed"),
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {{name = "default_seaweed.png", tileable_vertical = true}},
	inventory_image = "default_seaweed.png",
	wield_image = "default_seaweed.png",
	paramtype = "light",
	paramtype2 = "leveled",
	groups = {snappy = 3, seaweed = 1, seaweedy = 1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	drop = "",
	on_use = core.item_eat(2),
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-2/16, .5, -2/16, 2/16, 1.3, 2/16}
		}
	},
	on_timer = function(pos, elapsed)
		local p2 = core.get_node(pos).param2
		if p2 == 16 then
	default.under_water_growth(pos, 2, 6, "", 32, math.random(166, 286))
		elseif p2 == 32 then
	default.under_water_growth(pos, 3, 6, "", 48, math.random(166, 286))
		elseif p2 == 48 then
	default.under_water_growth(pos, 4, 6, "", 64, math.random(166, 286))
		elseif p2 == 64 then
	default.under_water_growth(pos, 5, 6, "", 80, math.random(166, 286))
		elseif p2 == 80 then
	default.under_water_growth(pos, 6, 6, "", 96, math.random(166, 286))
		elseif p2 == 96 then
	default.under_water_growth(pos, 7, 6, "", 112, math.random(166, 286))
		elseif p2 == 112 then
	default.under_water_spread(pos, 1, 6, "", math.random(166, 286))
		end
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	on_dig = function(pos, node, digger)
		local dname, inv = "", nil
		if digger then
			dname = digger:get_player_name()
			inv = digger:get_inventory()
		end
		if not core.is_creative_enabled(dname) then
	if inv and inv:room_for_item("main", "default:seaweed ".. get_kelp_height(node.param2)) then
		inv:add_item("main", "default:seaweed ".. get_kelp_height(node.param2))
	else
		core.add_item({x=pos.x, y=pos.y+1, z=pos.z}, "default:seaweed ".. get_height(node.param2))
	end
		end
		core.node_dig(pos, node, digger)
	end,
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
	if core.get_node(pos).name ~= "default:sand" then
		return itemstack
	end

	if pointd.above.y ~= pos.y+1 then
		return itemstack
	end

	local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
	local node_top = core.get_node(pos_top)
	local def_top = core.registered_nodes[node_top.name]
	local pname = placer:get_player_name()

	if def_top and def_top.liquidtype == "source" and
			core.get_item_group(node_top.name, "water") > 0 then
		if not core.is_protected(pos, pname) and
				not core.is_protected(pos_top, pname) then
			core.set_node(pos, {name = "default:seaweed", param2 = 16})
			core.get_node_timer(pos):start(math.random(166, 286))
			if not core.is_creative_enabled(pname) then
				itemstack:take_item()
			end
		else
			core.chat_send_player(pname, "Node is protected")
			core.record_protection_violation(pos, pname)
		end
	end

	return itemstack
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
	sound = {eat = "eat_soft"}
})

local def = {
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {"default_alga_1.png"},
	paramtype = "light",
	groups = {snappy = 3, seaweed = 1, seaweedy = 1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-1/16, .5, -1/16, 1/16, .7, 1/16},
		},
	},
	on_timer = function(pos, elapsed)
		default.under_water_growth(pos, 1, 6, "default:sand_with_alga_2", 0, math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
}

core.register_node("default:sand_with_alga_1", table.copy(def))

def.special_tiles = {"default_alga_2.png"}
def.selection_box = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, .5, .5},
		{-1/16, .5, -1/16, 1/16, .8, 1/16},
	},
}
def.on_timer = function(pos, elapsed)
	default.under_water_growth(pos, 1, 6, "default:sand_with_alga_3", 0, math.random(166, 286))
end
def.after_destruct = function(pos, oldnode)
	core.set_node(pos, {name = "default:sand_with_alga_1"})
	core.get_node_timer(pos):start(math.random(166, 286))
end
core.register_node("default:sand_with_alga_2", table.copy(def))

def.special_tiles = {"default_alga_3.png"}
def.selection_box = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, .5, .5},
		{-1/16, .5, -1/16, 1/16, 1., 1/16},
	},
}
def.on_timer = function(pos, elapsed)
	default.under_water_growth(pos, 1, 6, "default:sand_with_alga_4", 0, math.random(166, 286))
end
core.register_node("default:sand_with_alga_3", table.copy(def))

def.special_tiles = {"default_alga_4.png"}
def.selection_box = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, .5, .5},
		{-1/16, .5, -1/16, 1/16, 1.1, 1/16},
	},
}
def.on_timer = function(pos, elapsed)
	default.under_water_growth(pos, 1, 6, "default:sand_with_alga_5", 0, math.random(166, 286))
end
core.register_node("default:sand_with_alga_4", table.copy(def))

def.special_tiles = {"default_alga_5.png"}
def.selection_box = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, .5, .5},
		{-1/16, .5, -1/16, 1/16, 1.3, 1/16},
	},
}
def.on_timer = function(pos, elapsed)
	default.under_water_growth(pos, 1, 6, "default:alga", 0, math.random(166, 286))
end
core.register_node("default:sand_with_alga_5", table.copy(def))

def.description = S("Alga")
def.special_tiles = {"default_alga_6.png"}
def.inventory_image = "default_alga_6.png"
def.wield_image = "default_alga_6.png"
def.drop = "default:alga"
def.on_use = core.item_eat(2)
def.selection_box = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, .5, .5},
		{-1/16, .5, -1/16, 1/16, 1.4, 1/16},
	},
}
def.on_place = function(itemstack, placer, pointd)
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
	if core.get_node(pos).name ~= "default:sand" then
		return itemstack
	end

	if pointd.above.y ~= pos.y+1 then
		return itemstack
	end

	local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
	local node_top = core.get_node(pos_top)
	local def_top = core.registered_nodes[node_top.name]
	local pname = placer:get_player_name()

	if def_top and def_top.liquidtype == "source" and
			core.get_item_group(node_top.name, "water") > 0 then
		if not core.is_protected(pos, pname) and
				not core.is_protected(pos_top, pname) then
			core.set_node(pos, {name = "default:sand_with_alga_1"})
			core.get_node_timer(pos):start(math.random(166, 286))
			if not core.is_creative_enabled(pname) then
				itemstack:take_item()
			end
		else
			core.chat_send_player(pname, "Node is protected")
			core.record_protection_violation(pos, pname)
		end
	end

	return itemstack
end
def.on_timer = function(pos, elapsed)
	default.under_water_spread(pos, 1, 6, "default:sand_with_alga_1", math.random(166, 286))
end
core.register_node("default:alga", table.copy(def))

local def = {
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {"default_seagrass_1.png"},
	paramtype = "light",
	groups = {snappy = 3, seaweed = 1, seaweedy = 1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-5/16, .5, -5/16, 5/16, .8, 5/16},
		},
	},
	on_timer = function(pos, elapsed)
		default.under_water_growth(pos, 1, 6, "default:sand_with_seagrass_2", 0, math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
}

core.register_node("default:sand_with_seagrass_1", table.copy(def))

def.special_tiles = {"default_seagrass_2.png"}
def.on_timer = function(pos, elapsed)
	default.under_water_growth(pos, 1, 6, "default:sand_with_seagrass_3", 0, math.random(166, 286))
end
def.after_destruct = function(pos, oldnode)
	core.set_node(pos, {name = "default:sand_with_seagrass_1"})
	core.get_node_timer(pos):start(math.random(166, 286))
end
core.register_node("default:sand_with_seagrass_2", table.copy(def))

def.special_tiles = {"default_seagrass_3.png"}
def.on_timer = function(pos, elapsed)
	default.under_water_growth(pos, 1, 6, "default:sand_with_seagrass_4", 0, math.random(166, 286))
end
core.register_node("default:sand_with_seagrass_3", table.copy(def))

def.special_tiles = {"default_seagrass_4.png"}
def.on_timer = function(pos, elapsed)
	default.under_water_growth(pos, 1, 6, "default:seagrass", 0, math.random(166, 286))
end
core.register_node("default:sand_with_seagrass_4", table.copy(def))

def.description = S("Seagrass")
def.special_tiles = {"default_seagrass_5.png"}
def.inventory_image = "default_seagrass.png"
def.wield_image = "default_seagrass.png"
def.on_use = core.item_eat(2)
def.drop = {
	items = {
		{items = {"default:seagrass"}},
		{items = {"default:seagrass"}, rarity = 3}
	}
}
def.on_place = function(itemstack, placer, pointd)
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
	if core.get_node(pos).name ~= "default:sand" then
		return itemstack
	end

	if pointd.above.y ~= pos.y+1 then
		return itemstack
	end

	local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
	local node_top = core.get_node(pos_top)
	local def_top = core.registered_nodes[node_top.name]
	local pname = placer:get_player_name()

	if def_top and def_top.liquidtype == "source" and
			core.get_item_group(node_top.name, "water") > 0 then
		if not core.is_protected(pos, pname) and
				not core.is_protected(pos_top, pname) then
			core.set_node(pos, {name = "default:sand_with_seagrass_1"})
			core.get_node_timer(pos):start(math.random(166, 286))
			if not core.is_creative_enabled(pname) then
				itemstack:take_item()
			end
		else
			core.chat_send_player(pname, "Node is protected")
			core.record_protection_violation(pos, pname)
		end
	end

	return itemstack
end
def.on_timer = function(pos, elapsed)
	default.under_water_spread(pos, 1, 6, "default:sand_with_seagrass_1", math.random(166, 286))
end
def.sound = {eat = "eat_soft"}
core.register_node("default:seagrass", table.copy(def))

core.register_node("default:seagrass_green", {
	description = S("Green Seagrass"),
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {"default_seagrass_green.png"},
	inventory_image = "default_seagrass_green.png",
	wield_image = "default_seagrass_green.png",
	paramtype = "light",
	on_use = core.item_eat(2),
	groups = {snappy = 3, seaweed = 1, seaweedy = 1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-5/16, .5, -5/16, 5/16, .8, 5/16},
		},
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
		if core.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "default:seagrass_green"})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.under_water_spread(pos, 1, 6, "", math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
	sound = {eat = "eat_soft"}
})

core.register_node("default:seagrass_red", {
	description = S("Red Seagrass"),
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {"default_seagrass_red.png"},
	inventory_image = "default_seagrass_red.png",
	wield_image = "default_seagrass_red.png",
	paramtype = "light",
	on_use = core.item_eat(2),
	groups = {snappy = 3, seaweed = 1, seaweedy = 1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.3, 4/16},
		},
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
		if core.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "default:seagrass_red"})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.under_water_spread(pos, 1, 6, "", math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
	sound = {eat = "eat_soft"}
})

core.register_node("default:seaweed_grass", {
	description = "Seaweed Grass",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_dirt.png^default_seaweed_grass_top.png", "default_dirt.png"},
	special_tiles = {"default_seaweed_grass.png"},
	inventory_image = "default_seaweed_grass.png",
	wield_image = "default_seaweed_grass.png",
	paramtype = "light",
	groups = {snappy = 3, seaweed = 1, seaweedy = 1},
	node_dig_prediction = "default:dirt",
	node_placement_prediction = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-5/16, .5, -5/16, 5/16, .8, 5/16},
		},
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
		if core.get_node(pos).name ~= "default:dirt" then
			return itemstack
		end

		if pointd.above.y ~= pos.y+1 then
			return itemstack
		end

		local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_top = core.get_node(pos_top)
		local def_top = core.registered_nodes[node_top.name]
		local pname = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				core.get_item_group(node_top.name, "water") > 0 then
			if not core.is_protected(pos, pname) and
					not core.is_protected(pos_top, pname) then
				core.set_node(pos, {name = "default:seaweed_grass"})
				core.get_node_timer(pos):start(math.random(166, 286))
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
			else
				core.chat_send_player(pname, "Node is protected")
				core.record_protection_violation(pos, pname)
			end
		end

		return itemstack
	end,
	on_timer = function(pos, elapsed)
		default.under_water_spread(pos, 1, 6, "", math.random(166, 286))
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:dirt"})
	end,
	sounds = default.node_sound_dirt_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
		footstep = {name="default_grass_footstep", gain= .1},
	}),
})

local def = {
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {"default_sea_anemone_1.png"},
	paramtype = "light",
	damage_per_second = 1,
	groups = {snappy = 3, sea_anemone = 1},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, .6, 4/16},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, .39, .5},
	},
	on_timer = function(pos, elapsed)
		default.under_water_growth(pos, 1, 6, "default:sand_with_sea_anemone_2", 0, math.random(166, 286))
	end,
	on_punch = function(pos, node, puncher)
		local wielded = puncher:get_wielded_item()

		if wielded:get_count() == 0 then
			puncher:set_hp(puncher:get_hp() - 1)
		end
	end,
	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:sand"})
	end,
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),
}

core.register_node("default:sand_with_sea_anemone_1", table.copy(def))

def.special_tiles = {"default_sea_anemone_2.png"}
def.selection_box = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, .5, .5},
		{-4/16, .5, -4/16, 4/16, .7, 4/16},
	},
}
def.on_timer = function(pos, elapsed)
	default.under_water_growth(pos, 1, 6, "default:sand_with_sea_anemone_3", 0, math.random(166, 286))
end
def.after_destruct = function(pos, oldnode)
	core.set_node(pos, {name = "default:sand_with_sea_anemone_1"})
	core.get_node_timer(pos):start(math.random(166, 286))
end
core.register_node("default:sand_with_sea_anemone_2", table.copy(def))

def.special_tiles = {"default_sea_anemone_3.png"}
def.selection_box = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, .5, .5},
		{-4/16, .5, -4/16, 4/16, .9, 4/16},
	},
}
def.on_timer = function(pos, elapsed)
	default.under_water_growth(pos, 1, 6, "default:sand_with_sea_anemone_4", 0, math.random(166, 286))
end
core.register_node("default:sand_with_sea_anemone_3", table.copy(def))

def.special_tiles = {"default_sea_anemone_4.png"}
def.selection_box = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, .5, .5},
		{-4/16, .5, -4/16, 4/16, 1., 4/16},
	},
}
def.on_timer = function(pos, elapsed)
	default.under_water_growth(pos, 1, 6, "default:sea_anemone", 0, math.random(166, 286))
end
core.register_node("default:sand_with_sea_anemone_4", table.copy(def))

def.description = S("Sea Anemone")
def.special_tiles = {"default_sea_anemone_5.png"}
def.inventory_image = "default_sea_anemone.png"
def.wield_image = "default_sea_anemone.png"
def.drop = "default:sea_anemone"
def.on_use = core.item_eat(-3)
def.selection_box = {
	type = "fixed",
	fixed = {
		{-.5, -.5, -.5, .5, .5, .5},
		{-4/16, .5, -4/16, 4/16, 1.3, 4/16},
	},
}
def.on_place = function(itemstack, placer, pointd)
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
	if core.get_node(pos).name ~= "default:sand" then
		return itemstack
	end

	if pointd.above.y ~= pos.y+1 then
		return itemstack
	end

	local pos_top = {x = pos.x, y = pos.y + 1, z = pos.z}
	local node_top = core.get_node(pos_top)
	local def_top = core.registered_nodes[node_top.name]
	local pname = placer:get_player_name()

	if def_top and def_top.liquidtype == "source" and
			core.get_item_group(node_top.name, "water") > 0 then
		if not core.is_protected(pos, pname) and
				not core.is_protected(pos_top, pname) then
			core.set_node(pos, {name = "default:sand_with_sea_anemone_1"})
			core.get_node_timer(pos):start(math.random(166, 286))
			if not core.is_creative_enabled(pname) then
				itemstack:take_item()
			end
		else
			core.chat_send_player(pname, "Node is protected")
			core.record_protection_violation(pos, pname)
		end
	end

	return itemstack
end
def.on_timer = function(pos, elapsed)
	default.under_water_spread(pos, 1, 6, "default:sand_with_sea_anemone_1", math.random(166, 286), "group:sea_anemone")
end
def.sound = {eat = "eat_soft"}
core.register_node("default:sea_anemone", table.copy(def))


--- Corals

local function coral_on_place(itemstack, placer, pointd)
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

	if node_under.name ~= "default:coral_skeleton" or
			core.get_node(pos_above).name ~= "default:water_source" then
		return itemstack
	end

	if pos_above.y ~= pos_under.y+1 then
		return itemstack
	end

	if core.is_protected(pos_under, pname) or
			core.is_protected(pos_above, pname) then
		core.record_protection_violation(pos_under, pname)
		return itemstack
	end

	node_under.name = itemstack:get_name()
	core.set_node(pos_under, node_under)
	if not core.is_creative_enabled(pname) then
		itemstack:take_item()
	end

	return itemstack
end

core.register_node("default:coral_blue", {
	description = S("Blue Coral"),
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"default_coral_skeleton.png"},
	special_tiles = {"default_coral_blue.png"},
	inventory_image = "default_coral_blue.png",
	wield_image = "default_coral_blue.png",
	groups = {crumbly = 2, coraly = 1, timer_check = 1},
	drop = "default:coral_skeleton_tip",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.2, 4/16},
		},
	},
	node_dig_prediction = "default:coral_skeleton",
	node_placement_prediction = "",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),

	on_place = coral_on_place,

	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:coral_skeleton"})
	end,
})

core.register_node("default:coral_cyan", {
	description = S("Cyan Coral"),
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"default_coral_skeleton.png"},
	special_tiles = {"default_coral_cyan.png"},
	inventory_image = "default_coral_cyan.png",
	wield_image = "default_coral_cyan.png",
	groups = {crumbly = 2, coraly = 1, timer_check = 1},
	drop = "default:coral_skeleton_tip",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.2, 4/16},
		},
	},
	node_dig_prediction = "default:coral_skeleton",
	node_placement_prediction = "",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),

	on_place = coral_on_place,

	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:coral_skeleton"})
	end,
})

core.register_node("default:coral_green", {
	description = S("Green Coral"),
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"default_coral_skeleton.png"},
	special_tiles = {"default_coral_green.png"},
	inventory_image = "default_coral_green.png",
	wield_image = "default_coral_green.png",
	groups = {crumbly = 2, coraly = 1, timer_check = 1},
	drop = "default:coral_skeleton_tip",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.4, 4/16},
		},
	},
	node_dig_prediction = "default:coral_skeleton",
	node_placement_prediction = "",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),

	on_place = coral_on_place,

	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:coral_skeleton"})
	end,
})

core.register_node("default:coral_magenta_tip", {
	description = S("Magenta Coral Tip"),
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"default_coral_magenta.png"},
	special_tiles = {"default_coral_magenta_tip.png"},
	inventory_image = "default_coral_magenta_tip.png",
	wield_image = "default_coral_magenta_tip.png",
	groups = {crumbly = 2, coraly = 1, timer_check = 1},
	drop = "default:coral_skeleton_tip",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.4, 4/16},
		},
	},
	node_dig_prediction = "default:coral_magenta",
	node_placement_prediction = "",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),

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

	if node_under.name ~= "default:coral_magenta" or
			core.get_node(pos_above).name ~= "default:water_source" then
		return itemstack
	end

	if pos_above.y ~= pos_under.y+1 then
		return itemstack
	end

	if core.is_protected(pos_under, pname) or
			core.is_protected(pos_above, pname) then
core.log("action", pname .. " tried to place default:coral_magenta_tip at protected position " .. core.pos_to_string(pos_under))
		core.record_protection_violation(pos_under, pname)
		return itemstack
	end

	core.set_node(pos_under, {name = "default:coral_magenta_tip"})
	if not core.is_creative_enabled(pname) then
		itemstack:take_item()
	end

	return itemstack
	end,

	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:coral_magenta"})
	end,
})

core.register_node("default:coral_red", {
	description = S("Red Coral"),
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"default_coral_skeleton.png"},
	special_tiles = {"default_coral_red.png"},
	inventory_image = "default_coral_red.png",
	wield_image = "default_coral_red.png",
	groups = {crumbly = 2, coraly = 1, timer_check = 1},
	drop = "default:coral_skeleton_tip",
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.2, 4/16},
		},
	},
	node_dig_prediction = "default:coral_skeleton",
	node_placement_prediction = "",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),

	on_place = coral_on_place,

	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:coral_skeleton"})
	end,
})

core.register_node("default:coral_skeleton_tip", {
	description = S("Coral Skeleton Tip"),
	drawtype = "plantlike_rooted",
	paramtype = "light",
	tiles = {"default_coral_skeleton.png"},
	special_tiles = {"default_coral_skeleton_tip.png"},
	inventory_image = "default_coral_skeleton_tip.png",
	wield_image = "default_coral_skeleton_tip.png",
	groups = {crumbly = 2},
	selection_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-4/16, .5, -4/16, 4/16, 1.2, 4/16},
		},
	},
	node_dig_prediction = "default:coral_skeleton",
	node_placement_prediction = "",
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = .2},
		dug = {name = "default_grass_footstep", gain = .25},
	}),

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

	if node_under.name ~= "default:coral_skeleton" then
		return itemstack
	end

	if pos_above.y ~= pos_under.y+1 then
		return itemstack
	end

	if core.is_protected(pos_under, pname) or
			core.is_protected(pos_above, pname) then
core.log("action", pname .. " tried to place default:coral_skeleton_tip at protected position " .. core.pos_to_string(pos_under))
		core.record_protection_violation(pos_under, pname)
		return itemstack
	end

	core.set_node(pos_under, {name = "default:coral_skeleton_tip"})
	if not core.is_creative_enabled(pname) then
		itemstack:take_item()
	end

	return itemstack
	end,

	after_destruct = function(pos, oldnode)
		core.set_node(pos, {name = "default:coral_skeleton"})
	end,
})

core.register_node("default:coral_brown", {
	description = S("Brown Coral"),
	tiles = {"default_coral_brown.png"},
	groups = {cracky = 3, crumbly = 1, coraly = 2, timer_check = 1},
	drop = "default:coral_skeleton",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:coral_magenta", {
	description = S("Magenta Coral"),
	tiles = {"default_coral_magenta.png"},
	groups = {cracky = 3, crumbly = 1, coraly = 2, timer_check = 1},
	drop = "default:coral_skeleton",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:coral_orange", {
	description = S("Orange Coral"),
	tiles = {"default_coral_orange.png"},
	groups = {cracky = 3, crumbly = 1, coraly = 2, timer_check = 1},
	drop = "default:coral_skeleton",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(5, 9))
	end,
	on_timer = default.is_coral_submerged,
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:coral_skeleton", {
	description = S("Coral Skeleton"),
	tiles = {"default_coral_skeleton.png"},
	groups = {cracky = 3, crumbly = 1},
	sounds = default.node_sound_stone_defaults(),
})


--- Liquids

core.register_node("default:water_source", {
	description = S("Water Source"),
	drawtype = "liquid",
	waving = 3,
	tiles = {{
		name = "default_water_source_animated.png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.},
		},
		{
		name = "default_water_source_animated.png",
		backface_culling = true,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.},
	}},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "default:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	on_timer = default.water_freezing,
	groups = {water = 3, liquid = 3, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

local flow_speed = .5

if core.get_modpath("detectable_texturepack") then
	flow_speed = 1
end

core.register_node("default:water_flowing", {
	description = S("Flowing Water"),
	drawtype = "flowingliquid",
	waving = 3,
	tiles = {"default_water.png"},
	special_tiles = {{
		name = "default_water_flowing_animated.png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = flow_speed},
		},
		{
		name = "default_water_flowing_animated.png",
		backface_culling = true,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = .5},
	}},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "default:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, cools_lava = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_water_defaults(),
})


core.register_node("default:fresh_water_source", {
	description = S("Fresh Water Source"),
	drawtype = "liquid",
	tiles = {{
		name = "default_fresh_water_source_animated.png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.},
		},
		{
		name = "default_fresh_water_source_animated.png",
		backface_culling = true,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.},
	}},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:fresh_water_flowing",
	liquid_alternative_source = "default:fresh_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,	-- Instead renewable by bucket
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	on_timer = default.water_freezing,
	groups = {water = 3, liquid = 3, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

core.register_node("default:fresh_water_flowing", {
	description = S("Flowing Fresh Water"),
	drawtype = "flowingliquid",
	tiles = {"default_fresh_water.png"},
	special_tiles = {{
		name = "default_fresh_water_flowing_animated.png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = flow_speed},
		},
		{
		name = "default_fresh_water_flowing_animated.png",
		backface_culling = true,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = .5},
	}},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:fresh_water_flowing",
	liquid_alternative_source = "default:fresh_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, cools_lava = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_water_defaults(),
})


core.register_node("default:lava_source", {
	description = S("Lava Source"),
	drawtype = "liquid",
	tiles = {{
		name = "default_lava_source_animated.png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.},
		},
		{
		name = "default_lava_source_animated.png",
		backface_culling = true,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.},
	}},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:lava_flowing",
	liquid_alternative_source = "default:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1},
})

core.register_node("default:lava_flowing", {
	description = S("Flowing Lava"),
	drawtype = "flowingliquid",
	tiles = {"default_lava.png"},
	special_tiles = {{
		name = "default_lava_flowing_animated.png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3},
		},
		{
		name = "default_lava_flowing_animated.png",
		backface_culling = true,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3},
	}},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:lava_flowing",
	liquid_alternative_source = "default:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1, not_in_creative_inventory = 1},
})


--- Tools / "Advanced" crafting / Non-"natural"

local bookshelf_formspec =
	"size[8,7;]" ..
	"list[context;books;0,.3;8,2;]" ..
	"list[current_player;main;0,2.85;8,1;]" ..
	"list[current_player;main;0,4.08;8,3;8]" ..
	"listring[context;books]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0,2.85)

local function update_bookshelf(pos)
	local meta = core.get_meta(pos)
	local inv = meta:get_inventory()
	local invlist = inv:get_list("books")

	local formspec = bookshelf_formspec
	-- Inventory slots overlay
	local bx, by = 0, .3
	local n_written, n_empty = 0, 0
	for i = 1, 16 do
		if i == 9 then
			bx = 0
			by = by + 1
		end
		local stack = invlist[i]
		if stack:is_empty() then
			formspec = formspec ..
				"image[" .. bx .. "," .. by .. ";1,1;default_bookshelf_slot.png]"
		else
			local metatable = stack:get_meta():to_table() or {}
			if metatable.fields and metatable.fields.text then
				n_written = n_written + stack:get_count()
			else
				n_empty = n_empty + stack:get_count()
			end
		end
		bx = bx + 1
	end
	meta:set_string("formspec", formspec)
	if n_written + n_empty == 0 then
		meta:set_string("infotext", S("Empty Bookshelf"))
	else
		meta:set_string("infotext", S("Bookshelf (@1 written, @2 empty books)", n_written, n_empty))
	end
end

local default_bookshelf_def = {
	description = S("Bookshelf"),
	tiles = {"default_wood.png", "default_wood.png", "default_wood.png",
		"default_wood.png", "default_bookshelf.png", "default_bookshelf.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size("books", 8 * 2)
		update_bookshelf(pos)
	end,
	can_dig = function(pos, player)
		local inv = core.get_meta(pos):get_inventory()
		return inv:is_empty("books")
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack)
		if core.get_item_group(stack:get_name(), "book") ~= 0 then
			return stack:get_count()
		end
		return 0
	end,
	on_metadata_inventory_put = function(pos)
		update_bookshelf(pos)
	end,
	on_metadata_inventory_take = function(pos)
		update_bookshelf(pos)
	end,
	on_metadata_inventory_move = function(pos)
		update_bookshelf(pos)
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "books", drops)
		drops[#drops+1] = "default:bookshelf"
		core.remove_node(pos)
		return drops
	end,
}
default.set_inventory_action_loggers(default_bookshelf_def, "bookshelf")
core.register_node("default:bookshelf", default_bookshelf_def)

local function register_sign(material, desc, def)
	core.register_node("default:sign_wall_".. material, {
		description = desc,
		drawtype = "nodebox",
		tiles = {"default_sign_wall_".. material ..".png"},
		inventory_image = "default_sign_".. material ..".png",
		wield_image = "default_sign_".. material ..".png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		use_texture_alpha = "opaque",
		node_box = {
			type = "wallmounted",
			wall_top = {-7/16, 7/16, -5/16, 7/16, .5, 5/16},
			wall_bottom = {-7/16, -.5, -5/16, 7/16, -7/16, 5/16},
			wall_side = {-.5, -5/16, -7/16, -7/16, 5/16, 7/16}
		},
		groups = def.groups,
		legacy_wallmounted = true,
		sounds = def.sounds,

		on_construct = function(pos)
			local meta = core.get_meta(pos)
			meta:set_string("formspec", "field[text;;${text}]")
		end,
		on_receive_fields = function(pos, formname, fields, sender)
			if not fields.quit then
				return -- workaround for https://github.com/luanti-org/luanti/issues/16187
			end
			local pname = sender:get_player_name()
			if core.is_protected(pos, pname) then
				core.record_protection_violation(pos, pname)
				return
			end
			local text = fields.text
			if not text then
				return
			end
			if #text > 512 then
				core.chat_send_player(pname, S("Text too long"))
				return
			end
			text = text:gsub("[%z-\8\11-\31\127]", "") -- strip naughty control characters (keeps \t and \n)
			default.log_player_action(sender, ("wrote %q to the sign at"):format(text), pos)
			local meta = core.get_meta(pos)
			meta:set_string("text", text)

			if #text > 0 then
				meta:set_string("infotext", S('"@1"', text))
			else
				meta:set_string("infotext", '')
			end
		end,
	})
end

register_sign("wood", S("Wooden Sign"), {
	sounds = default.node_sound_wood_defaults(),
	groups = {choppy = 2, attached_node = 1, flammable = 2, oddly_breakable_by_hand = 3}
})

register_sign("steel", S("Steel Sign"), {
	sounds = default.node_sound_metal_defaults(),
	groups = {cracky = 2, attached_node = 1}
})

core.register_node("default:ladder_wood", {
	description = S("Wooden Ladder"),
	drawtype = "nodebox",
	tiles = {"default_ladder_wood.png", "default_ladder_wood.png", "default_wood.png"},
	inventory_image = "default_ladder_wood.png",
	wield_image = "default_ladder_wood.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-6/16, -.5, -.5, -.25, -6/16, .5}, -- struts
			{.25, -.5, -.5, 6/16, -6/16, .5},
			{-7/16, -.5, 5/16, 7/16, -6/16, 7/16}, -- rungs
			{-7/16, -.5, 1/16, 7/16, -6/16, 3/16},
			{-7/16, -.5, -3/16, 7/16, -6/16, -1/16},
			{-7/16, -.5, -7/16, 7/16, -6/16, -5/16}
		}
	},
	selection_box = {
		type = "wallmounted",
		wall_top = {-7/16, 6/16, -.5, 7/16, .5, .5},
		wall_side = {-.5, -.5, -7/16, -6/16, .5, 7/16},
		wall_bottom = {-7/16, -.5, -.5, 7/16, -6/16, .5}
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("default:ladder_stone", {
	description = S("Stone Ladder"),
	drawtype = "nodebox",
	tiles = {"default_stone.png"},
	inventory_image = "default_ladder_stone.png",
	wield_image = "default_ladder_stone.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-7/16, -9/16, 7/16, -1/16, -6/16, 4/16},
			{7/16, -9/16, 3/16, 1/16, -6/16, 0},
			{-7/16, -9/16, -4/16, -1/16, -6/16, -1/16},
			{7/16, -9/16, -8/16, 1/16, -6/16, -5/16}
		}
	},
	groups = {cracky = 3, attached_node = 1},
	legacy_wallmounted = true,
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:ladder_steel", {
	description = S("Steel Ladder"),
	drawtype = "nodebox",
	tiles = {"default_ladder_steel.png", "default_ladder_steel.png", "default_steel_block.png"},
	inventory_image = "default_ladder_steel.png",
	wield_image = "default_ladder_steel.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-7/16, -.5, -.5, -.25, -6/16, .5}, -- struts
			{.25, -.5, -.5, 7/16, -6/16, .5},
			{-4/16, -.5, 5/16, 4/16, -6/16, 7/16}, -- rungs
			{-4/16, -.5, 1/16, 4/16, -6/16, 3/16},
			{-4/16, -.5, -3/16, 4/16, -6/16, -1/16},
			{-4/16, -.5, -7/16, 4/16, -6/16, -5/16}
		}
	},
	selection_box = {
		type = "wallmounted",
		wall_top = {-7/16, 6/16, -.5, 7/16, .5, .5},
		wall_side = {-.5, -.5, -7/16, -6/16, .5, 7/16},
		wall_bottom = {-7/16, -.5, -.5, 7/16, -6/16, .5}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_metal_defaults(),
})

default.register_fence("default:fence_acacia_wood", {
	description = S("Acacia Wood Fence"),
	texture = "default_fence_acacia_wood.png",
	inventory_image = "default_fence_overlay.png^default_acacia_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_acacia_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:acacia_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("default:fence_apple_wood", {
	description = S("Apple Wood Fence"),
	texture = "default_fence_apple_wood.png",
	inventory_image = "default_fence_overlay.png^default_apple_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_apple_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:apple_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("default:fence_aspen_wood", {
	description = S("Aspen Wood Fence"),
	texture = "default_fence_aspen_wood.png",
	inventory_image = "default_fence_overlay.png^default_aspen_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_aspen_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:aspen_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("default:fence_wood", {
	description = S("Wood Fence"),
	texture = "default_fence_wood.png",
	inventory_image = "default_fence_overlay.png^default_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("default:fence_birch_wood", {
	description = S("Birch Wood Fence"),
	texture = "default_fence_birch_wood.png",
	inventory_image = "default_fence_overlay.png^default_birch_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_birch_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:birch_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("default:fence_coco_palm_wood", {
	description = S("Coco Palm Wood Fence"),
	texture = "default_fence_coco_palm_wood.png",
	inventory_image = "default_fence_overlay.png^default_coco_palm_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_coco_palm_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:coco_palm_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("default:fence_jungle_wood", {
	description = S("Jungle Wood Fence"),
	texture = "default_fence_jungle_wood.png",
	inventory_image = "default_fence_overlay.png^default_jungle_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_jungle_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:jungle_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("default:fence_mangrove_wood", {
	description = S("Mangrove Wood Fence"),
	texture = "default_fence_mangrove_wood.png",
	inventory_image = "default_fence_overlay.png^default_mangrove_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_mangrove_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:mangrove_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("default:fence_pine_wood", {
	description = S("Pine Wood Fence"),
	texture = "default_fence_pine_wood.png",
	inventory_image = "default_fence_overlay.png^default_pine_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_pine_wood.png^" ..
		"default_fence_overlay.png^[makealpha:255,126,126",
	material = "default:pine_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 4},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail("default:fence_rail_acacia_wood", {
	description = S("Acacia Wood Fence Rail"),
	texture = "default_fence_rail_acacia_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_acacia_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_acacia_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "default:acacia_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail("default:fence_rail_apple_wood", {
	description = S("Apple Wood Fence Rail"),
	texture = "default_fence_rail_apple_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_apple_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_apple_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "default:apple_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail("default:fence_rail_aspen_wood", {
	description = S("Aspen Wood Fence Rail"),
	texture = "default_fence_rail_aspen_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_aspen_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_aspen_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "default:aspen_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail("default:fence_rail_wood", {
	description = S("Wood Fence Rail"),
	texture = "default_fence_rail_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "default:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail("default:fence_rail_birch_wood", {
	description = S("Birch Wood Fence Rail"),
	texture = "default_fence_rail_birch_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_birch_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_birch_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "default:birch_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail("default:fence_rail_coco_palm_wood", {
	description = S("Coco Palm Wood Fence Rail"),
	texture = "default_fence_rail_coco_palm_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_coco_palm_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_coco_palm_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "default:coco_palm_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail("default:fence_rail_jungle_wood", {
	description = S("Jungle Wood Fence Rail"),
	texture = "default_fence_rail_jungle_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_jungle_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_jungle_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "default:jungle_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail("default:fence_rail_mangrove_wood", {
	description = S("Mangrove Wood Fence Rail"),
	texture = "default_fence_rail_mangrove_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_mangrove_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_mangrove_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "default:mangrove_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail("default:fence_rail_pine_wood", {
	description = S("Pine Wood Fence Rail"),
	texture = "default_fence_rail_pine_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_pine_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_pine_wood.png^" ..
		"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "default:pine_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 4},
	sounds = default.node_sound_wood_defaults()
})

core.register_node("default:glass", {
	description = S("Glass"),
	drawtype = "glasslike_framed_optional",
	tiles = {"default_glass.png", "default_glass_detail.png"},
	use_texture_alpha = "clip", -- only needed for stairs API
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	_tnt_loss = 2,
})

core.register_node("default:obsidian_glass", {
	description = S("Obsidian Glass"),
	drawtype = "glasslike_framed_optional",
	tiles = {"default_obsidian_glass.png", "default_obsidian_glass_detail.png"},
	use_texture_alpha = "clip", -- only needed for stairs API
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_glass_defaults(),
	_tnt_loss = 4,
})


core.register_node("default:cement_block", {
	description = S("Cement Block"),
	tiles = {"basic_materials_cement_block.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:concrete_block", {
	description = S("Concrete Block"),
	tiles = {"basic_materials_concrete_block.png"},
	is_ground_content = false,
	groups = {cracky=1, level=2, concrete=1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:concrete_block2", {
	description = S("Concrete Block 2"),
	tiles = {"technic_concrete_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2, concrete = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:concrete_paver", {
	description = S("Concrete Paver"),
	drawtype = "nodebox",
	tiles = {"default_paver.png", "default_paver.png^[transformFY"},
	inventory_image = "default_paver.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.47, .5}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.45, .5}
	},
	groups = {cracky = 3, oddly_breakable_by_hand = 2, attached_node = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("default:woven_mat", {
	description = S("Woven Mat"),
	drawtype = "nodebox",
	tiles = {"earthbuild_woven_mat.png", "earthbuild_woven_mat.png^[transformFY"},
	inventory_image = "earthbuild_woven_mat.png",
	wield_image = "earthbuild_woven_mat.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.45, .5}
	},
	groups = {snappy = 3, flammable = 3},
	sounds = default.node_sound_leaves_defaults({
		footstep = {name = "default_grass_footstep", gain = .13},
	}),
})


core.register_node("default:brick", {
	description = S("Brick Block"),
	tiles = {"default_brick.png^[transformFX", "default_brick.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})


core.register_node("default:meselamp", {
	description = S("Mese Lamp"),
	drawtype = "glasslike",
	tiles = {"default_meselamp.png"},
	paramtype = "light",
	light_source = default.LIGHT_MAX,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

default.register_mesepost("default:mese_post_light_acacia_wood", {
	description = S("Acacia Wood Mese Post Light"),
	texture = "default_fence_acacia_wood.png",
	material = "default:acacia_wood",
})

default.register_mesepost("default:mese_post_light_aspen_wood", {
	description = S("Aspen Wood Mese Post Light"),
	texture = "default_fence_aspen_wood.png",
	material = "default:aspen_wood",
})

default.register_mesepost("default:mese_post_light", {
	description = S("Wood Mese Post Light"),
	texture = "default_fence_wood.png",
	material = "default:wood",
})

default.register_mesepost("default:mese_post_light_jungle_wood", {
	description = S("Jungle Wood Mese Post Light"),
	texture = "default_fence_jungle_wood.png",
	material = "default:jungle_wood",
})

default.register_mesepost("default:mese_post_light_pine_wood", {
	description = S("Pine Wood Mese Post Light"),
	texture = "default_fence_pine_wood.png",
	material = "default:pine_wood",
})


core.register_node("default:ocealitelamp", {
	description = S("Ocealite Lamp"),
	drawtype = "glasslike",
	tiles = {"default_ocealitelamp.png"},
	paramtype = "light",
	light_source = default.LIGHT_MAX,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})


core.register_node("default:spectrum", {
	description = S("Light Spectrum"),
	drawtype = "glasslike",
	tiles = {"spectrum.png"},
	paramtype = "light",
	light_source = default.LIGHT_MAX,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

local function flood_air(pos, oldnode, newnode)
	local meta = core.get_meta(pos)
	local positions = core.find_nodes_in_area({x = pos.x + 1, y = pos.y + 1, z = pos.z + 1},
		{x = pos.x - 1, y = pos.y, z = pos.z - 1}, {"air"})
	-- Move up if possible
	if #positions > 0 then
		local pos2 = positions[math.random(#positions)]
		core.set_node(pos2, {name = oldnode.name})
		local nmeta = core.get_meta(pos2)
		nmeta:set_int("thermal_age", meta:get_int("thermal_age"))
		core.get_node_timer(pos2):start(math.random(4, 5))
	end
	-- Remove air
	return false
end

local draw_as = core.settings:get_bool("reveal_cold_and_hot_air") and "glasslike" or "airlike"

core.register_node("default:cold_air", {
	description = S("Cold Air"),
	drawtype = draw_as,
	tiles = {"default_invisible_node_overlay.png^[colorize:#8bb9f9"},
	inventory_image = "default_invisible_node_overlay.png^[colorize:#8bb9f9",
	wield_image = "default_invisible_node_overlay.png^[colorize:#8bb9f9",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	floodable = true,
	drop = "",
	groups = {not_in_creative_inventory = 1},
	on_timer = function(pos, elapsed)
		local meta = core.get_meta(pos)
		local heat = core.get_heat(pos)
		local under = {x = pos.x, y = pos.y - 1, z = pos.z}
		local under2 = {x = pos.x, y = pos.y - 2, z = pos.z}
		local chek_under = core.get_node_or_nil(under)
		local chek_under2 = core.get_node_or_nil(under2)
	if not chek_under or not chek_under2 then
		core.get_node_timer(pos):start(5)
		return
	end
		if meta:get_int("thermal_age") < 11 and pos.y > -25 then
	if #core.find_nodes_in_area({x = pos.x + 4, y = pos.y + 9, z = pos.z + 4},
		{x = pos.x - 4, y = pos.y, z = pos.z - 4}, {"default:crystal_block", "default:crystal_spike"}) > 0 then
		if heat > 49 then
			meta:set_int("thermal_age", meta:get_int("thermal_age")-1)
		else
			meta:set_int("thermal_age", meta:get_int("thermal_age")-3)
		end
	else
		if core.get_item_group(chek_under.name, "torch") ~= 0 or
		core.find_node_near(pos, 1, {"group:igniter", "default:furnace_active"}) then
			meta:set_int("thermal_age", meta:get_int("thermal_age")+math.random(3, 4))
		end
	end
	meta:set_int("thermal_age", meta:get_int("thermal_age")+1)
--core.chat_send_all("thermal_cold ".. meta:get_int("thermal_age"))
	if chek_under.name == "air" then
		core.set_node(under, {name = "default:cold_air"})
		local nmeta = core.get_meta(under)
		nmeta:set_int("thermal_age", meta:get_int("thermal_age"))
		core.get_node_timer(under):start(math.random(4, 5))
--core.chat_send_all("under removes")
		core.remove_node(pos)
	else
		if chek_under2.name == "air" and not core.registered_nodes[chek_under.name].walkable then
		core.set_node(under2, {name = "default:cold_air"})
		local nmeta = core.get_meta(under2)
		nmeta:set_int("thermal_age", meta:get_int("thermal_age"))
		core.get_node_timer(under2):start(math.random(4, 5))
--core.chat_send_all("under2 removes")
		core.remove_node(pos)
		else
		local positions = core.find_nodes_in_area({x = pos.x + 1, y = pos.y, z = pos.z + 1},
			{x = pos.x - 1, y = pos.y - 1, z = pos.z - 1}, {"air"})
		if #positions == 0 then
			core.get_node_timer(pos):start(math.random(4, 5))
			return
		end
		local pos2 = positions[math.random(#positions)]
		core.set_node(pos2, {name = "default:cold_air"})
		local nmeta = core.get_meta(pos2)
		nmeta:set_int("thermal_age", meta:get_int("thermal_age"))
		core.get_node_timer(pos2):start(math.random(4, 5))
--core.chat_send_all("pos2 removes")
		core.remove_node(pos)
		end
	end
		else
--core.chat_send_all("thermal_cold removes")
	core.remove_node(pos)
		end
	end,
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(4, 5))
	end,
	on_flood = flood_air
})

core.register_node("default:hot_air", {
	description = S("Hot Air"),
	drawtype = draw_as,
	tiles = {"default_invisible_node_overlay.png^[colorize:#ff8400"},
	inventory_image = "default_invisible_node_overlay.png^[colorize:#ff8400",
	wield_image = "default_invisible_node_overlay.png^[colorize:#ff8400",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	floodable = true,
	drop = "",
	groups = {not_in_creative_inventory = 1},
	on_timer = function(pos, elapsed)
		local meta = core.get_meta(pos)
		local heat = core.get_heat(pos)
		local chek_under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local above2 = {x = pos.x, y = pos.y + 2, z = pos.z}
		local chek_above = core.get_node_or_nil(above)
		local chek_above2 = core.get_node_or_nil(above2)
	if not chek_under or not chek_above or not chek_above2 then
		core.get_node_timer(pos):start(5)
		return
	end
		if meta:get_int("thermal_age") < 11 and pos.y > -50 then
	if core.get_item_group(chek_under.name, "torch") ~= 0 or
		#core.find_nodes_in_area({x = pos.x + 4, y = pos.y, z = pos.z + 4},
		{x = pos.x - 4, y = pos.y - 9, z = pos.z - 4}, {"group:igniter", "default:furnace_active"}) > 0 then
		if heat < 51 then
			meta:set_int("thermal_age", meta:get_int("thermal_age")-1)
		else
			meta:set_int("thermal_age", meta:get_int("thermal_age")-3)
		end
	else
		if core.find_node_near(pos, 1, {"default:crystal_block", "default:crystal_spike"}) then
			meta:set_int("thermal_age", meta:get_int("thermal_age")+math.random(3, 4))
		end
	end
	meta:set_int("thermal_age", meta:get_int("thermal_age")+1)
--core.chat_send_all("thermal_hot ".. meta:get_int("thermal_age"))
	if chek_above.name == "air" then
		core.set_node(above, {name = "default:hot_air"})
		local nmeta = core.get_meta(above)
		nmeta:set_int("thermal_age", meta:get_int("thermal_age"))
		core.get_node_timer(above):start(math.random(4, 5))
--core.chat_send_all("above removes")
		core.remove_node(pos)
	else
		if chek_above2.name == "air" and not core.registered_nodes[chek_above.name].walkable then
		core.set_node(above2, {name = "default:hot_air"})
		local nmeta = core.get_meta(above2)
		nmeta:set_int("thermal_age", meta:get_int("thermal_age"))
		core.get_node_timer(above2):start(math.random(4, 5))
--core.chat_send_all("above2 removes")
		core.remove_node(pos)
		else
		local positions = core.find_nodes_in_area({x = pos.x + 1, y = pos.y + 1, z = pos.z + 1},
			{x = pos.x - 1, y = pos.y, z = pos.z - 1}, {"air"})
		if #positions == 0 then
			core.get_node_timer(pos):start(math.random(4, 5))
			return
		end
		local pos2 = positions[math.random(#positions)]
		core.set_node(pos2, {name = "default:hot_air"})
		local nmeta = core.get_meta(pos2)
		nmeta:set_int("thermal_age", meta:get_int("thermal_age"))
		core.get_node_timer(pos2):start(math.random(4, 5))
--core.chat_send_all("pos2 removes")
		core.remove_node(pos)
		end
	end
		else
--core.chat_send_all("thermal_hot removes")
	core.remove_node(pos)
		end
	end,
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(4, 5))
	end,
	on_flood = flood_air
})


--- Misc

core.register_node("default:cloud", {
	description = S("Cloud"),
	tiles = {"default_cloud.png"},
	is_ground_content = false,
	groups = {not_in_creative_inventory = 1},
	sounds = default.node_sound_defaults(),
})


--- Register trees for leafdecay

if core.get_mapgen_setting("mg_name") == "v6" then
	default.register_leafdecay({
		trunks = {"default:jungle_trunk"},
		leaves = {"default:jungle_leaves"},
		radius = 3,
	})

	default.register_leafdecay({
		trunks = {"default:pine_trunk"},
		leaves = {"default:pine_needles"},
		radius = 3,
	})
else
	default.register_leafdecay({
		trunks = {"default:jungle_trunk"},
		leaves = {"default:jungle_leaves"},
		radius = 2,
	})

	default.register_leafdecay({
		trunks = {"default:pine_trunk"},
		leaves = {"default:pine_needles", "default:pinecone_needles"},
		radius = 2,
	})
end

default.register_leafdecay({
	trunks = {"default:acacia_trunk"},
	leaves = {"default:acacia_leaves"},
	radius = 3,
})

default.register_leafdecay({
	trunks = {"default:apple_trunk"},
	leaves = {"default:apple_leaves", "default:apple_leaves_blooming", "default:apple_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"default:aspen_trunk"},
	leaves = {"default:aspen_leaves"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"default:beech_trunk"},
	leaves = {"default:beech_leaves"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"default:birch_trunk"},
	leaves = {"default:birch_leaves"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"default:coco_palm_trunk"},
	leaves = {"default:coco_palm_leaves", "default:coco_mark", "default:coco_0",
		"default:coco_1", "default:coco_2", "default:coco_3"},
	radius = 4,
})

default.register_leafdecay({
	trunks = {"default:mangrove_trunk"},
	leaves = {"default:mangrove_leaves"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"default:orange_trunk"},
	leaves = {"default:orange_leaves", "default:orange_leaves_blooming", "default:orange_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"default:bush_stem"},
	leaves = {"default:bush_leaves", "default:bush_leaves_fruiting"},
	radius = 1,
})

default.register_leafdecay({
	trunks = {"default:acacia_bush_stem"},
	leaves = {"default:acacia_bush_leaves"},
	radius = 1,
})

default.register_leafdecay({
	trunks = {"default:pine_bush_stem"},
	leaves = {"default:pine_bush_needles"},
	radius = 1,
})
