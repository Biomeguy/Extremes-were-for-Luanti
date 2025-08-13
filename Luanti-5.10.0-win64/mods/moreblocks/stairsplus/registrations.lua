--[[
More Blocks: registrations

Copyright © 2011-2019 Hugo Locurcio and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
--]]

-- default registrations
local default_nodes = { -- Default stairs/slabs/panels/microblocks:
	"stone",
	"rocks",
	"cobble",
	"stone_brick",
	"stone_block",
	"mossystone",
	"mossycobble",
	"mossystone_brick",
	"mossystone_block",
	"basalt",
	"desert_stone",
	"desert_rocks",
	"desert_cobble",
	"desert_stone_brick",
	"desert_stone_block",
	"pumice",
	"ocean_stone",
	"ocean_cobble",
	"ocean_stone_carved",
	"ocean_stone_circular",
	"ocean_stone_pillar",
	"ocean_stone_brick",
	"brick",
	"sandstone",
	"sandstone_brick",
	"sandstone_block",
	"wrought_iron_block",
	"cast_iron_block",
	"steel_block",
	"stainless_steel_block",
	"tin_block",
	"copper_block",
	"brass_block",
	"bronze_block",
	"chromium_block",
	"zinc_block",
	"silver_block",
	"gold_block",
	"diamond_block",
	"orichalc_block",
	"crystal_block",
	"meselamp",
	"ocealitelamp",
	"glass",
	"acacia_trunk",
	"acacia_wood",
	"apple_trunk",
	"apple_wood",
	"aspen_trunk",
	"aspen_wood",
	"beech_trunk",
	"wood",
	"birch_trunk",
	"birch_wood",
	"coco_palm_trunk",
	"coco_palm_wood",
	"jungle_trunk",
	"jungle_wood",
	"mangrove_trunk",
	"mangrove_wood",
	"pine_trunk",
	"pine_wood",
	"obsidian",
	"obsidian_block",
	"obsidian_brick",
	"obsidian_glass",
	"white_marble",
	"white_marble_block",
	"marble",
	"marble_brick",
	"diamite",
	"granite",
	"bedrock",
	"silver_sandstone",
	"silver_sandstone_brick",
	"silver_sandstone_block",
	"desert_sandstone",
	"desert_sandstone_brick",
	"desert_sandstone_block",
	"coral_skeleton",
	"ice",
	"ice_brick",
	"ice_block",
	"snow_brick",
	"snow_block",
	"concrete_block",
	"cement_block",
	"concrete_block2",
}

stairs.register_stair_and_slab("acacia_trunk", "default:acacia_trunk", {choppy = 2, flammable = 2},
	{"default_acacia_trunk_top.png", "default_acacia_trunk_top.png", "default_acacia_trunk.png"},
	"Acacia Trunk Stair", "Acacia Trunk Slab", default.node_sound_wood_defaults(), false)

stairs.register_stair_and_slab("apple_trunk", "default:apple_trunk", {choppy = 2, flammable = 2},
	{"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	"Apple Trunk Stair", "Apple Trunk Slab", default.node_sound_wood_defaults(), false)

stairs.register_stair_and_slab("aspen_trunk", "default:aspen_trunk", {choppy = 2, flammable = 2},
	{"default_aspen_trunk_top.png", "default_aspen_trunk_top.png", "default_aspen_trunk.png"},
	"Aspen Trunk Stair", "Aspen Trunk Slab", default.node_sound_wood_defaults(), false)

stairs.register_stair_and_slab("beech_trunk", "default:beech_trunk", {choppy = 2, flammable = 2},
	{"default_beech_trunk_top.png", "default_beech_trunk_top.png", "default_beech_trunk.png"},
	"Beech Trunk Stair", "Beech Trunk Slab", default.node_sound_wood_defaults(), false)

stairs.register_stair_and_slab("birch_trunk", "default:birch_trunk", {choppy = 2, flammable = 1},
	{"default_birch_trunk_top.png", "default_birch_trunk_top.png", "default_birch_trunk.png"},
	"Birch Trunk Stair", "Birch Trunk Slab", default.node_sound_wood_defaults(), false)

stairs.register_stair_and_slab("coco_palm_trunk", "default:coco_palm_trunk", {choppy = 2, flammable = 2},
	{"default_coco_palm_trunk_top.png", "default_coco_palm_trunk_top.png", "default_coco_palm_trunk.png"},
	"Coco Palm Trunk Stair", "Coco Palm Trunk Slab", default.node_sound_wood_defaults(), false)

stairs.register_stair_and_slab("jungle_trunk", "default:jungle_trunk", {choppy = 2, flammable = 2},
	{"default_jungle_trunk_top.png", "default_jungle_trunk_top.png", "default_jungle_trunk.png"},
	"Jungle Trunk Stair", "Jungle Trunk Slab", default.node_sound_wood_defaults(), false)

stairs.register_stair_and_slab("mangrove_trunk", "default:mangrove_trunk", {choppy = 2, flammable = 1},
	{"default_mangrove_trunk_top.png", "default_mangrove_trunk_top.png", "default_mangrove_trunk.png"},
	"Mangrove Trunk Stair", "Mangrove Trunk Slab", default.node_sound_wood_defaults(), false)

stairs.register_stair_and_slab("pine_trunk", "default:pine_trunk", {choppy = 3, flammable = 3},
	{"default_pine_trunk_top.png", "default_pine_trunk_top.png", "default_pine_trunk.png"},
	"Pine Trunk Stair", "Pine Trunk Slab", default.node_sound_wood_defaults(), false)

stairs.register_stair_and_slab("diamond_block", "default:diamond_block",
	{cracky = 1, level = 3}, {"default_diamond_block.png"},
	"Diamond Block Stair", "Diamond Block Slab", default.node_sound_stone_defaults(), true)

for _, name in pairs(default_nodes) do
	local mod = "default"
	local nodename = mod .. ":" .. name
	local ndef = table.copy(core.registered_nodes[nodename])
	ndef.sunlight_propagates = true

	-- Stone and desert_stone drop rocks and desert_rocks respectively.
	if type(ndef.drop) == "string" then
		ndef.drop = ndef.drop:gsub(".+:", "")
	end

	-- Use the primary tile for all sides of cut glasslike nodes and disregard paramtype2.
	if #ndef.tiles > 1 and ndef.drawtype and ndef.drawtype:find("glass") then
		ndef.tiles = {ndef.tiles[1]}
		ndef.paramtype2 = nil
	end

	if name == "ice" or name == "ice_brick" or name == "ice_block" or name == "snow_brick" or name == "snow_block" then
		ndef.groups.melttoflo = 1
	end

	mod = "moreblocks"
	stairsplus:register_all(mod, name, nodename, ndef)
end

-- farming registrations
if core.get_modpath("farming") then
	local farming_nodes = {"straw", "hay"}
	for _, name in pairs(farming_nodes) do
		local mod = "farming"
		local nodename = mod .. ":" .. name
		local ndef = table.copy(core.registered_nodes[nodename])
		ndef.sunlight_propagates = true

		mod = "moreblocks"
		stairsplus:register_all(mod, name, nodename, ndef)
	end
end

-- fabric registrations
if core.get_modpath("fabric") then
	local dyes = {"white", "grey", "black", "red", "yellow", "green", "cyan", "blue",
	"light_blue", "magenta", "orange", "violet", "brown", "pink", "dark_grey", "dark_green"}
	for _, name in pairs(dyes) do
		local mod = "fabric"
		local nodename = mod .. ":block_" .. name
		local ndef = table.copy(core.registered_nodes[nodename])
		ndef.sunlight_propagates = true

		-- Prevent dye+cut fabric recipy from creating a full fabric block.
		ndef.groups.fabric_block = nil

		stairsplus:register_all(mod, name, nodename, ndef)
	end
end

-- Alias cuts of split_stone_tile_alt which was renamed checker_stone_tile.
stairsplus:register_alias_all("moreblocks", "split_stone_tile_alt", "moreblocks", "checker_stone_tile")

-- The following LBM is necessary because the name stair_split_stone_tile_alt
-- conflicts with another node and so the alias for that specific node gets
-- ignored.
core.register_lbm({
	name = "moreblocks:fix_split_stone_tile_alt_name_collision",
	nodenames = {"moreblocks:stair_split_stone_tile_alt"},
	action = function(pos, node)
		core.set_node(pos, {
			name = "moreblocks:stair_checker_stone_tile",
			param2 = core.get_node(pos).param2

		})
		core.log('action', "LBM replaced " .. node.name ..
			" at " .. core.pos_to_string(pos))
	end,
})
