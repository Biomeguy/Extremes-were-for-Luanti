--[[
Map Tools: item definitions

Copyright (c) 2012-2017 Hugo Locurcio and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
--]]

local S = maptools.intllib

maptools.creative = maptools.config["hide_from_creative_inventory"]

core.register_node("maptools:stone_brick", {
	description = S("Unbreakable Stone Brick"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_stone_brick.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("maptools:cobble", {
	description = S("Unbreakable Cobblestone"),
	range = 12,
	stack_max = 10000,
	tiles = {"maptools_cobble.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("maptools:mossycobble", {
	description = S("Unbreakable Mossy Cobblestone"),
	range = 12,
	stack_max = 10000,
	tiles = {"maptools_mossycobble.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("maptools:obsidiantest0", {
	description = S("Unbreakable obsidiantest1"),
	range = 12,
	stack_max = 10000,
	tiles = {"dwarves_obsidian.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("maptools:obsidiantest2", {
	description = S("Unbreakable obsidiantest3"),
	range = 12,
	stack_max = 10000,
	tiles = {"test_obsidian2.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("maptools:obsidiantest3", {
	description = S("Unbreakable obsidiantest4"),
	range = 12,
	stack_max = 10000,
	tiles = {"test_obsidian3.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("maptools:obsidiantest4", {
	description = S("Unbreakable obsidiantest5"),
	range = 12,
	stack_max = 10000,
	tiles = {"test_obsidian3_block.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("maptools:obsidiantest5", {
	description = S("Unbreakable obsidiantest6"),
	range = 12,
	stack_max = 10000,
	tiles = {"test_obsidian3_brick.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("maptools:soil_wet", {
	description = "Unbreakable Wet Soil",
	range = 12,
	stack_max = 10000,
	tiles = {"default_dirt.png^farming_soil_wet.png", "default_dirt.png^farming_soil_wet_side.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative, soil = 3, wet = 1, field = 1},
	sounds = default.node_sound_dirt_defaults(),
})

-- Redefine cloud so that the admin pickaxe can mine it:
core.register_node(":default:cloud", {
	description = S("Cloud"),
	tiles = {"default_cloud.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_defaults(),
})

core.register_node("maptools:black", {
	description = S("Black"),
	range = 12,
	stack_max = 10000,
	tiles = {"black.png"},
	walkable = false,
	drop = "",
	post_effect_color = {a=255, r=0, g=0, b=0},
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("maptools:white", {
	description = S("White"),
	range = 12,
	stack_max = 10000,
	tiles = {"white.png"},
	walkable = false,
	drop = "",
	post_effect_color = {a=255, r=128, g=128, b=128},
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("maptools:fullclip", {
	description = S("Full Clip"),
	range = 12,
	stack_max = 10000,
	inventory_image = "default_steel_block.png^dye_blue.png",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
})

core.register_node("maptools:fullclip_face", {
	description = S("Full Clip Face"),
	range = 12,
	stack_max = 10000,
	inventory_image = "default_steel_block.png^dye_white.png",
	drawtype = "nodebox",
	tiles = {"blank.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	use_texture_alpha = "clip",
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.4999, .5}
	},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative, fall_damage_add_percent=-100},
})

core.register_node("maptools:playerclip_top", {
	description = S("Player Clip Top Face"),
	range = 12,
	stack_max = 10000,
	inventory_image = "default_steel_block.png^dye_yellow.png",
	drawtype = "nodebox",
	tiles = {"blank.png"},
	--pointable = false,
	paramtype = "light",
	use_texture_alpha = "clip",
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {-.5, .4999, -.5, .5, .5, .5}
	},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative, fall_damage_add_percent=-100},
})

core.register_node("maptools:bouncy", {
	description = S("Bouncy 100"),
	range = 12,
	stack_max = 10000,
	inventory_image = "default_steel_block.png^default_apple.png",
	drawtype = "nodebox",
	tiles = {"blank.png"},
	paramtype = "light",
	use_texture_alpha = "clip",
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.4999, .5}
	},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative, fall_damage_add_percent=-100, bouncy=100},
})

core.register_node("maptools:lightbulb", {
	description = S("Light Bulb"),
	range = 12,
	stack_max = 10000,
	inventory_image = "default_steel_block.png^default_mese_crystal_fragment.png",
	drawtype = "airlike",
	walkable = false,
	--pointable = false,
	light_source = 14,
	paramtype = "light",
	sunlight_propagates = true,
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
})

core.register_node("maptools:climb", {
	description = S("Climb Block"),
	range = 12,
	stack_max = 10000,
	inventory_image = "default_steel_block.png^default_ladder_wood.png",
	drawtype = "airlike",
	walkable = false,
	climbable = true,
	--pointable = false,
	paramtype = "light",
	sunlight_propagates = true,
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
})

for damage_num=1,5,1 do
core.register_node("maptools:damage_" .. damage_num, {
	description = S("Damaging Block (%s)"):format(damage_num),
	range = 12,
	stack_max = 10000,
	inventory_image = "default_steel_block.png^farming_cotton_" .. damage_num .. ".png",
	drawtype = "airlike",
	walkable = false,
	--pointable = false,
	damage_per_second = damage_num,
	paramtype = "light",
	sunlight_propagates = true,
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
})
end

core.register_node("maptools:kill", {
	description = S("Kill Block"),
	range = 12,
	stack_max = 10000,
	inventory_image = "default_steel_block.png^dye_black.png",
	drawtype = "airlike",
	walkable = false,
	--pointable = false,
	damage_per_second = 20,
	paramtype = "light",
	sunlight_propagates = true,
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
})

core.register_node("maptools:smoke", {
	description = S("Smoke Block"),
	range = 12,
	stack_max = 10000,
	tiles = {"maptools_smoke.png"},
	drawtype = "allfaces_optional",
	walkable = false,
	paramtype = "light",
	drop = "",
	groups = {unbreakable= 1, not_in_creative_inventory = maptools.creative},
	post_effect_color = {a=192, r=96, g=96, b=96},
})

core.register_node("maptools:superapple", {
	description = S("Super Apple"),
	range = 12,
	stack_max = 10000,
	drawtype = "plantlike",
	tiles = {"maptools_superapple.png"},
	inventory_image = "maptools_superapple.png",
	walkable = false,
	paramtype = "light",
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {fleshy= 3, dig_immediate= 3, not_in_creative_inventory = maptools.creative},
	on_use = core.item_eat(20),
	sounds = default.node_sound_defaults(),
})

core.register_node("maptools:rotating_maze_wall", {-- Experimental
	description = "Rotating Maze Wall",
	drawtype = "nodebox",
	tiles = {"rot_maze_wall.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.0625, 1.5, 3.5, .0625}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_timer = function(pos)
		core.set_node(pos, {name="maptools:rotating_maze_wall", param2=math.random(0, 3)})
	end,
	groups = {unbreakable = 1, timer_check = 1},
	on_rotate = screwdriver.disallow,
	sounds = default.node_sound_defaults(),
})
--[[ Must be used on a mapgen representing all biomes individually by one surface node with hht_sapling as node_dust
core.register_node("maptools:hht_sapling", {
	description = S("Heat Humidity Testing Sapling"),
	drawtype = "plantlike",
	tiles = {"default_bush_sapling.png"},
	inventory_image = "default_bush_sapling.png",
	wield_image = "default_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = function(pos)
		if default.h_h_h(pos, -31000, 31000, 19, 86, 22, 120) then
			core.set_node(pos, {name = "default:dry_shrub"})
			return
		end
		core.set_node(pos, {name = "default:bush_leaves"})
	end,
	groups = {snappy = 3, timer_check = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
})

core.register_lbm({
	name = "maptools:activate_hht_sapling",
	nodenames = {"maptools:hht_sapling"},
	run_at_every_load = true,
	action = function(pos)
		if not core.get_node_timer(pos):is_started() then
			core.get_node_timer(pos):start(3)
		end
	end
})
]]
core.register_craftitem("maptools:copper_coin", {
	description = S("Copper Coin"),
	inventory_image = "maptools_copper_coin.png",
	wield_scale = {x = .5, y = .5, z = .25},
	stack_max = 10000,
	groups = {not_in_creative_inventory = maptools.creative},
})

core.register_craftitem("maptools:silver_coin", {
	description = S("Silver Coin"),
	inventory_image = "maptools_silver_coin.png",
	wield_scale = {x = .5, y = .5, z = .25},
	stack_max = 10000,
	groups = {not_in_creative_inventory = maptools.creative},
})

core.register_craftitem("maptools:gold_coin", {
	description = S("Gold Coin"),
	inventory_image = "maptools_gold_coin.png",
	wield_scale = {x = .5, y = .5, z = .25},
	stack_max = 10000,
	groups = {not_in_creative_inventory = maptools.creative},
})

core.register_craftitem("maptools:infinitefuel", {
	description = S("Infinite Fuel"),
	inventory_image = "maptools_infinitefuel.png",
	stack_max = 10000,
	groups = {not_in_creative_inventory = maptools.creative},
})

core.register_craft({
	type = "fuel",
	recipe = "maptools:infinitefuel",
	burntime = 1000000000,
})

core.register_tool("maptools:pick_admin", {
	description = S("Admin Pickaxe"),
	inventory_image = "maptools_adminpick.png",
	range = 12,
	groups = {not_in_creative_inventory = maptools.creative},
	on_use = function(item, user, pointd)
		if pointd.under == nil then return end
		if core.get_node(pointd.under) ~= nil then
core.log("action", user:get_player_name().. " digs " ..core.get_node(pointd.under).name.. " at " ..core.pos_to_string(pointd.under).. " using an Admin Pickaxe.")
			core.remove_node(pointd.under)-- This even works on non-empty containers and group-less nodes.
		end
	end
})

core.register_tool("maptools:pick_admin_with_drops", {
	description = S("Admin Pickaxe with Drops"),
	inventory_image = "maptools_adminpick_with_drops.png",
	range = 20,
	groups = {not_in_creative_inventory = maptools.creative},
	tool_capabilities = {
		full_punch_interval = .3,
		max_drop_level = 3,
		groupcaps = {
			unbreakable = {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 5},
			fleshy = {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 5},
			choppy = {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 5},
			bendy = {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 5},
			cracky = {times={[4] =0, [1] =0, [2] =0, [3] =0}, uses =0, maxlevel =5},
			crumbly = {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 5},
			snappy = {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 5}
		},
		damage_groups = {fleshy = 1000},
		punch_attack_uses=0,
	}
})

core.register_craft({
	output = "maptools:pick_admin_with_drops",
	recipe = {{"maptools:pick_admin_with_drops"}}})
