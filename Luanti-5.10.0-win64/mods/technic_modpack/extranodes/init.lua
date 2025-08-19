-- Luanti mod: extranodes
-- namespace: technic
-- Boilerplate to support localized strings if intllib mod is installed.
local S = rawget(_G, "intllib") and intllib.Getter() or function(s) return s end

local iclip_def = {
	description = S("Insulator/cable clip"),
	drawtype = "mesh",
	mesh = "technic_insulator_clip.obj",
	tiles = {"technic_insulator_clip.png"},
	is_ground_content = false,
	groups = {choppy=1, snappy=1, oddly_breakable_by_hand=1 },
	sounds = default.node_sound_stone_defaults(),
}

local iclipfence_def = {
	description = S("Insulator/cable clip"),
	tiles = {"technic_insulator_clip.png"},
	is_ground_content = false,
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "connected",
		fixed = {
			{ -.25,   .75,   -.25,   .25,   1.25,   .25   }, -- the clip on top
			{ -.125, .6875, -.125, .125, .75,   .125 },
			{ -.1875,  .625,  -.1875,  .1875,  .6875, .1875  },
			{ -.125, .5625, -.125, .125, .625,  .125 },
			{ -.1875,  .5,    -.1875,  .1875,  .5625, .1875  },
			{ -.125, .4375, -.125, .125, .5,    .125 },
			{ -.1875,  .375,  -.1875,  .1875,  .4375, .1875  },
			{ -.125, -.5,    -.125,  .125,  .375,  .125  }, -- the post, slightly short
		},
		-- connect_top =
		-- connect_bottom =
		connect_front = {{-1/16,3/16,-1/2,1/16,5/16,-1/8},
			{-1/16,-5/16,-1/2,1/16,-3/16,-1/8}},
		connect_left = {{-1/2,3/16,-1/16,-1/8,5/16,1/16},
			{-1/2,-5/16,-1/16,-1/8,-3/16,1/16}},
		connect_back = {{-1/16,3/16,1/8,1/16,5/16,1/2},
			{-1/16,-5/16,1/8,1/16,-3/16,1/2}},
		connect_right = {{1/8,3/16,-1/16,1/2,5/16,1/16},
			{1/8,-5/16,-1/16,1/2,-3/16,1/16}},
	},
	connects_to = {"group:fence", "group:wood", "group:trunk"},
	groups = {fence=1, choppy=1, snappy=1, oddly_breakable_by_hand=1 },
	sounds = default.node_sound_stone_defaults(),
}

local sclip_tex = {
	"technic_insulator_clip.png",
	{ name = "strut.png^steel_strut_overlay.png", color = "white" },
	{ name = "strut.png", color = "white" }
}

local streetsmod = core.get_modpath("streets") or core.get_modpath("steelsupport")
-- cheapie's fork breaks it into several individual mods, with differernt names for the same content.

if streetsmod then
	sclip_tex = {
		"technic_insulator_clip.png",
		{ name = "streets_support.png^technic_steel_strut_overlay.png", color = "white" },
		{ name = "streets_support.png", color = "white" }
	}
end

local sclip_def = {
	description = S("Steel strut with insulator/cable clip"),
	drawtype = "mesh",
	mesh = "technic_steel_strut_with_insulator_clip.obj",
	tiles = sclip_tex,
	paramtype = "light",
	paramtype2 = "wallmounted",
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = { choppy=1, cracky=1 },
	backface_culling = false
}

if core.get_modpath("unif	ieddyes") then
	iclip_def.paramtype2 = "colorwallmounted"
	iclip_def.palette = "unifieddyes_palette_colorwallmounted.png"
	iclip_def.after_place_node = function(pos, placer, itemstack, pointd)
		unifieddyes.fix_rotation(pos, placer, itemstack, pointd)
	end
	iclip_def.groups = {choppy=1, snappy=1, oddly_breakable_by_hand=1, ud_param2_colorable = 1}

	iclipfence_def.paramtype2 = "color"
	iclipfence_def.palette = "unifieddyes_palette_extended.png"
	iclipfence_def.on_construct = unifieddyes.on_construct
	iclipfence_def.groups = {fence=1, choppy=1, snappy=1, oddly_breakable_by_hand=1, ud_param2_colorable = 1}

	sclip_def.paramtype2 = "colorwallmounted"
	sclip_def.palette = "unifieddyes_palette_colorwallmounted.png"
	sclip_def.after_place_node = function(pos, placer, itemstack, pointd)
		unifieddyes.fix_rotation(pos, placer, itemstack, pointd)
	end
	sclip_def.groups = {choppy=1, cracky=1, ud_param2_colorable = 1}
end

core.register_node(":technic:insulator_clip", iclip_def)
core.register_node(":technic:insulator_clip_fencepost", iclipfence_def)

core.register_craft({
	output = "technic:insulator_clip",
	recipe = {
		{ "", "dye:white", ""},
		{ "", "technic:raw_latex", ""},
		{ "technic:raw_latex", "default:stone", "technic:raw_latex"},
	}
})

core.register_craft({
	output = "technic:insulator_clip_fencepost 2",
	recipe = {
		{ "", "dye:white", ""},
		{ "", "technic:raw_latex", ""},
		{ "technic:raw_latex", "default:fence_wood", "technic:raw_latex"},
	}
})

local steelmod = core.get_modpath("steel")

if streetsmod or steelmod then
	core.register_node(":technic:steel_strut_with_insulator_clip", sclip_def)

	if steelmod then
		core.register_craft({
			output = "technic:steel_strut_with_insulator_clip",
			recipe = {
				{"technic:insulator_clip_fencepost"},
				{"steel:strut_mount"}
			}
		})

		core.register_craft({
			output = "technic:steel_strut_with_insulator_clip",
			recipe = {
				{"technic:insulator_clip_fencepost", ""},
				{"steel:strut", "default:steel_ingot"}
			}
		})

	elseif streetsmod then
		core.register_craft({
			output = "technic:steel_strut_with_insulator_clip",
			recipe = {
				{"technic:insulator_clip_fencepost", ""},
				{"streets:steel_support", "default:steel_ingot"}
			}
		})
	end
end

if core.get_modpath("unif	ieddyes") then

	unifieddyes.register_color_craft({
		output = "technic:insulator_clip_fencepost",
		palette = "extended",
		type = "shapeless",
		neutral_node = "technic:insulator_clip_fencepost",
		recipe = {
			"NEUTRAL_NODE",
			"MAIN_DYE"
		}
	})

	unifieddyes.register_color_craft({
		output = "technic:insulator_clip",
		palette = "wallmounted",
		type = "shapeless",
		neutral_node = "technic:insulator_clip",
		recipe = {
			"NEUTRAL_NODE",
			"MAIN_DYE"
		}
	})

	unifieddyes.register_color_craft({
		output = "technic:steel_strut_with_insulator_clip",
		palette = "wallmounted",
		type = "shapeless",
		neutral_node = "",
		recipe = {
			"technic:steel_strut_with_insulator_clip",
			"MAIN_DYE"
		}
	})

	if steelmod then
		unifieddyes.register_color_craft({
			output = "technic:steel_strut_with_insulator_clip",
			palette = "wallmounted",
			neutral_node = "",
			recipe = {
				{ "technic:insulator_clip_fencepost", "MAIN_DYE"},
				{ "steel:strut_mount", ""}
			}
		})
	end

	if streetsmod then
		unifieddyes.register_color_craft({
			output = "technic:steel_strut_with_insulator_clip",
			palette = "wallmounted",
			neutral_node = "technic:steel_strut_with_insulator_clip",
			recipe = {
				{ "technic:insulator_clip_fencepost", "MAIN_DYE"},
				{ "streets:steel_support", "default:steel_ingot"}
			}
		})
	end
end
