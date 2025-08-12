
local S = homedecor_i18n.gettext

local function N_(x) return x end

core.register_node("decor:skylight", {
	description = S("Glass Skylight"),
	drawtype = "raillike",
	tiles = { "default_glass.png" },
	wield_image = "default_glass.png",
	inventory_image = "homedecor_skylight_inv.png",
	groups = { snappy = 3 },
	paramtype = "light",
	sounds = default.node_sound_glass_defaults(),
	selection_box = homedecor.nodebox.slab_y(0.1),
	--collision_box = homedecor.nodebox.slab_y(0.1),
})

core.register_node("decor:skylight_frosted", {
	description = S("Glass Skylight Frosted"),
	drawtype = "raillike",
	tiles = { "homedecor_skylight_frosted.png" },
	wield_image = "homedecor_skylight_frosted.png",
	inventory_image = "homedecor_skylight_frosted_inv.png",
	use_texture_alpha = "blend",
	groups = { snappy = 3 },
	paramtype = "light",
	sounds = default.node_sound_glass_defaults(),
	selection_box = homedecor.nodebox.slab_y(0.1),
	--collision_box = homedecor.nodebox.slab_y(0.1),
})

for _, s in pairs({ N_("asphalt"), N_("wood") }) do
	core.register_node("decor:shingles_"..s, {
		description = S("Shingles (@1)", S(s)),
		drawtype = "raillike",
		tiles = { "homedecor_shingles_"..s..".png" },
		wield_image = "homedecor_shingles_"..s..".png",
		inventory_image = "homedecor_shingles_"..s.."_inv.png",
		paramtype = "light",
		walkable = false,
		groups = { snappy = 3 },
		sounds = default.node_sound_wood_defaults(),
		selection_box = homedecor.nodebox.slab_y(0.1),
		collision_box = homedecor.nodebox.slab_y(0.1),
	})
end

local slope_cbox = {
	type = "fixed",
	fixed = {
		{-0.5,  -0.5,  -0.5, 0.5, -0.25, 0.5},
		{-0.5, -0.25, -0.25, 0.5,     0, 0.5},
		{-0.5,     0,     0, 0.5,  0.25, 0.5},
		{-0.5,  0.25,  0.25, 0.5,   0.5, 0.5}
	}
}

local ocorner_cbox = {
	type = "fixed",
	fixed = {
		{-0.5,  -0.5,  -0.5,   0.5, -0.25, 0.5},
		{-0.5, -0.25, -0.25,  0.25,     0, 0.5},
		{-0.5,     0,     0,     0,  0.25, 0.5},
		{-0.5,  0.25,  0.25, -0.25,   0.5, 0.5}
	}
}

local icorner_cbox = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5}, -- NodeBox5
		{-0.5, -0.5, -0.25, 0.5, 0, 0.5}, -- NodeBox6
		{-0.5, -0.5, -0.5, 0.25, 0, 0.5}, -- NodeBox7
		{-0.5, 0, -0.5, 0, 0.25, 0.5}, -- NodeBox8
		{-0.5, 0, 0, 0.5, 0.25, 0.5}, -- NodeBox9
		{-0.5, 0.25, 0.25, 0.5, 0.5, 0.5}, -- NodeBox10
		{-0.5, 0.25, -0.5, -0.25, 0.5, 0.5}, -- NodeBox11
	}
}

homedecor.register_outer_corner = function(modname, subname, groups, slope_image, description)
	local tiles = slope_image

	if type(slope_image) ~= "table" then
		tiles = { "homedecor_slope_outer_corner_"..slope_image..".png" }
	end

	core.register_node(modname..":shingle_outer_corner_" .. subname, {
		description = S("@1 (outer corner)", description),
		drawtype = "mesh",
		mesh = "homedecor_slope_outer_corner.obj",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		selection_box = ocorner_cbox,
		collision_box = ocorner_cbox,
		groups = groups,
		on_place = core.rotate_node,
		sounds = default.node_sound_wood_defaults()
	})
end

homedecor.register_inner_corner = function(modname, subname, groups, slope_image, description)
	local tiles = slope_image

	if type(slope_image) ~= "table" then
		tiles = { "homedecor_slope_outer_corner_"..slope_image..".png" }
	end

	core.register_node(modname..":shingle_inner_corner_" .. subname, {
		description = S("@1 (inner corner)", description),
		drawtype = "mesh",
		mesh = "homedecor_slope_inner_corner.obj",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		collision_box = icorner_cbox,
		groups = groups,
		on_place = core.rotate_node,
		sounds = default.node_sound_wood_defaults()
	})
end

homedecor.register_slope = function(modname, subname, recipeitem, groups, slope_image, description)
	local tiles = slope_image

	if type(slope_image) ~= "table" then
		tiles = { "homedecor_slope_outer_corner_"..slope_image..".png" }
	end

	core.register_node(modname..":shingle_side_" .. subname, {
		description = description,
		drawtype = "mesh",
		mesh = "homedecor_slope.obj",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		selection_box = slope_cbox,
		collision_box = slope_cbox,
		groups = groups,
		on_place = core.rotate_node,
		sounds = default.node_sound_wood_defaults()
	})

	-- convert between flat shingles and slopes

	core.register_craft({
		output = modname..":shingle_side_"..subname.." 3",
		recipe = {
			{recipeitem, recipeitem, recipeitem}
		}
	})

	core.register_craft({
		output = recipeitem.." 3",
		recipe = {
			{modname..":shingle_side_"..subname, modname..":shingle_side_"..subname, modname..":shingle_side_"..subname},
		}
	})

	-- craft outer corners

	core.register_craft({
		output = modname..":shingle_outer_corner_"..subname.." 3",
		recipe = {
			{ "", recipeitem, "" },
			{ recipeitem, "", recipeitem }
		}
	})

	core.register_craft({
		output = modname..":shingle_outer_corner_"..subname.." 3",
		recipe = {
			{ "", modname..":shingle_side_"..subname, "" },
			{ modname..":shingle_side_"..subname, "", modname..":shingle_side_"..subname },
		}
	})

	-- craft inner corners

	core.register_craft({
		output = modname..":shingle_inner_corner_"..subname.." 3",
		recipe = {
			{recipeitem, recipeitem},
			{"", recipeitem}
		}
	})

	core.register_craft({
		output = modname..":shingle_inner_corner_"..subname.." 3",
		recipe = {
			{modname..":shingle_side_"..subname, modname..":shingle_side_"..subname},
			{"", modname..":shingle_side_"..subname}
		}
	})
	-- convert between flat shingles and inner/outer corners

	core.register_craft({
		type = "shapeless",
		output = recipeitem.." 1",
		recipe = { modname..":shingle_outer_corner_"..subname }
	})

	core.register_craft({
		type = "shapeless",
		output = recipeitem.." 1",
		recipe = { modname..":shingle_inner_corner_"..subname }
	})
end

core.register_craft( {
	output = "decor:shingle_side_glass",
	recipe = {
		{ "decor:skylight", "decor:skylight", "decor:skylight" }
	}
})

core.register_craft({
	type = "fuel",
	recipe = "decor:shingle_inner_corner_wood",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "decor:shingle_outer_corner_wood",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "decor:shingle_side_wood",
	burntime = 30,
})

homedecor.register_roof = function(modname, subname, groups, slope_image , description)
	homedecor.register_outer_corner(modname, subname, groups, slope_image, description)
	homedecor.register_inner_corner(modname, subname, groups, slope_image, description)
end

-- corners

homedecor.register_roof("decor", "wood",
	{ snappy = 3 },
	{ "homedecor_shingles_wood.png" },
	S("Wood Shingles")
)

homedecor.register_roof("decor", "asphalt",
	{ snappy = 3 },
	{ "homedecor_shingles_asphalt.png" },
	S("Asphalt Shingles")
)

-- register just the slopes

homedecor.register_slope("decor", "wood",
	"decor:shingles_wood",
	{ snappy = 3 },
	{ "homedecor_shingles_wood.png" },
	S("Wood Shingles")
)

homedecor.register_slope("decor", "asphalt",
	"decor:shingles_asphalt",
	{ snappy = 3 },
	{ "homedecor_shingles_asphalt.png" },
	S("Asphalt Shingles")
)


homedecor.register("chimney", {
	description = S("Chimney"),
	mesh = "homedecor_chimney.obj",
	tiles = {
		"homedecor_chimney_tb.png",
		"default_brick.png"
	},
	selection_box = homedecor.nodebox.bar_y(0.25),
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

core.register_abm({
	nodenames = {"decor:plate_soft"},
	neighbors = {"group:water"},
	interval = 50,
	chance = 20,
	action = function(pos)
		if not core.find_node_near(pos, 3, "decor:plate_rusted") then
			core.add_node(pos, {name= "decor:plate_rusted"})
		end
	end,
})

if core.settings:get_bool("creative_mode") and not core.get_modpath("unified_inventory") then
	steel_expect_infinite_stacks = true
else
	steel_expect_infinite_stacks = false
end

function steel_rotate_and_place(itemstack, placer, pointd)

	local node = core.get_node(pointd.under)
	if not core.registered_nodes[node.name] or not core.registered_nodes[node.name].on_rightclick then
		local above = pointd.above
		local under = pointd.under
		local pitch = placer:get_look_pitch()
		local node = core.get_node(above)
		local fdir = core.dir_to_facedir(placer:get_look_dir())
		local wield_name = itemstack:get_name()

		if node.name ~= "air" then return end

		local iswall = (above.x ~= under.x) or (above.z ~= under.z)
		local isceiling = (above.x == under.x) and (above.z == under.z) and (pitch > 0)

		if iswall then 
			local dirs = { 2, 3, 0, 1 }
			core.add_node(above, {name = wield_name.."_wall", param2 = dirs[fdir+1] }) -- place wall variant
		elseif isceiling then
			core.add_node(above, {name = wield_name.."_wall", param2 = 19 }) -- place wall variant on ceiling
		else
			core.add_node(above, {name = wield_name }) -- place regular variant
		end

		if not steel_expect_infinite_stacks then
			itemstack:take_item()
			return itemstack
		end
	else
		core.registered_nodes[node.name].on_rightclick(pointd.under, node, placer, itemstack)
	end
end

core.register_node("decor:plate_soft", {
	description = "Soft steel plate",
	tiles = {"steelplatesoft.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults({
		footstep = {name = "default_weakmetal_footstep", gain= .2},
		dig = {name = "default_dig_metal", gain= .3},
	}),
})

core.register_node("decor:plate_hard", {
	description = "Hardened steel plate",
	tiles = {"steelplatehard.png"},
	groups = {cracky=1},
	sounds = default.node_sound_metal_defaults({
		footstep = {name="default_weakmetal_footstep", gain= .4}
	}),
})

core.register_node("decor:plate_rusted", {
	description = "Rusted steel plate",
	tiles = {"steel_rusted.png"},
	groups = {cracky=1,choppy=1},
	sounds = default.node_sound_metal_defaults({
		footstep = {name="default_weakmetal_footstep", gain= .4}
	}),
})

if core.registered_nodes["streets:steel_support"] then
	core.register_alias("decor:strut","streets:steel_support")
else
	core.register_node("decor:strut", {
		description = "Strut",
		drawtype = "glasslike",
		tiles = {"strut.png"},
		paramtype = "light",
		groups = {choppy=1,cracky=1},
		sounds = default.node_sound_metal_defaults({
			footstep = {name="default_weakmetal_footstep", gain= .4}
		}),
	})
	core.register_alias("streets:steel_support","decor:strut")
end

core.register_node("decor:roofing", {
	description = "Corrugated steel roofing",
	drawtype = "raillike",
	tiles = {"corrugated_steel.png"},
	inventory_image = "corrugated_steel.png",
	wield_image = "corrugated_steel.png",
	paramtype = "light",
	walkable = true,
	selection_box = {
		type = "fixed",
		-- but how to specify the dimensions for curved and sideways rails?
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {bendy=2,snappy=1,dig_immediate=2},
	on_place = function(itemstack, placer, pointd)
		steel_rotate_and_place(itemstack, placer, pointd)
		return itemstack
	end,
	sounds = default.node_sound_metal_defaults({
		footstep = {name="default_weakmetal_footstep", gain= .4}
	})
})

core.register_node("decor:roofing_wall", {
	description = "Corrugated steel wall",
	drawtype = "nodebox",
	tiles = {"corrugated_steel.png"},
	inventory_image = "corrugated_steel.png",
	wield_image = "corrugated_steel.png",
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = {bendy=2,snappy=1,dig_immediate=2, not_in_creative_inventory=1},
	drop = "decor:roofing",
	on_place = function(itemstack, placer, pointd)
		steel_rotate_and_place(itemstack, placer, pointd)
		return itemstack
	end,
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.48, .5, .5, -.48}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, .5, -.4}
	},
	sounds = default.node_sound_metal_defaults({
		footstep = {name="default_weakmetal_footstep", gain= .4}
	})
})

homedecor.register_slope("decor", "roofing", 
	"decor:roofing", 
	{bendy=2,snappy=1,dig_immediate=2}, 
	{"corrugated_steel.png"}, 
	"Corrugated steel roofing"
)

homedecor.register_roof("decor", "roofing", 
	{bendy=2,snappy=1,dig_immediate=2}, 
	{"corrugated_steel.png"}, 
	"Corrugated steel roofing"
)

	--steel scrap are only used to recover ingots

core.register_craftitem("decor:scrap", {
	description = "Steel scraps",
	inventory_image = "scrap.png",
})

	--recipes

core.register_craft({
	output = 'decor:plate_soft 2',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot'},
	}
})

core.register_craft({
	type = "cooking",
	output = "decor:plate_hard",
	recipe = "decor:plate_soft",
})

-- only register this craft if streets is not loaded
if not core.registered_nodes["streets:steel_support"] then
	core.register_craft({
		output = 'decor:strut 5',
		recipe = {
			{'default:steel_ingot', '', 'default:steel_ingot'},
			{'', 'default:steel_ingot', ''},
			{'default:steel_ingot', '', 'default:steel_ingot'}
		}
	})
end

core.register_craft({
	output = 'decor:roofing 6',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'}
	}
})
	--remelting recipes

core.register_craft({
	output = 'decor:scrap 2',
	recipe = {
		{'decor:strut'}
	}
})

core.register_craft({
	output = 'decor:scrap',
	recipe = {
		{'decor:roofing'}
	}
})

core.register_craft({
	output = 'decor:scrap 4',
	recipe = {
		{'decor:plate_soft'}
	}
})

core.register_craft({
	output = 'decor:scrap 4',
	recipe = {
		{'decor:plate_hard'}
	}
})

core.register_craft({
	output = 'default:iron_lump',
	recipe = {
		{'decor:scrap', 'decor:scrap'}
	}
})
