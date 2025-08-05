-- beds/beds.lua

-- support for MT game translation.
local S = beds.get_translator

-- Fancy shaped bed

beds.register_bed("beds:fancy_bed", {
	description = S("Fancy Bed"),
	inventory_image = "beds_bed_fancy.png",
	wield_image = "beds_bed_fancy.png",
	tiles = {
		bottom = {
			"beds_bed_top1.png",
			"beds_bed_under.png",
			"beds_bed_side1.png",
			"beds_bed_side1.png^[transformFX",
			"beds_bed_foot.png",
			"beds_bed_foot.png"
		},
		top = {
			"beds_bed_top2.png",
			"beds_bed_under.png",
			"beds_bed_side2.png",
			"beds_bed_side2.png^[transformFX",
			"beds_bed_head.png",
			"beds_bed_head.png"
		}
	},
	nodebox = {
		bottom = {
			{-.5, -.5, -.5, -.375, -.065, -.4375},
			{.375, -.5, -.5, .5, -.065, -.4375},
			{-.5, -.375, -.5, .5, -.125, -.4375},
			{-.5, -.375, -.5, -.4375, -.125, .5},
			{.4375, -.375, -.5, .5, -.125, .5},
			{-.4375, -.3125, -.4375, .4375, -.0625, .5},
		},
		top = {
			{-.5, -.5, .4375, -.375, .1875, .5},
			{.375, -.5, .4375, .5, .1875, .5},
			{-.5, 0, .4375, .5, .125, .5},
			{-.5, -.375, .4375, .5, -.125, .5},
			{-.5, -.375, -.5, -.4375, -.125, .5},
			{.4375, -.375, -.5, .5, -.125, .5},
			{-.4375, -.3125, -.5, .4375, -.0625, .4375},
		}
	},
	selectionbox = {-.5, -.5, -.5, .5, .06, 1.5},
	recipe = {
		{"", "group:stick"},
		{"fabric:sheet_white", "fabric:block_white"},
		{"", "group:wood"}
	},
})

-- Simple shaped bed

beds.register_bed("beds:bed", {
	description = S("Simple Bed"),
	inventory_image = "beds_bed.png",
	wield_image = "beds_bed.png",
	tiles = {
		bottom = {
			"beds_bed_top_bottom.png^[transformR90",
			"beds_bed_under.png",
			"beds_bed_side_bottom_r.png",
			"beds_bed_side_bottom_r.png^[transformFX",
			"blank.png",
			"beds_bed_side_bottom.png"
		},
		top = {
			"beds_bed_top_top.png^[transformR90",
			"beds_bed_under.png",
			"beds_bed_side_top_r.png",
			"beds_bed_side_top_r.png^[transformFX",
			"beds_bed_side_top.png",
			"blank.png"
		}
	},
	nodebox = {
		bottom = {-.5, -.5, -.5, .5, .0625, .5},
		top = {-.5, -.5, -.5, .5, .0625, .5},
	},
	selectionbox = {-.5, -.5, -.5, .5, .0625, 1.5},
	recipe = {
		{"fabric:sheet_white", "fabric:block_white"},
		{"", "group:wood"}
	},
})

-- Aliases for PilzAdam's beds mod

core.register_alias("beds:bed_bottom_red", "beds:bed_bottom")
core.register_alias("beds:bed_top_red", "beds:bed_top")

-- Fuel

core.register_craft({
	type = "fuel",
	recipe = "beds:fancy_bed_bottom",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_bottom",
	burntime = 12,
})

beds.register_bed("beds:primitive_bed", {
	description = "Primitive Bed",
	inventory_image = "beds_primitive_bed.png",
	wield_image = "beds_primitive_bed.png",
	tiles = {
		bottom = {
			"beds_primitive_top.png^[transformR90",
			"beds_bed_under.png",
			"beds_primitive_side.png",
			"beds_primitive_side.png^[transformfx",
			"blank.png",
			"beds_primitive_side.png"
		},
		top = {
			"beds_primitive_top.png^[transformR90",
			"beds_bed_under.png",
			"beds_primitive_side.png",
			"beds_primitive_side.png^[transformfx",
			"beds_primitive_side.png",
			"blank.png"
		}
	},
	nodebox = {
		bottom = {-.5, -.5, -.5, .5, .0625, .5},
		top = {-.5, -.5, -.5, .5, .0625, .5},
	},
	selectionbox = {-.5, -.5, -.5, .5, .0625, 1.5},
	recipe = {
		{"default:jungle_grass_1", "default:reed_block_dry"},
		{"", "default:wood"}
	},
	sounds = default.node_sound_wood_defaults({
		footstep = {name = "default_grass_footstep", gain = .45},
		dug = {name = "default_grass_footstep", gain = .7},
	})
})

core.register_craft({
	type = "fuel",
	recipe = "beds:primitive_bed_bottom",
	burntime = 12,
})

if core.get_modpath("decor_beds") then
beds.register_bed("beds:blue_bed", {
	description = S("Simple Bed Blue"),
	inventory_image = "beds_blue_bed.png",
	wield_image = "beds_blue_bed.png",
	tiles = {
		bottom = {
			"beds_blue_bed_top_bottom.png^[transformR90",
			"beds_bed_under.png",
			"beds_blue_bed_side_bottom_r.png",
			"beds_blue_bed_side_bottom_r.png^[transformfx",
			"blank.png",
			"beds_blue_bed_side_bottom.png"
		},
		top = {
			"beds_blue_bed_top_top.png^[transformR90",
			"beds_bed_under.png",
			"beds_blue_bed_side_top_r.png",
			"beds_blue_bed_side_top_r.png^[transformfx",
			"beds_blue_bed_side_top.png",
			"blank.png"
		}
	},
	nodebox = {
		bottom = {-.5, -.5, -.5, .5, .0625, .5},
		top = {-.5, -.5, -.5, .5, .0625, .5},
	},
	selectionbox = {-.5, -.5, -.5, .5, .0625, 1.5},
	recipe = {
		{"fabric:sheet_blue", "fabric:block_white"},
		{"", "group:wood"}
	},
})

beds.register_bed("beds:green_bed", {
	description = S("Simple Bed Green"),
	inventory_image = "beds_bed_g.png",
	wield_image = "beds_bed_g.png",
	tiles = {
		bottom = {
			"beds_bed_top_bottom_g.png^[transformR90",
			"beds_bed_under.png",
			"beds_bed_side_bottom_r_g.png",
			"beds_bed_side_bottom_r_g.png^[transformfx",
			"blank.png",
			"beds_bed_side_bottom_g.png"
		},
		top = {
			"beds_bed_top_top_g.png^[transformR90",
			"beds_bed_under.png",
			"beds_bed_side_top_r_g.png",
			"beds_bed_side_top_r_g.png^[transformfx",
			"beds_bed_side_top_g.png",
			"blank.png"
		}
	},
	nodebox = {
		bottom = {-.5, -.5, -.5, .5, .0625, .5},
		top = {-.5, -.5, -.5, .5, .0625, .5},
	},
	selectionbox = {-.5, -.5, -.5, .5, .0625, 1.5},
	recipe = {
		{"fabric:sheet_dark_green", "fabric:block_white"},
		{"", "group:wood"}
	},
})

beds.register_bed("beds:green_fancy_bed", {
	description = S("Fancy Bed Green"),
	inventory_image = "beds_bed_fancy_g.png",
	wield_image = "beds_bed_fancy_g.png",
	tiles = {
		bottom = {
			"beds_bed_top1_g.png",
			"beds_bed_under.png",
			"beds_bed_side1_g.png",
			"beds_bed_side1_g.png^[transformFX",
			"beds_bed_foot_g.png",
			"beds_bed_foot_g.png"
		},
		top = {
			"beds_bed_top2_g.png",
			"beds_bed_under.png",
			"beds_bed_side2_g.png",
			"beds_bed_side2_g.png^[transformFX",
			"beds_bed_head_g.png",
			"beds_bed_head_g.png"
		}
	},
	nodebox = {
		bottom = {
			{-.5, -.5, -.5, -.375, -.065, -.4375},
			{.375, -.5, -.5, .5, -.065, -.4375},
			{-.5, -.375, -.5, .5, -.125, -.4375},
			{-.5, -.375, -.5, -.4375, -.125, .5},
			{.4375, -.375, -.5, .5, -.125, .5},
			{-.4375, -.3125, -.4375, .4375, -.0625, .5},
		},
		top = {
			{-.5, -.5, .4375, -.375, .1875, .5},
			{.375, -.5, .4375, .5, .1875, .5},
			{-.5, 0, .4375, .5, .125, .5},
			{-.5, -.375, .4375, .5, -.125, .5},
			{-.5, -.375, -.5, -.4375, -.125, .5},
			{.4375, -.375, -.5, .5, -.125, .5},
			{-.4375, -.3125, -.5, .4375, -.0625, .4375},
		}
	},
	selectionbox = {-.5, -.5, -.5, .5, .06, 1.5},
	recipe = {
		{"", "group:stick"},
		{"fabric:sheet_dark_green", "fabric:block_white"},
		{"", "group:wood"}
	},
})

core.register_craft({
	type = "fuel",
	recipe = "beds:blue_bed_bottom",
	burntime = 12,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:green_fancy_bed_bottom",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:green_bed_bottom",
	burntime = 12,
})

beds.register_decor_bed("beds:bed_black", {
	description = "Black Bed",
	inventory_image = "beds_black.png",
	wield_image = "beds_black.png",
	tiles = {"beds_bed_black.png"},
	recipe = {
		{"fabric:sheet_black", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

beds.register_decor_bed("beds:bed_blue", {
	description = "Blue Bed",
	inventory_image = "beds_blue.png",
	wield_image = "beds_blue.png",
	tiles = {"beds_bed_blue.png"},
	recipe = {
		{"fabric:sheet_blue", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

beds.register_decor_bed("beds:bed_brown", {
	description = "Brown Bed",
	inventory_image = "beds_brown.png",
	wield_image = "beds_brown.png",
	tiles = {"beds_bed_brown.png"},
	recipe = {
		{"fabric:sheet_brown", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

beds.register_decor_bed("beds:bed_cyan", {
	description = "Cyan Bed",
	inventory_image = "beds_cyan.png",
	wield_image = "beds_cyan.png",
	tiles = {"beds_bed_cyan.png"},
	recipe = {
		{"fabric:sheet_cyan", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

beds.register_decor_bed("beds:bed_dark_green", {
	description = "Dark Green Bed",
	inventory_image = "beds_darkgreen.png",
	wield_image = "beds_darkgreen.png",
	tiles = {"beds_bed_darkgreen.png"},
	recipe = {
		{"fabric:sheet_dark_green", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

beds.register_decor_bed("beds:bed_dark_grey", {
	description = "Dark Grey Bed",
	inventory_image = "beds_darkgrey.png",
	wield_image = "beds_darkgrey.png",
	tiles = {"beds_bed_darkgrey.png"},
	recipe = {
		{"fabric:sheet_dark_grey", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

beds.register_decor_bed("beds:bed_green", {
	description = "Green Bed",
	inventory_image = "beds_green.png",
	wield_image = "beds_green.png",
	tiles = {"beds_bed_green.png"},
	recipe = {
		{"fabric:sheet_green", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

beds.register_decor_bed("beds:bed_grey", {
	description = "Grey Bed",
	inventory_image = "beds_grey.png",
	wield_image = "beds_grey.png",
	tiles = {"beds_bed_grey.png"},
	recipe = {
		{"fabric:sheet_grey", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

beds.register_decor_bed("beds:bed_light_blue", {
	description = "Light Blue Bed",
	inventory_image = "beds_lightblue.png",
	wield_image = "beds_lightblue.png",
	tiles = {"beds_bed_lightblue.png"},
	recipe = {
		{"fabric:sheet_light_blue", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

beds.register_decor_bed("beds:bed_magenta", {
	description = "Magenta Bed",
	inventory_image = "beds_magenta.png",
	wield_image = "beds_magenta.png",
	tiles = {"beds_bed_magenta.png"},
	recipe = {
		{"fabric:sheet_magenta", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

beds.register_decor_bed("beds:bed_orange", {
	description = "Orange Bed",
	inventory_image = "beds_orange.png",
	wield_image = "beds_orange.png",
	tiles = {"beds_bed_orange.png"},
	recipe = {
		{"fabric:sheet_orange", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

beds.register_decor_bed("beds:bed_pink", {
	description = "Pink Bed",
	inventory_image = "beds_pink.png",
	wield_image = "beds_pink.png",
	tiles = {"beds_bed_pink.png"},
	recipe = {
		{"fabric:sheet_pink", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

beds.register_decor_bed("beds:bed_purple", {
	description = "Purple Bed",
	inventory_image = "beds_purple.png",
	wield_image = "beds_purple.png",
	tiles = {"beds_bed_purple.png"},
	recipe = {
		{"fabric:sheet_violet", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

beds.register_decor_bed("beds:bed_red", {
	description = "Red Bed",
	inventory_image = "beds_red.png",
	wield_image = "beds_red.png",
	tiles = {"beds_bed_red.png"},
	recipe = {
		{"fabric:sheet_red", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

beds.register_decor_bed("beds:bed_white", {
	description = "White Bed",
	inventory_image = "beds_white.png",
	wield_image = "beds_white.png",
	tiles = {"beds_bed_white.png"},
	recipe = {
		{"fabric:sheet_white", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

beds.register_decor_bed("beds:bed_yellow", {
	description = "Yellow Bed",
	inventory_image = "beds_yellow.png",
	wield_image = "beds_yellow.png",
	tiles = {"beds_bed_yellow.png"},
	recipe = {
		{"fabric:sheet_yellow", "fabric:block_white"},
		{"group:stick", "group:wood"}
	}
})

-- Fuel

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_black",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_blue",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_brown",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_cyan",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_dark_green",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_dark_grey",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_green",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_grey",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_light_blue",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_magenta",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_orange",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_pink",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_purple",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_red",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_white",
	burntime = 13,
})

core.register_craft({
	type = "fuel",
	recipe = "beds:bed_yellow",
	burntime = 13,
})
end
