
local S = core.get_translator("decor")

core.register_node("decor:bamboo_fence", {
	description = "Bamboo Fence",
	tiles = {"decor_bamboo_fence_top.png", "decor_bamboo_fence_top.png", "decor_bamboo_fence.png"},
	inventory_image = "default_fence_overlay.png^decor_bamboo_block.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^decor_bamboo_block.png^default_fence_overlay.png^[makealpha:255,126,126",
	drawtype = "nodebox",
	paramtype = "light",
	use_texture_alpha = "clip",
	connects_to = {"group:fence", "group:wood", "group:choppy", "group:stone"},
	node_box = {
		type = "connected",
		fixed = {
			{-.125, -.5, -.125, .125, .5, .125},
		},
		connect_back = {
			{-.125, -.5, -.125, .125, .5, .125},
			{-.0625, .25, -.0625, .0625, .375, .5},
			{-.0625, -.0625, -.0625, .0625, .0625, .5},
			{-.0625, -.375, -.0625, .0625, -.25, .5},
		},
		connect_front = {
			{-.125, -.5, -.125, .125, .5, .125},
			{-.0625, .25, -.5, .0625, .375, .0625},
			{-.0625, -.0625, -.5, .0625, .0625, .0625},
			{-.0625, -.375, -.5, .0625, -.25, .0625},
		},
		connect_left = {
			{-.125, -.5, -.125, .125, .5, .125},
			{-.5, .25, -.0625, .0625, .375, .0625},
			{-.5, -.0625, -.0625, .0625, .0625, .0625},
			{-.5, -.375, -.0625, .0625, -.25, .0625},
		},
		connect_right = {
			{-.125, -.5, -.125, .125, .5, .125},
			{0, .25, -.0625, .5, .375, .0625},
			{0, -.0625, -.0625, .5, .0625, .0625},
			{0, -.375, -.0625, .5, -.25, .0625},
		}
	},
	groups = {choppy=1, oddly_breakable_by_hand=1, fence=1},
	sounds = default.node_sound_wood_defaults()
})

core.register_node("decor:bamboo_block", {
	description = "Bamboo Block",
	tiles = {"decor_bamboo_block_top.png", "decor_bamboo_block_top.png", "decor_bamboo_block.png"},
	paramtype2 = "facedir",
	groups = {choppy = 1, oddly_breakable_by_hand = 2, wood=1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_craft({
	output = "decor:bamboo_block",
	recipe = {{"ethereal:bamboo_block"}}
})

core.register_craft({
	output = "ethereal:bamboo_block",
	recipe = {{"decor:bamboo_block"}}
})

--[[	From the Mod Agriculture.

Copyright (C) 2016-2020 Jonah Brüchert <jbb@kaidan.im>

This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.
]]

core.register_node("decor:ivy_3d", {
    description = "3D Ivy",
    drawtype = "mesh",
    tiles = {"decor_ivy.png"},
    paramtype = "light",
	use_texture_alpha = "clip",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    mesh = "decor_ivy.obj",
    groups = {snappy = 2, oddly_breakable_by_hand = 1, flammable = 2},
    sounds = default.node_sound_leaves_defaults(),
    selection_box = {
        type = "fixed",
        fixed = {-.4, -.5, -.5, .4, -.4, .5}
    }
})

core.register_craft({
    output = "decor:ivy_3d",
    recipe = {
        {"group:leaves", ""},
        {"default:stick", "group:leaves"},
        {"group:leaves", ""}
    }
})

local T = {name = "decor:bamboo", force_place = true}
local L = {name = "decor:bamboo_leaves"}

decor_bamboo = {size = {x = 3, y = 17, z = 3}, data = {
_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,L,_,
_,L,_,
_,L,_,
_,L,_,
_,L,_,
_,_,_,

_,T,_,
_,T,_,
_,T,_,
_,T,_,
_,T,_,
_,T,_,
_,T,_,
_,T,_,
_,T,_,
_,T,_,
_,T,_,
L,T,L,
L,T,L,
L,T,L,
L,T,L,
L,T,L,
_,L,_,

_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,_,_,
_,L,_,
_,L,_,
_,L,_,
_,L,_,
_,L,_,
_,_,_},
yslice_prob = {{ypos = 1, prob = 127}, {ypos = 2, prob = 127}, {ypos = 3, prob = 127}}}

core.register_node("decor:bamboo", {
    description = "Bamboo",
    drawtype = "nodebox",
    tiles = {"decor_bamboo_top.png", "decor_bamboo_top.png", {name="decor_bamboo.png", align_style="world", scale=4}},
    inventory_image = "decor_bamboo_inventory.png",
    wield_image = "decor_bamboo_inventory.png",
    paramtype = "light",
	use_texture_alpha = "clip",
    sunlight_propagates = true,
    node_box = {
        type = "fixed",
        fixed = {
            {-.25, -.5, -.5, -.25, .5, .5},
            {-.5, -.5, -.25, .5, .5, -.25},
            {.25, -.5, -.5, .25, .5, .5},
            {-.5, -.5, .25, .5, .5, .25},
            {-.25, .5, -.25, .25, .5, .25},
            {-.25, -.5, -.25, .25, -.5, .25}
        }
    },
    selection_box = {
        type = "fixed",
        fixed = {-.3, -.5, -.3, .3, .5, .3}
    },
    groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, stick = 1, trunk = 1},
    sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		if core.get_item_group(core.get_node({x=pos.x, y=pos.y - 1, z=pos.z}).name, "soil") > 0 then
	core.get_node_timer(pos):start(math.random(180, 240))
		end
	end,
	on_timer = function(pos)
		local node_under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		if not node_under then
			core.get_node_timer(pos):start(180)
			return
		end
		if core.get_item_group(node_under.name, "soil") == 0 then
			core.get_node_timer(pos):start(180)
			return
		end
		local light_level = core.get_node_light(pos)
		if not light_level or light_level < 12 then
			core.get_node_timer(pos):start(180)
			return
		end
		-- is there enough height to grow sapling?
		if not enough_height(pos, 16) then
			core.get_node_timer(pos):start(180)
			return
		end
		core.log("action", "A decor bamboo grows into a tree at ".. core.pos_to_string(pos))
		add_tree(pos, 1, 0, 1, decor_bamboo, "0")
	end,
    after_dig_node = function(pos, node, metadata, digger)
        default.dig_up(pos, node, digger)
    end,
})

core.register_node("decor:bamboo_leaves", {
    description = "Bamboo Leaves",
    drawtype = "plantlike",
    tiles = {"extra_biomes_bamboo_leaves.png"},
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,
    walkable = false,
    groups = {snappy = 3, flammable = 2, leaves = 1}	
})

core.register_node("decor:bamboo_wood_white", {
    description = "White Bamboo Wood",
    tiles = {{name="extra_biomes_bamboo_wood.png", align_style="world", scale=2}},
    inventory_image = core.inventorycube("extra_biomes_bamboo_wood_inventory.png"),
    paramtype2 = "facedir",
    place_param2 = 0,
    is_ground_content = false,
    groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
    sounds = default.node_sound_wood_defaults(),
})

core.register_craft({
	output = "decor:bamboo_wood_white",
	recipe = {
		{"decor:bamboo", "decor:bamboo", "decor:bamboo"},
		{"decor:bamboo", "decor:bamboo", "decor:bamboo"},
		{"decor:bamboo", "decor:bamboo", "decor:bamboo"}
	}
})

core.register_craft({
	output = "decor:bamboo",
	recipe = {{"ethereal:bamboo"}}
})

core.register_craft({
	output = "ethereal:bamboo",
	recipe = {{"decor:bamboo"}}
})

local function my_register_stair_and_slab(subname, recipeitem, groups, images,
		desc_stair, desc_slab, sounds, worldaligntex)
	stairs.register_stair(subname, recipeitem, groups, images, desc_stair,
		sounds, worldaligntex)
	stairs.register_stair_inner(subname, recipeitem, groups, images, "",
		sounds, worldaligntex, "Inner " .. desc_stair)
	stairs.register_stair_outer(subname, recipeitem, groups, images, "",
		sounds, worldaligntex, "Outer " .. desc_stair)
	stairs.register_slab(subname, recipeitem, groups, images, desc_slab,
		sounds, worldaligntex)
end

my_register_stair_and_slab(
    "bamboo_wood_white",
    "decor:bamboo_wood_white",
    {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    {{name="extra_biomes_bamboo_wood.png", align_style="world", scale=2}},
    "White Bamboo Wood Stair",
    "White Bamboo Wood Slab",
    default.node_sound_wood_defaults(),
    true
)

default.register_fence("decor:fence_bamboo", {
	description = "Bamboo Fence",
	texture = "extra_biomes_bamboo_fence.png",
 	inventory_image = "default_fence_overlay.png^extra_biomes_bamboo_fence.png^default_fence_overlay.png^[makealpha:255,126,126",
 	wield_image = "default_fence_overlay.png^extra_biomes_bamboo_fence.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "decor:bamboo",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

core.register_craft({
	output = "decor:bamboo_fence",
	recipe = {{"decor:fence_bamboo"}}
})

core.register_craft({
	output = "decor:fence_bamboo",
	recipe = {{"decor:bamboo_fence"}}
})

core.register_node("decor:scarecrow", {
	description = "Scarecrow",
	drawtype = "mesh",
	mesh = "scarecrow.obj",
	paramtype2 = "facedir",
	tiles = {"decor_scarecrow.png"},
	visual_scale = .5,
	wield_image = "decor_scarecrow_item.png",
	wield_scale = {x=1., y=1., z=1.},
	paramtype = "light",
	use_texture_alpha = "clip",
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 1, .3}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 1, .3}
	},
	inventory_image = "decor_scarecrow_item.png",
	groups = {choppy = 1, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_wood_defaults()
})

vase_box = {
	type = "fixed",
	fixed = {-.3, -.5, -.3, .3, .5, .3}
}

core.register_node("decor:vase", {
	description = "Vase",
	drawtype = "mesh",
	mesh = "vase.obj",
	tiles = {"vase.png"},
	visual_scale = .5,
	wield_scale = {x=.5, y=.5, z=.5},
	paramtype = "light",
	use_texture_alpha = "clip",
	selection_box = vase_box,
	collision_box = vase_box,
	groups = {cracky=2, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("decor:Ancient_vase", {
	description = "Ancient Vase",
	drawtype = "mesh",
	mesh = "vase.obj",
	tiles = {"Ancient_vase.png"},
	visual_scale = .5,
	wield_scale = {x=.5, y=.5, z=.5},
	paramtype = "light",
	use_texture_alpha = "clip",
	selection_box = vase_box,
	collision_box = vase_box,
	groups = {cracky=2, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("decor:Ancient_vase_sand", {
	description = "Sandstone Vase",
	drawtype = "mesh",
	mesh = "vase.obj",
	tiles = {"Ancient_vase_sand.png"},
	visual_scale = .5,
	wield_scale = {x=.5, y=.5, z=.5},
	paramtype = "light",
	use_texture_alpha = "clip",
	selection_box = vase_box,
	collision_box = vase_box,
	groups = {cracky=2, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("decor:candle_white", {
	description = "White candle",
	drawtype = "mesh",
	mesh = "candle.obj",
	tiles = {"decor_candle.png"},
	visual_scale = .5,
	wield_image = "decor_candle_item.png",
	wield_scale = {x=1., y=1., z=1.},
	paramtype = "light",
	use_texture_alpha = "clip",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	inventory_image = "decor_candle_item.png",
	groups = {choppy = 1, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_wood_defaults()
})

core.register_node("decor:candle_red", {
	description = "Red candle",
	drawtype = "mesh",
	mesh = "candle.obj",
	tiles = {"red_candle.png"},
	visual_scale = .5,
	wield_image = "red_candle_item.png",
	wield_scale = {x=1., y=1., z=1.},
	paramtype = "light",
	use_texture_alpha = "clip",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	},
	inventory_image = "red_candle_item.png",
	groups = {choppy = 1, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_wood_defaults()
})

core.register_node("decor:mammoth_wool", {
	description = "Mammoth Wool",
	tiles = {"decor_mammoth_wool.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
	sounds = default.node_sound_defaults(),
})

core.register_node("decor:framed_glass", {
	description = "Glass With Wooden Frame",
	drawtype = "glasslike_framed_optional",
	tiles = {"decor_framed_glass.png", "decor_framed_glass_detail.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:gold_brick", {
	description = "Gold Brick",
	tiles = {"decor_gold_brick.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_metal_defaults(),
})

core.register_node("decor:sandstone_wire", {
	description = "Sandstone Wire",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	connects_to = {"decor:sandstone_wire", "decor:sticky_light", "group:wall", "group:stone"},
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "connected",
		fixed = {
	{-.25, -.25, -.25, .25, .25, .25}
		},
		connect_front = {
	{-.25, -.25, -.5, .25, .25, -.25}
		},
		connect_back = {
	{-.25, -.25, .25, .25, .25, .5}
		},
		connect_left = {
	{-.5, -.25, -.25, -.25, .25, .25}
		},
		connect_right = {
	{.25, -.25, -.25, .5, .25, .25}
		},
		connect_bottom = {
	{-.25, -.5, -.25, .25, -.25, .25}
		},
		connect_top = {
	{-.25, .25, -.25, .25, .5, .25}
		}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:sticky_light", {
	description = "Stick-y Light",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 14,
	connects_to = {"decor:sticky_light", "decor:sandstone_wire", "group:wall", "group:stone"},
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "connected",
		fixed = {
	{-.125, -.125, -.125, .125, .125, .125}
		},
		connect_front = {
	{-.0625, -.0625, -.5, .0625, .0625, -.125}
		},
		connect_back = {
	{-.0625, -.0625, .125, .0625, .0625, .5}
		},
		connect_left = {
	{-.5, -.0625, -.0625, -.125, .0625, .0625}
		},
		connect_right = {
	{.125, -.0625, -.0625, .5, .0625, .0625}
		},
		connect_bottom = {
	{-.0625, -.5, -.0625, .0625, -.125, .0625}
		},
		connect_top = {
	{-.0625, .125, -.0625, .0625, .5, .0625}
		}
	},
	groups = {oddly_breakable_by_hand=2},
	sounds = default.node_sound_defaults()
})

core.register_node("decor:sandstone_pillar_square_large", {
	description = "Square Sandstone Pillar Large",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
	{-.375, -.5, -.375, .375, .5, .375}
		}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:sandstone_pillar_square_base", {
	description = "Square Sandstone Pillar Base",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
	{-.5, -.5, -.5,.5, -.375, .5},
	{-.375, -.375, -.375, .375, -.125, .375},
	{-.25, -.125, -.25, .25, .5, .25}
		}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:sandstone_pillar_square_base_half", {
	description = "Square Sandstone Pillar Half Base",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
	{-.5, -.5, 0, .5, -.375, .5},
	{-.375, -.375, .125, .375, -.125, .5},
	{-.25, -.125, .25, .25, .5, .5}
		}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	type = "shapeless",
	output = "decor:sandstone_pillar_square_base_half 2",
	recipe = {"decor:sandstone_pillar_square_base"},
})
core.register_craft({
	type = "shapeless",
	output = "decor:sandstone_pillar_square_base",
	recipe = {"decor:sandstone_pillar_square_base_half", "decor:sandstone_pillar_square_base_half"},
})

core.register_node("decor:sandstone_pillar_square_top", {
	description = "Square Sandstone Pillar Top",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
	{-.5, .3125, -.5, .5, .5, .5},
	{-.375, .0625, -.375, .375, .3125, .375},
	{-.25, -.5, -.25, .25, .0625, .25}
		}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:sandstone_pillar_square_half_top", {
	description = "Square Sandstone Pillar Half Top",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
	{-.5, .3125, 0, .5, .5, .5},
	{-.375, .0625, .125, .375, .3125, .5},
	{-.25, -.5, .25, .25, .0625, .5}
		}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	type = "shapeless",
	output = "decor:sandstone_pillar_square_half_top 2",
	recipe = {"decor:sandstone_pillar_square_top"},
})
core.register_craft({
	type = "shapeless",
	output = "decor:sandstone_pillar_square_top",
	recipe = {"decor:sandstone_pillar_square_half_top", "decor:sandstone_pillar_square_half_top"},
})

core.register_node("decor:sandstone_pillar_square_middle", {
	description = "Square Sandstone Pillar Middle",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, .5, .25}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:sandstone_pillar_square_half_middle", {
	description = "Square Sandstone Pillar Half Middle",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-.25, -.5, .25, .25, .5, .5}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_craft({
	type = "shapeless",
	output = "decor:sandstone_pillar_square_half_middle 2",
	recipe = {"decor:sandstone_pillar_square_middle"},
})
core.register_craft({
	type = "shapeless",
	output = "decor:sandstone_pillar_square_middle",
	recipe = {"decor:sandstone_pillar_square_half_middle", "decor:sandstone_pillar_square_half_middle"},
})

core.register_node("decor:sandstone_pillar_round_1", {
	description = "Round Sandstone Pillar 1",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
	{-.1875, -.5, -.5, .1875, .5, .5},
	{-.5, -.5, -.1875, .5, .5, .1875},
	{-.375, -.5, -.375, .375, .5, .375},
	{-.3125, -.5, -.4375, .3125, .5, .4375},
	{-.4375, -.5, -.3125, .4375, .5, .3125}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
	{-.2, -.5, -.5, .2, .5, .5},
	{-.4, -.5, -.4, .4, .5, .4},
	{-.5, -.5, -.2, .5, .5, .2}
		}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:sandstone_pillar_round_2", {
	description = "Round Sandstone Pillar 2",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
	{-.375, -.5, -.125, .375, .5, .125},
	{-.125, -.5, -.375, .125, .5, .375},
	{-.25, -.5, -.3125, .25, .5, .3125},
	{-.3125, -.5, -.25, .3125, .5, .25}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
	{-.375, -.5, -.14, .375, .5, .14},
	{-.3, -.5, -.3, .3, .5, .3},
	{-.14, -.5, -.375, .14, .5, .375}
		}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:sandstone_pillar_round_3", {
	description = "Round Sandstone Pillar 3",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
	{-.25, -.5, -.125, .25, .5, .125},
	{-.125, -.5, -.25, .125, .5, .25},
	{-.1875, -.5, -.1875, .1875, .5, .1875}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
	{-.14, -.5, -.24, .14, .5, .24},
	{-.24, -.5, -.14, .24, .5, .14}
		}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:sandstone_pillar_round_4", {
	description = "Round Sandstone Pillar 4",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
	{-.125, -.5, -.0625, .125, .5, .0625},
	{-.0625, -.5, -.125, .0625, .5, .125}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.11, -.5, -.11, .11, .5, .11}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:sandstone_carved_1", {
	description = "Carved Sandstone 1",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
	{-.375, -.375, -.4375, .375, .375, .4375},
	{.375, -.375, -.5, .5, .375, .5},
	{-.5, -.375, -.5, -.375, .375, .5},
	{-.5, .375, -.5, .5, .5, .5},
	{-.5, -.5, -.5, .5, -.375, .5},
	{-.3125, -.25, -.5, .3125, .25, -.4375},
	{-.3125, -.25, .4375, .3125, .25, .5}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, .5, .5}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:sandstone_carved_2", {
	description = "Carved Sandstone 2",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
	{-.5, -.5, -.4375, .5, .5, .5},
	{-.5, -.5, -.5, -.1875, .5, -.4375},
	{-.1875, .1875, -.5, .5, .5, -.4375},
	{.1875, -.5, -.5, .5, -.1875, -.4375}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, .5, .5}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:sandstone_carved_3", {
	description = "Carved Sandstone 3",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
	{-.5, -.5, -.4375, .5, .5, .5},
	{-.5, .1875, -.5, .5, .5, -.4375},
	{-.5, -.5, -.5, .5, -.1875, -.4375}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, .5, .5}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:sandstone_carved_4", {
	description = "Carved Sandstone 4",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
	{-.5, -.5, -.4375, .5, .5, .5},
	{-.5, -.5, -.5, -.1875, .5, -.4375},
	{.1875, -.5, -.5, .5, .5, -.4375}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, .5, .5}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:sandstone_carved_5", {
	description = "Carved Sandstone 5",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
	{-.5, -.5, -.4375, .5, .5, .5},
	{-.5, -.5, -.5, -.1875, -.1875, -.4375},
	{.1875, -.5, -.5, .5, -.1875, -.4375},
	{-.5, .1875, -.5, -.1875, .5, -.4375},
	{.1875, .1875, -.5, .5, .5, -.4375}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, .5, .5}
	},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:sandstone_ledge", {
	description = "Sandstone Ledge",
	tiles = {
		"default_sandstone.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.5, .3125, -.5625, .5, .5, .5},
			{-.5, .4375, -.625, .5, .5, .5}
		}
	},
	groups = {cracky=1}
})

core.register_node("decor:sandstone_ledge_corner", {
	description = "Sandstone Ledge Corner",
	tiles = {
		"default_sandstone.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.5, .3125, -.5625, .5625, .5, .5},
			{-.5, .4375, -.625, .625, .5, .5}
		}
	},
	groups = {cracky=1}
})

core.register_node("decor:sandstone_rail", {
	description = "Sandstone Rail",
	tiles = {
		"default_sandstone.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.5, -.0625, -.5625, .5, .125, .5},
			{-.5, 0, -.625, .5, .0625, .5}
		}
	},
	groups = {cracky=1}
})

core.register_node("decor:sandstone_rail_corner", {
	description = "Sandstone Rail Corner",
	tiles = {
		"default_sandstone.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
			{-.5, -.0625, -.5625, .5625, .125, .5},
			{-.5, 0, -.625, .625, .0625, .5}
		}
	},
	groups = {cracky=1}
})

core.register_node("decor:snow_block", {
	description = "Snow Block",
	tiles = {"decor_snow_block.png"},
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

core.register_node("decor:snow_bricks", {
	description = "Snow Bricks",
	tiles = {"decor_snow_bricks.png"},
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

core.register_node("decor:rusty_steel_plating", {
	description = "Rusty Plating",
	tiles = {"decor_rusty_steel_plating.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults({
		footstep = {name="default_weakmetal_footstep", gain= .4}
	}),
})

core.register_node("decor:broken_glass", {
	description = "Broken Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"decor_broken_glass.png", "decor_broken_glass_detail.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:plank_walkway", {
	description = "Wood Plank Walkway",
	tiles = {"decor_wood_planks.png", "decor_wood_planks.png", "default_wood.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, .4375, -.5, -.3125, .5, .5},
			{-.25, .4375, -.4375, -.0625, .5, .5},
			{0, .4375, -.5, .1875, .5, .5},
			{.25, .4375, -.375, .4375, .5, .5}
		}
	},
	groups = {choppy=1},
	sounds = default.node_sound_wood_defaults()
})

--stained glass

local colours = {
{"red", "Red"},
{"green", "Green"},
{"blue", "Blue"},
{"yellow", "Yellow"},
{"cyan", "Cyan"},
{"brown", "Brown"},
{"orange", "Orange"},
{"purple", "Purple"},
{"magenta", "Magenta"},
{"darkgreen", "Dark Green"},
{"darkgrey", "Dark Grey"},
{"grey", "Grey"},
{"white", "White"},
{"black", "Black"},
{"pink", "Pink"},
}

for _, row in ipairs(colours) do
local colour = row[1]
local desc = row[2]
core.register_node("decor:"..colour.."_glass", {
	description = ""..desc.." Stained Glass",
	drawtype = "glasslike",
	tiles = {"decor_"..colour.."_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = "blend",
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=1, oddly_breakable_by_hand=3, snappy=2}
})
xpanes.register_pane(""..colour.."_glass", {
	description = ""..desc.." Stained Glass Pane",
	textures = {"decor_"..colour.."_glass.png","decor_"..colour.."_glass.png","decor_"..colour.."_glass.png"},
	inventory_image = "decor_"..colour.."_glass.png",
	wield_image = "decor_"..colour.."_glass.png",
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = "blend",
	sounds = default.node_sound_glass_defaults(),
	groups = {snappy=2, cracky=3, oddly_breakable_by_hand=3},
	recipe = {
		{"", "dye:"..colour, ""},
		{"", "xpanes:pane_flat", ""}
	}
})
end

local topchains_sbox = {
	type = "fixed",
	fixed = {
		{ -.25, .35, -.25, .25, .5, .25 },
		{ -.1, -.625, -.1, .1, .4, .1 }
	}
}

core.register_node("decor:chain_top", {
	description = S("Hanging chain (ceiling mount, wrought iron)"),
	drawtype = "mesh",
	mesh = "top_chains.obj",
	tiles = {"basic_materials_chain_steel.png"},
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "top_chain_wrought_iron_inv.png",
	groups = {cracky=3},
	selection_box = topchains_sbox,
})

core.register_node("decor:chain_top_brass", {
	description = S("Hanging chain (ceiling mount, brass)"),
	drawtype = "mesh",
	mesh = "top_chains.obj",
	tiles = {"basic_materials_chain_brass.png"},
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "top_chain_brass_inv.png",
	groups = {cracky=3},
	selection_box = topchains_sbox,
})

core.register_node("decor:chandelier", {
	description = S("Chandelier (wrought iron)"),
	paramtype = "light",
	use_texture_alpha = "clip",
	light_source = default.LIGHT_MAX-2,
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	tiles = {
		"basic_materials_chain_steel.png",
		"chains_candle.png",
		{
			name="chains_candle_flame.png",
			animation={
				type="vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=3.
			}
		}
	},
	drawtype = "mesh",
	mesh = "chains_chandelier.obj",
	groups = {cracky=3},
	sounds =  default.node_sound_stone_defaults(),
})

core.register_node("decor:chandelier_brass", {
	description = S("Chandelier (brass)"),
	paramtype = "light",
	use_texture_alpha = "clip",
	light_source = default.LIGHT_MAX-2,
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	tiles = {
		"basic_materials_chain_brass.png",
		"chains_candle.png",
		{
			name="chains_candle_flame.png",
			animation={
				type="vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=3.
			}
		}
	},
	drawtype = "mesh",
	mesh = "chains_chandelier.obj",
	groups = {cracky=3},
	sounds =  default.node_sound_stone_defaults(),
})

core.register_node("decor:adobe_dense", {
	description = S("Dense Adobe"),
	tiles = {"building_blocks_adobe_dense.png"},
	groups = {crumbly=2},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("decor:Roofing", {
	tiles = {"building_blocks_Roofing.png"},
	description = S("Roof block"),
	groups = {snappy=3},
})

core.register_node("decor:smoothglass", {
	description = S("Streak Free Glass"),
	drawtype = "glasslike",
	tiles = {"building_blocks_sglass.png"},
	inventory_image = core.inventorycube("building_blocks_sglass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=3,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})
core.register_node("decor:grate", {
	description = S("Grate"),
	drawtype = "glasslike",
	tiles = {"building_blocks_grate.png"},
	inventory_image = core.inventorycube("building_blocks_grate.png"),
	paramtype = "light",
	use_texture_alpha = "clip",
	sunlight_propagates = true,
	groups = {cracky=1},
	sounds = default.node_sound_metal_defaults({
		footstep = {name="default_weakmetal_footstep", gain= .4}
	})
})

core.register_node("decor:Fireplace", {
	description = S("Fireplace"),
	tiles = {
		"building_blocks_cast_iron.png",
		"building_blocks_cast_iron.png",
		"building_blocks_cast_iron.png",
		"building_blocks_cast_iron_fireplace.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = default.LIGHT_MAX,
	sunlight_propagates = true,
	groups = {cracky=2},
})

core.register_node("decor:woodglass", {
	drawtype = "glasslike",
	description = S("Wood Framed Glass"),
	tiles = {"building_blocks_wglass.png"},
	inventory_image = core.inventorycube("building_blocks_wglass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=3,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})
core.register_node("decor:terrycloth_towel", {
	drawtype = "raillike",
	description = S("Terrycloth towel"),
	tiles = {"building_blocks_towel.png"},
	inventory_image = "building_blocks_towel_inv.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		-- but how to specify the dimensions for curved and sideways rails?
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	sunlight_propagates = true,
	groups = {crumbly=3},
})
core.register_node("decor:Tarmac_spread", {
	drawtype = "raillike",
	description = S("Tarmac Spread"),
	tiles = {"building_blocks_tar.png"},
	inventory_image = "building_blocks_tar_spread_inv.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		-- but how to specify the dimensions for curved and sideways rails?
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	sunlight_propagates = true,
	groups = {cracky=3},
	sounds = default.node_sound_dirt_defaults(),
})
core.register_node("decor:BWtile", {
	drawtype = "nodebox",
	description = S("Chess board tiling"),
	tiles = {
		"building_blocks_BWtile.png",
		"building_blocks_BWtile.png^[transformR90",
		"building_blocks_BWtile.png^[transformR90",
		"building_blocks_BWtile.png^[transformR90",
		"building_blocks_BWtile.png"},
	inventory_image = "building_blocks_bwtile_inv.png",
	paramtype = "light",
	walkable = false,
	node_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	sunlight_propagates = true,
	groups = {crumbly=3},
})
core.register_node("decor:brobble_spread", {
	drawtype = "raillike",
	-- Translators: "Brobble" is a portmanteau of "Brick" and "Cobble".
	-- Translate however you see fit.
	description = S("Brobble Spread"),
	tiles = {"building_blocks_brobble.png"},
	inventory_image = "building_blocks_brobble_spread_inv.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		-- but how to specify the dimensions for curved and sideways rails?
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	sunlight_propagates = true,
	groups = {crumbly=3},
})
core.register_node("decor:gravel_spread", {
	drawtype = "raillike",
	description = S("Gravel Spread"),
	tiles = {"default_gravel.png"},
	inventory_image = "building_blocks_gravel_spread_inv.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		-- but how to specify the dimensions for curved and sideways rails?
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	sunlight_propagates = true,
	groups = {crumbly=2},
	sounds = default.node_sound_gravel_defaults(),
})
core.register_node("decor:hardwood", {
	description = S("Hardwood"),
	tiles = {"building_blocks_hardwood.png"},
	groups = {choppy=1,flammable=1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("decor:fakegrass", {
	description = S("Fake Grass"),
	tiles = {"default_grass.png", "default_dirt.png", "default_dirt.png^default_grass_side.png"},
	groups = {crumbly=3},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=.4},
	}),
})

core.register_craftitem("decor:sticks", {
	description = S("Small bundle of sticks"),
	inventory_image = "building_blocks_sticks.png",
})

core.register_craftitem("decor:tar_base", {
	description = S("Tar base"),
	inventory_image = "building_blocks_tar_base.png",
})

core.register_node("decor:Tar", {
	description = S("Tar"),
	tiles = {"building_blocks_tar.png"},
	groups = {crumbly=1, tar_block = 1},
	sounds = default.node_sound_stone_defaults(),
})
core.register_node("decor:Clarble", {
	description = S("Clarble"),
	tiles = {"building_blocks_clarble.png"},
	groups = {cracky=3, clarble = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_tool("decor:knife", {
	description = S("Tar Knife"),
	inventory_image = "building_blocks_knife.png",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[2]=7.50, [3]=2.80}, uses=100, maxlevel=1},
			fleshy={times={[2]=5.50, [3]=2.80}, uses=100, maxlevel=1}
		}
	},
})

if core.get_modpath("moreblocks") then

stairs.register_stair_and_slab("clarble", "decor:Clarble",
	{cracky=3}, {"building_blocks_clarble.png"},
	"Clarble Stair", "Clarble Slab", default.node_sound_stone_defaults(), true)
	stairsplus:register_all("decor",
		"clarble", "decor:Clarble", {
			description = S("Clarble"),
			tiles = {"building_blocks_clarble.png"},
			groups = {cracky=3},
			sounds = default.node_sound_stone_defaults(),
		}
	)
stairs.register_stair_and_slab("hardwood", "decor:hardwood",
	{choppy=1,flammable=1}, {"building_blocks_hardwood.png"},
	"Hardwood Stair", "Hardwood Slab", default.node_sound_wood_defaults(), true)
	stairsplus:register_all("decor",
		"hardwood", "decor:hardwood", {
			description = S("Hardwood"),
			tiles = {"building_blocks_hardwood.png"},
			groups = {choppy=1,flammable=1},
			sounds = default.node_sound_wood_defaults(),
		}
	)

for _, i in ipairs(stairsplus.shapes_list) do
	local class = i[1]
	local cut = i[2]
	core.register_alias("moreblocks:"..class.."tar"..cut, "decor:"..class.."tar"..cut)
end
core.register_alias("moreblocks:tar", "decor:Tar")

stairs.register_stair_and_slab("Tar", "decor:Tar",
	{crumbly=1}, {"building_blocks_tar.png"},
	"Tar Stair", "Tar Slab", default.node_sound_stone_defaults(), true)
	stairsplus:register_all("decor",
		"tar", "decor:Tar", {
			description = S("Tar"),
			tiles = {"building_blocks_tar.png"},
			groups = {crumbly=1},
			sounds = default.node_sound_stone_defaults(),
		}
	)

stairs.register_stair_and_slab("grate", "decor:grate",
	{cracky=1}, {"building_blocks_grate.png"},
	"Grate Stair", "Grate Slab", default.node_sound_stone_defaults(), true)
	stairsplus:register_all("decor",
		"grate", "decor:grate", {
			description = S("Grate"),
			tiles = {"building_blocks_grate.png"},
			use_texture_alpha = "clip",
			groups = {cracky=1},
			sounds = default.node_sound_stone_defaults(),
		}
	)
stairs.register_stair_and_slab("adobe_dense", "decor:adobe_dense",
	{crumbly=2}, {"building_blocks_adobe_dense.png"},
	"Dense Adobe Stair", "Dense Adobe Slab", default.node_sound_stone_defaults(), true)
	stairsplus:register_all("decor",
		"adobe_dense", "decor:adobe_dense", {
			description = S("Dense Adobe"),
			tiles = {"building_blocks_adobe_dense.png"},
			groups = {crumbly=2},
			sounds = default.node_sound_stone_defaults(),
		}
	)
stairs.register_stair_and_slab("Roofing", "decor:Roofing",
	{snappy=3}, {"building_blocks_Roofing.png"},
	"Roofing Stair", "Roofing Slab", default.node_sound_stone_defaults(), true)
	stairsplus:register_all("decor",
		"Roofing", "decor:Roofing", {
			description = S("Roofing"),
			tiles = {"building_blocks_Roofing.png"},
			groups = {snappy=3},
			sounds = default.node_sound_stone_defaults(),
		}
	)
end

-- undecorated coloured glass, all using plain glass texture
local glass_list = {
	{"black", "Darkened", "292421",}, {"blue", "Blue", "0000FF",},
	{"cyan", "Cyan", "00FFFF",}, {"green", "Green", "00FF00",}, 
	{"magenta", "Magenta", "FF00FF",}, {"orange", "Orange", "FF6103",}, 
	{"purple", "Purple", "800080",}, {"red", "Red", "FF0000",}, 
	{"yellow", "Yellow", "FFFF00",}, {"frosted", "Frosted", "FFFFFF",}
}

for i in ipairs(glass_list) do
	local name = glass_list[i][1]
	local description = glass_list[i][2]
	local colour = glass_list[i][3]

	core.register_node("decor:stained_glass_"..name, {
		description = description.." Glass",
		drawtype = "glasslike",
		tiles = {"abriglass_plainglass.png^[colorize:#"..colour..":122"},
		paramtype = "light",
		use_texture_alpha = "blend",
		sunlight_propagates = true,
		light_source = 4,
		groups = {cracky = 3},
		sounds = default.node_sound_glass_defaults(),
	})
end


-- boring glass because why not?
core.register_node("decor:clear_glass", {
	description = "Clear Glass",
	drawtype = "glasslike",
	tiles = {"abriglass_clearglass.png"},
	paramtype = "light",
	use_texture_alpha = "clip",
	sunlight_propagates = true,
	groups = {cracky = 3},
	sounds = default.node_sound_glass_defaults(),
})


-- glass lights
local light_list = {
	{"glass_light_green", "Green", "lightgreen"},
	{"glass_light_blue", "Blue", "lightblue"},
	{"glass_light_red", "Red", "lightred"},
	{"glass_light_yellow", "Yellow", "lightyellow"},
}

for i in ipairs(light_list) do
	local name = light_list[i][1]
	local description = light_list[i][2]
	local image = light_list[i][3]

	core.register_node("decor:" ..name, {
		description = description.. "Glass Light",
		tiles = {"abriglass_" ..image.. ".png"},
		groups = {cracky = 3},
		use_texture_alpha = "blend",
		sunlight_propagates = true,
		light_source = 14,
		drawtype = "glasslike",
		paramtype = "light",
		sounds = default.node_sound_glass_defaults(),
	})
end


-- patterned glass
local pattern_list = {   --{name, description, image}
	{"stainedglass_tiles_dark", "Stained Glass", "stainedglass_tiles1",},
	{"stainedglass_tiles_pale", "Stained Glass", "stainedglass_tiles2",},
	{"stainedglass_pattern01", "Stained Glass", "stainedglass_pattern01",},
	{"stainedglass_pattern02", "Cage Glass", "stainedglass_pattern02",},
	{"stainedglass_pattern03", "Stained Glass", "stainedglass_pattern03",},
	{"stainedglass_pattern04", "Stained Glass Cross", "stainedglass_pattern04",},
	{"stainedglass_pattern05", "Stained Glass", "stainedglass_pattern05",},
}

for i in ipairs(pattern_list) do
	local name = pattern_list[i][1]
	local description = pattern_list[i][2]
	local image = pattern_list[i][3]

	core.register_node("decor:"..name, {
		description = description,
		drawtype = "glasslike",
		tiles = {"abriglass_"..image..".png"},
		use_texture_alpha = "blend",
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		light_source = 5,
		groups = {cracky = 3},
		sounds = default.node_sound_glass_defaults(),
	})
end


-- portholes
local port_list = {
	{"wood",}, {"jungle_wood",},
}

for i in ipairs(port_list) do
	local name = port_list[i][1]

	core.register_node("decor:porthole_"..name, {
		description = "Porthole",
		drawtype = "nodebox",
		paramtype = "light",
		use_texture_alpha = "clip",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {-.5, -.5, -.5, .5, .5, .5}
		},
		groups = {choppy = 2, flammable = 2, wood = 1},
		tiles = {"default_"..name.. ".png", -- up
			"default_"..name.. ".png", -- down
			"default_"..name.. ".png", -- right
			"default_"..name.. ".png", -- left
			"abriglass_porthole_"..name..".png", -- back
			"abriglass_porthole_"..name..".png", -- front
		},
		is_ground_content = false,
		sunlight_propagates = true,
	})
end


-- one-way glass
local oneway_list = {
	{"dark", "Dark", "oneway_face.png", "abriglass_oneway_wall.png",},
	{"pale", "White", "oneway_face.png^[colorize:#F8F8FF:200", "abriglass_oneway_wall.png^[colorize:#E6E6FA:200",},
	{"desert_brick", "Desert Brick", "oneway_face.png^[colorize:#814F3C:200", "default_desert_stone_brick.png",},
	{"stone_brick", "Stone Brick", "oneway_face.png^[colorize:#615E5D:200", "default_stone_brick.png",},
	{"sandstone_brick", "Sandstone Brick", "oneway_face.png^[colorize:#FFF9C5:200", "default_sandstone_brick.png",},
}

for i in ipairs(oneway_list) do
	local name = oneway_list[i][1]
	local description = oneway_list[i][2]
	local image1 = oneway_list[i][3]
	local image2 = oneway_list[i][4]

	core.register_node("decor:oneway_glass_"..name, {
		description = description.." One-Way Glass",
		drawtype = "nodebox",
		paramtype = "light",
		use_texture_alpha = "clip",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-.5, -.5, -.5, .5, .5, .5},
			},
		},
		groups = {cracky = 3},
		tiles = {"blank.png", -- up
			"blank.png", -- down
			"blank.png", -- right
			"blank.png", -- left
			"abriglass_"..image1, -- back
			image2, -- front
		},
		sunlight_propagates = true,
		is_ground_content = false,
		inventory_image = core.inventorycube("abriglass_"..image1)
	})
end


-- normal nodes to match one-way glass
core.register_node("decor:oneway_wall_dark", {
	description = "Dark Block",
	tiles = {"abriglass_oneway_wall.png"},
	paramtype2 = "facedir",
	groups = {cracky = 3},
})

core.register_node("decor:oneway_wall_pale", {
	description = "Pale Block",
	tiles = {"abriglass_oneway_wall.png^[colorize:#E6E6FA:200"},
	paramtype2 = "facedir",
	groups = {cracky = 3},
})

-- crystal, for later use in crafting recipes
core.register_node("decor:ghost_crystal", {
	description = "Ghost Crystal",
	drawtype = "glasslike",
	tiles = {"abriglass_ghost_crystal.png"},
	wield_image = "abriglass_ghost_crystal_wield.png",
	paramtype = "light",
	use_texture_alpha = "blend",
	sunlight_propagates = true,
	light_source = 14,
	groups = {cracky = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:portal", {
	description = "Decorative Portal Event Horizon",
	drawtype = "glasslike_framed",
	tiles = {"default_obsidian_glass.png", "default_obsidian_glass_detail.png"},
	paramtype = "light",
	light_source = 8,
	walkable = false,
	sunlight_propagates = true,
	is_ground_content = false,
	on_construct = function(pos)
		core.get_node_timer(pos):start(1)
	end,
	on_timer = function(pos)
		core.add_particlespawner({-- texpools?
			amount = 6,
			time = 7,
			minpos = vector.subtract(pos, .5),
			maxpos = vector.add(pos, .5),
			minvel = {x=-1.5, y=.3, z=-1.5},
			maxvel = {x=1.5, y=.5, z=1.5},
			exptime = {min = 1, max = 2},
			minsize = 1.5,
			maxsize = 2,
			texture = "decor_portal_particle1.png",
			glow = 14 })
		core.add_particlespawner({
			amount = 6,
			time = 7,
			minpos = vector.subtract(pos, .5),
			maxpos = vector.add(pos, .5),
			minvel = {x=-1.5, y=.3, z=-1.5},
			maxvel = {x=1.5, y=.5, z=1.5},
			exptime = {min = 1, max = 2},
			minsize = 1.5,
			maxsize = 2,
			texture = "decor_portal_particle2.png",
			glow = 14 })
		core.get_node_timer(pos):start(math.random(6, 8))
	end,
	groups = {cracky = 3, oddly_breakable_by_hand = 1, timer_check = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "decor:portal 2",
	recipe = {{"default:obsidian_glass", "ecology:crescentflower"}},
	replacements = {{"ecology:crescentflower", "farming:spent_biomasse"}}
})

core.register_craft({
	output = "default:obsidian_glass",
	recipe = {{"decor:portal", "decor:portal"}}
})

core.register_node("decor:glass_water_box", {
	description = "Glass Water box",
	drawtype = "glasslike_framed",
	tiles = {"default_glass.png", "default_glass_detail.png"},
	special_tiles = {{
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
	paramtype2 = "glasslikeliquidlevel",
	place_param2 = 63,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})


core.register_node("decor:endtable", {
	description = S("End Table"),
	drawtype = "nodebox",
	tiles = {"lrfurn_coffeetable_back.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
	{-.375, -.5, -.375, -.3125, -.0625, -.3125},--legs
	{.3125, -.5, -.375, .375, -.0625, -.3125},
	{-.375, -.5, .3125, -.3125, -.0625, .375},
	{.3125, -.5, .3125, .375, -.0625, .375},
	{-.4375, -.0625, -.4375, .4375, 0, .4375}--tabletop
		}
	}
})

core.register_node("decor:ltable_end", {
	description = S("Bamboo Wood Long Table End"),
	drawtype = "nodebox",
	tiles = {{name="extra_biomes_bamboo_wood.png", align_style="world", scale=2}},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
	{-.5, .375, -.5, .5, .5, .5},
	{-.375, -.5, -.375, -.25, .375, -.25},
	{.25, -.5, -.375, .375, .375, -.25}
		}
	}
})

core.register_node("decor:ltable_mid", {
	description = S("Bamboo Wood Long Table Midddle"),
	drawtype = "nodebox",
	tiles = {{name="extra_biomes_bamboo_wood.png", align_style="world", scale=2}},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {-.5, .375, -.5, .5, .5, .5}
	}
})

core.register_node("decor:table_short", {
	description = S("Bamboo Wood Short Table"),
	drawtype = "nodebox",
	tiles = {{name="extra_biomes_bamboo_wood.png", align_style="world", scale=2}},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
	{-.5, -.0625, -.5, .5, .125, .5},
	{-.4, -.5, -.4, -.1, -.0625, -.1},
	{.1, -.5, -.4, .4, -.0625, -.1},
	{-.4, -.5, .1, -.1, -.0625, .4},
	{.1, -.5, .1, .4, -.0625, .4}
		}
	}
})

core.register_node("decor:tombstone", {
	description = "Tomb Stone",
	drawtype = "mesh",
	mesh = "tombstone.obj",
	tiles = {"tombstone.png"},
	wield_image = "tombstone_item.png",
	inventory_image = "tombstone_item.png",
	use_texture_alpha = "clip",
	paramtype2 = "facedir",
	paramtype = "light",
	visual_scale = .5,
	sunlight_propagates = true,
	is_ground_content = false,
	wield_scale = {x=1., y=1., z=1.},
	collision_box = {
		type = "fixed",
		fixed = {-.3, -.5, .1, .3, .4, .3}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.4, -.5, -0, .4, .5, .3}
	},
	groups = {dig_immediate = 2},
})

core.register_node("decor:plate_glass", {
	description = "Plate Glass",
	drawtype = "glasslike",
	tiles = {"cityscape_plate_glass.png"},
	use_texture_alpha = "blend",
	paramtype = "light",
	light_source = 1,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, level=1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("decor:road", {
	description = "Road",
	tiles = {"cityscape_tarmac.png"},
	is_ground_content = false,
	groups = {cracky = 2, level = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("decor:road_yellow_line", {
	description = "Road",
	tiles = {"cityscape_tarmac_yellow_line.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky = 2, level = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("decor:plaster", {
	description = "Plaster",
	tiles = {"default_desert_stone.png^[colorize:#8C8175:225"},
	is_ground_content = false,
	groups = {cracky = 3, level = 0, flammable = 2, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_stone_defaults(),
})

function decor.clone_node(name)
	local node = core.registered_nodes[name]
	local node2 = table.copy(node)
	return node2
end

core.register_node("decor:concrete", {
	description = "Concrete",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, level=1, stone = 1},
	drop = "default:cobble",
	sounds = default.node_sound_stone_defaults(),
})

local newnode = decor.clone_node("decor:concrete")
newnode.tiles = {"default_stone.png^[colorize:#964B00:40"}
core.register_node("decor:concrete2", newnode)
newnode = decor.clone_node("decor:concrete")
newnode.tiles = {"default_stone.png^[colorize:#FF0000:20"}
core.register_node("decor:concrete3", newnode)
newnode = decor.clone_node("decor:concrete")
newnode.tiles = {"default_stone.png^[colorize:#4682B4:10"}
core.register_node("decor:concrete4", newnode)
newnode = decor.clone_node("decor:concrete")
newnode.tiles = {"default_stone.png^[colorize:#000000:40"}
core.register_node("decor:concrete5", newnode)

core.register_node("decor:floor_ceiling", {
	description = "Floor/Ceiling",
	tiles = {"cityscape_floor.png", "cityscape_ceiling.png", "default_stone.png"},
	paramtype2 = "facedir",
	groups = {cracky = 3, level=1, flammable = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})
newnode = decor.clone_node("decor:floor_ceiling")
newnode.tiles = {"cityscape_floor.png^cityscape_broken_3.png", "cityscape_ceiling.png^cityscape_broken_3.png", "default_stone.png^cityscape_broken_3.png"}
newnode.groups.falling_node = 1
core.register_node("decor:floor_ceiling_broken", newnode)

core.register_node("decor:sidewalk", {
	description = "Sidewalk",
	tiles = {"cityscape_sidewalk.png"},
	groups = {cracky = 3, level=1, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("decor:light_panel", {
	description = "Light Panel",
	drawtype = "nodebox",
	tiles = {"default_sandstone.png"},
	light_source = 14,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	node_box = { type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.48, .5}},
	groups = {cracky = 3, level=1, oddly_breakable_by_hand = 1, flammable = 3},
	on_place = core.rotate_and_place,
	sounds = default.node_sound_stone_defaults(),
})

local goodies = {
	{ items = {"default:pine_wood 2"}, rarity = 1},
	{ items = {"default:apple 12"}, rarity = 10},
	{ items = {"default:steel_ingot 3"}, rarity = 10},
	{ items = {"default:copper_ingot 3"}, rarity = 10},
	{ items = {"default:book 10"}, rarity = 10},
	{ items = {"default:paper 30"}, rarity = 10},
	{ items = {"default:meselamp"}, rarity = 10},
}

if core.get_modpath("vessels") then
	goodies[#goodies+1] = { items = {"vessels:shelf"}, rarity = 10}
	goodies[#goodies+1] = { items = {"vessels:glass_bottle 10"}, rarity = 10}
	goodies[#goodies+1] = { items = {"vessels:drinking_glass 10"}, rarity = 10}
	goodies[#goodies+1] = { items = {"vessels:steel_bottle 10"}, rarity = 10}
	goodies[#goodies+1] = { items = {"vessels:glass_fragments 20"}, rarity = 10}
end

if core.get_modpath("bucket") then
	goodies[#goodies+1] = { items = {"bucket:bucket_empty 10"}, rarity = 10}
end

if core.get_modpath("fabric") then
	goodies[#goodies+1] = { items = {"fabric:block_blue 10"}, rarity = 10}
	goodies[#goodies+1] = { items = {"fabric:block_red 10"}, rarity = 10}
	goodies[#goodies+1] = { items = {"fabric:block_green 10"}, rarity = 10}
	goodies[#goodies+1] = { items = {"fabric:block_yellow 10"}, rarity = 10}
	goodies[#goodies+1] = { items = {"fabric:block_cyan 10"}, rarity = 10}
	goodies[#goodies+1] = { items = {"fabric:block_magenta 10"}, rarity = 10}
	goodies[#goodies+1] = { items = {"fabric:block_orange 10"}, rarity = 10}
	goodies[#goodies+1] = { items = {"fabric:block_violet 10"}, rarity = 10}
	goodies[#goodies+1] = { items = {"fabric:block_pink 10"}, rarity = 10}
end

if core.get_modpath("beds") then
	goodies[#goodies+1] = { items = {"beds:fancy_bed"}, rarity = 10}
	goodies[#goodies+1] = { items = {"beds:bed"}, rarity = 10}
end

core.register_node("decor:crate", {
	description = "Crate",
	tiles = {"cityscape_crate.png"},
	drop = {
		max_items = 2,
		items = goodies
	},
	groups = {choppy = 1, level = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("decor:park_bench", {
	description = "Park Bench",
	tiles = {"default_wood.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = { type = "fixed",
		fixed = {
			{1., .01, -.25, -1., -.01, .25},	-- seat
			{1., .5, .23, -1., 0, .25},	-- back
			{.95, 0, -.05, .85, -.5, .05},	-- leg 1
			{-.95, 0, -.05, -.85, -.5, .05},	-- leg 2
	}	},
	groups = {choppy = 3, level=0},
	on_place = core.rotate_and_place,
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("decor:wood_broken", {
	description = "Rotten Wood",
	tiles = {"default_wood.png^cityscape_wood_rot.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("decor:light_box_yellow", {
	description = "Yellow Light Box",
	tiles = {"light_box_yellow.png"},
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 14,
	groups = {cracky = 3, oddly_breakable_by_hand = 2},
})

core.register_node("decor:light_box_blue", {
	description = "Blue Light Box",
	tiles = {"light_box_blue.png"},
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 14,
	groups = {cracky = 3, oddly_breakable_by_hand = 2},
})

core.register_node("decor:concrete_wall", {
	description = "Concrete Wall",
	sounds = default.node_sound_stone_defaults(),
	paramtype = "light",
	drawtype = "nodebox",
	tiles = {"technic_concrete_block.png"},
	sunlight_propagates = true,
	groups = {cracky = 1},
	node_box = {
		type = "connected",
		fixed          = {{-.3, -.5, -.3, .3, -.4, .3}, {-.1, -.5, -.1, .1, .5, .1}},
		connect_front  = {{-.3, -.5, -.5, .3, -.4, .3}, {-.1, -.5, -.5, .1, .5, .1}},
		connect_back   = {{-.3, -.5, -.3, .3, -.4, .5}, {-.1, -.5, -.1, .1, .5, .5}},
		connect_left   = {{-.5, -.5, -.3, .3, -.4, .3}, {-.5, -.5, -.1, .1, .5, .1}},
		connect_right  = {{-.3, -.5, -.3, .5, -.4, .3}, {-.1, -.5, -.1, .5, .5, .1}},
	},
	connects_to = {"decor:concrete_wall","decor:concrete_wall_upper"},
	on_construct = function(pos)
		local node = core.get_node(pos)
		local pos_above = {x = pos.x,y = pos.y + 1,z = pos.z}
		local node_above = core.get_node(pos_above)
		local pos_below = {x = pos.x,y = pos.y - 1,z = pos.z}
		local node_below = core.get_node(pos_below)
		if node_above.name == "decor:concrete_wall" then
			node_above.name = "decor:concrete_wall_upper"
			core.swap_node(pos_above,node_above)
		end
		if node_below.name == "decor:concrete_wall" or node_below.name == "decor:concrete_wall_upper" then
			node.name = "decor:concrete_wall_upper"
			core.swap_node(pos,node)
		end
	end,
	on_destruct = function(pos)
		local node = core.get_node(pos)
		local pos_above = {x = pos.x,y = pos.y + 1,z = pos.z}
		local node_above = core.get_node(pos_above)
		if node_above.name == "decor:concrete_wall_upper" then
			node_above.name = "decor:concrete_wall"
			core.swap_node(pos_above,node_above)
		end
	end,
})

core.register_node("decor:concrete_wall_upper", {
	sounds = default.node_sound_stone_defaults(),
	paramtype = "light",
	drawtype = "nodebox",
	tiles = {"technic_concrete_block.png"},
	sunlight_propagates = true,
	groups = {cracky = 1, not_in_creative_inventory = 1},
	drop = "decor:concrete_wall",
	node_box = {
		type = "connected",
		fixed          = {{-.1, -.5, -.1, .1, .5, .1}},
		connect_front  = {{-.1, -.5, -.5, .1, .5, .1}},
		connect_back   = {{-.1, -.5, -.1, .1, .5, .5}},
		connect_left   = {{-.5, -.5, -.1, .1, .5, .1}},
		connect_right  = {{-.1, -.5, -.1, .5, .5, .1}},
	},
	connects_to = {"decor:concrete_wall","decor:concrete_wall_upper"},
	on_destruct = function(pos)
		local node = core.get_node(pos)
		local pos_above = {x = pos.x,y = pos.y + 1,z = pos.z}
		local node_above = core.get_node(pos_above)
		if node_above.name == "decor:concrete_wall_upper" then
			node_above.name = "decor:concrete_wall"
			core.swap_node(pos_above,node_above)
		end
	end,
})

core.register_node("decor:concrete_railing", {
	description = "Concrete Railing",
	sounds = default.node_sound_stone_defaults(),
	paramtype = "light",
	drawtype = "nodebox",
	tiles = {"technic_concrete_block.png"},
	sunlight_propagates = true,
	groups = {cracky = 1},
	node_box = {
		type = "connected",
		fixed          = {{.0625,-.5,.0625,-.0625,.1875,-.0625}},
		connect_front  = {{-.0625,.1875,-.5,.0625,.3125,.0625}},
		connect_back   = {{-.0625,.1875,-.0625,.0625,.3125,.5}},
		connect_left   = {{-.5,.1875,-.0625,.0625,.3125,.0625}},
		connect_right  = {{-.0625,.1875,-.0625,.5,.3125,.0625}}
	},
	selection_box = {
		type = "fixed",
		fixed = {{-.5,-.5,-.5,.5,.3125,.5}}
	},
	connects_to = {"decor:concrete_railing","decor:concrete_catwalk"}
})

core.register_node("decor:concrete_catwalk",{
	description= "Concrete Catwalk",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"technic_concrete_block.png"},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5,-.5,-.5,.5,-.375,.5},
			{-.5,-.4,-.0625,-.4375,.45,.0625},
			{.4433,-.4,-.0625,.5,.45,.0625},
			{.4433,.4485,-.5,.5,.5,.5},
			{-.5,.4485,-.5,-.4375,.5,.5}
		}
	},
	groups = {cracky = 2},
})

core.register_node("decor:concrete_bench", {
	description = "Concrete Bench",
	drawtype = "nodebox",
	tiles = {"technic_concrete_block.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-.125,-.5,-.125,.125,.0625,.125},
			{-.5,.0625,-.3125,.5,.1875,.3125}
		}
	},
	groups = {cracky = 2},
	on_rotate = screwdriver.rotate_simple,
	can_dig = player_api.sit_dig_centered,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		player_api.sit_centered(pos, node, clicker, pointd)
		return itemstack
	end,
})

core.register_node("decor:wooden_framed_glass", {
	description = "Деревянное окно",
	drawtype = "glasslike_framed",
	tiles = {"default_wood.png","default_glass_detail.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:steel_framed_glass", {
	description = "Стальное окно",
	drawtype = "glasslike_framed",
	tiles = {"framedglass_steel_frame.png","default_glass_detail.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:wooden_framed_obsidian_glass", {
	description = "Деревянное окно с обсидиановым стеклом",
	drawtype = "glasslike_framed",
	tiles = {"default_wood.png","default_obsidian_glass_detail.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

-- helper functions copied partly from Unified Dyes

local creative_mode = core.settings:get_bool("creative_mode")

local function select_node(pointd)
	local pos = pointd.under
	local node = core.get_node_or_nil(pos)
	local def = node and core.registered_nodes[node.name]

	if not def or not def.buildable_to then
		pos = pointd.above
		node = core.get_node_or_nil(pos)
		def = node and core.registered_nodes[node.name]
	end
	return def and pos, def
end

local function is_buildable_to(placer_name, ...)
	for _, pos in ipairs({...}) do
		local node = core.get_node_or_nil(pos)
		local def = node and core.registered_nodes[node.name]
		if not (def and def.buildable_to) or core.is_protected(pos, placer_name) then
			return false
		end
	end
	return true
end

function decor.color_on_punch(pos, node, puncher, pointd)
	local itemstack = puncher:get_wielded_item()
	local itemname = itemstack:get_name()

	if not string.find(itemname, "dye:")
	  and not string.find(itemname, "unifieddyes:") then
		return itemstack
	end

	local a,b = string.find(node.name, "_glass")
	local oldcolor = string.sub(node.name, b + 1)
	local newcolor = string.sub(itemname, string.find(itemname, ":") + 1)

	local oldcolor2 = string.gsub(oldcolor, "darkgreen", "dark_green")
	local oldcolor2 = string.gsub(oldcolor2, "darkgrey", "dark_grey")

	local newcolor2 = string.gsub(newcolor, "dark_green", "darkgreen")
	local newcolor2 = string.gsub(newcolor2, "dark_grey", "darkgrey")

	if oldcolor == newcolor2 then
		core.chat_send_player(puncher:get_player_name(), "That node is already "..newcolor.."." )
		return itemstack
	end

	if not (newcolor == "dark_grey"
			or newcolor == "dark_green"
			or core.registered_nodes["decor:steel_framed_obsidian_glass"..newcolor]) then
		core.chat_send_player(puncher:get_player_name(), "Framed glass doesn't support "..newcolor.."." )
		return itemstack
	end

	local inv = puncher:get_inventory()
	local prevdye = "dye:"..oldcolor2

	if not (inv:contains_item("main", prevdye) and creative_mode) and core.registered_items[prevdye] then
		if inv:room_for_item("main", prevdye) then
			inv:add_item("main", prevdye)
		else
			core.add_item(pos, prevdye)
		end
	end

	core.set_node(pos, { name = "decor:steel_framed_obsidian_glass"..newcolor2 })
	itemstack:take_item()
	return itemstack
end

local return_dye_after_dig = function(pos, oldnode, oldmetadata, digger)

	local a,b = string.find(oldnode.name, "_glass")
	local oldcolor = string.sub(oldnode.name, b + 1)
	local oldcolor2 = string.gsub(oldcolor, "darkgreen", "dark_green")
	local oldcolor2 = string.gsub(oldcolor2, "darkgrey", "dark_grey")

	local prevdye = "dye:"..oldcolor2

	local inv = digger:get_inventory()

	if prevdye and not (inv:contains_item("main", prevdye) and creative_mode) and core.registered_items[prevdye] then
		if inv:room_for_item("main", prevdye) then
			inv:add_item("main", prevdye)
		else
			core.add_item(pos, prevdye)
		end
	end
end

core.register_node("decor:steel_framed_obsidian_glass", {
	description = "Стальное окно с обсидиановым стеклом",
	drawtype = "glasslike_framed",
	tiles = {"framedglass_steel_frame.png","default_obsidian_glass_detail.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
	on_punch = decor.color_on_punch,
	after_dig_node = return_dye_after_dig
})

function add_coloured_framedglass(name, desc, color)
	core.register_node( "decor:steel_framed_obsidian_glass"..name, {
		description = "Стальное окно с "..desc.." обсидиановым стеклом",
		tiles = {
			"framedglass_steel_frame.png",
			{ name = "framedglass_whiteglass.png", color = color }
		},
		drawtype = "glasslike_framed",
		paramtype = "light",
		sunlight_propagates = true,
		use_texture_alpha = "blend",
		groups = {cracky=3, not_in_creative_inventory=0},
		sounds = default.node_sound_glass_defaults(),
		on_punch = decor.color_on_punch,
		after_dig_node = return_dye_after_dig,
		drop = "decor:steel_framed_obsidian_glass"
	}) 
end

add_coloured_framedglass("red",		"красным",		0xffff0000)
add_coloured_framedglass("orange",	"оранжевым",	0xfffe7f00)
add_coloured_framedglass("yellow",	"жёлтым",		0xffffff01)
add_coloured_framedglass("green",	"зелёным",		0xff0cff00)
add_coloured_framedglass("cyan",	"голубым",		0xff7affff)
add_coloured_framedglass("blue",	"синим",		0xff1600ff)
add_coloured_framedglass("violet",	"фиолетовым",	0xff7d00ff)
add_coloured_framedglass("magenta",	"пурпурным",	0xfffd05ff)

add_coloured_framedglass("darkgreen",	"тёмно-зелёным",0xff144f00)
add_coloured_framedglass("pink",		"розовым",		0xffffa4a4)
add_coloured_framedglass("brown",		"коричневым",	0xff542a00)

add_coloured_framedglass("white",		"белым",		0xffffffff)
add_coloured_framedglass("grey",		"серым",		0xff7f817e)
add_coloured_framedglass("darkgrey",	"тёмно-серым",	0xff3f403e)
add_coloured_framedglass("black",		"чёрным",		0xff000000)

-- block_in_block | October 2018 TumeniNodes

--a node which can be set inside default nodes. you must point at the
--top of the other node to place it.

core.register_node("decor:block_1", {
	description = "Block 1",
	drawtype = "nodebox",
	tiles = {"block_1_top.png", "block_1_bottom.png", "block_1_side.png"},
	inventory_image = "block_1_side.png",
	wield_image = "block_1_side.png",
	visual_scale = 2.,
	paramtype = "light",
	use_texture_alpha = "clip",
	groups = {cracky = 3},
	drop = "default:apple",
	sounds = default.node_sound_stone_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-.3125, -1.375, -.3125, .3125, -.75, .3125},
			{-.375, -1.5, -.375, .375, -1.375, .375},
		}
	}
})

core.register_node("decor:block_2", {
	description = "Block 2",
	drawtype = "nodebox",
	tiles = {"block_2.png"},
	inventory_image = "block_2.png",
	wield_image = "block_2.png",
	visual_scale = .5,
	paramtype = "light",
	use_texture_alpha = "clip",
	light_source = 6,
	groups = {cracky = 3},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-.3125, -1.3125, -.3125, .3125, -.6875, .3125},
		}
	}
})

-- Let's add a mesh version, just for giggles plus silly drops
-- First tile = inner node	Second tile = outer node

core.register_node("decor:block_3", {
	description = "Block 3",
	drawtype = "mesh",
	mesh = "block_in_block.obj",
	tiles = {"default_gold_block.png", "default_obsidian_glass.png"},
	paramtype = "light",
	use_texture_alpha = "clip",
	groups = {cracky = 3},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:block_4", {
	description = "Block 4",
	drawtype = "mesh",
	mesh = "block_in_block.obj",
	tiles = {"default_diamond_block.png", "default_glass.png"},
	paramtype = "light",
	use_texture_alpha = "clip",
	groups = {cracky = 3},
	drop = "default:aspen_sapling",
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:green_slime_mossycobble", {
	description = "Green Slime Mossy Cobble",
	drawtype = "mesh",
	mesh = "block_in_block.obj",
	tiles = {"default_mossycobble.png", "green_slime.png"},
	inventory_image = core.inventorycube("block_side_inv.png", "block_side_inv.png", "block_side_inv.png"),
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = "blend",
	groups = {cracky = 3},
	drop = "default:mese_post_light",
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:green_liquid_light", {
	description = "Green Liquid Light",
	drawtype = "mesh",
	mesh = "block_in_block.obj",
	tiles = {"default_mese_block.png", {name = "green_liquid.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1}
	}},
	inventory_image = core.inventorycube("green_liquid_invcube.png", "green_liquid_invcube.png", "green_liquid_invcube.png"),
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = "blend",
	light_source = 9,
	groups = {cracky = 3},
	drop = "default:dirt_with_grass",
	sounds = default.node_sound_water_defaults()
})

-- Cool but can we switch the animated texture around?
-- Sure

core.register_node("decor:green_liquid_inner", {
	description = "Green Liquid Inner",
	drawtype = "mesh",
	mesh = "block_in_block.obj",
	tiles = {{name = "green_liquid.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1}
		}, "default_glass.png"},
	inventory_image = core.inventorycube("green_liquid_innercube.png", "green_liquid_innercube.png", "green_liquid_innercube.png"),
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = "blend",
	groups = {cracky = 3},
	drop = "default:dirt_with_dry_grass",
	sounds = default.node_sound_glass_defaults()
})

core.register_node("decor:reinforced_chalk", {
	description = "Reinforced Chalk",
	tiles = {"darkage_reinforced_chalk.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:reinforced_wood", {
	description = "Reinforced Wood",
	tiles = {"darkage_reinforced_wood.png"},
	groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

core.register_node("decor:reinforced_wood_right", {
	description = "Reinforced Wood Right",
	tiles = {"darkage_reinforced_wood_right.png"},
	groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

core.register_node("decor:reinforced_wood_left", {
	description = "Reinforced Wood Left",
	tiles = {"darkage_reinforced_wood_left.png"},
	groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

core.register_node("decor:chain", {
	description = "Chain",
	drawtype = "signlike",
	tiles = {"darkage_chain.png"},
	inventory_image = "darkage_chain.png",
	wield_image = "darkage_chain.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	selection_box = {type = "wallmounted"},
	groups = {snappy=1,cracky=2,oddly_breakable_by_hand=2},
	legacy_wallmounted = true
})

core.register_node("decor:box", {
	description = "Box",
	tiles = {"darkage_box_top.png","darkage_box_top.png","darkage_box.png"},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = {snappy = 3},
	sounds = default.node_sound_wood_defaults({
		dig = {name = "default_dig_choppyhollow", gain= .4}
	}),
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec",
			"size[8,8]"..
			"list[current_name;main;0,0;8,3;]"..
			"list[current_player;main;0,4;8,4;]")
		meta:set_string("infotext", "Box")
		local inv = meta:get_inventory()
		inv:set_size("main", 16)
	end,
	can_dig = function(pos,player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		core.log("action", player:get_player_name()..
			" moves stuff in box at "..core.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name()..
			" moves stuff to box at "..core.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name()..
			" takes stuff from box at "..core.pos_to_string(pos))
	end,
})

core.register_node("decor:wood_shelves", {
	description = "Wooden Shelves",
	tiles = {"darkage_shelves.png","darkage_shelves.png","darkage_shelves.png",
		"darkage_shelves.png","darkage_shelves.png","darkage_shelves_front.png"},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec",
			"size[8,10]"..
		"list[context;up;0,0;8,3;]"..
		"list[context;down;0,3;8,3;]"..
			"list[current_player;main;0,6;8,4;]")
		meta:set_string("infotext", "Wooden Shelves")
		local inv = meta:get_inventory()
		inv:set_size("up", 16)
		inv:set_size("down", 16)
	end,
	can_dig = function(pos,player)
		local meta = core.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("up") and inv:is_empty("down")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		core.log("action", player:get_player_name()..
			" moves stuff in shelves at "..core.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name()..
			" moves stuff to shelves at "..core.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name()..
			" takes stuff from shelves at "..core.pos_to_string(pos))
	end,
})

core.register_node("decor:iron_grille", {
	description = "Iron Grille",
	drawtype = "glasslike",
	tiles = {"darkage_iron_grille.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:wood_grille", {
	description = "Wooden Grille",
	drawtype = "glasslike",
	tiles = {"darkage_wood_grille.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=1,choppy=2},
	sounds = default.node_sound_stone_defaults()
})

core.register_node("decor:wood_frame", {
	description = "Wooden Frame",
	drawtype = "glasslike",
	tiles = {"darkage_wood_frame.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=1,choppy=2},
	sounds = default.node_sound_stone_defaults()
})


-- Crafts
core.register_craft({
	output = "decor:reinforced_chalk",
	recipe = {
		{"default:stick","","default:stick"},
		{"","mapgen:chalk",""},
		{"default:stick","","default:stick"}
	}
})

core.register_craft({
	output = "decor:reinforced_wood",
	recipe = {
		{"default:stick","","default:stick"},
		{"","default:wood",""},
		{"default:stick","","default:stick"}
	}
})

core.register_craft({
	output = "default:wood",
	recipe = {{"decor:reinforced_wood"}}
})

core.register_craft({
	output = "decor:reinforced_wood_left",
	recipe = {
		{"default:stick","",""},
		{"","default:wood",""},
		{"","","default:stick"}
	}
})

core.register_craft({
	output = "default:wood",
	recipe = {{"decor:reinforced_wood_left"}}
})

core.register_craft({
	output = "decor:reinforced_wood_right",
	recipe = {
		{"","","default:stick"},
		{"","default:wood",""},
		{"default:stick","",""}
	}
})

core.register_craft({
	output = "default:wood",
	recipe = {{"decor:reinforced_wood_right"}}
})

core.register_craft({
	output = "decor:box",
	recipe = {
		{"default:wood","","default:wood"},
		{"","",""},
		{"default:wood","","default:wood"}
	}
})

core.register_craft({
	output = "decor:chain 2",
	recipe = {
		{"default:steel_ingot"},
		{"default:steel_ingot"},
		{"default:steel_ingot"}
	}
})

core.register_craft({
	output = "decor:iron_grille 3",
	recipe = {
		{"","default:steel_ingot",""},
		{"default:steel_ingot","default:steel_block","default:steel_ingot"}
	}
})

core.register_craft({
	output = "decor:wood_grille 3",
	recipe = {
		{"","default:stick",""},
		{"default:stick","default:wood","default:stick"}
	}
})

core.register_craft({
	output = "decor:wood_shelves",
	recipe = {
		{"decor:box"},
		{"decor:box"}
	}
})

core.register_craft({
	output = "decor:wood_frame",
	recipe = {
		{"default:stick","","default:stick"},
		{"","default:glass",""},
		{"default:stick","","default:stick"}
	}
})

core.register_craft({
	output = "default:glass",
	recipe = {{"decor:wood_frame"}}
})

core.register_node("decor:strip_light", {
	description = "Strip Light",
	drawtype = "nodebox",
	tiles = {"default_wood.png", "default_cloud.png", "default_wood.png"},
	paramtype2 = "facedir",
	light_source = 14,
	node_box = {
		type = "fixed",
		fixed = {
			{-.5,.25,-.25,.5,.375,.25},
			{-.5,.375,-.0625,.5,.5,.0625}
		}
	},
	groups={oddly_breakable_by_hand=3},
})

core.register_node("decor:catwalk", {
	description = "Catwalk",
	drawtype = "nodebox",
	tiles = {"catwalk.png", "catwalk.png", "default_steel_block.png"},
	paramtype = "light",
	use_texture_alpha = "clip",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5,-.5,-.5,.5,-.375,.5},
			{-.5,-.5,-.0625,-.4375,.5,.0625},
			{.443299,-.5,-.0625,.5,.5,.0625},
			{.443299,.448454,-.5,.5,.5,.5},
			{-.5,.448454,-.5,-.4375,.5,.5}
		}
	},
	groups={oddly_breakable_by_hand=3},
})

screwdriver = screwdriver or {}

local function start_smoke(pos, node, clicker, chimney)
	local this_spawner_meta = core.get_meta(pos)
	local id = this_spawner_meta:get_int("smoky")
	local s_handle = this_spawner_meta:get_int("sound")
	local above = core.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name

	if id ~= 0 then
		if s_handle then
			core.after(0, function(handle)
				core.sound_stop(handle)
			end, s_handle)
		end
		core.delete_particlespawner(id)
		this_spawner_meta:set_int("smoky", 0)
		this_spawner_meta:set_int("sound", 0)
		return
	end

	if above == "air" and (not id or id == 0) then
		id = core.add_particlespawner({
			amount = 4, time = 0, collisiondetection = true,
			minpos = {x=pos.x-.25, y=pos.y+.4, z=pos.z-.25},
			maxpos = {x=pos.x+.25, y=pos.y+5, z=pos.z+.25},
			minvel = {x=-.2, y=.3, z=-.2}, maxvel = {x=.2, y=1, z=.2},
			minacc = {x=0,y=0,z=0}, maxacc = {x=0,y=.5,z=0},
			exptime = {min = 1, max = 3},
			minsize = 4, maxsize = 8,
			texture = "smoke_particle.png"})
		if chimney == 1 then
			this_spawner_meta:set_int("smoky", id)
			this_spawner_meta:set_int("sound", 0)
		else
			s_handle = core.sound_play("fire_small", {
				pos = pos,
				max_hear_distance = 5,
				loop = true
			})
			this_spawner_meta:set_int("smoky", id)
			this_spawner_meta:set_int("sound", s_handle)
		end
	end
end

local function stop_smoke(pos)
	local this_spawner_meta = core.get_meta(pos)
	local id = this_spawner_meta:get_int("smoky")
	local s_handle = this_spawner_meta:get_int("sound")

	if id ~= 0 then
		core.delete_particlespawner(id)
	end

	if s_handle then
		core.after(0, function(handle)
			core.sound_stop(handle)
		end, s_handle)
	end

	this_spawner_meta:set_int("smoky", 0)
	this_spawner_meta:set_int("sound", 0)
end

core.register_node("decor:ice_fire", {
	description = "Ice fire",
	drawtype = "firelike",
	inventory_image = "ice_fire_inv.png",
	tiles = {{name="ice_fire_animated.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=1.5}}},
	paramtype = "light",
	sunlight_propagates = true,
	buildable_to = true,
	walkable = false,
	light_source = 14,
	waving = 1,
	groups = {dig_immediate=3, not_in_creative_inventory=1},
	drop = ""
})

core.register_node("decor:fancy_fire", {
	description = "Fancy Fire",
	drawtype = "mesh",
	mesh = "fancy_fire.obj",
	tiles = {{name="fake_fire_animated.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=1}}, {name="fake_fire_logs.png"}},
	inventory_image = "fancy_fire_inv.png",
	paramtype = "light",
	use_texture_alpha = "clip",
	paramtype2 = "facedir",
	groups = {dig_immediate=3},
	sunlight_propagates = true,
	light_source = 14,
	walkable = false,
	damage_per_second = 4,
	on_rotate = screwdriver.rotate_simple,
	on_rightclick = function(pos, node, clicker, itemstack, pointd)
		start_smoke(pos, node, clicker)
		return itemstack
	end,
	on_destruct = function(pos)
		stop_smoke(pos)
		core.sound_play("fire_extinguish_flame", {
			pos = pos, max_hear_distance = 5
		})
	end,
	drop = {
		items = {
			{items = {"default:torch 2", "decor:sticks"}}
		}
	}
})

-- EMBERS
core.register_node("decor:embers", {
    description = "Glowing Embers",
	tiles = {
		{name="embers_animated.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=2}},
	},
	light_source = 9,
	groups = {crumbly=3},
	paramtype = "light",
	sounds = default.node_sound_dirt_defaults(),
})

-- CHIMNEYS
local materials = {
	{ "stone",     "Stone chimney top"},
	{ "sandstone", "Sandstone chimney top"},
}

for _, mat in ipairs(materials) do
	local name, desc = unpack(mat)
	core.register_node("decor:chimney_top_"..name, {
		description = desc,
		tiles = {"default_"..name..".png^chimney_top.png", "default_"..name..".png"},
		groups = {snappy=3},
		paramtype = "light",
		sounds = default.node_sound_stone_defaults(),
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {-.5, -.5, -.5, .5, 0, .5},
		},
		on_rightclick = function(pos, node, clicker, itemstack, pointd)
			start_smoke(pos, node, clicker, 1)
			return itemstack
		end,
		on_destruct = function (pos)
			stop_smoke(pos)
		end
	})

	core.register_craft({
		type = "shapeless",
		output = "decor:chimney_top_"..name,
		recipe = {"default:torch", "stairs:slab_"..name}
	})
end

core.override_item("default:ice", {
	on_ignite = function(pos, igniter)
		local flame_pos = {x = pos.x, y = pos.y + 1, z = pos.z}
		if core.get_node(flame_pos).name == "air" then
			core.set_node(flame_pos, {name = "decor:ice_fire"})
		end
	end
})

-- CRAFTS

core.register_craft({
	type = "shapeless",
	output = "decor:embers",
	recipe = {"default:torch", "group:wood", "default:torch"}
})

core.register_craft({
	type = "shapeless",
	output = "decor:fancy_fire",
	recipe = {"default:torch", "decor:sticks", "default:torch"}
})

if core.get_modpath("doors") then
	doors.register("decor:oak_door", {
		tiles = {{ name = "castle_door_oak.png", backface_culling = true }},
		description = "Oak Door",
		inventory_image = "castle_oak_door_inv.png",
		protected = true,
		groups = { choppy = 2, door = 1 },
		sounds = default.node_sound_wood_defaults(),
		recipe = {
			{"default:beech_trunk", "default:beech_trunk"},
			{"default:beech_trunk", "default:beech_trunk"},
			{"default:beech_trunk", "default:beech_trunk"},
		}
	})

	doors.register("decor:jail_door", {
		tiles = {{ name = "castle_door_jail.png", backface_culling = true }},
		description = "Jail Door",
		inventory_image = "castle_jail_door_inv.png",
		protected = true,
		groups = { cracky = 2, door = 1, flow_through = 1},
		sound_open = "doors_steel_door_open",
		sound_close = "doors_steel_door_close",
		recipe = {
			{"xpanes:jailbars_flat", "xpanes:jailbars_flat"},
			{"xpanes:jailbars_flat", "xpanes:jailbars_flat"},
			{"xpanes:jailbars_flat", "xpanes:jailbars_flat"},
		}
	})
end

if core.get_modpath("xpanes") then
xpanes.register_pane("jailbars", {
	description = "Jail Bars",
	tiles = {"castle_jailbars.png"},
	drawtype = "airlike",
	paramtype = "light",
	textures = {"castle_jailbars.png", "", "xpanes_bar_top.png"},
	inventory_image = "castle_jailbars.png",
	wield_image = "castle_jailbars.png",
	sounds = default.node_sound_metal_defaults(),
	groups = {cracky=1, pane=1, flow_through=1},
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "",                    "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}},
})
end

core.register_node("decor:stonewall", {
	description = "Castle Wall",
	tiles = {"castle_stonewall.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("decor:rubble", {
	description = "Castle Rubble",
	tiles = {"castle_rubble.png"},
	groups = {crumbly=3,falling_node=1},
	sounds = default.node_sound_gravel_defaults(),
})

core.register_craft({
	output = "decor:stonewall",
	recipe = {
		{"default:cobble"},
		{"default:desert_stone"},
	}
})

core.register_craft({
	output = "decor:rubble",
	recipe = {
		{"decor:stonewall"},
	}
})

core.register_craft({
	output = "decor:rubble 2",
	recipe = {
		{"default:gravel"},
		{"default:desert_stone"},
	}
})

core.register_node("decor:stonewall_corner", {
	description = "Castle Corner",
	tiles = {"castle_corner_stonewall_tb.png^[transformR90",
		 "castle_corner_stonewall_tb.png^[transformR180",
		 "castle_corner_stonewall1.png",
		 "castle_stonewall.png",
		 "castle_stonewall.png",	
		 "castle_corner_stonewall2.png"},
	paramtype2 = "facedir",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = "decor:stonewall_corner",
	recipe = {
		{"", "decor:stonewall"},
		{"decor:stonewall", "default:sandstone"},
	}
})

core.register_node("decor:dungeon_stone", {
	description = "Dungeon Stone",
	tiles = {"castle_dungeon_stone.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = "decor:dungeon_stone 2",
	recipe = {
		{"default:stone_brick", "default:obsidian"},
	}
})

core.register_craft({
	output = "decor:dungeon_stone 2",
	recipe = {
		{"default:stone_brick"},
		{"default:obsidian"},
	}
})

core.register_node("decor:chandelier_castle", {
	drawtype = "plantlike",
	description = "Chandelier",
	paramtype = "light",
	wield_image = "castle_chandelier_wield.png",
	inventory_image = "castle_chandelier_wield.png", 
	groups = {cracky=2},
	sounds = default.node_sound_metal_defaults(),
	sunlight_propagates = true,
	is_ground_content = false,
	light_source = 14,
	tiles = {{
		name = "castle_chandelier.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.}
	}},
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.37, -.25, .25, .5, .25}
	},
})

core.register_craft({
	output = "decor:chandelier_castle",
	recipe = {
		{"", "", ""},
		{"", "default:steel_ingot", ""},
		{"default:torch","default:torch","default:torch"}
	}
})

core.register_node("decor:chandelier_chain_castle", {
	drawtype = "plantlike",
	description = "Chandelier Chain",
	paramtype = "light",
	wield_image = "castle_chandelier_chain.png",
	inventory_image = "castle_chandelier_chain.png", 
	walkable = false,
	climbable = true,
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_metal_defaults(),
	sunlight_propagates = true,
	tiles = {"castle_chandelier_chain.png"},
	selection_box = {
		type = "fixed",
		fixed = {.1,-.5,.1,-.1,.5,-.1}
	},
})

core.register_craft({
	output = "decor:chandelier_chain_castle 4",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"", "", ""},
		{"","default:steel_ingot",""}
	}
})

local pillar_brasier_nodebox = {
	type = "fixed",
	fixed = {
		{-.375, .125, -.375, .375, .25, .375}, -- mid
		{-.5, .25, -.5, .5, .375, .5}, -- plat
		{-.5, .375, .375, .5, .5, .5}, -- edge
		{-.5, .375, -.5, .5, .5, -.375}, -- edge
		{.375, .375, -.375, .5, .5, .375}, -- edge
		{-.5, .375, -.375, -.375, .5, .375}, -- edge
		{-.25,-.5,-.25,.25,.125,.25}, -- support
	}
}

local pillar_brasier_selection_box = {
	type = "fixed",
	fixed = {
		{-.375, .125, -.375, .375, .25, .375}, -- mid
		{-.5, .25, -.5, .5, .5, .5}, -- plat
		{-.25,-.5,-.25,.25,.125,.25}, -- support
	}
}

local brasier_nodebox = {
	type = "fixed",
	fixed = {
		{-.25, 0, -.25, .25, .125, .25}, -- base
		{-.375, .125, -.375, .375, .25, .375}, -- mid
		{-.5, .25, -.5, .5, .375, .5}, -- plat
		{-.5, .375, .375, .5, .5, .5}, -- edge
		{-.5, .375, -.5, .5, .5, -.375}, -- edge
		{.375, .375, -.375, .5, .5, .375}, -- edge
		{-.5, .375, -.375, -.375, .5, .375}, -- edge
		{.25, -.5, -.375, .375, .125, -.25}, -- leg
		{-.375, -.5, .25, -.25, .125, .375}, -- leg
		{.25, -.5, .25, .375, .125, .375}, -- leg
		{-.375, -.5, -.375, -.25, .125, -.25}, -- leg
		{-.125, -.0625, -.125, .125, 0, .125}, -- bottom_knob
	}
}
local brasier_selection_box = {
	type = "fixed",
	fixed = {
		{-.375, -.5, -.375, .375, .25, .375}, -- mid
		{-.5, .25, -.5, .5, .5, .5}, -- plat
	}
}

local brasier_burn = function(pos)
	local pos_above = {x=pos.x, y=pos.y+1, z=pos.z}
	local node_above = core.get_node(pos_above)
	local timer = core.get_node_timer(pos)

	if timer:is_started() and node_above.name == "fire:permanent_flame" then return end -- already burning, don't burn a new thing.

	local inv = core.get_inventory({type="node", pos=pos})
	local item = inv:get_stack("fuel", 1)
	local fuel_burned = core.get_craft_result({method="fuel", width=1, items={item:peek_item(1)}}).time

	if fuel_burned > 0 and (node_above.name == "air" or node_above.name == "fire:permanent_flame") then
		item:set_count(item:get_count() - 1)
		inv:set_stack("fuel", 1, item)

		timer:start(fuel_burned * 60) -- one minute of flame per second of burn time, for balance.

		if node_above.name == "air" then
			core.set_node(pos_above, {name = "fire:permanent_flame"})
		end
	else
		if node_above.name == "fire:permanent_flame" then
			core.set_node(pos_above, {name = "air"})
		end
	end
end

local brasier_on_construct = function(pos)
	local inv = core.get_meta(pos):get_inventory()
	inv:set_size("fuel", 1)

	local meta = core.get_meta(pos)
	meta:set_string("formspec", 
		"size[8,5.3]" ..
		"list[current_name;fuel;3.5,0;1,1;]" ..
		"list[current_player;main;0,1.15;8,1;]" ..
		"list[current_player;main;0,2.38;8,3;8]" ..
		"listring[current_name;main]" ..
		"listring[current_player;main]" ..
		default.get_hotbar_bg(0,1.15)
	)
end

local brasier_on_destruct = function(pos, oldnode)
	local pos_above = {x=pos.x, y=pos.y+1, z=pos.z}
	local node_above = core.get_node(pos_above)
	if node_above.name == "fire:permanent_flame" then
		core.set_node(pos_above, {name = "air"})
	end
end

local brasier_can_dig = function(pos, player)
	local inv = core.get_meta(pos):get_inventory()
	return inv:is_empty("fuel")
end

-- Only allow fuel items to be placed in fuel
local brasier_allow_metadata_inventory_put = function(pos, listname, index, stack, player)
	if listname == "fuel" then
		if core.get_craft_result({method="fuel", width=1, items={stack}}).time ~= 0 then
			return stack:get_count()
		else
			return 0
		end
	end
	return 0
end

core.register_node("decor:brasier_floor", {
	description = "Floor Brasier",
	tiles = {"castle_steel.png^(castle_coal_bed.png^[mask:castle_brasier_bed_mask.png)", "castle_steel.png"},
	drawtype = "nodebox",
	groups = {cracky=2},
	paramtype = "light",
	node_box = brasier_nodebox,
	selection_box = brasier_selection_box,
	on_construct = brasier_on_construct,
	on_destruct = brasier_on_destruct,
	can_dig = brasier_can_dig,
	allow_metadata_inventory_put = brasier_allow_metadata_inventory_put,
	on_metadata_inventory_put = brasier_burn,
	on_timer = brasier_burn,
})

core.register_craft({
	output = "decor:brasier_floor",
	recipe = {
		{"default:steel_ingot", "default:torch", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
	}
})

core.register_node("decor:candlestick", {
	description = "Candlestick",
	drawtype = "plantlike",
	tiles = {{
		name = "horror_candlestick_anim.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.},
	}},
	wield_image = "horror_candlestick.png",
	inventory_image = "horror_candlestick.png",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 14,
	groups = {cracky=1, oddly_breakable_by_hand=2},
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, .1, .1}
	},
})

core.register_node("decor:candle", {
	description = "Candle",
	drawtype = "plantlike",
	tiles = {{
		name = "horror_candle_anim.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.},
	}},
	wield_image = "horror_candle_inv.png",
	inventory_image = "horror_candle_inv.png",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 14,
	groups = {snappy=2, dig_immediate=2},
	selection_box = {
		type = "fixed",
		fixed = {-.1, -.5, -.1, .1, 0, .1}
	},
})

core.register_abm({
	nodenames = {"decor:head"},
	interval = 2,
	chance = 5,
	action = function(pos)
		core.add_particlespawner({
			amount = 2,
			time = 4,
			minpos = {x=pos.x-.2, y=pos.y-.2, z=pos.z-.1},
			maxpos = {x=pos.x+.2, y=pos.y-.2, z=pos.z+.1},
			minvel = {x=0, y=-.7, z=0},
			maxvel = {x=0, y=-.8, z=0},
			minacc = {x=0, y=-1, z=0},
			maxacc = {x=0, y=-1, z=0},
			exptime = {min = 4, max = 5},
			minsize = 1,
			maxsize = 2,
			texture = "horror_blood.png"})
	end
})

core.register_abm({
	nodenames = {"decor:clock"},
	interval = 1,
	chance = 1,
	action = function(pos)
		core.sound_play("clock", {pos = pos, gain = 3, max_hear_distance = 5})
		local meta = core.get_meta(pos)
		local time1 = core.get_timeofday()*24000
		meta:set_string("infotext", "time:"..time1)
		if math.random(1,500) == 1 then
core.sound_play("clock_strikes_twelve", {pos = pos, max_hear_distance = 15})
		end
	end
})

core.register_node("decor:bookshelf", {
	description = "Bookshelf (fake)",
	tiles = {"default_wood.png", "default_wood.png", "default_bookshelf.png"},
	is_ground_content = false,
	walkable = false,
	drop = "default:bookshelf",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("decor:glowsteel_block", {
	description = "Glow Steel",
	tiles = {{
		name="horror_glowsteel.png",
		animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1.},
	}},
	inventory_image = "horror_glowsteelinv.png",
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 2,
	groups = {cracky = 2}
})

core.register_node("decor:fire", {
	description = "Decorative Fire",
	drawtype = "plantlike",
	tiles = {{
		name = "horror_fire.png",
		animation = {type = "vertical_frames", aspect_w = 1, aspect_h = 1, length = 1.7},
	}},
	inventory_image = "horror_fire_inv.png",
	wield_image = "horror_fire_inv.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	light_source = 14,
	damage_per_second = 2,
	groups = {dig_immediate = 3},
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 0, .3}
	}
})

core.register_node("decor:lantern_h", {
	description = "Lantern",
	drawtype = "plantlike",
	tiles = {"horror_lantern.png"},
	inventory_image = "horror_lantern.png",
	paramtype = "light",
	walkable = false,
	use_texture_alpha = "blend",
	sunlight_propagates = true,
	light_source = 14,
	on_construct = function(pos)
		core.get_node_timer(pos):start(7)
	end,
	on_timer = function(pos)
		core.add_particlespawner({
			amount = 10,
			time = 7,
			minpos = {x=pos.x-.5, y=pos.y-.5, z=pos.z-.5},
			maxpos = {x=pos.x+.5, y=pos.y+.5, z=pos.z+.5},
			minvel = {x=-.1, y=-.1, z=-.1},
			maxvel = {x=.1, y=.1, z=.1},
			exptime = {min = 1, max = 2},
			minsize = 1,
			maxsize = 2,
			collisiondetection = true,
			texture = "default_firefly.png",
			glow = 5 })
		core.get_node_timer(pos):start(7)
	end,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .3, .2}
	},
	groups = {snappy=1, oddly_breakable_by_hand=1}
})

core.register_node("decor:fountain", {
	description = "Gargoyle Fountain",
	tiles = {"horror_stone.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, .4375, .5, .5, .5},
			{-.3125, -.4375, .375, .3125, .375, .5},
			{-.25, -.3125, .125, .25, .3125, .5},
			{-.25, -.3125, -.0625, .25, -.125, .5},
			{-.25, 0, -.1875, .25, .1875, .5},
			{-.125, .1875, -.0625, .125, .25, .5}
		}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(3)
	end,
	on_timer = function(pos)
		core.add_particlespawner({
			amount = 59,
			time = 4,
			pos = {x=pos.x, y=pos.y-.1, z=pos.z},
			minvel = {x=0, y=-1, z=0},
			maxvel = {x=0, y=-2, z=0},
			exptime = {min = .5, max = 1},
			minsize = 2,
			maxsize = 3,
			texture = "horror_gunk.png"})
		core.get_node_timer(pos):start(3)
	end,
	groups = {cracky=1},
})

core.register_node("decor:cross", {
	description = "Cross",
	tiles = {"horror_stone.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-.3125, -.5, -.3125, .3125, -.4375, .3125},
			{-.125, -.5, -.125, .125, .5, .125},
			{-.375, .0625, -.125, .375, .25, .125}
		}
	},
	groups = {cracky=1}
})

core.register_node("decor:old_tombstone", {
	description = "Old Tombstone",
	tiles = {"horror_crackedstone.png", "horror_stone.png", "horror_stone.png",
		"horror_stone.png", "horror_stone.png", "horror_crackedstone.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, -.25, .5, -.375, .3125},
			{-.4375, -.5, -.125, .4375, .125, .1875},
			{-.375, -.5, -.125, .375, .25, .1875},
			{-.3125, -.5, -.125, .3125, .375, .1875}
		}
	},
	groups = {cracky=1}
})

core.register_node("decor:stone", {
	description = "Old Stone",
	tiles = {"horror_stone.png"},
	groups = {cracky=1}
})

stairs.register_stair_and_slab("oldstone", "decor:stone",
	{cracky=1},
	{"horror_stone.png"},
	"Old Stone Stair",
	"Old Stone Slab")

core.register_node("decor:clock", {
	description = "Clock",
	tiles = {"horror_clock_top.png", "horror_clock_top.png", "horror_clock_side.png",
		"horror_clock_side.png", "horror_clock_back.png", "horror_clock_front.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-.375, -.5, -.25, .375, .4375, .25},
			{-.3125, .25, -.1875, .3125, .5, .1875},
			{-.4375, -.5, -.3125, .4375, -.4375, .3125}
		}
	}
})

core.register_node("decor:jar", {
	description = "Eye Jar",
	tiles = {"jar_top.png", "jar_top.png", "jar_side.png"},
	drawtype = "nodebox",
	paramtype = "light",
	use_texture_alpha = "opaque",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-.4375, -.5, -.4375, .4375, -.375, .4375},
			{-.4375, .375, -.4375, .4375, .5, .4375},
			{-.375, -.5, -.375, .375, .5, .375},
			{-.4375, -.5, -.3125, .4375, .5, .3125},
			{-.3125, -.5, -.4375, .25, .5, .4375},
			{-.5, -.5, -.375, .5, -.375, .375},
			{-.375, -.5, -.5, .375, -.375, .5},
			{-.3125, .375, -.5, .375, .5, .5},
			{-.5, .375, -.375, .5, .5, .375}
		}
	}
})

core.register_node("decor:stand", {
	description = "Stand",
	tiles = {"horror_stone.png"},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-.4375, .4375, -.4375, .4375, .5, .4375},
			{-.4375, -.5, -.4375, .4375, -.4375, .4375},
			{-.375, -.4375, -.375, .375, -.375, .375},
			{-.375, .375, -.375, .375, .4375, .375},
			{-.25, -.375, -.25, .25, .375, .25}
		}
	}
})

core.register_node("decor:fence", {
	description = "Spike Fence",
	tiles = {"blank.png", "blank.png", "horror_spikes_side.png",
		"horror_spikes_side.png", "horror_spikes.png"},
	drawtype = "nodebox",
	paramtype = "light",
	use_texture_alpha = "clip",
	paramtype2 = "facedir",
	groups = {cracky=1},
	damage_per_second = 1,
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.0625, .5, .5, 0}
	}
})

core.register_node("decor:tree", {
	description = "Dead Tree",
	drawtype = "plantlike",
	tiles = {"horror_tree.png"},
	inventory_image = "horror_tree.png",
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	visual_scale = 2,
	groups = {choppy=1, oddly_breakable_by_hand=1, flammable=1},
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, 1, .3}
	},
	collision_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .7, .2}
	},
	drop = "default:stick 7",
})

core.register_node("decor:head", {
	description = "Head",
	drawtype = "plantlike",
	tiles = {"horror_head.png"},
	inventory_image = "horror_head.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {dig_immediate=3}
})

core.register_node("decor:boards", {
	description = "Boards",
	tiles = {"horror_wood.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=2, oddly_breakable_by_hand=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, .125, .4375, .5, .4375, .5},
			{-.4375, -.5, .375, -.0625, .5, .4375},
			{-.5, -.4375, .4375, .5, -.1875, .5},
			{.0625, -.5, .375, .4375, .5, .4375}
		}
	}
})

core.register_node("decor:shelf", {
	description = "Shelf",
	tiles = {"horror_barrel_top.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=2, oddly_breakable_by_hand=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, .4375, -.0625, .5, .5, .5},
			{.4375, .3125, .125, .5, .4375, .5},
			{.4375, .1875, .3125, .5, .5, .5},
			{-.5, .1875, .3125, -.4375, .5, .5},
			{-.5, .3125, .125, -.4375, .4375, .5}
		}
	}
})

core.register_node("decor:barrel", {
	description = "Barrel",
	tiles = {"horror_barrel_top.png", "horror_barrel_top.png", "horror_barrel.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=2, oddly_breakable_by_hand=1},
	drop = {
		items = {
			{items = {"farming:wheat_bread 2", "default:apple 3", "default:coal_lump 2"}}
		}
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-.1875, -.5, -.5, .1875, .5, .5},
			{-.5, -.5, -.1875, .5, .5, .1875},
			{-.375, -.5, -.375, .375, .5, .375},
			{-.3125, -.5, -.4375, .3125, .5, .4375},
			{-.4375, -.5, -.3125, .4375, .5, .3125}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-.2, -.5, -.5, .2, .5, .5},
			{-.4, -.5, -.4, .4, .5, .4},
			{-.5, -.5, -.2, .5, .5, .2}
		}
	}
})

core.register_node("decor:horror_table", {
	description = "Table",
	tiles = {"default_wood.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, .375, -.5, .5, .5, .5},
			{.25, -.5, -.5, .5, .375, -.25},
			{-.1875, -.5, -.5, .5, -.375, .1875}
		}
	}
})

core.register_node("decor:table_stone", {
	description = "Old Stone Table",
	tiles = {"horror_stone.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, .375, -.5, .5, .5, .5},
			{.25, -.5, -.5, .5, .375, -.25},
			{-.1875, -.5, -.5, .5, -.375, .1875}
		}
	}
})

core.register_node("decor:sandbags", {
	description = "Sandbags",
	tiles = {"army_sandbags.png"},
	groups = {crumbly=2, falling_node=1},
})

core.register_craft({
	output = "decor:sandbags 2",
	recipe = {
		{"default:paper", "default:paper", "default:paper"},
		{"default:paper", "group:sand", "default:paper"},
		{"default:paper", "default:paper", "default:paper"}
	}
})

core.register_node("decor:barbedwire", {
	description = "Barbed Wire",
	drawtype = "plantlike",
	visual_scale = 1.2,
	tiles = {"army_barbedwire.png"},
	inventory_image = "army_barbedwire.png",
	wield_image = "army_barbedwire.png",
	paramtype = "light",
	walkable = false,
	damage_per_second = 2,
	groups = {snappy=2},
})

core.register_craft({
	output = "decor:barbedwire 12",
	recipe = {
		{"default:stick"},
		{"default:steel_ingot"}
	}
})

core.register_node("decor:glass_framed_diamond", {
	description = S("Glass - Framed Diamond"),
	drawtype = "glasslike_framed",
	tiles = {"lib_materials_frame_diamond.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:glass_framed_round", {
	description = S("Glass - Framed Round"),
	drawtype = "glasslike_framed",
	tiles = {"lib_materials_frame_round.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:glass_framed_square", {
	description = S("Glass - Framed Square"),
	drawtype = "glasslike_framed",
	tiles = {"lib_materials_frame_square.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:glass_framed_steel_01", {
	description = S("Glass - Framed Steel 01"),
	drawtype = "glasslike_framed",
	tiles = {"lib_materials_frame_steel_01.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:glass_framed_steel_02", {
	description = S("Glass - Framed Steel 02"),
	drawtype = "glasslike_framed",
	tiles = {"lib_materials_frame_steel_02.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:glass_framed_wood_01", {
	description = S("Glass - Framed Wood 01"),
	drawtype = "glasslike_framed",
	tiles = {"lib_materials_frame_wood_01.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:glass_framed_wood_02", {
	description = S("Glass - Framed Wood 02"),
	drawtype = "glasslike_framed",
	tiles = {"lib_materials_frame_wood_02.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:frame_wood_rose", {
	description = S("Frame - Wood Rose"),
	drawtype = "glasslike_framed",
	tiles = {"lib_materials_frame_wood_medieval_rose.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:glass_stained", {
	description = S("Glass - Stained"),
	drawtype = "glasslike_framed",
	tiles = {"lib_materials_glass_stained.png"},
	use_texture_alpha = "blend",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:glass_framed_diamond_milky", {
	description = S("Glass - Framed Diamond Milky"),
	drawtype = "glasslike_framed",
	tiles = {"lib_materials_framed_glass_diamond_milky.png"},
	use_texture_alpha = "blend",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:glass_framed_round_milky", {
	description = S("Glass - Framed Round Milky"),
	drawtype = "glasslike_framed",
	tiles = {"lib_materials_framed_glass_round_milky.png"},
	use_texture_alpha = "blend",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("decor:glass_framed_square_milky", {
	description = S("Glass - Framed Square Milky"),
	drawtype = "glasslike_framed",
	tiles = {"lib_materials_framed_glass_square_milky.png"},
	use_texture_alpha = "blend",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})
