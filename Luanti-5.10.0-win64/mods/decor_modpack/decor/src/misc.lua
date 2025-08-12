
local S = homedecor_i18n.gettext

local function N_(x) return x end

local rug_types = {
	{ N_("large"),   homedecor.box.slab_y(0.0625) },
	{ N_("persian"), homedecor.box.slab_y(0.0625) },
}

for _, rt in ipairs(rug_types) do
	local s, m = unpack(rt)

	local mesh = m
	local nodebox = nil
	local tiles = { "homedecor_rug_"..s..".png", "fabric_block_grey.png" }

	if type(m) == "table" then
		mesh = nil
		nodebox = {
			type = "fixed",
			fixed = m
		}
		tiles = {
			"homedecor_rug_"..s..".png",
			"fabric_block_grey.png",
			"homedecor_rug_"..s..".png"
		}
	end

	homedecor.register("rug_"..s, {
		description = S("Rug (@1)", S(s)),
		mesh = mesh,
		tiles = tiles,
		node_box = nodebox,
		paramtype2 = "wallmounted",
		walkable = false,
		groups = {snappy = 3},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = { type = "wallmounted" },
	})
end

local pot_colors = { N_("black"), N_("green"), N_("terracotta") }

for _, p in ipairs(pot_colors) do
homedecor.register("flower_pot_"..p, {
	description = S("Flower Pot (@1)", S(p)),
	mesh = "homedecor_flowerpot.obj",
	visual_scale = 1.14,
	tiles = {"homedecor_flower_pot_"..p..".png", {name = "default_dirt.png", color = 0xff505050}},
	groups = {snappy = 3, potting_soil = 1},
	sounds = default.node_sound_stone_defaults(),
})
end

homedecor.register("pole_brass", {
    description = S("Brass Pole"),
	mesh = "homedecor_round_pole.obj",
    tiles = {"basic_materials_chain_brass.png^homedecor_generic_metal_lines_overlay.png",},
    inventory_image = "homedecor_pole_brass_inv.png",
    wield_image = "homedecor_pole_brass_inv.png",
    selection_box = {
            type = "fixed",
            fixed = { -0.125, -0.5, -0.125, 0.125, 0.5, 0.125 },
    },
    collision_box = {
            type = "fixed",
            fixed = { -0.125, -0.5, -0.125, 0.125, 0.5, 0.125 },
    },
    groups = {snappy=3},
    sounds = default.node_sound_metal_defaults(),
})

homedecor.register("pole_wrought_iron", {
    description = S("Wrought Iron Pole"),
    tiles = { "homedecor_generic_metal_wrought_iron.png^homedecor_generic_metal_lines_overlay.png" },
    inventory_image = "homedecor_pole_wrought_iron_inv.png",
    wield_image = "homedecor_pole_wrought_iron_inv.png",
    selection_box = {
            type = "fixed",
            fixed = {-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}
    },
	node_box = {
		type = "fixed",
                fixed = {-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}
	},
    groups = {snappy=3},
    sounds = default.node_sound_stone_defaults(),
})

local pooltable_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.5, 0.5, 0.3125, 1.5 }
}

homedecor.register("pool_table", {
	mesh = "homedecor_pool_table.obj",
	tiles = {
		"homedecor_pool_table_cue.png",
		"homedecor_pool_table_baize.png",
		"homedecor_pool_table_pockets.png",
		"homedecor_pool_table_balls.png",
		homedecor.lux_wood,
	},
	description = S("Pool Table"),
	inventory_image = "homedecor_pool_table_inv.png",
	groups = {snappy=3},
	selection_box = pooltable_cbox,
	collision_box = pooltable_cbox,
	expand = { forward="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	on_rotate = screwdriver.disallow
})

local piano_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.125, 1.5, 0.5, 0.5 }
}

homedecor.register("piano", {
	mesh = "homedecor_piano.obj",
	tiles = {
		{ name = "homedecor_generic_wood_luxury.png", color = homedecor.color_black },
		"homedecor_piano_keys.png",
		"basic_materials_chain_brass.png",
	},
	inventory_image = "homedecor_piano_inv.png",
	description = S("Piano"),
	groups = { snappy = 3 },
	selection_box = piano_cbox,
	collision_box = piano_cbox,
	expand = { right="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	on_rotate = screwdriver.disallow
})

local pframe_cbox = {
	type = "fixed",
	fixed = { -0.18, -0.5, -0.08, 0.18, -0.08, 0.18 }
}
local n = { 1, 2 }

for _, i in ipairs(n) do
	homedecor.register("picture_frame"..i, {
		description = S("Picture Frame "..i),
		mesh = "homedecor_picture_frame.obj",
		tiles = {
			"homedecor_picture_frame_image"..i..".png",
			homedecor.lux_wood,
			"homedecor_picture_frame_back.png",
		},
		inventory_image = "homedecor_picture_frame"..i.."_inv.png",
		wield_image = "homedecor_picture_frame"..i.."_inv.png",
		groups = {snappy = 3},
		selection_box = pframe_cbox,
		walkable = false,
		sounds = default.node_sound_glass_defaults()
	})
end

local p_cbox = {
	type = "fixed",
	fixed = {
		{ -0.5, -0.5, 0.4375, 0.5, 0.5, 0.5 }
	}
}

for i = 1,20 do
	homedecor.register("painting_"..i, {
		description = S("Decorative painting #@1", i),
		mesh = "homedecor_painting.obj",
		tiles = {
			"default_wood.png",
			"homedecor_blank_canvas.png",
			"homedecor_painting"..i..".png"
		},
		selection_box = p_cbox,
		walkable = false,
		groups = {snappy=3},
		sounds = default.node_sound_wood_defaults(),
	})
end

homedecor.banister_materials = {
	{	"wood",
		S("wood"),
		"default_wood.png",
		"default_wood.png",
		"group:wood",
		"group:stick",
		"",
		""
	},
	{	"white_dark",
		S("dark topped"),
		homedecor.white_wood,
		homedecor.dark_wood,
		"group:wood",
		"group:stick",
		"dye:brown",
		"dye:white"
	},
	{	"brass",
		S("brass"),
		homedecor.white_wood,
		"basic_materials_chain_brass.png",
		"default:brass_ingot",
		"group:stick",
		"",
		"dye:white"
	},
	{	"wrought_iron",
		S("wrought iron"),
		"homedecor_generic_metal_wrought_iron.png",
		"homedecor_generic_metal_wrought_iron.png",
		"decor:pole_wrought_iron",
		"decor:pole_wrought_iron",
		"",
		""
	}
}

for _, side in ipairs({"diagonal_left", "diagonal_right", "horizontal"}) do

	local sidedesc = side:match("^diagonal") and S("diagonal") or S("horizontal")

	for _, mat in ipairs(homedecor.banister_materials) do

		local name, matdesc, tile1, tile2 = unpack(mat)
		local nodename = "banister_"..name.."_"..side

		local groups = { snappy = 3, not_in_creative_inventory = 1 }
		local cbox = {
			type = "fixed",
			fixed = { -9/16, -3/16, 5/16, 9/16, 24/16, 8/16 }
		}

		if side == "horizontal" then
			groups = { snappy = 3 }
			cbox = {
				type = "fixed",
				fixed = { -8/16, -8/16, 5/16, 8/16, 8/16, 8/16 }
			}
		else
			core.register_alias(string.gsub("decor:"..nodename, "diagonal_", ""), "decor:"..nodename)
		end

		homedecor.register(nodename, {
			description = S("Banister for Stairs (@1, @2)", matdesc, sidedesc),
			mesh = "homedecor_banister_"..side..".obj",
			tiles = {
				tile1,
				tile2,
			},
			inventory_image = "homedecor_banister_"..name.."_inv.png",
			groups = groups,
			selection_box = cbox,
			collision_box = cbox,
			on_place = homedecor.place_banister,
			drop = "decor:banister_"..name.."_horizontal",
		})
	end
end
