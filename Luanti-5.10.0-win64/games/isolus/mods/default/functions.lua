
-- Sounds
function default.node_sound_defaults(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "", gain = 1.0}
	tbl.dug = tbl.dug or
			{name = "default_dug_node", gain = 0.25}
	tbl.place = tbl.place or
			{name = "default_place_node_hard", gain = 1.0}
	return tbl
end

function default.node_sound_stone_defaults(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "default_hard_footstep", gain = 0.2}
	tbl.dug = tbl.dug or
			{name = "default_hard_footstep", gain = 1.0}
	default.node_sound_defaults(tbl)
	return tbl
end

function default.node_sound_dirt_defaults(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "default_dirt_footstep", gain = 0.25}
	tbl.dig = tbl.dig or
			{name = "default_dig_crumbly", gain = 0.4}
	tbl.dug = tbl.dug or
			{name = "default_dirt_footstep", gain = 1.0}
	tbl.place = tbl.place or
			{name = "default_place_node", gain = 1.0}
	default.node_sound_defaults(tbl)
	return tbl
end

function default.node_sound_sand_defaults(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "default_sand_footstep", gain = 0.05}
	tbl.dug = tbl.dug or
			{name = "default_sand_footstep", gain = 0.15}
	tbl.place = tbl.place or
			{name = "default_place_node", gain = 1.0}
	default.node_sound_defaults(tbl)
	return tbl
end

function default.node_sound_gravel_defaults(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "default_gravel_footstep", gain = 0.25}
	tbl.dig = tbl.dig or
			{name = "default_gravel_dig", gain = 0.35}
	tbl.dug = tbl.dug or
			{name = "default_gravel_dug", gain = 1.0}
	tbl.place = tbl.place or
			{name = "default_place_node", gain = 1.0}
	default.node_sound_defaults(tbl)
	return tbl
end

function default.node_sound_wood_defaults(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "default_wood_footstep", gain = 0.15}
	tbl.dig = tbl.dig or
			{name = "default_dig_choppy", gain = 0.4}
	tbl.dug = tbl.dug or
			{name = "default_wood_footstep", gain = 1.0}
	default.node_sound_defaults(tbl)
	return tbl
end

function default.node_sound_leaves_defaults(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "default_grass_footstep", gain = 0.45}
	tbl.dug = tbl.dug or
			{name = "default_grass_footstep", gain = 0.7}
	tbl.place = tbl.place or
			{name = "default_place_node", gain = 1.0}
	default.node_sound_defaults(tbl)
	return tbl
end

function default.node_sound_fruits_defaults(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "default_grass_footstep", gain = 0.45}
	tbl.dig = tbl.dig or
			{name = "default_dig_snappy", gain = 0.35}
	tbl.dug = tbl.dug or
			{name = "default_grass_footstep", gain = 0.35}
	tbl.place = tbl.place or
			{name = "default_place_node", gain = 1.0}
	default.node_sound_defaults(tbl)
	return tbl
end

function default.node_sound_glass_defaults(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "default_glass_footstep", gain = 0.3}
	tbl.dig = tbl.dig or
			{name = "default_glass_footstep", gain = 0.5}
	tbl.dug = tbl.dug or
			{name = "default_break_glass", gain = 1.0}
	default.node_sound_defaults(tbl)
	return tbl
end

function default.node_sound_ice_defaults(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "default_ice_footstep", gain = 0.15}
	tbl.dig = tbl.dig or
			{name = "default_ice_dig", gain = 0.5}
	tbl.dug = tbl.dug or
			{name = "default_ice_dug", gain = 0.5}
	default.node_sound_defaults(tbl)
	return tbl
end

function default.node_sound_metal_defaults(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "default_metal_footstep", gain = 0.2}
	tbl.dig = tbl.dig or
			{name = "default_dig_metal", gain = 0.5}
	tbl.dug = tbl.dug or
			{name = "default_dug_metal", gain = 0.5}
	tbl.place = tbl.place or
			{name = "default_place_node_metal", gain = 0.5}
	default.node_sound_defaults(tbl)
	return tbl
end

function default.node_sound_water_defaults(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "default_water_footstep", gain = 0.2}
	default.node_sound_defaults(tbl)
	return tbl
end

function default.node_sound_snow_defaults(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "default_snow_footstep", gain = 0.2}
	tbl.dig = tbl.dig or
			{name = "default_snow_footstep", gain = 0.3}
	tbl.dug = tbl.dug or
			{name = "default_snow_footstep", gain = 0.3}
	tbl.place = tbl.place or
			{name = "default_place_node", gain = 1.0}
	default.node_sound_defaults(tbl)
	return tbl
end


default.leaf_cbox = {
	type = "fixed", fixed = {-.5, .49, -.5, .5, .5, .5}
}

default.plant_sbox = {
	type = "fixed", fixed = {-5/16, -.5, -5/16, 5/16, -.1, 5/16}
}
default.grass_sbox = {
	type = "fixed", fixed = {-1/8, -.5, -9/16, 5/8, -.25, 3/16}
}

local leaf_type = tonumber(core.settings:get("mesh_leaves")) or 0
leaf_drawtype = "allfaces_optional"
waving_style = 1
leaf_cbox = nil

if leaf_type > 0 then
	leaf_drawtype = "mesh"
	leaf_cbox = default.leaf_cbox
	if leaf_type == 2 then
		waving_style = 2
	end
end

set_image = ""

function leaf_image(image)
	if leaf_type > 0 then
		set_image = image
	end
	return set_image
end


function swap_preserved(pos, name)
	local node = core.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	core.swap_node(pos, node)
end

default.moss_death_correspondences = {
	["default:mossystone"] = "default:stone",
	["default:mossycobble"] = "default:cobble",
	["default:mossystone_block"] = "default:stone_block",
	["default:mossystone_brick"] = "default:stone_brick",
	["stairs:slab_mossystone"] = "stairs:slab_stone",
	["stairs:stair_mossystone"] = "stairs:stair_stone",
	["stairs:stair_inner_mossystone"] = "stairs:stair_inner_stone",
	["stairs:stair_outer_mossystone"] = "stairs:stair_outer_stone",
	["stairs:slab_mossycobble"] = "stairs:slab_cobble",
	["stairs:stair_mossycobble"] = "stairs:stair_cobble",
	["stairs:stair_inner_mossycobble"] = "stairs:stair_inner_cobble",
	["stairs:stair_outer_mossycobble"] = "stairs:stair_outer_cobble",
	["stairs:slab_mossystone_block"] = "stairs:slab_stone_block",
	["stairs:stair_mossystone_block"] = "stairs:stair_stone_block",
	["stairs:stair_inner_mossystone_block"] = "stairs:stair_inner_stone_block",
	["stairs:stair_outer_mossystone_block"] = "stairs:stair_outer_stone_block",
	["stairs:slab_mossystone_brick"] = "stairs:slab_stone_brick",
	["stairs:stair_mossystone_brick"] = "stairs:stair_stone_brick",
	["stairs:stair_inner_mossystone_brick"] = "stairs:stair_inner_stone_brick",
	["stairs:stair_outer_mossystone_brick"] = "stairs:stair_outer_stone_brick",
	["walls:mossycobble"] = "walls:cobble",
	["moreblocks:micro_mossystone"] = "moreblocks:micro_stone",
	["moreblocks:micro_mossystone_1"] = "moreblocks:micro_stone_1",
	["moreblocks:micro_mossystone_2"] = "moreblocks:micro_stone_2",
	["moreblocks:micro_mossystone_4"] = "moreblocks:micro_stone_4",
	["moreblocks:micro_mossystone_12"] = "moreblocks:micro_stone_12",
	["moreblocks:micro_mossystone_14"] = "moreblocks:micro_stone_14",
	["moreblocks:micro_mossystone_15"] = "moreblocks:micro_stone_15",
	["moreblocks:panel_mossystone"] = "moreblocks:panel_stone",
	["moreblocks:panel_mossystone_1"] = "moreblocks:panel_stone_1",
	["moreblocks:panel_mossystone_2"] = "moreblocks:panel_stone_2",
	["moreblocks:panel_mossystone_4"] = "moreblocks:panel_stone_4",
	["moreblocks:panel_mossystone_12"] = "moreblocks:panel_stone_12",
	["moreblocks:panel_mossystone_14"] = "moreblocks:panel_stone_14",
	["moreblocks:panel_mossystone_15"] = "moreblocks:panel_stone_15",
	["moreblocks:slab_mossystone_quarter"] = "moreblocks:slab_stone_quarter",
	["moreblocks:slab_mossystone_three_quarter"] = "moreblocks:slab_stone_three_quarter",
	["moreblocks:slab_mossystone_1"] = "moreblocks:slab_stone_1",
	["moreblocks:slab_mossystone_2"] = "moreblocks:slab_stone_2",
	["moreblocks:slab_mossystone_14"] = "moreblocks:slab_stone_14",
	["moreblocks:slab_mossystone_15"] = "moreblocks:slab_stone_15",
	["moreblocks:slab_mossystone_two_sides"] = "moreblocks:slab_stone_two_sides",
	["moreblocks:slab_mossystone_three_sides"] = "moreblocks:slab_stone_three_sides",
	["moreblocks:slab_mossystone_three_sides_u"] = "moreblocks:slab_stone_three_sides_u",
	["moreblocks:slab_mossystone_square_column"] = "moreblocks:slab_stone_square_column",
	["moreblocks:slope_mossystone"] = "moreblocks:slope_stone",
	["moreblocks:slope_mossystone_half"] = "moreblocks:slope_stone_half",
	["moreblocks:slope_mossystone_half_raised"] = "moreblocks:slope_stone_half_raised",
	["moreblocks:slope_mossystone_inner"] = "moreblocks:slope_stone_inner",
	["moreblocks:slope_mossystone_inner_half"] = "moreblocks:slope_stone_inner_half",
	["moreblocks:slope_mossystone_inner_half_raised"] = "moreblocks:slope_stone_inner_half_raised",
	["moreblocks:slope_mossystone_inner_cut"] = "moreblocks:slope_stone_inner_cut",
	["moreblocks:slope_mossystone_inner_cut_half"] = "moreblocks:slope_stone_inner_cut_half",
	["moreblocks:slope_mossystone_inner_cut_half_raised"] = "moreblocks:slope_stone_inner_cut_half_raised",
	["moreblocks:slope_mossystone_outer"] = "moreblocks:slope_stone_outer",
	["moreblocks:slope_mossystone_outer_half"] = "moreblocks:slope_stone_outer_half",
	["moreblocks:slope_mossystone_outer_half_raised"] = "moreblocks:slope_stone_outer_half_raised",
	["moreblocks:slope_mossystone_outer_cut"] = "moreblocks:slope_stone_outer_cut",
	["moreblocks:slope_mossystone_outer_cut_half"] = "moreblocks:slope_stone_outer_cut_half",
	["moreblocks:slope_mossystone_outer_cut_half_raised"] = "moreblocks:slope_stone_outer_cut_half_raised",
	["moreblocks:slope_mossystone_cut"] = "moreblocks:slope_stone_cut",
	["moreblocks:slope_mossystone_angled_slab"] = "moreblocks:slope_stone_angled_slab",
	["moreblocks:slope_mossystone_angled_stair"] = "moreblocks:slope_stone_angled_stair",
	["moreblocks:slope_mossystone_cylinder"] = "moreblocks:slope_stone_cylinder",
	["moreblocks:slope_mossystone_spike_pyramid"] = "moreblocks:slope_stone_spike_pyramid",
	["moreblocks:slope_mossystone_pyramid"] = "moreblocks:slope_stone_pyramid",
	["moreblocks:slope_mossystone_cone"] = "moreblocks:slope_stone_cone",
	["moreblocks:slope_mossystone_sphere"] = "moreblocks:slope_stone_sphere",
	["moreblocks:stair_mossystone_half"] = "moreblocks:stair_stone_half",
	["moreblocks:stair_mossystone_right_half"] = "moreblocks:stair_stone_right_half",
	["moreblocks:stair_mossystone_alt"] = "moreblocks:stair_stone_alt",
	["moreblocks:stair_mossystone_alt_1"] = "moreblocks:stair_stone_alt_1",
	["moreblocks:stair_mossystone_alt_2"] = "moreblocks:stair_stone_alt_2",
	["moreblocks:stair_mossystone_alt_4"] = "moreblocks:stair_stone_alt_4",
	["moreblocks:micro_mossycobble"] = "moreblocks:micro_cobble",
	["moreblocks:micro_mossycobble_1"] = "moreblocks:micro_cobble_1",
	["moreblocks:micro_mossycobble_2"] = "moreblocks:micro_cobble_2",
	["moreblocks:micro_mossycobble_4"] = "moreblocks:micro_cobble_4",
	["moreblocks:micro_mossycobble_12"] = "moreblocks:micro_cobble_12",
	["moreblocks:micro_mossycobble_14"] = "moreblocks:micro_cobble_14",
	["moreblocks:micro_mossycobble_15"] = "moreblocks:micro_cobble_15",
	["moreblocks:panel_mossycobble"] = "moreblocks:panel_cobble",
	["moreblocks:panel_mossycobble_1"] = "moreblocks:panel_cobble_1",
	["moreblocks:panel_mossycobble_2"] = "moreblocks:panel_cobble_2",
	["moreblocks:panel_mossycobble_4"] = "moreblocks:panel_cobble_4",
	["moreblocks:panel_mossycobble_12"] = "moreblocks:panel_cobble_12",
	["moreblocks:panel_mossycobble_14"] = "moreblocks:panel_cobble_14",
	["moreblocks:panel_mossycobble_15"] = "moreblocks:panel_cobble_15",
	["moreblocks:slab_mossycobble_quarter"] = "moreblocks:slab_cobble_quarter",
	["moreblocks:slab_mossycobble_three_quarter"] = "moreblocks:slab_cobble_three_quarter",
	["moreblocks:slab_mossycobble_1"] = "moreblocks:slab_cobble_1",
	["moreblocks:slab_mossycobble_2"] = "moreblocks:slab_cobble_2",
	["moreblocks:slab_mossycobble_14"] = "moreblocks:slab_cobble_14",
	["moreblocks:slab_mossycobble_15"] = "moreblocks:slab_cobble_15",
	["moreblocks:slab_mossycobble_two_sides"] = "moreblocks:slab_cobble_two_sides",
	["moreblocks:slab_mossycobble_three_sides"] = "moreblocks:slab_cobble_three_sides",
	["moreblocks:slab_mossycobble_three_sides_u"] = "moreblocks:slab_cobble_three_sides_u",
	["moreblocks:slab_mossycobble_square_column"] = "moreblocks:slab_cobble_square_column",
	["moreblocks:slope_mossycobble"] = "moreblocks:slope_cobble",
	["moreblocks:slope_mossycobble_half"] = "moreblocks:slope_cobble_half",
	["moreblocks:slope_mossycobble_half_raised"] = "moreblocks:slope_cobble_half_raised",
	["moreblocks:slope_mossycobble_inner"] = "moreblocks:slope_cobble_inner",
	["moreblocks:slope_mossycobble_inner_half"] = "moreblocks:slope_cobble_inner_half",
	["moreblocks:slope_mossycobble_inner_half_raised"] = "moreblocks:slope_cobble_inner_half_raised",
	["moreblocks:slope_mossycobble_inner_cut"] = "moreblocks:slope_cobble_inner_cut",
	["moreblocks:slope_mossycobble_inner_cut_half"] = "moreblocks:slope_cobble_inner_cut_half",
	["moreblocks:slope_mossycobble_inner_cut_half_raised"] = "moreblocks:slope_cobble_inner_cut_half_raised",
	["moreblocks:slope_mossycobble_outer"] = "moreblocks:slope_cobble_outer",
	["moreblocks:slope_mossycobble_outer_half"] = "moreblocks:slope_cobble_outer_half",
	["moreblocks:slope_mossycobble_outer_half_raised"] = "moreblocks:slope_cobble_outer_half_raised",
	["moreblocks:slope_mossycobble_outer_cut"] = "moreblocks:slope_cobble_outer_cut",
	["moreblocks:slope_mossycobble_outer_cut_half"] = "moreblocks:slope_cobble_outer_cut_half",
	["moreblocks:slope_mossycobble_outer_cut_half_raised"] = "moreblocks:slope_cobble_outer_cut_half_raised",
	["moreblocks:slope_mossycobble_cut"] = "moreblocks:slope_cobble_cut",
	["moreblocks:slope_mossycobble_angled_slab"] = "moreblocks:slope_cobble_angled_slab",
	["moreblocks:slope_mossycobble_angled_stair"] = "moreblocks:slope_cobble_angled_stair",
	["moreblocks:slope_mossycobble_cylinder"] = "moreblocks:slope_cobble_cylinder",
	["moreblocks:slope_mossycobble_spike_pyramid"] = "moreblocks:slope_cobble_spike_pyramid",
	["moreblocks:slope_mossycobble_pyramid"] = "moreblocks:slope_cobble_pyramid",
	["moreblocks:slope_mossycobble_cone"] = "moreblocks:slope_cobble_cone",
	["moreblocks:slope_mossycobble_sphere"] = "moreblocks:slope_cobble_sphere",
	["moreblocks:stair_mossycobble_half"] = "moreblocks:stair_cobble_half",
	["moreblocks:stair_mossycobble_right_half"] = "moreblocks:stair_cobble_right_half",
	["moreblocks:stair_mossycobble_alt"] = "moreblocks:stair_cobble_alt",
	["moreblocks:stair_mossycobble_alt_1"] = "moreblocks:stair_cobble_alt_1",
	["moreblocks:stair_mossycobble_alt_2"] = "moreblocks:stair_cobble_alt_2",
	["moreblocks:stair_mossycobble_alt_4"] = "moreblocks:stair_cobble_alt_4",
	["moreblocks:micro_mossystone_block"] = "moreblocks:micro_stone_block",
	["moreblocks:micro_mossystone_block_1"] = "moreblocks:micro_stone_block_1",
	["moreblocks:micro_mossystone_block_2"] = "moreblocks:micro_stone_block_2",
	["moreblocks:micro_mossystone_block_4"] = "moreblocks:micro_stone_block_4",
	["moreblocks:micro_mossystone_block_12"] = "moreblocks:micro_stone_block_12",
	["moreblocks:micro_mossystone_block_14"] = "moreblocks:micro_stone_block_14",
	["moreblocks:micro_mossystone_block_15"] = "moreblocks:micro_stone_block_15",
	["moreblocks:panel_mossystone_block"] = "moreblocks:panel_stone_block",
	["moreblocks:panel_mossystone_block_1"] = "moreblocks:panel_stone_block_1",
	["moreblocks:panel_mossystone_block_2"] = "moreblocks:panel_stone_block_2",
	["moreblocks:panel_mossystone_block_4"] = "moreblocks:panel_stone_block_4",
	["moreblocks:panel_mossystone_block_12"] = "moreblocks:panel_stone_block_12",
	["moreblocks:panel_mossystone_block_14"] = "moreblocks:panel_stone_block_14",
	["moreblocks:panel_mossystone_block_15"] = "moreblocks:panel_stone_block_15",
	["moreblocks:slab_mossystone_block_quarter"] = "moreblocks:slab_stone_block_quarter",
	["moreblocks:slab_mossystone_block_three_quarter"] = "moreblocks:slab_stone_block_three_quarter",
	["moreblocks:slab_mossystone_block_1"] = "moreblocks:slab_stone_block_1",
	["moreblocks:slab_mossystone_block_2"] = "moreblocks:slab_stone_block_2",
	["moreblocks:slab_mossystone_block_14"] = "moreblocks:slab_stone_block_14",
	["moreblocks:slab_mossystone_block_15"] = "moreblocks:slab_stone_block_15",
	["moreblocks:slab_mossystone_block_two_sides"] = "moreblocks:slab_stone_block_two_sides",
	["moreblocks:slab_mossystone_block_three_sides"] = "moreblocks:slab_stone_block_three_sides",
	["moreblocks:slab_mossystone_block_three_sides_u"] = "moreblocks:slab_stone_block_three_sides_u",
	["moreblocks:slab_mossystone_block_square_column"] = "moreblocks:slab_stone_block_square_column",
	["moreblocks:slope_mossystone_block"] = "moreblocks:slope_stone_block",
	["moreblocks:slope_mossystone_block_half"] = "moreblocks:slope_stone_block_half",
	["moreblocks:slope_mossystone_block_half_raised"] = "moreblocks:slope_stone_block_half_raised",
	["moreblocks:slope_mossystone_block_inner"] = "moreblocks:slope_stone_block_inner",
	["moreblocks:slope_mossystone_block_inner_half"] = "moreblocks:slope_stone_block_inner_half",
	["moreblocks:slope_mossystone_block_inner_half_raised"] = "moreblocks:slope_stone_block_inner_half_raised",
	["moreblocks:slope_mossystone_block_inner_cut"] = "moreblocks:slope_stone_block_inner_cut",
	["moreblocks:slope_mossystone_block_inner_cut_half"] = "moreblocks:slope_stone_block_inner_cut_half",
	["moreblocks:slope_mossystone_block_inner_cut_half_raised"] = "moreblocks:slope_stone_block_inner_cut_half_raised",
	["moreblocks:slope_mossystone_block_outer"] = "moreblocks:slope_stone_block_outer",
	["moreblocks:slope_mossystone_block_outer_half"] = "moreblocks:slope_stone_block_outer_half",
	["moreblocks:slope_mossystone_block_outer_half_raised"] = "moreblocks:slope_stone_block_outer_half_raised",
	["moreblocks:slope_mossystone_block_outer_cut"] = "moreblocks:slope_stone_block_outer_cut",
	["moreblocks:slope_mossystone_block_outer_cut_half"] = "moreblocks:slope_stone_block_outer_cut_half",
	["moreblocks:slope_mossystone_block_outer_cut_half_raised"] = "moreblocks:slope_stone_block_outer_cut_half_raised",
	["moreblocks:slope_mossystone_block_cut"] = "moreblocks:slope_stone_block_cut",
	["moreblocks:slope_mossystone_block_angled_slab"] = "moreblocks:slope_stone_block_angled_slab",
	["moreblocks:slope_mossystone_block_angled_stair"] = "moreblocks:slope_stone_block_angled_stair",
	["moreblocks:slope_mossystone_block_cylinder"] = "moreblocks:slope_stone_block_cylinder",
	["moreblocks:slope_mossystone_block_spike_pyramid"] = "moreblocks:slope_stone_block_spike_pyramid",
	["moreblocks:slope_mossystone_block_pyramid"] = "moreblocks:slope_stone_block_pyramid",
	["moreblocks:slope_mossystone_block_cone"] = "moreblocks:slope_stone_block_cone",
	["moreblocks:slope_mossystone_block_sphere"] = "moreblocks:slope_stone_block_sphere",
	["moreblocks:stair_mossystone_block_half"] = "moreblocks:stair_stone_block_half",
	["moreblocks:stair_mossystone_block_right_half"] = "moreblocks:stair_stone_block_right_half",
	["moreblocks:stair_mossystone_block_alt"] = "moreblocks:stair_stone_block_alt",
	["moreblocks:stair_mossystone_block_alt_1"] = "moreblocks:stair_stone_block_alt_1",
	["moreblocks:stair_mossystone_block_alt_2"] = "moreblocks:stair_stone_block_alt_2",
	["moreblocks:stair_mossystone_block_alt_4"] = "moreblocks:stair_stone_block_alt_4",
	["moreblocks:micro_mossystone_brick"] = "moreblocks:micro_stone_brick",
	["moreblocks:micro_mossystone_brick_1"] = "moreblocks:micro_stone_brick_1",
	["moreblocks:micro_mossystone_brick_2"] = "moreblocks:micro_stone_brick_2",
	["moreblocks:micro_mossystone_brick_4"] = "moreblocks:micro_stone_brick_4",
	["moreblocks:micro_mossystone_brick_12"] = "moreblocks:micro_stone_brick_12",
	["moreblocks:micro_mossystone_brick_14"] = "moreblocks:micro_stone_brick_14",
	["moreblocks:micro_mossystone_brick_15"] = "moreblocks:micro_stone_brick_15",
	["moreblocks:panel_mossystone_brick"] = "moreblocks:panel_stone_brick",
	["moreblocks:panel_mossystone_brick_1"] = "moreblocks:panel_stone_brick_1",
	["moreblocks:panel_mossystone_brick_2"] = "moreblocks:panel_stone_brick_2",
	["moreblocks:panel_mossystone_brick_4"] = "moreblocks:panel_stone_brick_4",
	["moreblocks:panel_mossystone_brick_12"] = "moreblocks:panel_stone_brick_12",
	["moreblocks:panel_mossystone_brick_14"] = "moreblocks:panel_stone_brick_14",
	["moreblocks:panel_mossystone_brick_15"] = "moreblocks:panel_stone_brick_15",
	["moreblocks:slab_mossystone_brick_quarter"] = "moreblocks:slab_stone_brick_quarter",
	["moreblocks:slab_mossystone_brick_three_quarter"] = "moreblocks:slab_stone_brick_three_quarter",
	["moreblocks:slab_mossystone_brick_1"] = "moreblocks:slab_stone_brick_1",
	["moreblocks:slab_mossystone_brick_2"] = "moreblocks:slab_stone_brick_2",
	["moreblocks:slab_mossystone_brick_14"] = "moreblocks:slab_stone_brick_14",
	["moreblocks:slab_mossystone_brick_15"] = "moreblocks:slab_stone_brick_15",
	["moreblocks:slab_mossystone_brick_two_sides"] = "moreblocks:slab_stone_brick_two_sides",
	["moreblocks:slab_mossystone_brick_three_sides"] = "moreblocks:slab_stone_brick_three_sides",
	["moreblocks:slab_mossystone_brick_three_sides_u"] = "moreblocks:slab_stone_brick_three_sides_u",
	["moreblocks:slab_mossystone_brick_square_column"] = "moreblocks:slab_stone_brick_square_column",
	["moreblocks:slope_mossystone_brick"] = "moreblocks:slope_stone_brick",
	["moreblocks:slope_mossystone_brick_half"] = "moreblocks:slope_stone_brick_half",
	["moreblocks:slope_mossystone_brick_half_raised"] = "moreblocks:slope_stone_brick_half_raised",
	["moreblocks:slope_mossystone_brick_inner"] = "moreblocks:slope_stone_brick_inner",
	["moreblocks:slope_mossystone_brick_inner_half"] = "moreblocks:slope_stone_brick_inner_half",
	["moreblocks:slope_mossystone_brick_inner_half_raised"] = "moreblocks:slope_stone_brick_inner_half_raised",
	["moreblocks:slope_mossystone_brick_inner_cut"] = "moreblocks:slope_stone_brick_inner_cut",
	["moreblocks:slope_mossystone_brick_inner_cut_half"] = "moreblocks:slope_stone_brick_inner_cut_half",
	["moreblocks:slope_mossystone_brick_inner_cut_half_raised"] = "moreblocks:slope_stone_brick_inner_cut_half_raised",
	["moreblocks:slope_mossystone_brick_outer"] = "moreblocks:slope_stone_brick_outer",
	["moreblocks:slope_mossystone_brick_outer_half"] = "moreblocks:slope_stone_brick_outer_half",
	["moreblocks:slope_mossystone_brick_outer_half_raised"] = "moreblocks:slope_stone_brick_outer_half_raised",
	["moreblocks:slope_mossystone_brick_outer_cut"] = "moreblocks:slope_stone_brick_outer_cut",
	["moreblocks:slope_mossystone_brick_outer_cut_half"] = "moreblocks:slope_stone_brick_outer_cut_half",
	["moreblocks:slope_mossystone_brick_outer_cut_half_raised"] = "moreblocks:slope_stone_brick_outer_cut_half_raised",
	["moreblocks:slope_mossystone_brick_cut"] = "moreblocks:slope_stone_brick_cut",
	["moreblocks:slope_mossystone_brick_angled_slab"] = "moreblocks:slope_stone_brick_angled_slab",
	["moreblocks:slope_mossystone_brick_angled_stair"] = "moreblocks:slope_stone_brick_angled_stair",
	["moreblocks:slope_mossystone_brick_cylinder"] = "moreblocks:slope_stone_brick_cylinder",
	["moreblocks:slope_mossystone_brick_spike_pyramid"] = "moreblocks:slope_stone_brick_spike_pyramid",
	["moreblocks:slope_mossystone_brick_pyramid"] = "moreblocks:slope_stone_brick_pyramid",
	["moreblocks:slope_mossystone_brick_cone"] = "moreblocks:slope_stone_brick_cone",
	["moreblocks:slope_mossystone_brick_sphere"] = "moreblocks:slope_stone_brick_sphere",
	["moreblocks:stair_mossystone_brick_half"] = "moreblocks:stair_stone_brick_half",
	["moreblocks:stair_mossystone_brick_right_half"] = "moreblocks:stair_stone_brick_right_half",
	["moreblocks:stair_mossystone_brick_alt"] = "moreblocks:stair_stone_brick_alt",
	["moreblocks:stair_mossystone_brick_alt_1"] = "moreblocks:stair_stone_brick_alt_1",
	["moreblocks:stair_mossystone_brick_alt_2"] = "moreblocks:stair_stone_brick_alt_2",
	["moreblocks:stair_mossystone_brick_alt_4"] = "moreblocks:stair_stone_brick_alt_4",
}
default.moss_correspondences = {
	["default:stone"] = "default:mossystone",
	["default:cobble"] = "default:mossycobble",
	["default:stone_block"] = "default:mossystone_block",
	["default:stone_brick"] = "default:mossystone_brick",
	["stairs:slab_stone"] = "stairs:slab_mossystone",
	["stairs:stair_stone"] = "stairs:stair_mossystone",
	["stairs:stair_inner_stone"] = "stairs:stair_inner_mossystone",
	["stairs:stair_outer_stone"] = "stairs:stair_outer_mossystone",
	["stairs:slab_cobble"] = "stairs:slab_mossycobble",
	["stairs:stair_cobble"] = "stairs:stair_mossycobble",
	["stairs:stair_inner_cobble"] = "stairs:stair_inner_mossycobble",
	["stairs:stair_outer_cobble"] = "stairs:stair_outer_mossycobble",
	["stairs:slab_stone_block"] = "stairs:slab_mossystone_block",
	["stairs:stair_stone_block"] = "stairs:stair_mossystone_block",
	["stairs:stair_inner_stone_block"] = "stairs:stair_inner_mossystone_block",
	["stairs:stair_outer_stone_block"] = "stairs:stair_outer_mossystone_block",
	["stairs:slab_stone_brick"] = "stairs:slab_mossystone_brick",
	["stairs:stair_stone_brick"] = "stairs:stair_mossystone_brick",
	["stairs:stair_inner_stone_brick"] = "stairs:stair_inner_mossystone_brick",
	["stairs:stair_outer_stone_brick"] = "stairs:stair_outer_mossystone_brick",
	["walls:cobble"] = "walls:mossycobble",
	["moreblocks:micro_stone"] = "moreblocks:micro_mossystone",
	["moreblocks:micro_stone_1"] = "moreblocks:micro_mossystone_1",
	["moreblocks:micro_stone_2"] = "moreblocks:micro_mossystone_2",
	["moreblocks:micro_stone_4"] = "moreblocks:micro_mossystone_4",
	["moreblocks:micro_stone_12"] = "moreblocks:micro_mossystone_12",
	["moreblocks:micro_stone_14"] = "moreblocks:micro_mossystone_14",
	["moreblocks:micro_stone_15"] = "moreblocks:micro_mossystone_15",
	["moreblocks:panel_stone"] = "moreblocks:panel_mossystone",
	["moreblocks:panel_stone_1"] = "moreblocks:panel_mossystone_1",
	["moreblocks:panel_stone_2"] = "moreblocks:panel_mossystone_2",
	["moreblocks:panel_stone_4"] = "moreblocks:panel_mossystone_4",
	["moreblocks:panel_stone_12"] = "moreblocks:panel_mossystone_12",
	["moreblocks:panel_stone_14"] = "moreblocks:panel_mossystone_14",
	["moreblocks:panel_stone_15"] = "moreblocks:panel_mossystone_15",
	["moreblocks:slab_stone_quarter"] = "moreblocks:slab_mossystone_quarter",
	["moreblocks:slab_stone_three_quarter"] = "moreblocks:slab_mossystone_three_quarter",
	["moreblocks:slab_stone_1"] = "moreblocks:slab_mossystone_1",
	["moreblocks:slab_stone_2"] = "moreblocks:slab_mossystone_2",
	["moreblocks:slab_stone_14"] = "moreblocks:slab_mossystone_14",
	["moreblocks:slab_stone_15"] = "moreblocks:slab_mossystone_15",
	["moreblocks:slab_stone_two_sides"] = "moreblocks:slab_mossystone_two_sides",
	["moreblocks:slab_stone_three_sides"] = "moreblocks:slab_mossystone_three_sides",
	["moreblocks:slab_stone_three_sides_u"] = "moreblocks:slab_mossystone_three_sides_u",
	["moreblocks:slab_stone_square_column"] = "moreblocks:slab_mossystone_square_column",
	["moreblocks:slope_stone"] = "moreblocks:slope_mossystone",
	["moreblocks:slope_stone_half"] = "moreblocks:slope_mossystone_half",
	["moreblocks:slope_stone_half_raised"] = "moreblocks:slope_mossystone_half_raised",
	["moreblocks:slope_stone_inner"] = "moreblocks:slope_mossystone_inner",
	["moreblocks:slope_stone_inner_half"] = "moreblocks:slope_mossystone_inner_half",
	["moreblocks:slope_stone_inner_half_raised"] = "moreblocks:slope_mossystone_inner_half_raised",
	["moreblocks:slope_stone_inner_cut"] = "moreblocks:slope_mossystone_inner_cut",
	["moreblocks:slope_stone_inner_cut_half"] = "moreblocks:slope_mossystone_inner_cut_half",
	["moreblocks:slope_stone_inner_cut_half_raised"] = "moreblocks:slope_mossystone_inner_cut_half_raised",
	["moreblocks:slope_stone_outer"] = "moreblocks:slope_mossystone_outer",
	["moreblocks:slope_stone_outer_half"] = "moreblocks:slope_mossystone_outer_half",
	["moreblocks:slope_stone_outer_half_raised"] = "moreblocks:slope_mossystone_outer_half_raised",
	["moreblocks:slope_stone_outer_cut"] = "moreblocks:slope_mossystone_outer_cut",
	["moreblocks:slope_stone_outer_cut_half"] = "moreblocks:slope_mossystone_outer_cut_half",
	["moreblocks:slope_stone_outer_cut_half_raised"] = "moreblocks:slope_mossystone_outer_cut_half_raised",
	["moreblocks:slope_stone_cut"] = "moreblocks:slope_mossystone_cut",
	["moreblocks:slope_stone_angled_slab"] = "moreblocks:slope_mossystone_angled_slab",
	["moreblocks:slope_stone_angled_stair"] = "moreblocks:slope_mossystone_angled_stair",
	["moreblocks:slope_stone_cylinder"] = "moreblocks:slope_mossystone_cylinder",
	["moreblocks:slope_stone_spike_pyramid"] = "moreblocks:slope_mossystone_spike_pyramid",
	["moreblocks:slope_stone_pyramid"] = "moreblocks:slope_mossystone_pyramid",
	["moreblocks:slope_stone_cone"] = "moreblocks:slope_mossystone_cone",
	["moreblocks:slope_stone_sphere"] = "moreblocks:slope_mossystone_sphere",
	["moreblocks:stair_stone_half"] = "moreblocks:stair_mossystone_half",
	["moreblocks:stair_stone_right_half"] = "moreblocks:stair_mossystone_right_half",
	["moreblocks:stair_stone_alt"] = "moreblocks:stair_mossystone_alt",
	["moreblocks:stair_stone_alt_1"] = "moreblocks:stair_mossystone_alt_1",
	["moreblocks:stair_stone_alt_2"] = "moreblocks:stair_mossystone_alt_2",
	["moreblocks:stair_stone_alt_4"] = "moreblocks:stair_mossystone_alt_4",
	["moreblocks:micro_cobble"] = "moreblocks:micro_mossycobble",
	["moreblocks:micro_cobble_1"] = "moreblocks:micro_mossycobble_1",
	["moreblocks:micro_cobble_2"] = "moreblocks:micro_mossycobble_2",
	["moreblocks:micro_cobble_4"] = "moreblocks:micro_mossycobble_4",
	["moreblocks:micro_cobble_12"] = "moreblocks:micro_mossycobble_12",
	["moreblocks:micro_cobble_14"] = "moreblocks:micro_mossycobble_14",
	["moreblocks:micro_cobble_15"] = "moreblocks:micro_mossycobble_15",
	["moreblocks:panel_cobble"] = "moreblocks:panel_mossycobble",
	["moreblocks:panel_cobble_1"] = "moreblocks:panel_mossycobble_1",
	["moreblocks:panel_cobble_2"] = "moreblocks:panel_mossycobble_2",
	["moreblocks:panel_cobble_4"] = "moreblocks:panel_mossycobble_4",
	["moreblocks:panel_cobble_12"] = "moreblocks:panel_mossycobble_12",
	["moreblocks:panel_cobble_14"] = "moreblocks:panel_mossycobble_14",
	["moreblocks:panel_cobble_15"] = "moreblocks:panel_mossycobble_15",
	["moreblocks:slab_cobble_quarter"] = "moreblocks:slab_mossycobble_quarter",
	["moreblocks:slab_cobble_three_quarter"] = "moreblocks:slab_mossycobble_three_quarter",
	["moreblocks:slab_cobble_1"] = "moreblocks:slab_mossycobble_1",
	["moreblocks:slab_cobble_2"] = "moreblocks:slab_mossycobble_2",
	["moreblocks:slab_cobble_14"] = "moreblocks:slab_mossycobble_14",
	["moreblocks:slab_cobble_15"] = "moreblocks:slab_mossycobble_15",
	["moreblocks:slab_cobble_two_sides"] = "moreblocks:slab_mossycobble_two_sides",
	["moreblocks:slab_cobble_three_sides"] = "moreblocks:slab_mossycobble_three_sides",
	["moreblocks:slab_cobble_three_sides_u"] = "moreblocks:slab_mossycobble_three_sides_u",
	["moreblocks:slab_cobble_square_column"] = "moreblocks:slab_mossycobble_square_column",
	["moreblocks:slope_cobble"] = "moreblocks:slope_mossycobble",
	["moreblocks:slope_cobble_half"] = "moreblocks:slope_mossycobble_half",
	["moreblocks:slope_cobble_half_raised"] = "moreblocks:slope_mossycobble_half_raised",
	["moreblocks:slope_cobble_inner"] = "moreblocks:slope_mossycobble_inner",
	["moreblocks:slope_cobble_inner_half"] = "moreblocks:slope_mossycobble_inner_half",
	["moreblocks:slope_cobble_inner_half_raised"] = "moreblocks:slope_mossycobble_inner_half_raised",
	["moreblocks:slope_cobble_inner_cut"] = "moreblocks:slope_mossycobble_inner_cut",
	["moreblocks:slope_cobble_inner_cut_half"] = "moreblocks:slope_mossycobble_inner_cut_half",
	["moreblocks:slope_cobble_inner_cut_half_raised"] = "moreblocks:slope_mossycobble_inner_cut_half_raised",
	["moreblocks:slope_cobble_outer"] = "moreblocks:slope_mossycobble_outer",
	["moreblocks:slope_cobble_outer_half"] = "moreblocks:slope_mossycobble_outer_half",
	["moreblocks:slope_cobble_outer_half_raised"] = "moreblocks:slope_mossycobble_outer_half_raised",
	["moreblocks:slope_cobble_outer_cut"] = "moreblocks:slope_mossycobble_outer_cut",
	["moreblocks:slope_cobble_outer_cut_half"] = "moreblocks:slope_mossycobble_outer_cut_half",
	["moreblocks:slope_cobble_outer_cut_half_raised"] = "moreblocks:slope_mossycobble_outer_cut_half_raised",
	["moreblocks:slope_cobble_cut"] = "moreblocks:slope_mossycobble_cut",
	["moreblocks:slope_cobble_angled_slab"] = "moreblocks:slope_mossycobble_angled_slab",
	["moreblocks:slope_cobble_angled_stair"] = "moreblocks:slope_mossycobble_angled_stair",
	["moreblocks:slope_cobble_cylinder"] = "moreblocks:slope_mossycobble_cylinder",
	["moreblocks:slope_cobble_spike_pyramid"] = "moreblocks:slope_mossycobble_spike_pyramid",
	["moreblocks:slope_cobble_pyramid"] = "moreblocks:slope_mossycobble_pyramid",
	["moreblocks:slope_cobble_cone"] = "moreblocks:slope_mossycobble_cone",
	["moreblocks:slope_cobble_sphere"] = "moreblocks:slope_mossycobble_sphere",
	["moreblocks:stair_cobble_half"] = "moreblocks:stair_mossycobble_half",
	["moreblocks:stair_cobble_right_half"] = "moreblocks:stair_mossycobble_right_half",
	["moreblocks:stair_cobble_alt"] = "moreblocks:stair_mossycobble_alt",
	["moreblocks:stair_cobble_alt_1"] = "moreblocks:stair_mossycobble_alt_1",
	["moreblocks:stair_cobble_alt_2"] = "moreblocks:stair_mossycobble_alt_2",
	["moreblocks:stair_cobble_alt_4"] = "moreblocks:stair_mossycobble_alt_4",
	["moreblocks:micro_stone_block"] = "moreblocks:micro_mossystone_block",
	["moreblocks:micro_stone_block_1"] = "moreblocks:micro_mossystone_block_1",
	["moreblocks:micro_stone_block_2"] = "moreblocks:micro_mossystone_block_2",
	["moreblocks:micro_stone_block_4"] = "moreblocks:micro_mossystone_block_4",
	["moreblocks:micro_stone_block_12"] = "moreblocks:micro_mossystone_block_12",
	["moreblocks:micro_stone_block_14"] = "moreblocks:micro_mossystone_block_14",
	["moreblocks:micro_stone_block_15"] = "moreblocks:micro_mossystone_block_15",
	["moreblocks:panel_stone_block"] = "moreblocks:panel_mossystone_block",
	["moreblocks:panel_stone_block_1"] = "moreblocks:panel_mossystone_block_1",
	["moreblocks:panel_stone_block_2"] = "moreblocks:panel_mossystone_block_2",
	["moreblocks:panel_stone_block_4"] = "moreblocks:panel_mossystone_block_4",
	["moreblocks:panel_stone_block_12"] = "moreblocks:panel_mossystone_block_12",
	["moreblocks:panel_stone_block_14"] = "moreblocks:panel_mossystone_block_14",
	["moreblocks:panel_stone_block_15"] = "moreblocks:panel_mossystone_block_15",
	["moreblocks:slab_stone_block_quarter"] = "moreblocks:slab_mossystone_block_quarter",
	["moreblocks:slab_stone_block_three_quarter"] = "moreblocks:slab_mossystone_block_three_quarter",
	["moreblocks:slab_stone_block_1"] = "moreblocks:slab_mossystone_block_1",
	["moreblocks:slab_stone_block_2"] = "moreblocks:slab_mossystone_block_2",
	["moreblocks:slab_stone_block_14"] = "moreblocks:slab_mossystone_block_14",
	["moreblocks:slab_stone_block_15"] = "moreblocks:slab_mossystone_block_15",
	["moreblocks:slab_stone_block_two_sides"] = "moreblocks:slab_mossystone_block_two_sides",
	["moreblocks:slab_stone_block_three_sides"] = "moreblocks:slab_mossystone_block_three_sides",
	["moreblocks:slab_stone_block_three_sides_u"] = "moreblocks:slab_mossystone_block_three_sides_u",
	["moreblocks:slab_stone_block_square_column"] = "moreblocks:slab_mossystone_block_square_column",
	["moreblocks:slope_stone_block"] = "moreblocks:slope_mossystone_block",
	["moreblocks:slope_stone_block_half"] = "moreblocks:slope_mossystone_block_half",
	["moreblocks:slope_stone_block_half_raised"] = "moreblocks:slope_mossystone_block_half_raised",
	["moreblocks:slope_stone_block_inner"] = "moreblocks:slope_mossystone_block_inner",
	["moreblocks:slope_stone_block_inner_half"] = "moreblocks:slope_mossystone_block_inner_half",
	["moreblocks:slope_stone_block_inner_half_raised"] = "moreblocks:slope_mossystone_block_inner_half_raised",
	["moreblocks:slope_stone_block_inner_cut"] = "moreblocks:slope_mossystone_block_inner_cut",
	["moreblocks:slope_stone_block_inner_cut_half"] = "moreblocks:slope_mossystone_block_inner_cut_half",
	["moreblocks:slope_stone_block_inner_cut_half_raised"] = "moreblocks:slope_mossystone_block_inner_cut_half_raised",
	["moreblocks:slope_stone_block_outer"] = "moreblocks:slope_mossystone_block_outer",
	["moreblocks:slope_stone_block_outer_half"] = "moreblocks:slope_mossystone_block_outer_half",
	["moreblocks:slope_stone_block_outer_half_raised"] = "moreblocks:slope_mossystone_block_outer_half_raised",
	["moreblocks:slope_stone_block_outer_cut"] = "moreblocks:slope_mossystone_block_outer_cut",
	["moreblocks:slope_stone_block_outer_cut_half"] = "moreblocks:slope_mossystone_block_outer_cut_half",
	["moreblocks:slope_stone_block_outer_cut_half_raised"] = "moreblocks:slope_mossystone_block_outer_cut_half_raised",
	["moreblocks:slope_stone_block_cut"] = "moreblocks:slope_mossystone_block_cut",
	["moreblocks:slope_stone_block_angled_slab"] = "moreblocks:slope_mossystone_block_angled_slab",
	["moreblocks:slope_stone_block_angled_stair"] = "moreblocks:slope_mossystone_block_angled_stair",
	["moreblocks:slope_stone_block_cylinder"] = "moreblocks:slope_mossystone_block_cylinder",
	["moreblocks:slope_stone_block_spike_pyramid"] = "moreblocks:slope_mossystone_block_spike_pyramid",
	["moreblocks:slope_stone_block_pyramid"] = "moreblocks:slope_mossystone_block_pyramid",
	["moreblocks:slope_stone_block_cone"] = "moreblocks:slope_mossystone_block_cone",
	["moreblocks:slope_stone_block_sphere"] = "moreblocks:slope_mossystone_block_sphere",
	["moreblocks:stair_stone_block_half"] = "moreblocks:stair_mossystone_block_half",
	["moreblocks:stair_stone_block_right_half"] = "moreblocks:stair_mossystone_block_right_half",
	["moreblocks:stair_stone_block_alt"] = "moreblocks:stair_mossystone_block_alt",
	["moreblocks:stair_stone_block_alt_1"] = "moreblocks:stair_mossystone_block_alt_1",
	["moreblocks:stair_stone_block_alt_2"] = "moreblocks:stair_mossystone_block_alt_2",
	["moreblocks:stair_stone_block_alt_4"] = "moreblocks:stair_mossystone_block_alt_4",
	["moreblocks:micro_stone_brick"] = "moreblocks:micro_mossystone_brick",
	["moreblocks:micro_stone_brick_1"] = "moreblocks:micro_mossystone_brick_1",
	["moreblocks:micro_stone_brick_2"] = "moreblocks:micro_mossystone_brick_2",
	["moreblocks:micro_stone_brick_4"] = "moreblocks:micro_mossystone_brick_4",
	["moreblocks:micro_stone_brick_12"] = "moreblocks:micro_mossystone_brick_12",
	["moreblocks:micro_stone_brick_14"] = "moreblocks:micro_mossystone_brick_14",
	["moreblocks:micro_stone_brick_15"] = "moreblocks:micro_mossystone_brick_15",
	["moreblocks:panel_stone_brick"] = "moreblocks:panel_mossystone_brick",
	["moreblocks:panel_stone_brick_1"] = "moreblocks:panel_mossystone_brick_1",
	["moreblocks:panel_stone_brick_2"] = "moreblocks:panel_mossystone_brick_2",
	["moreblocks:panel_stone_brick_4"] = "moreblocks:panel_mossystone_brick_4",
	["moreblocks:panel_stone_brick_12"] = "moreblocks:panel_mossystone_brick_12",
	["moreblocks:panel_stone_brick_14"] = "moreblocks:panel_mossystone_brick_14",
	["moreblocks:panel_stone_brick_15"] = "moreblocks:panel_mossystone_brick_15",
	["moreblocks:slab_stone_brick_quarter"] = "moreblocks:slab_mossystone_brick_quarter",
	["moreblocks:slab_stone_brick_three_quarter"] = "moreblocks:slab_mossystone_brick_three_quarter",
	["moreblocks:slab_stone_brick_1"] = "moreblocks:slab_mossystone_brick_1",
	["moreblocks:slab_stone_brick_2"] = "moreblocks:slab_mossystone_brick_2",
	["moreblocks:slab_stone_brick_14"] = "moreblocks:slab_mossystone_brick_14",
	["moreblocks:slab_stone_brick_15"] = "moreblocks:slab_mossystone_brick_15",
	["moreblocks:slab_stone_brick_two_sides"] = "moreblocks:slab_mossystone_brick_two_sides",
	["moreblocks:slab_stone_brick_three_sides"] = "moreblocks:slab_mossystone_brick_three_sides",
	["moreblocks:slab_stone_brick_three_sides_u"] = "moreblocks:slab_mossystone_brick_three_sides_u",
	["moreblocks:slab_stone_brick_square_column"] = "moreblocks:slab_mossystone_brick_square_column",
	["moreblocks:slope_stone_brick"] = "moreblocks:slope_mossystone_brick",
	["moreblocks:slope_stone_brick_half"] = "moreblocks:slope_mossystone_brick_half",
	["moreblocks:slope_stone_brick_half_raised"] = "moreblocks:slope_mossystone_brick_half_raised",
	["moreblocks:slope_stone_brick_inner"] = "moreblocks:slope_mossystone_brick_inner",
	["moreblocks:slope_stone_brick_inner_half"] = "moreblocks:slope_mossystone_brick_inner_half",
	["moreblocks:slope_stone_brick_inner_half_raised"] = "moreblocks:slope_mossystone_brick_inner_half_raised",
	["moreblocks:slope_stone_brick_inner_cut"] = "moreblocks:slope_mossystone_brick_inner_cut",
	["moreblocks:slope_stone_brick_inner_cut_half"] = "moreblocks:slope_mossystone_brick_inner_cut_half",
	["moreblocks:slope_stone_brick_inner_cut_half_raised"] = "moreblocks:slope_mossystone_brick_inner_cut_half_raised",
	["moreblocks:slope_stone_brick_outer"] = "moreblocks:slope_mossystone_brick_outer",
	["moreblocks:slope_stone_brick_outer_half"] = "moreblocks:slope_mossystone_brick_outer_half",
	["moreblocks:slope_stone_brick_outer_half_raised"] = "moreblocks:slope_mossystone_brick_outer_half_raised",
	["moreblocks:slope_stone_brick_outer_cut"] = "moreblocks:slope_mossystone_brick_outer_cut",
	["moreblocks:slope_stone_brick_outer_cut_half"] = "moreblocks:slope_mossystone_brick_outer_cut_half",
	["moreblocks:slope_stone_brick_outer_cut_half_raised"] = "moreblocks:slope_mossystone_brick_outer_cut_half_raised",
	["moreblocks:slope_stone_brick_cut"] = "moreblocks:slope_mossystone_brick_cut",
	["moreblocks:slope_stone_brick_angled_slab"] = "moreblocks:slope_mossystone_brick_angled_slab",
	["moreblocks:slope_stone_brick_angled_stair"] = "moreblocks:slope_mossystone_brick_angled_stair",
	["moreblocks:slope_stone_brick_cylinder"] = "moreblocks:slope_mossystone_brick_cylinder",
	["moreblocks:slope_stone_brick_spike_pyramid"] = "moreblocks:slope_mossystone_brick_spike_pyramid",
	["moreblocks:slope_stone_brick_pyramid"] = "moreblocks:slope_mossystone_brick_pyramid",
	["moreblocks:slope_stone_brick_cone"] = "moreblocks:slope_mossystone_brick_cone",
	["moreblocks:slope_stone_brick_sphere"] = "moreblocks:slope_mossystone_brick_sphere",
	["moreblocks:stair_stone_brick_half"] = "moreblocks:stair_mossystone_brick_half",
	["moreblocks:stair_stone_brick_right_half"] = "moreblocks:stair_mossystone_brick_right_half",
	["moreblocks:stair_stone_brick_alt"] = "moreblocks:stair_mossystone_brick_alt",
	["moreblocks:stair_stone_brick_alt_1"] = "moreblocks:stair_mossystone_brick_alt_1",
	["moreblocks:stair_stone_brick_alt_2"] = "moreblocks:stair_mossystone_brick_alt_2",
	["moreblocks:stair_stone_brick_alt_4"] = "moreblocks:stair_mossystone_brick_alt_4",
}

function search_faces(pos, node)
	local xm = {x=pos.x-1, y=pos.y, z=pos.z}
	local xp = {x=pos.x+1, y=pos.y, z=pos.z}
	local ym = {x=pos.x, y=pos.y-1, z=pos.z}
	local yp = {x=pos.x, y=pos.y+1, z=pos.z}
	local zm = {x=pos.x, y=pos.y, z=pos.z-1}
	local zp = {x=pos.x, y=pos.y, z=pos.z+1}
	if core.get_node(xm).name == node then return true end
	if core.get_node(xp).name == node then return true end
	if core.get_node(ym).name == node then return true end
	if core.get_node(yp).name == node then return true end
	if core.get_node(zm).name == node then return true end
	if core.get_node(zp).name == node then return true end
	if core.get_item_group(core.get_node(xm).name, node) ~= 0 then return true end
	if core.get_item_group(core.get_node(xp).name, node) ~= 0 then return true end
	if core.get_item_group(core.get_node(ym).name, node) ~= 0 then return true end
	if core.get_item_group(core.get_node(yp).name, node) ~= 0 then return true end
	if core.get_item_group(core.get_node(zm).name, node) ~= 0 then return true end
	if core.get_item_group(core.get_node(zp).name, node) ~= 0 then return true end
	return false
end

function search_face_lighting(pos, light)
	local xm = {x=pos.x-1, y=pos.y, z=pos.z}
	local xp = {x=pos.x+1, y=pos.y, z=pos.z}
	local ym = {x=pos.x, y=pos.y-1, z=pos.z}
	local yp = {x=pos.x, y=pos.y+1, z=pos.z}
	local zm = {x=pos.x, y=pos.y, z=pos.z-1}
	local zp = {x=pos.x, y=pos.y, z=pos.z+1}
	if core.get_node_light(xm) ~= nil then
	if core.get_node_light(xm) >= light then return true end end
	if core.get_node_light(xp) ~= nil then
	if core.get_node_light(xp) >= light then return true end end
	if core.get_node_light(ym) ~= nil then
	if core.get_node_light(ym) >= light then return true end end
	if core.get_node_light(yp) ~= nil then
	if core.get_node_light(yp) >= light then return true end end
	if core.get_node_light(zm) ~= nil then
	if core.get_node_light(zm) >= light then return true end end
	if core.get_node_light(zp) ~= nil then
	if core.get_node_light(zp) >= light then return true end end
	return false
end

function default.attack_heal(pos)
	local timer = core.get_node_timer(pos)
	for _, obj in pairs(core.get_objects_inside_radius(pos, 3)) do
		if obj:is_player() then
		obj:set_hp(obj:get_hp()+5)
		timer:start(.4)	end
local ent = obj:get_luaentity()
if ent and ent.type == "monster" then
	obj:punch(obj, .5, {
		full_punch_interval=.5,
		damage_groups={fleshy=5},
	}, nil)
	timer:start(.3)
end
	end
	timer:start(math.random(.3, 1))
end

local lp = core.settings:get_bool("limit_particles")

function default.fireflies(pos)
	if not core.get_modpath("es") and lp ~= true then
	local tod = core.get_timeofday()
if tod > .8 or tod < .2 then
core.add_particlespawner({
	amount = 2,
	time = 7,
	minpos = {x=pos.x-2, y=pos.y-.5, z=pos.z-2},
	maxpos = {x=pos.x+2, y=pos.y+1.5, z=pos.z+2},
	minvel = {x=-.1, y=-.1, z=-.1},
	maxvel = {x=.1, y=.1, z=.1},
	exptime = {min = 1, max = 2},
	minsize = .8,
	maxsize = 1,
	collisiondetection = true,
	texture = "default_firefly.png",
	glow = 5 })
end
core.get_node_timer(pos):start(math.random(6, 7))
	end
end

local ahhc = core.settings:get_bool("altitude_heat_humidity_check")

if ahhc ~= false then
function default.h_h_h(pos, height1, height2, heat1, heat2, humidity1, humidity2)
	local heat = core.get_heat(pos)
	local humidity = core.get_humidity(pos)
	if height1 and pos.y < height1 or height2 and pos.y > height2 and #core.find_nodes_in_area({x = pos.x + 2, y = pos.y, z = pos.z + 2},
		{x = pos.x - 2, y = pos.y - 3, z = pos.z - 2}, "default:hot_air") == 0 then
		return true
	end
	if (heat1 and heat < heat1 and #core.find_nodes_in_area({x = pos.x + 2, y = pos.y, z = pos.z + 2},
		{x = pos.x - 2, y = pos.y - 3, z = pos.z - 2}, "default:hot_air") == 0 or
		heat2 and heat > heat2 and #core.find_nodes_in_area({x = pos.x + 1, y = pos.y + 2, z = pos.z + 1},
		{x = pos.x - 1, y = pos.y, z = pos.z - 1}, "default:cold_air") == 0) then
		return true
	end
	if humidity1 and humidity < humidity1 or humidity2 and humidity > humidity2 then
		return true
	end
	return false
end
else
function default.h_h_h() return false end
end
-- No heat check because of water currents	\\\
function default.under_water_growth(pos, height, light, step, p2, timer)
	local water_pos = {x = pos.x, y = pos.y + height, z = pos.z}
	local water_node = core.get_node_or_nil(water_pos)
	local ntimer = core.get_node_timer(pos)
	if not water_node then
		ntimer:start(timer)
		return
	end
	local meta = core.get_meta(pos)
	if meta:get_int("light_level") > 0 then
		light = light - (meta:get_int("light_level") * 3)
		meta:set_int("light_level", 0)
	end
	local light_level = core.get_node_light(water_pos)
	if not light_level or light_level < light then
		ntimer:start(timer)
		return
	end
	local def_top = core.registered_nodes[water_node.name]
	if def_top and def_top.liquidtype == "source" and
		core.get_item_group(water_node.name, "water") > 0 then
	if step == "" then
		step = core.get_node(pos).name
	end
		core.swap_node(pos, {name = step, param2 = p2})
		ntimer:start(timer)
	end
end

function default.under_water_spread(pos, height, light, step, timer, group)
	local ntimer = core.get_node_timer(pos)
	if core.find_node_near(pos, 2, "ignore") then
		ntimer:start(timer)
		return
	end

	local light_level = core.get_node_light({x = pos.x, y = pos.y + height, z = pos.z})
	if not light_level or light_level < light then
		ntimer:start(timer)
		return
	end

	local pos0 = vector.subtract(pos, 4)
	local pos1 = vector.add(pos, 4)
	group = group or "group:seaweedy"
	if #core.find_nodes_in_area(pos0, pos1, group) > 3 then
		ntimer:start(timer)
		return
	end

	local sands = core.find_nodes_in_area(pos0, pos1, "default:sand")
	local num_sands = #sands
	if num_sands >= 1 then
		for si = 1, math.min(3, num_sands) do
			local sand = sands[math.random(num_sands)]
			local sand_above = {x = sand.x, y = sand.y + 1, z = sand.z}
			local above_name = core.get_node(sand_above).name
			light_level = core.get_node_light(sand_above)
			if light_level and light_level >= light and above_name == "default:water_source" then
	if step == "" then
		step = core.get_node(pos).name
	end
				core.swap_node(sand, {name = step})
				core.get_node_timer(sand):start(timer)
			end
		end
	end
	ntimer:start(timer)
end

function default.on_water_spread(pos, reach, light, step, timer, group)
	local ntimer = core.get_node_timer(pos)
	if core.find_node_near(pos, 2, "ignore") then
		ntimer:start(timer)
		return
	end

	local light_level = core.get_node_light(pos)
	if not light_level or light_level < light then
		ntimer:start(timer)
		return
	end

	local pos0 = vector.subtract(pos, reach)
	local pos1 = vector.add(pos, reach)
	group = group or "group:o_w_flora"
	if #core.find_nodes_in_area(pos0, pos1, group) > 2 then
		ntimer:start(timer)
		return
	end

	local waters = core.find_nodes_in_area_under_air(pos0, pos1, {"default:water_source", "default:fresh_water_source"})
	local num_waters = #waters
	if num_waters >= 1 then
		for si = 1, math.min(2, num_waters) do
			local water = waters[math.random(num_waters)]
			local water_above = {x = water.x, y = water.y + 1, z = water.z}
			light_level = core.get_node_light(water_above)
			if light_level and light_level >= light then
	if step == "" then
		step = core.get_node(pos).name
	end
				core.set_node(water_above, {name = step, param2 = math.random(0, 3)})
				core.get_node_timer(water_above):start(timer)
			end
		end
	end
	ntimer:start(timer)
end
--		///
local MapGen = core.get_modpath("mapgen")

function default.cooling_near(pos, timer)-- If near Water, change Water to Ice and cool the air
	local nt = core.get_node_timer(pos)
for i=-1,1 do
for j=-1,1 do
for k=-1,1 do
	local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
	local n = core.get_node_or_nil(p)
	if not n then
		nt:start(timer)
		return-- Nodes not yet loaded, try later
	end
	if n.name == "default:water_source" or n.name == "default:fresh_water_source" then
		local ice_name = "default:ice"
if MapGen then
	local ice_choice = math.random(1, 6)
	if ice_choice == 2 then
		ice_name = "mapgen:clear_ice"
	elseif ice_choice == 3 then
		ice_name = "mapgen:clear_ice_white"
	elseif ice_choice == 4 then
		ice_name = "mapgen:clear_ice_blue"
	elseif ice_choice == 5 then
		ice_name = "mapgen:clear_ice_cyan"
	end
end
		core.swap_node(p, {name = ice_name})
		core.get_node_timer(p):start(5)
	elseif n.name == "air" and pos.y > -25 then
		core.set_node(p, {name = "default:cold_air"})
	elseif MapGen and n.name == "default:fresh_water_flowing" and j == 0 then
		core.swap_node(p, {name = "mapgen:ice_waterfall"})
		core.get_node_timer(p):start(5)
	end
end
end
end
	nt:start(timer)
end

function default.update_cools(pos)
	for i=-1,1 do
	for j=-1,1 do
	for k=-1,1 do
local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
local n = core.get_node_or_nil(p)
if not n then
	return-- Nodes not yet loaded, try later
end
if core.get_item_group(n.name, "icy") > 0 or core.get_item_group(n.name, "snowy") > 0 then
	core.get_node_timer(p):start(5)
end
	end
	end
	end
end

if ahhc ~= false then
function al_he(pos)-- check altitude for heat and coolant
	if pos.y > -10 and pos.y < 110 and core.get_heat(pos) > 49 and
	not core.find_node_near(pos, 1, {"default:crystal_block", "default:crystal_spike", "default:cold_air"}) then
		return true
	end
	return false
end
else
function al_he() return false end
end

local WhitePine = core.get_modpath("white_pine")

function default.melt_near_heat(pos)-- TODO, if in a cool biome slowdown melting
	local under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not under then
		core.get_node_timer(pos):start(math.random(5, 9))
		return
	end
	local name = core.get_node(pos).name
	local water_node = "default:water"
	if math.random(1, 3) == 1 then
		water_node = "default:fresh_water"
	end
	if core.get_item_group(under.name, "torch") ~= 0 or
	core.find_node_near(pos, 1, {"group:igniter", "default:furnace_active"}) or al_he(pos) then
		if name == "default:ice" or name == "default:ice_brick" or name == "default:ice_block" or name == "default:cave_ice" or
		name == "caverealms:thin_ice" or name == "mapgen:ice_waterfall" or name == "mapgen:clear_ice" or name == "mapgen:clear_ice_blue" or
		name == "mapgen:clear_ice_cyan" or name == "mapgen:crumbled_ice" or name == "mapgen:clear_ice_white" then
			core.set_node(pos, {name = water_node.."_source"})
		elseif name == "default:snow" or name == "default:snow_block" or name == "default:snow_brick" or name == "ethereal:icecle_1" or
		name == "ethereal:icecle_2" or name == "ethereal:icecle_3" or name == "ethereal:icecle_4" or name == "ethereal:icecle_5" or
		name == "caverealms:icicle_down" or name == "caverealms:icicle_up" or name == "caverealms:icicle" or core.get_item_group(name, "melttoflo") ~= 0 then
			if name:find("invisadoors:door_") then	core.add_item(pos, "default:mese_crystal") end
			core.set_node(pos, {name = water_node.."_flowing", param2 = math.random(2, 6)})
		elseif name == "default:dirt_with_snow" then
			core.swap_node(pos, {name = "default:dirt_with_grass"})
		elseif name == "default:pine_needles_with_snow" then
			local meta = core.get_meta(pos)
			if meta:get_string("pinecones") == "true" then
	swap_preserved(pos, "default:pinecone_needles")
			else
	swap_preserved(pos, "default:pine_needles")
			end
			core.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = water_node.."_flowing"})
		elseif name == "white_pine:needles_with_snow" then
			swap_preserved(pos, "white_pine:needles")
			core.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = water_node.."_flowing"})
		end
		core.check_for_falling(pos)
		return
	end
	if name == "default:snow" and WhitePine then
		pos.y = pos.y - 1
		if core.get_item_group(core.get_node({x = pos.x, y = pos.y - 1, z = pos.z}).name, "torch") ~= 0 or
		core.find_node_near(pos, 1, {"group:igniter", "default:furnace_active"}) or al_he(pos) then
			core.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = water_node.."_flowing"})
			return
		end
		if under.name == "white_pine:needles" then
			swap_preserved(pos, "white_pine:needles_with_snow")
		elseif under.name == "default:pine_needles" or under.name == "default:pinecone_needles" then
	if under.name == "default:pinecone_needles" then
		if core.find_node_near(pos, 2, "default:pine_trunk") then
		local meta = core.get_meta(pos)
		meta:set_string("pinecones", "true") end
	end
			swap_preserved(pos, "default:pine_needles_with_snow")
		end
	end
end

function default.hydrate_dry_dirt(pos)
	local name = core.get_node(pos).name
	local water_near = core.find_node_near(pos, 1, "group:water")

	if water_near then
		local n = core.get_node(water_near).name
		if name == "default:dry_dirt" or name == "ethereal:dry_dirt_with_fiery_grass" then
			core.swap_node(pos, {name="default:dirt"})
		elseif name == "default:dry_clay_dirt" then
			core.swap_node(pos, {name="default:clay_dirt"})
		end
		if n == "default:water_flowing" or n == "default:fresh_water_flowing" then
			core.remove_node(water_near)
		end
	else
		core.get_node_timer(pos):start(math.random(4, 6))
	end
end

function default.is_coral_submerged(pos)
	local name = core.get_node(pos).name
	if (#core.find_nodes_in_area({x = pos.x + 4, y = pos.y + 8, z = pos.z + 4},
	{x = pos.x - 4, y = pos.y, z = pos.z - 4}, "group:water") == 0 and not core.find_node_near(pos, 4, "ignore")) or
	core.find_node_near(pos, 1, {"group:igniter", "default:furnace_active"}) then
local level = "_tip"
if core.get_item_group(name, "coraly") == 2 then
	level = ""
end
		core.swap_node(pos, {name = "default:coral_skeleton"..level})
	else
local meta = core.get_meta(pos)
if meta:get_int("spreading") < 45 then
	meta:set_int("spreading", meta:get_int("spreading")+1)
else
	meta:set_int("spreading", 0)
	default.under_water_spread(pos, 1, 6, name, math.random(5, 9), "group:coraly")
	return
end
		core.get_node_timer(pos):start(math.random(5, 9))
	end
end

function default.water_freezing(pos)-- Flowing water can't freeze by environment because it's heating itself
if ahhc ~= false then
	if pos.y > -10 and pos.y < 110 and core.get_heat(pos) < 12.6 and #core.find_nodes_in_area({x = pos.x + 4, y = pos.y, z = pos.z + 4},
		{x = pos.x - 4, y = pos.y - 9, z = pos.z - 4}, {"group:igniter", "default:furnace_active", "default:hot_air"}) == 0 then
		core.set_node(pos, {name = "default:ice"})
	elseif pos.y > 110 and #core.find_nodes_in_area({x = pos.x + 4, y = pos.y, z = pos.z + 4},
		{x = pos.x - 4, y = pos.y - 9, z = pos.z - 4}, {"group:igniter", "default:furnace_active", "default:hot_air"}) == 0 then
		core.set_node(pos, {name = "default:ice"})
	end
end
end

local Nether = core.get_modpath("nether")

-- Lavacooling
if core.settings:get_bool("enable_lavacooling") ~= false then
core.register_abm({
	label = "Lava cooling",
	nodenames = {"default:lava_source", "default:lava_flowing", "default:molten_rock",
		"caverealms:hot_cobble", "caverealms:glow_obsidian_2",
		"caverealms:glow_obsidian_brick_2", "nether:lava_source", "nether:lava_crust"},
	neighbors = {"group:cools_lava", "group:water", "air", "group:soil", "default:compost_pile", "default:mud"},
	interval = 2,
	chance = 2,
	catch_up = false,
	action = function(pos, node)
		if node.name == "default:lava_flowing" and node.param2 > 2 then
			if core.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" or
			core.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "default:hot_air" then
				local lava_choice = math.random(1, 102)
				if lava_choice == 41 then
					core.set_node(pos, {name = "default:molten_rock"})
				end
			end
		end
		if core.find_node_near(pos, 1, "group:cools_lava") then
			if node.name == "caverealms:hot_cobble" then
				core.set_node(pos, {name = "default:cobble"})
			elseif node.name == "caverealms:glow_obsidian_2" then
				core.set_node(pos, {name = "caverealms:glow_obsidian"})
			elseif node.name == "caverealms:glow_obsidian_brick_2" then
				core.set_node(pos, {name = "caverealms:glow_obsidian_brick"})
			elseif node.name == "nether:lava_source" or node.name == "nether:lava_crust" then
				-- use swap_node to avoid triggering the lava_crust's after_destruct
				core.swap_node(pos, {name = "nether:basalt"})
			elseif node.name == "default:molten_rock" then
				core.set_node(pos, {name = "default:pumice"})
			elseif node.name == "default:lava_source" then
				core.set_node(pos, {name = "default:obsidian"})
			else -- Lava flowing
				if search_faces(pos, "default:water_source") then
					core.set_node(pos, {name = "default:basalt"})
				else
					local stone_choice = math.random(1, 3)
					local stone_name = "default:stone"
					if stone_choice == 2 then
						stone_name = "default:desert_stone"
					end
					core.set_node(pos, {name = stone_name})
				end
			end

	if Nether then
		local pos_above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local node_above = core.get_node(pos_above)

		-- Evaporate water sitting above lava, if it's in the Nether.
		-- (we don't want Nether mod to effect overworld lava mechanics)
		if (core.get_item_group(node_above.name, "water") > 0 or
			core.get_item_group(node_above.name, "icy") > 0 or
			core.get_item_group(node_above.name, "snowy") > 0) and
			pos.y < nether.DEPTH_CEILING and pos.y > nether.DEPTH_FLOOR_LAYERS then
			-- cools_lava might be a better group to check for, but perhaps there's
			-- something in that group that isn't a liquid and shouldn't be evaporated?
			core.swap_node(pos_above, {name="air"})
		end

		-- add steam to cooling lava
		core.add_particlespawner({
			amount = 20,
			time = .15,
			minpos = {x=pos.x - .4, y=pos.y, z=pos.z - .4},
			maxpos = {x=pos.x + .4, y=pos.y + .5, z=pos.z + .4},
			minvel = {x = -.5, y = .5, z = -.5},
			maxvel = {x = .5, y = 1.5, z = .5},
			minacc = {x = 0, y = .1, z = 0},
			maxacc = {x = 0, y = .2, z = 0},
			exptime = {min = .5, max = 1.3},
			minsize = 1.5,
			maxsize = 3.5,
			texture = "nether_particle_anim4.png",
			animation = {type = "vertical_frames", aspect_w = 7, aspect_h = 7, length = 1.4}
		})
	end
			core.sound_play("default_cool_lava", {pos = pos, max_hear_distance = 16, gain = .2}, true)
		end
		local melts = core.find_node_near(pos, 1, {"group:icy", "group:snowy"})
		if melts then
			core.get_node_timer(melts):start(1)
		end
		for i=-1,1 do
		for j=-1,1 do
		for k=-1,1 do
			local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
			local n = core.get_node_or_nil(p)
			if not n then
				return-- Nodes not yet loaded, try later
			end
	if n.name == "air" and pos.y > -50 and ahhc ~= false then
		core.set_node(p, {name = "default:hot_air"})
	end
	if core.get_item_group(n.name, "soil") > 0 or n.name == "default:compost_pile" or n.name == "default:mud" then
		if n.name == "default:clay_dirt"
		or n.name == "default:clay_dirt_with_savanna_grass"
		or n.name == "farming:clay_soil"
		or n.name == "farming:clay_soil_wet"
		or n.name == "es:clay_dirt_with_aiden_grass" then
			core.set_node(p, {name = "default:dry_clay_dirt"})
		else
			core.set_node(p, {name = "default:dry_dirt"})
		end
		core.get_node_timer(p):start(math.random(3, 5))
	end
	if n.name == "ethereal:quicksand" then
		core.set_node(p, {name = "default:sand"})
	end
	n.name = default.moss_death_correspondences[n.name]
	if n.name then
		core.set_node(p, n)
	end
		end
		end
		end
	end,
})
end


-- Optimized helper to put all items in an inventory into a drops list
function default.get_inventory_drops(pos, inventory, drops)
	local inv = core.get_meta(pos):get_inventory()
	local n = #drops
	for i = 1, inv:get_size(inventory) do
		local stack = inv:get_stack(inventory, i)
		if stack:get_count() > 0 then
			drops[n+1] = stack:to_table()
			n = n + 1
		end
	end
end


-- Reed and cactus growing

-- Wrapping the functions in ABM action is necessary to make overriding them possible
function default.grow_cactus(pos, node)
	if node.param2 >= 4 then
		return
	end
	pos.y = pos.y - 1
	if core.get_item_group(core.get_node(pos).name, "sand") == 0 then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "default:cactus" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = core.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	if core.get_node_light(pos) < 13 then
		return
	end
	core.set_node(pos, {name = "default:cactus"})
	return true
end

function default.grow_reed(pos, node)
	pos.y = pos.y - 1
	local name = core.get_node(pos).name
	if name ~= "default:dirt" and
		name ~= "default:dirt_with_short_grass" and
		name ~= "default:dirt_with_grass" and
		name ~= "default:dirt_with_savanna_grass" and
		name ~= "default:dirt_with_swamp_grass" and
		name ~= "default:dirt_with_rainforest_litter" and
		name ~= "default:clay_dirt" and
		name ~= "default:clay_dirt_with_savanna_grass" then
		return
	end
	if not core.find_node_near(pos, 3, "group:water") then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "default:reed" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = core.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	if core.get_node_light(pos) < 13 then
		return
	end
	core.set_node(pos, {name = "default:reed"})
	return true
end

core.register_abm({
	label = "Grow cactus",
	nodenames = {"default:cactus"},
	neighbors = {"group:sand"},
	interval = 12,
	chance = 83,
	action = function(...)
		default.grow_cactus(...)
	end
})

core.register_abm({
	label = "Grow reed",
	nodenames = {"default:reed"},
	-- Grows on dirt and surface dirt nodes of the biomes reed appears in,
	-- including the old savanna nodes.
	-- 'default:dirt_with_grass' is here only because it was allowed before.
	neighbors = {
		"default:dirt",
		"default:dirt_with_short_grass",
		"default:dirt_with_grass",
		"default:dirt_with_savanna_grass",
		"default:dirt_with_swamp_grass",
		"default:dirt_with_rainforest_litter",
		"default:clay_dirt",
		"default:clay_dirt_with_savanna_grass",
	},
	interval = 14,
	chance = 71,
	action = function(...)
		default.grow_reed(...)
	end
})


-- Dig upwards

local in_dig_up = false

function default.dig_up(pos, node, digger, max_height)
	if in_dig_up then return end -- Do not recurse
	if digger == nil then return end
	max_height = max_height or 100

	in_dig_up = true
	for y = 1, max_height do
		local up_pos = vector.offset(pos, 0, y, 0)
		local up_node = core.get_node(up_pos)
		if up_node.name ~= node.name then
			break
		end
		if not core.node_dig(up_pos, up_node, digger) then
			break
		end
	end
	in_dig_up = false
end

-- errors are hard to handle, instead we rely on resetting this value the next step
core.register_globalstep(function()
	in_dig_up = false
end)


-- Fence registration helper
local fence_collision_extra = core.settings:get_bool("enable_fence_tall") and 3/8 or 0

function default.register_fence(name, def)
	local fence_texture = "default_fence_overlay.png^".. def.texture ..
			"^default_fence_overlay.png^[makealpha:255,126,126"
	-- Allow almost everything to be overridden
	local default_fields = {
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
			-- connect_top =
			-- connect_bottom =
			connect_front = {{-1/16,  3/16, -1/2,   1/16,  5/16, -1/8 },
						{-1/16, -5/16, -1/2,   1/16, -3/16, -1/8 }},
			connect_left =  {{-1/2,   3/16, -1/16, -1/8,   5/16,  1/16},
						{-1/2,  -5/16, -1/16, -1/8,  -3/16,  1/16}},
			connect_back =  {{-1/16,  3/16,  1/8,   1/16,  5/16,  1/2 },
						{-1/16, -5/16,  1/8,   1/16, -3/16,  1/2 }},
			connect_right = {{ 1/8,   3/16, -1/16,  1/2,   5/16,  1/16},
						{ 1/8,  -5/16, -1/16,  1/2,  -3/16,  1/16}}
		},
		collision_box = {
			type = "connected",
			fixed = {-1/8, -1/2, -1/8, 1/8, 1/2 + fence_collision_extra, 1/8},
			-- connect_top =
			-- connect_bottom =
			connect_front = {-1/8, -1/2, -1/2,  1/8, 1/2 + fence_collision_extra, -1/8},
			connect_left =  {-1/2, -1/2, -1/8, -1/8, 1/2 + fence_collision_extra,  1/8},
			connect_back =  {-1/8, -1/2,  1/8,  1/8, 1/2 + fence_collision_extra,  1/2},
			connect_right = { 1/8, -1/2, -1/8,  1/2, 1/2 + fence_collision_extra,  1/8}
		},
		connects_to = {"group:fence", "group:wood", "group:trunk", "group:wall", "group:stone"},
		inventory_image = fence_texture,
		wield_image = fence_texture,
		tiles = {def.texture},
		sunlight_propagates = true,
		is_ground_content = false,
		check_for_pole = true, --< signs_lib
		groups = {},
	}
	for k, v in pairs(default_fields) do
		if def[k] == nil then
			def[k] = v
		end
	end

	-- Always add to the fence group, even if no group provided
	def.groups.fence = 1

	local material = def.material
	def.texture = nil
	def.material = nil

	core.register_node(name, def)

	-- Register crafting recipe, trim away starting colon if any
	if not material then return end
	name = string.gsub(name, "^:", "")
	core.register_craft({
		output = name .." 4",
		recipe = {
			{ material, "group:stick", material },
			{ material, "group:stick", material }
		}
	})
end


-- Fence rail registration helper
function default.register_fence_rail(name, def)
	local fence_rail_texture = "default_fence_rail_overlay.png^".. def.texture ..
			"^default_fence_rail_overlay.png^[makealpha:255,126,126"
	-- Allow almost everything to be overridden
	local default_fields = {
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-1/16,  3/16, -1/16, 1/16,  5/16, 1/16},
					{-1/16, -3/16, -1/16, 1/16, -5/16, 1/16}},
			-- connect_top =
			-- connect_bottom =
			connect_front = {{-1/16,  3/16, -1/2,   1/16,  5/16, -1/16},
						{-1/16, -5/16, -1/2,   1/16, -3/16, -1/16}},
			connect_left =  {{-1/2,   3/16, -1/16, -1/16,  5/16,  1/16},
						{-1/2,  -5/16, -1/16, -1/16, -3/16,  1/16}},
			connect_back =  {{-1/16,  3/16,  1/16,  1/16,  5/16,  1/2 },
						{-1/16, -5/16,  1/16,  1/16, -3/16,  1/2 }},
			connect_right = {{ 1/16,  3/16, -1/16,  1/2,   5/16,  1/16},
						{ 1/16, -5/16, -1/16,  1/2,  -3/16,  1/16}}
		},
		collision_box = {
			type = "connected",
			fixed = {-1/8, -1/2, -1/8, 1/8, 1/2 + fence_collision_extra, 1/8},
			-- connect_top =
			-- connect_bottom =
			connect_front = {-1/8, -1/2, -1/2,  1/8, 1/2 + fence_collision_extra, -1/8},
			connect_left =  {-1/2, -1/2, -1/8, -1/8, 1/2 + fence_collision_extra,  1/8},
			connect_back =  {-1/8, -1/2,  1/8,  1/8, 1/2 + fence_collision_extra,  1/2},
			connect_right = { 1/8, -1/2, -1/8,  1/2, 1/2 + fence_collision_extra,  1/8}
		},
		connects_to = {"group:fence", "group:wall", "group:trunk"},
		inventory_image = fence_rail_texture,
		wield_image = fence_rail_texture,
		tiles = {def.texture},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {},
	}
	for k, v in pairs(default_fields) do
		if def[k] == nil then
			def[k] = v
		end
	end

	def.groups.fence = 1

	local material = def.material
	def.texture = nil
	def.material = nil

	core.register_node(name, def)

	if not material then return end
	name = string.gsub(name, "^:", "")
	core.register_craft({
		output = name .." 16",
		recipe = {
			{ material, material },
			{ "", ""},
			{ material, material }
		}
	})
end


-- Mese post registration helper
function default.register_mesepost(name, def)
	local post_texture = def.texture .."^default_mese_post_light_side.png^[makealpha:0,0,0"
	local post_texture_dark = def.texture .."^default_mese_post_light_side_dark.png^[makealpha:0,0,0"
	-- Allow almost everything to be overridden
	local default_fields = {
		wield_image = post_texture,
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {-2/16, -8/16, -2/16, 2/16, 8/16, 2/16}
		},
		paramtype = "light",
		tiles = {def.texture, def.texture, post_texture_dark, post_texture_dark, post_texture, post_texture},
		use_texture_alpha = "opaque",
		light_source = default.LIGHT_MAX,
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = default.node_sound_wood_defaults(),
	}
	for k, v in pairs(default_fields) do
		if def[k] == nil then
			def[k] = v
		end
	end

	local material = def.material
	def.texture = nil
	def.material = nil

	core.register_node(name, def)

	if not material then return end
	name = string.gsub(name, "^:", "")
	core.register_craft({
		output = name .." 4",
		recipe = {
			{"default:glass"},
			{"default:mese_crystal"},
			{material}
		}
	})
end


-- Leafdecay

-- Prevent decay of placed leaves
function default.after_place_leaves(pos, placer, itemstack, pointd)
	if placer and placer:is_player() then
		local node = core.get_node(pos)
		node.param2 = 1
		core.set_node(pos, node)
	end
end

-- Leafdecay
local function leafdecay_after_destruct(pos, oldnode, def)
	for _, v in pairs(core.find_nodes_in_area(vector.subtract(pos, def.radius), vector.add(pos, def.radius), def.leaves)) do
		local node = core.get_node(v)
		local timer = core.get_node_timer(v)
		if node.param2 ~= 1 and not timer:is_started() then
			timer:start(math.random(20, 120) / 10)
		end
	end
end

local movement_gravity = tonumber(core.settings:get("movement_gravity")) or 9.81

local function leafdecay_on_timer(pos, def)
	if core.find_node_near(pos, def.radius, def.trunks) then
		return false
	end

	local node = core.get_node(pos)
	local drops = core.get_node_drops(node.name)
	for _, item in ipairs(drops) do
		local is_leaf
		for _, v in pairs(def.leaves) do
			if v == item then
				is_leaf = true
			end
		end
		if core.get_item_group(item, "leafdecay_drop") ~= 0 or
				not is_leaf then
			core.add_item({
				x = pos.x - 0.5 + math.random(),
				y = pos.y - 0.5 + math.random(),
				z = pos.z - 0.5 + math.random(),
			}, item)
		end
	end

	core.remove_node(pos)
	core.check_for_falling(pos)

	-- spawn a few particles for the removed node
	core.add_particlespawner({
		amount = 8,
		time = .001,
		minpos = vector.subtract(pos, {x=.5, y=.5, z=.5}),
		maxpos = vector.add(pos, {x=.5, y=.5, z=.5}),
		minvel = vector.new(-.5, -1, -.5),
		maxvel = vector.new(.5, 0, .5),
		minacc = vector.new(0, -movement_gravity, 0),
		maxacc = vector.new(0, -movement_gravity, 0),
		minsize = 0,
		maxsize = 0,
		node = node,
	})
end

function default.register_leafdecay(def)
	assert(def.leaves)
	assert(def.trunks)
	assert(def.radius)
	for _, v in pairs(def.trunks) do
		core.override_item(v, {
			after_destruct = function(pos, oldnode)
				leafdecay_after_destruct(pos, oldnode, def)
			end,
		})
	end
	for _, v in pairs(def.leaves) do
		core.override_item(v, {
			on_timer = function(pos)
				leafdecay_on_timer(pos, def)
			end,
		})
	end
end


-- Plasma projectile
local plasma_light

if core.get_modpath("illumination") then
	plasma_light = "illumination:light_full"
core.register_alias("default:light", "illumination:light_full")
else
core.register_node("default:light", {
	drawtype = "airlike",
	light_source = 14,
	paramtype = "light",
	walkable = false,
	diggable = false,
	pointable = false,
	buildable_to = true,
	sunlight_propagates = true,
	on_blast = function() end,
	drop = "",
	groups = {not_in_creative_inventory=1},
	on_timer = function(pos)
		for i, obj in pairs(core.get_objects_inside_radius(pos, 1)) do
	if obj:is_player() then
		return true
	end
		end
		core.remove_node(pos)
	end,
})
	plasma_light = "default:light"
core.register_alias("illumination:light_faint", "air")
core.register_alias("illumination:light_dim", "air")
core.register_alias("illumination:light_mid", "air")
core.register_alias("illumination:light_full", "default:light")
end

core.register_entity("default:plasma", {
initial_properties = {
	visual = "sprite",
	textures = {"plasma.png"},
	physical = false,
	collisionbox = {-.1,-.1,-.1, .1,.1,.1},
	visual_size = {x = 1.5, y = 1.5},
	use_texture_alpha = true,
	glow = 14,
},
	launcher = "",
	age = 0,
	y_depth = 1,
	lastpos = {},
	hit_player = function(self, player)
		local s = self.object:get_pos()
		local p = player:get_pos()
		local vec = {x=s.x - p.x, y=s.y - p.y, z=s.z - p.z}
		player:punch(self.object, 1.,  {
			full_punch_interval = 1.,
			damage_groups = {fleshy = 200},
		}, vec)
	end,
	hit_mob = function(self, mob)
		mob:punch(self.object, 1., {
			full_punch_interval = 1.,
			damage_groups = {fleshy = 200},
		}, nil)
	end,
	hit_node = function(self, pos, node)
		core.sound_play("tnt_explode", {pos = pos, gain = 1, max_hear_distance = 48}, true)
		local nodecut = core.get_node(pos).name
		if nodecut == "default:bedrock_barrier" then
			core.check_for_falling(pos)
			return
		elseif nodecut == "nssm:indistructible_morentir" or nodecut == "mapgen:adamantium"
		or nodecut == "mapgen:impervium" or nodecut == "es:hdsteel_block" or nodecut == "es:hdglass" then
			core.dig_node(pos)
			core.check_for_falling(pos)
			return
		end
		for dx = -1, 1 do
		for dy = -self.y_depth, 1 do
		for dz = -1, 1 do
	local p = {x=pos.x + dx, y=pos.y + dy, z=pos.z + dz}	 if core.is_protected(p, self.launcher) then return end
	local ncut = core.get_node(p).name
	if ncut == "default:stone"
	or ncut == "default:rocks"
	or ncut == "default:rock"
	or ncut == "default:desert_stone"
	or ncut == "default:desert_rocks"
	or ncut == "default:desert_rock"
	or ncut == "default:sand"
	or ncut == "default:desert_sand"
	or ncut == "default:silver_sand"
	or ncut == "default:gravel" then
		core.remove_node(p)
		core.add_item(p, {name = ncut})
	end
	if ncut ~= "default:bedrock_barrier" and ncut ~= "nssm:indistructible_morentir" and ncut ~= "mapgen:adamantium"
	and ncut ~= "mapgen:impervium" and ncut ~= "es:hdsteel_block" and ncut ~= "es:hdglass" then
		core.dig_node(p)
	end
	core.after(.5, function()
core.check_for_falling({x=pos.x + dx, y=pos.y+2, z=pos.z + dz})
	end, pos)
		end
		end
		end
	end,
	on_step = function(self, dtime)
		self.age = self.age + 1
		if self.age > 180 then
			self.object:remove()
			return
		end
		local pos = self.object:get_pos()
		pos = vector.round(pos)
		local node = core.get_node_or_nil(pos)
		if node and core.registered_nodes[node.name].walkable and not core.is_protected(pos, self.launcher) then
			self.hit_node(self, pos, node)
			self.object:remove()
			return
		end
		if self.hit_player or self.hit_mob then
			for _,obj in pairs(core.get_objects_inside_radius({x=pos.x, y=pos.y-.5, z=pos.z}, 1)) do
	if self.hit_player and obj:is_player() and obj:get_player_name() ~= self.launcher then
		self.hit_player(self, obj)
		self.object:remove()
		return
	end

	local entity = obj:get_luaentity() and obj:get_luaentity().name or ""
-- Needs a more efficient list of entities to ignore
	if self.hit_mob and obj:get_player_name() ~= self.launcher and entity ~= "default:plasma" and entity ~= "__builtin:item"
	and entity ~= "__builtin:falling_node" and entity ~= "extra_energy:orb" and entity ~= "mtools:block_dummy" and entity ~= "anvil:item"
	and entity ~= "gauges:hp_bar" and entity ~= "signs_lib:text" and entity ~= "itemframes:item" and obj:get_hp() > 2 then
		self.hit_mob(self, obj)
		if entity ~= "es:bullet" then
			self.object:remove()
			return
		end
	end
			end
		end
		if self.lastpos.x~=nil then
	if math.floor(self.lastpos.x+.5) ~= math.floor(pos.x+.5)
	or math.floor(self.lastpos.y+.5) ~= math.floor(pos.y+.5)
	or math.floor(self.lastpos.z+.5) ~= math.floor(pos.z+.5) then
		if core.get_node(self.lastpos).name == plasma_light then
			core.remove_node(self.lastpos)
		end
		if core.get_node(pos).name == "air" then
			core.set_node(pos, {name = plasma_light})
			core.get_node_timer(pos):start(1)
		end
	end
		end
	self.lastpos = pos
	end
})


-- Convert default:dirts to something that fits the environment
core.register_abm({
	label = "Grass spread",
	nodenames = {"default:dirt", "default:clay_dirt", "default:dirt_with_short_grass"},
	neighbors = {"air", "group:grass", "group:savanna_grass", "default:snow"},
	interval = 6,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		-- Check for darkness: night, shadow or under a light-blocking node
		-- Returns if ignore above
		local above = {x= pos.x, y= pos.y+ 1, z= pos.z}
		if (core.get_node_light(above) or 0) < 13 then
			return
		end

		-- Look for spreading dirt-type neighbours
		local p2 = core.find_node_near(pos, 1, "group:spreading_dirt_type")
		if p2 then
			local n3 = core.get_node(p2)
			local ns = (n3.name == "default:clay_dirt_with_savanna_grass" or n3.name == "es:clay_dirt_with_aiden_grass")
			if node.name == "default:clay_dirt" then
				if ns then
					core.set_node(pos, {name = n3.name})
				end
			elseif not ns then
				core.set_node(pos, {name = n3.name})
			end
			return
		end

		-- Else, any seeding nodes on top?
		local name = core.get_node(above).name
		if node.name ~= "default:clay_dirt" then
	-- Snow check is cheapest, so comes first
	if name == "default:snow" then
		core.set_node(pos, {name = "default:dirt_with_snow"})
	elseif core.get_item_group(name, "normal_grass") ~= 0 then
		core.set_node(pos, {name = "default:dirt_with_grass"})
	elseif core.get_item_group(name, "savanna_grass") ~= 0 then
		core.set_node(pos, {name = "default:dirt_with_savanna_grass"})
	end
		else
	if core.get_item_group(name, "savanna_grass") ~= 0 then
		core.set_node(pos, {name = "default:clay_dirt_with_savanna_grass"})
	end
		end
	end
})


-- Grass and savanna grass removed in darkness
core.register_abm({
	label = "Grass covered",
	nodenames = {"group:spreading_dirt_type", "default:dirt_with_short_grass", "ethereal:dry_dirt_with_fiery_grass"},
	interval = 8,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		local above = {x= pos.x, y= pos.y+ 1, z= pos.z}
		local name = core.get_node(above).name
		local nodedef = core.registered_nodes[name]
		if name ~= "ignore" and nodedef and not ((nodedef.sunlight_propagates or
			nodedef.paramtype == "light") and nodedef.liquidtype == "none") then
			if node.name == "default:clay_dirt_with_savanna_grass" or node.name == "es:clay_dirt_with_aiden_grass" then
				core.set_node(pos, {name = "default:clay_dirt"})
			elseif node.name == "ethereal:dry_dirt_with_fiery_grass" then
				core.set_node(pos, {name = "default:dry_dirt"})
			else
				core.set_node(pos, {name = "default:dirt"})
			end
		end
	end
})


-- Moss growth on cobble near water
core.register_abm({
	label = "Moss growth",
	nodenames = {"default:stone", "default:cobble", "default:stone_brick", "default:stone_block",
"stairs:slab_stone", "stairs:stair_stone", "stairs:stair_inner_stone", "stairs:stair_outer_stone",
"stairs:slab_cobble", "stairs:stair_cobble", "stairs:stair_inner_cobble", "stairs:stair_outer_cobble",
"stairs:slab_stone_block", "stairs:stair_stone_block", "stairs:stair_inner_stone_block", "stairs:stair_outer_stone_block",
"stairs:slab_stone_brick", "stairs:stair_stone_brick", "stairs:stair_inner_stone_brick", "stairs:stair_outer_stone_brick", "walls:cobble",
"moreblocks:micro_stone", "moreblocks:micro_stone_1", "moreblocks:micro_stone_2", "moreblocks:micro_stone_4",
"moreblocks:micro_stone_12", "moreblocks:micro_stone_14", "moreblocks:micro_stone_15", "moreblocks:panel_stone",
"moreblocks:panel_stone_1", "moreblocks:panel_stone_2", "moreblocks:panel_stone_4", "moreblocks:panel_stone_12",
"moreblocks:panel_stone_14", "moreblocks:panel_stone_15", "moreblocks:slab_stone_quarter",
"moreblocks:slab_stone_three_quarter", "moreblocks:slab_stone_1", "moreblocks:slab_stone_2", "moreblocks:slab_stone_14",
"moreblocks:slab_stone_15", "moreblocks:slab_stone_two_sides", "moreblocks:slab_stone_three_sides",
"moreblocks:slab_stone_three_sides_u", "moreblocks:slab_stone_square_column", "moreblocks:slope_stone",
"moreblocks:slope_stone_half", "moreblocks:slope_stone_half_raised", "moreblocks:slope_stone_inner",
"moreblocks:slope_stone_inner_half", "moreblocks:slope_stone_inner_half_raised", "moreblocks:slope_stone_inner_cut",
"moreblocks:slope_stone_inner_cut_half", "moreblocks:slope_stone_inner_cut_half_raised", "moreblocks:slope_stone_outer",
"moreblocks:slope_stone_outer_half", "moreblocks:slope_stone_outer_half_raised", "moreblocks:slope_stone_outer_cut",
"moreblocks:slope_stone_outer_cut_half", "moreblocks:slope_stone_outer_cut_half_raised", "moreblocks:slope_stone_cut",
"moreblocks:slope_stone_angled_slab", "moreblocks:slope_stone_angled_stair", "moreblocks:slope_stone_cylinder",
"moreblocks:slope_stone_spike_pyramid", "moreblocks:slope_stone_pyramid", "moreblocks:slope_stone_cone",
"moreblocks:slope_stone_sphere", "moreblocks:stair_stone_half", "moreblocks:stair_stone_right_half",
"moreblocks:stair_stone_alt", "moreblocks:stair_stone_alt_1", "moreblocks:stair_stone_alt_2", "moreblocks:stair_stone_alt_4",
"moreblocks:micro_cobble", "moreblocks:micro_cobble_1", "moreblocks:micro_cobble_2", "moreblocks:micro_cobble_4",
"moreblocks:micro_cobble_12", "moreblocks:micro_cobble_14", "moreblocks:micro_cobble_15", "moreblocks:panel_cobble",
"moreblocks:panel_cobble_1", "moreblocks:panel_cobble_2", "moreblocks:panel_cobble_4", "moreblocks:panel_cobble_12",
"moreblocks:panel_cobble_14", "moreblocks:panel_cobble_15", "moreblocks:slab_cobble_quarter",
"moreblocks:slab_cobble_three_quarter", "moreblocks:slab_cobble_1", "moreblocks:slab_cobble_2", "moreblocks:slab_cobble_14",
"moreblocks:slab_cobble_15", "moreblocks:slab_cobble_two_sides", "moreblocks:slab_cobble_three_sides",
"moreblocks:slab_cobble_three_sides_u", "moreblocks:slab_cobble_square_column", "moreblocks:slope_cobble",
"moreblocks:slope_cobble_half", "moreblocks:slope_cobble_half_raised", "moreblocks:slope_cobble_inner",
"moreblocks:slope_cobble_inner_half", "moreblocks:slope_cobble_inner_half_raised", "moreblocks:slope_cobble_inner_cut",
"moreblocks:slope_cobble_inner_cut_half", "moreblocks:slope_cobble_inner_cut_half_raised", "moreblocks:slope_cobble_outer",
"moreblocks:slope_cobble_outer_half", "moreblocks:slope_cobble_outer_half_raised", "moreblocks:slope_cobble_outer_cut",
"moreblocks:slope_cobble_outer_cut_half", "moreblocks:slope_cobble_outer_cut_half_raised", "moreblocks:slope_cobble_cut",
"moreblocks:slope_cobble_angled_slab", "moreblocks:slope_cobble_angled_stair", "moreblocks:slope_cobble_cylinder",
"moreblocks:slope_cobble_spike_pyramid", "moreblocks:slope_cobble_pyramid", "moreblocks:slope_cobble_cone",
"moreblocks:slope_cobble_sphere", "moreblocks:stair_cobble_half", "moreblocks:stair_cobble_right_half",
"moreblocks:stair_cobble_alt", "moreblocks:stair_cobble_alt_1", "moreblocks:stair_cobble_alt_2", "moreblocks:stair_cobble_alt_4",
"moreblocks:micro_stone_block", "moreblocks:micro_stone_block_1", "moreblocks:micro_stone_block_2",
"moreblocks:micro_stone_block_4", "moreblocks:micro_stone_block_12", "moreblocks:micro_stone_block_14",
"moreblocks:micro_stone_block_15", "moreblocks:panel_stone_block", "moreblocks:panel_stone_block_1",
"moreblocks:panel_stone_block_2", "moreblocks:panel_stone_block_4", "moreblocks:panel_stone_block_12",
"moreblocks:panel_stone_block_14", "moreblocks:panel_stone_block_15", "moreblocks:slab_stone_block_quarter",
"moreblocks:slab_stone_block_three_quarter", "moreblocks:slab_stone_block_1", "moreblocks:slab_stone_block_2",
"moreblocks:slab_stone_block_14", "moreblocks:slab_stone_block_15", "moreblocks:slab_stone_block_two_sides",
"moreblocks:slab_stone_block_three_sides", "moreblocks:slab_stone_block_three_sides_u",
"moreblocks:slab_stone_block_square_column", "moreblocks:slope_stone_block", "moreblocks:slope_stone_block_half",
"moreblocks:slope_stone_block_half_raised", "moreblocks:slope_stone_block_inner", "moreblocks:slope_stone_block_inner_half",
"moreblocks:slope_stone_block_inner_half_raised", "moreblocks:slope_stone_block_inner_cut",
"moreblocks:slope_stone_block_inner_cut_half", "moreblocks:slope_stone_block_inner_cut_half_raised",
"moreblocks:slope_stone_block_outer", "moreblocks:slope_stone_block_outer_half", "moreblocks:slope_stone_block_outer_half_raised",
"moreblocks:slope_stone_block_outer_cut", "moreblocks:slope_stone_block_outer_cut_half",
"moreblocks:slope_stone_block_outer_cut_half_raised", "moreblocks:slope_stone_block_cut", "moreblocks:slope_stone_block_angled_slab",
"moreblocks:slope_stone_block_angled_stair", "moreblocks:slope_stone_block_cylinder", "moreblocks:slope_stone_block_spike_pyramid",
"moreblocks:slope_stone_block_pyramid", "moreblocks:slope_stone_block_cone", "moreblocks:slope_stone_block_sphere",
"moreblocks:stair_stone_block_half", "moreblocks:stair_stone_block_right_half", "moreblocks:stair_stone_block_alt",
"moreblocks:stair_stone_block_alt_1", "moreblocks:stair_stone_block_alt_2", "moreblocks:stair_stone_block_alt_4",
"moreblocks:micro_stone_brick", "moreblocks:micro_stone_brick_1", "moreblocks:micro_stone_brick_2", "moreblocks:micro_stone_brick_4",
"moreblocks:micro_stone_brick_12", "moreblocks:micro_stone_brick_14", "moreblocks:micro_stone_brick_15", "moreblocks:panel_stone_brick",
"moreblocks:panel_stone_brick_1", "moreblocks:panel_stone_brick_2", "moreblocks:panel_stone_brick_4", "moreblocks:panel_stone_brick_12",
"moreblocks:panel_stone_brick_14", "moreblocks:panel_stone_brick_15", "moreblocks:slab_stone_brick_quarter",
"moreblocks:slab_stone_brick_three_quarter", "moreblocks:slab_stone_brick_1", "moreblocks:slab_stone_brick_2",
"moreblocks:slab_stone_brick_14", "moreblocks:slab_stone_brick_15", "moreblocks:slab_stone_brick_two_sides",
"moreblocks:slab_stone_brick_three_sides", "moreblocks:slab_stone_brick_three_sides_u", "moreblocks:slab_stone_brick_square_column",
"moreblocks:slope_stone_brick", "moreblocks:slope_stone_brick_half", "moreblocks:slope_stone_brick_half_raised",
"moreblocks:slope_stone_brick_inner", "moreblocks:slope_stone_brick_inner_half", "moreblocks:slope_stone_brick_inner_half_raised",
"moreblocks:slope_stone_brick_inner_cut", "moreblocks:slope_stone_brick_inner_cut_half",
"moreblocks:slope_stone_brick_inner_cut_half_raised", "moreblocks:slope_stone_brick_outer", "moreblocks:slope_stone_brick_outer_half",
"moreblocks:slope_stone_brick_outer_half_raised", "moreblocks:slope_stone_brick_outer_cut", "moreblocks:slope_stone_brick_outer_cut_half",
"moreblocks:slope_stone_brick_outer_cut_half_raised", "moreblocks:slope_stone_brick_cut", "moreblocks:slope_stone_brick_angled_slab",
"moreblocks:slope_stone_brick_angled_stair", "moreblocks:slope_stone_brick_cylinder", "moreblocks:slope_stone_brick_spike_pyramid",
"moreblocks:slope_stone_brick_pyramid", "moreblocks:slope_stone_brick_cone", "moreblocks:slope_stone_brick_sphere",
"moreblocks:stair_stone_brick_half", "moreblocks:stair_stone_brick_right_half", "moreblocks:stair_stone_brick_alt",
"moreblocks:stair_stone_brick_alt_1", "moreblocks:stair_stone_brick_alt_2", "moreblocks:stair_stone_brick_alt_4"},
	neighbors = {"group:water"},
	interval = 16,
	chance = 200,
	catch_up = false,
	action = function(pos, node)
		node.name = default.moss_correspondences[node.name]
		if core.find_node_near(pos, 1, {"group:igniter", "default:furnace_active"}) then
			return
		end
		if (search_faces(pos, "air") or search_faces(pos, "attached_node") or
		search_faces(pos, "leaves")) and search_face_lighting(pos, 4) and node.name then
			core.set_node(pos, node)
		end
	end
})

core.register_lbm({
	name = "default:activate_node_timers_1",
	nodenames = {"default:coir_block", "default:dry_dirt", "default:dry_clay_dirt", "default:subtrop_grass",
"group:normal_grass", "group:swamp_grass", "default:light", "beds:primitive_bed", "ecology:sumbrellia"},
	run_at_every_load = true,
	action = function(pos)
		local timer = core.get_node_timer(pos)
		if not timer:is_started() then
			timer:start(2)
		end
	end
})

core.register_lbm({
	name = "default:activate_node_timers_2",
	nodenames = {"default:seaweedy_wood", "default:poison_ivy_3", "group:o_w_flora", "group:water_flora",
"ecology:dark_cactus", "ecology:stoneweed", "group:desert_flora", "ecology:artic_carrot",
"group:glow_coral", "ecology:rhodedendron_plant", "ecology:cavefern", "group:trunks_moss"},
	run_at_every_load = true,
	action = function(pos)
		local timer = core.get_node_timer(pos)
		if not timer:is_started() then
			timer:start(math.random(300, 1500))
		end
	end
})

local check_timer_for = {"group:timer_check"}
if ahhc ~= false then
	check_timer_for = {"group:timer_check", "default:water_source", "default:fresh_water_source"}
end

core.register_abm({
	nodenames = check_timer_for,
	interval = 3,
	chance = 1,
	action = function(pos)
		local timer = core.get_node_timer(pos)
		if not timer:is_started() then
			timer:start(.1)
		end
	end
})

core.register_abm({
	nodenames = {"group:melttoflo"},
	interval = 6,
	chance = 1,
	action = function(pos)
		default.melt_near_heat(pos)
	end
})


-- Register a craft to copy the metadata of items
function default.register_craft_metadata_copy(ingredient, result)
	core.register_craft({
		type = "shapeless",
		output = result,
		recipe = {ingredient, result}
	})

	core.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
		if itemstack:get_name() ~= result then
			return
		end

		local original
		local index
		for i = 1, #old_craft_grid do
			if old_craft_grid[i]:get_name() == result then
				original = old_craft_grid[i]
				index = i
			end
		end
		if not original then
			return
		end
		local copymeta = original:get_meta():to_table()
		itemstack:get_meta():from_table(copymeta)
		-- put the book with metadata back in the craft grid
		craft_inv:set_stack("craft", index, original)
	end)
end

-- Compact method for repeating crafts
function register_tools(name, mat, handle)

	handle = handle or "default:stick"

	core.register_craft({
		output = "default:pick_".. name,
		recipe = {
			{mat, mat, mat},
			{"", handle, ""},
			{"", handle, ""}
		}
	})

	core.register_craft({
		output = "default:shovel_".. name,
		recipe = {
			{mat},
			{handle},
			{handle}
		}
	})

	core.register_craft({
		output = "default:axe_".. name,
		recipe = {
			{mat, mat},
			{mat, handle},
			{"", handle}
		}
	})

	core.register_craft({
		output = "default:sword_".. name,
		recipe = {
			{mat},
			{mat},
			{handle}
		}
	})

	core.register_craft({
		output = "default:snow 90",
		recipe = {
			{"default:ice", "default:axe_".. name, "default:ice"},
			{"", "default:ice", ""},
			{"default:ice", "", "default:ice"}
		},
		replacements = {{"default:axe_".. name, "default:axe_".. name}}
	})

	core.register_craft({
		type = "shapeless",
		output = "default:coconut_milk",
		recipe = {"default:coconut", "vessels:drinking_glass", "default:axe_".. name},
		replacements = {{"default:axe_".. name, "default:axe_".. name}}
	})
end

function register_sandstone(mat, sand)
	core.register_craft({
		output = mat .."_block 9",
		recipe = {
			{mat, mat, mat},
			{mat, mat, mat},
			{mat, mat, mat}
		}
	})

	core.register_craft({
		output = mat .."_brick 4",
		recipe = {
			{mat, mat},
			{mat, mat}
		}
	})

	core.register_craft({
		output = mat,
		recipe = {
			{sand, sand},
			{sand, sand}
		}
	})

	core.register_craft({
		output = sand .." 4",
		recipe = {{mat}}
	})
end

function register_brick_block(mat)
	core.register_craft({
		output = mat .."_block 9",
		recipe = {
			{mat, mat, mat},
			{mat, mat, mat},
			{mat, mat, mat}
		}
	})

	core.register_craft({
		output = mat .."_brick 4",
		recipe = {
			{mat, mat},
			{mat, mat}
		}
	})
end

function register_nine(block, ore)
	core.register_craft({
		output = block,
		recipe = {
			{ore, ore, ore},
			{ore, ore, ore},
			{ore, ore, ore}
		}
	})

	core.register_craft({
		output = ore .." 9",
		recipe = {{block}}
	})
end


-- Log API / helpers
local log_non_player_actions = core.settings:get_bool("log_non_player_actions", false)

local is_pos = function(v)
	return type(v) == "table" and
		type(v.x) == "number" and type(v.y) == "number" and type(v.z) == "number"
end

function default.log_player_action(player, ...)
	local msg = player:get_player_name()
	if player.is_fake_player or not player:is_player() then
		if not log_non_player_actions then
			return
		end
		msg = msg .. "(" .. (type(player.is_fake_player) == "string"
			and player.is_fake_player or "*") .. ")"
	end
	for _, v in ipairs({...}) do
		-- translate pos
		local part = is_pos(v) and core.pos_to_string(v) or v
		-- no leading spaces before punctuation marks
		msg = msg .. (string.match(part, "^[;,.]") and "" or " ") .. part
	end
	core.log("action",  msg)
end

local nop = function() end
function default.set_inventory_action_loggers(def, name)
	local on_move = def.on_metadata_inventory_move or nop
	def.on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		default.log_player_action(player, "moves stuff in", name, "at", pos)
		return on_move(pos, from_list, from_index, to_list, to_index, count, player)
	end
	local on_put = def.on_metadata_inventory_put or nop
	def.on_metadata_inventory_put = function(pos, listname, index, stack, player)
		default.log_player_action(player, "moves", stack:get_name(), stack:get_count(), "to", name, "at", pos)
		return on_put(pos, listname, index, stack, player)
	end
	local on_take = def.on_metadata_inventory_take or nop
	def.on_metadata_inventory_take = function(pos, listname, index, stack, player)
		default.log_player_action(player, "takes", stack:get_name(), stack:get_count(), "from", name, "at", pos)
		return on_take(pos, listname, index, stack, player)
	end
end


-- NOTICE: This method is not an official part of the API yet.
-- This method may change in future.
function default.can_interact_with_node(player, pos)
	if player and player:is_player() then
		if core.check_player_privs(player, "protection_bypass") then
			return true
		end
	else
		return false
	end

	local meta = core.get_meta(pos)
	local owner = meta:get_string("owner")

	if not owner or owner == "" or owner == player:get_player_name() then
		return true
	end

	-- Is player wielding the right key?
	local item = player:get_wielded_item()
	if core.get_item_group(item:get_name(), "key") == 1 then
		local key_meta = item:get_meta()

		if key_meta:get_string("secret") == "" then
			local key_oldmeta = item:get_meta():get_string("")
			if key_oldmeta == "" or not core.parse_json(key_oldmeta) then
				return false
			end

			key_meta:set_string("secret", core.parse_json(key_oldmeta).secret)
			item:set_metadata("")
		end

		return meta:get_string("key_lock_secret") == key_meta:get_string("secret")
	end

	return false
end
