--[[
More Blocks: Stairs+

Copyright © 2011-2019 Hugo Locurcio and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
--]]

-- Nodes will be called <modname>:{stair,slab,panel,micro,slope}_<subname>

local modpath = core.get_modpath("moreblocks").. "/stairsplus"

stairsplus = {}
stairsplus.expect_infinite_stacks = false

stairsplus.shapes_list = {}

if not core.get_modpath("unified_inventory")
	and core.settings:get_bool("creative_mode") then
	stairsplus.expect_infinite_stacks = true
end

function stairsplus:prepare_groups(groups)
	local result = {}
	if groups then
		for k, v in pairs(groups) do
			if k ~= "wood" and k ~= "stone" then
				result[k] = v
			end
		end
	end
	if not moreblocks.config.stairsplus_in_creative_inventory then
		result.not_in_creative_inventory = 1
	end
	return result
end

function stairsplus:register_all(modname, subname, recipeitem, fields)
	self:register_stair(modname, subname, recipeitem, fields)
	self:register_slab(modname, subname, recipeitem, fields)
	self:register_slope(modname, subname, recipeitem, fields)
	self:register_panel(modname, subname, recipeitem, fields)
	self:register_micro(modname, subname, recipeitem, fields)

	core.register_craft({
		type = "shapeless",
		output = "stairs:slab_" .. subname,
		recipe = {modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname},
	})
	-- uncomment this rule when conflict is no longer likely to happen
	--	https://github.com/minetest/minetest/issues/2881
	-- core.register_craft({
	--	type = "shapeless",
	--	output = "stairs:slab_" .. subname,
	--	recipe = {modname .. ":panel_" .. subname, modname .. ":panel_" .. subname},
	-- })

	-- then remove these two
	core.register_craft({
		output = "stairs:slab_" .. subname,
		recipe = {{modname .. ":panel_" .. subname, modname .. ":panel_" .. subname}},
	})

	core.register_craft({
		output = "stairs:slab_" .. subname,
		recipe = {
			{modname .. ":panel_" .. subname},
			{modname .. ":panel_" .. subname}
		}
	})
	------------------------------

	core.register_craft({
		type = "shapeless",
		output = "stairs:slab_" .. subname .. " 3",
		recipe = {"stairs:stair_" .. subname, "stairs:stair_" .. subname},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:slab_" .. subname,
		recipe = {modname .. ":slab_" .. subname .. "_quarter", modname .. ":slab_" .. subname .. "_quarter"},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:slab_" .. subname,
		recipe = {modname .. ":slab_" .. subname .. "_quarter_centered", modname .. ":slab_" .. subname .. "_quarter_centered"},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:slab_" .. subname,
		recipe = {modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2", modname .. ":slab_" .. subname .. "_2"},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:slab_" .. subname,
		recipe = {modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered", modname .. ":slab_" .. subname .. "_2_centered"},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:slab_" .. subname,
		recipe = {modname .. ":slab_" .. subname .. "_1", modname .. ":slab_" .. subname .. "_1", modname .. ":slab_" .. subname .. "_1", modname .. ":slab_" .. subname .. "_1", modname .. ":slab_" .. subname .. "_1", modname .. ":slab_" .. subname .. "_1", modname .. ":slab_" .. subname .. "_1", modname .. ":slab_" .. subname .. "_1"},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:slab_" .. subname,
		recipe = {modname .. ":slope_" .. subname .. "_half", modname .. ":slope_" .. subname .. "_half"},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:slab_" .. subname,
		recipe = {modname .. ":slope_" .. subname .. "_outer_half", modname .. ":slope_" .. subname .. "_inner_half"},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:slab_" .. subname,
		recipe = {modname .. ":slope_" .. subname .. "_outer_cut_half", modname .. ":slope_" .. subname .. "_inner_cut_half"},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:stair_" .. subname,
		recipe = {modname .. ":panel_" .. subname, "stairs:slab_" .. subname},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:stair_" .. subname,
		recipe = {modname .. ":panel_" .. subname, modname .. ":slab_" .. subname .. "_centered"},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:stair_" .. subname,
		recipe = {modname .. ":panel_" .. subname, modname .. ":panel_" .. subname, modname .. ":panel_" .. subname},
	})

	core.register_craft({
		type = "shapeless",
		output = recipeitem,
		recipe = {modname .. ":panel_" .. subname .. "_narrow", modname .. ":panel_" .. subname .. "_narrow", modname .. ":panel_" .. subname .. "_narrow", modname .. ":panel_" .. subname .. "_narrow", modname .. ":panel_" .. subname .. "_narrow", modname .. ":panel_" .. subname .. "_narrow", modname .. ":panel_" .. subname .. "_narrow", modname .. ":panel_" .. subname .. "_narrow", modname .. ":panel_" .. subname .. "_narrow"},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:stair_" .. subname,
		recipe = {modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:stair_inner_" .. subname,
		recipe = {modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:stair_outer_" .. subname,
		recipe = {modname .. ":micro_" .. subname, "stairs:slab_" .. subname},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:stair_outer_" .. subname,
		recipe = {modname .. ":micro_" .. subname, modname .. ":slab_" .. subname .. "_centered"},
	})

	core.register_craft({
		type = "shapeless",
		output = "stairs:stair_outer_" .. subname,
		recipe = {modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname, modname .. ":micro_" .. subname},
	})

	core.register_craft({
		output = modname .. ":slab_" .. subname .. "_2_centered 2",
		recipe = {
			{modname .. ":slab_" .. subname .. "_2"},
			{""},
			{modname .. ":slab_" .. subname .. "_2"}
		}
	})
	core.register_craft({
		output = modname .. ":slab_" .. subname .. "_centered 2",
		recipe = {
			{"stairs:slab_" .. subname},
			{""},
			{"stairs:slab_" .. subname}
		}
	})
	core.register_craft({
		output = "stairs:slab_" .. subname .. " 2",
		recipe = {
			{modname .. ":slab_" .. subname .. "_centered"},
			{""},
			{modname .. ":slab_" .. subname .. "_centered"}
		}
	})
	core.register_craft({
		output = recipeitem,
		recipe = {
			{modname .. ":slab_" .. subname .. "_centered", modname .. ":slab_" .. subname .. "_centered"}
		}
	})
	core.register_craft({
		output = modname .. ":slab_" .. subname .. "_quarter_centered 2",
		recipe = {
			{modname .. ":slab_" .. subname .. "_quarter"},
			{""},
			{modname .. ":slab_" .. subname .. "_quarter"}
		}
	})
	core.register_craft({
		output = modname .. ":slab_" .. subname .. "_three_quarter_centered 2",
		recipe = {
			{modname .. ":slab_" .. subname .. "_three_quarter"},
			{""},
			{modname .. ":slab_" .. subname .. "_three_quarter"}
		}
	})
end

function stairsplus:register_alias_all(modname_old, subname_old, modname_new, subname_new)
	self:register_stair_alias(modname_old, subname_old, modname_new, subname_new)
	self:register_slab_alias(modname_old, subname_old, modname_new, subname_new)
	self:register_slope_alias(modname_old, subname_old, modname_new, subname_new)
	self:register_panel_alias(modname_old, subname_old, modname_new, subname_new)
	self:register_micro_alias(modname_old, subname_old, modname_new, subname_new)
end
function stairsplus:register_alias_force_all(modname_old, subname_old, modname_new, subname_new)
	self:register_stair_alias_force(modname_old, subname_old, modname_new, subname_new)
	self:register_slab_alias_force(modname_old, subname_old, modname_new, subname_new)
	self:register_slope_alias_force(modname_old, subname_old, modname_new, subname_new)
	self:register_panel_alias_force(modname_old, subname_old, modname_new, subname_new)
	self:register_micro_alias_force(modname_old, subname_old, modname_new, subname_new)
end

-- luacheck: no unused
local function register_stair_slab_panel_micro(modname, subname, recipeitem, groups, images, description, drop, light)
	stairsplus:register_all(modname, subname, recipeitem, {
		groups = groups,
		tiles = images,
		description = description,
		drop = drop,
		light_source = light
	})
end

dofile(modpath .. "/defs.lua")
dofile(modpath .. "/recipes.lua")
dofile(modpath .. "/common.lua")
dofile(modpath .. "/stairs.lua")
dofile(modpath .. "/slabs.lua")
dofile(modpath .. "/slopes.lua")
dofile(modpath .. "/panels.lua")
dofile(modpath .. "/microblocks.lua")
dofile(modpath .. "/custom.lua")
dofile(modpath .. "/registrations.lua")
