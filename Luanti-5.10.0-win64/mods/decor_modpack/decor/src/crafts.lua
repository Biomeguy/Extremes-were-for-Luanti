-- Crafting for homedecor mod (includes folding) by Vanessa Ezekowitz

local S = homedecor_i18n.gettext

core.register_craftitem("decor:drawer_small", {
	description = S("Small Wooden Drawer"),
	inventory_image = "homedecor_drawer_small.png",
})

core.register_craftitem("decor:blank_canvas", {
	description = S("Blank Canvas"),
	inventory_image = "homedecor_blank_canvas.png"
})

core.register_craftitem("decor:speaker_driver", {
	description = S("Speaker driver"),
	inventory_image = "homedecor_speaker_driver_inv.png"
})

core.register_craftitem("decor:fan_blades", {
	description = S("Fan blades"),
	inventory_image = "homedecor_fan_blades.png"
})

-- the actual crafts

core.register_craft({
	output = "decor:fan_blades 2",
	recipe = {
		{"", "basic_materials:plastic_sheet", ""},
		{"", "default:steel_ingot", ""},
		{"basic_materials:plastic_sheet", "", "basic_materials:plastic_sheet"}
	}
})

core.register_craft({
	output = "decor:flower_pot_terracotta",
	recipe = {
		{"mapgen:roof_tile_terracotta", "default:dirt", "mapgen:roof_tile_terracotta"},
		{"mapgen:roof_tile_terracotta", "mapgen:roof_tile_terracotta", "mapgen:roof_tile_terracotta"}
	}
})

core.register_craft({
	output = "mapgen:roof_tile_terracotta 5",
	recipe = {{"decor:flower_pot_terracotta"}},
	replacements = {{"decor:flower_pot_terracotta", "default:dirt"}}
})

core.register_craft({
	output = "decor:flower_pot_green",
	recipe = {
		{"", "dye:dark_green", ""},
		{"basic_materials:plastic_sheet", "default:dirt", "basic_materials:plastic_sheet"},
		{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"}
	}
})

core.register_craft({
	output = "basic_materials:plastic_sheet 5",
	recipe = {{"decor:flower_pot_green"}},
	replacements = {{"decor:flower_pot_green", "default:dirt"}}
})

core.register_craft({
	output = "decor:flower_pot_black",
	recipe = {
		{"dye:black", "dye:black", "dye:black"},
		{"basic_materials:plastic_sheet", "default:dirt", "basic_materials:plastic_sheet"},
		{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"}
	}
})

core.register_craft({
	output = "basic_materials:plastic_sheet 5",
	recipe = {{"decor:flower_pot_black"}},
	replacements = {{"decor:flower_pot_black", "default:dirt"}}
})

--

core.register_craft({
	output = "decor:projection_screen 3",
	recipe = {
		{"", "default:glass", ""},
		{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"},
		{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "decor:projection_screen",
	burntime = 30,
})

--  Items/recipes not requiring smelting of anything new

core.register_craft({
	output = "decor:glass_table_small_round 15",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "default:glass", "default:glass"},
		{"", "default:glass", ""}
	}
})

core.register_craft({
	output = "decor:glass_table_small_square 2",
	recipe = {
		{"decor:glass_table_small_round", "decor:glass_table_small_round"}
	}
})

core.register_craft({
	output = "decor:glass_table_large 2",
	recipe = {
		{"decor:glass_table_small_square", "decor:glass_table_small_square"}
	}
})

--

core.register_craft({
	output = "decor:wood_table_small_round 15",
	recipe = {
		{"", "group:wood", ""},
		{"group:wood", "group:wood", "group:wood"},
		{"", "group:wood", ""}
	}
})

core.register_craft({
	output = "decor:wood_table_small_square 2",
	recipe = {
		{"decor:wood_table_small_round","decor:wood_table_small_round"}
	}
})

core.register_craft({
	output = "decor:wood_table_large 2",
	recipe = {
		{"decor:wood_table_small_square", "decor:wood_table_small_square"}
	}
})

core.register_craft({
	output = "decor:utility_table_top",
	recipe = {{"decor:wood_table_large"}}
})

core.register_craft({
	output = "decor:wood_table_large",
	recipe = {{"decor:utility_table_top"}}
})

--

core.register_craft({
	type = "fuel",
	recipe = "decor:wood_table_small_round",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "decor:wood_table_small_square",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "decor:wood_table_large",
	burntime = 30,
})

--

core.register_craft({
	output = "decor:shingles_asphalt 6",
	recipe = {
		{"decor:gravel_spread", "dye:black", "decor:gravel_spread"},
		{"group:sand", "dye:black", "group:sand"},
		{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"}
	}
})

--

core.register_craft({
	output = "decor:shingles_wood 12",
	recipe = {
		{"group:stick", "group:wood"},
		{"group:wood", "group:stick"}
	}
})

core.register_craft({
	output = "decor:shingles_wood 12",
	recipe = {
		{"group:wood", "group:stick"},
		{"group:stick", "group:wood"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "decor:shingles_wood",
	burntime = 30,
})

--

core.register_craft({
	output = "decor:skylight 4",
	recipe = {
		{"decor:glass_table_large", "decor:glass_table_large"},
		{"decor:glass_table_large", "decor:glass_table_large"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:skylight_frosted",
	recipe = {"dye:white", "decor:skylight"},
})

core.register_craft({
	type = "cooking",
	output = "decor:skylight",
	recipe = "decor:skylight_frosted",
})

core.register_craft({
	output = "decor:drawer_small",
	recipe = {{"group:wood", "default:steel_ingot", "group:wood"}}
})

core.register_craft({
	type = "fuel",
	recipe = "decor:drawer_small",
	burntime = 30,
	replacements = {{"decor:drawer_small", "default:steel_ingot"}}
})

-- Table legs

core.register_craft({
	output = "decor:table_legs_wrought_iron 3",
	recipe = {
		{"", "default:iron_lump", ""},
		{"", "default:iron_lump", ""},
		{"default:iron_lump", "default:iron_lump", "default:iron_lump"}
	}
})

core.register_craft({
	output = "decor:table_legs_brass 3",
	recipe = {
		{"", "default:brass_ingot", ""},
		{"", "default:brass_ingot", ""},
		{"default:brass_ingot", "default:brass_ingot", "default:brass_ingot"}
	}
})

core.register_craft({
	output = "decor:utility_table_legs",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "", "group:stick"},
		{"group:stick", "", "group:stick"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "decor:utility_table_legs",
	burntime = 30,
})

-- vertical poles/lampposts

core.register_craft({
	output = "decor:pole_brass 4",
	recipe = {
		{"", "default:brass_ingot", ""},
		{"", "default:brass_ingot", ""},
		{"", "default:brass_ingot", ""}
	}
})

core.register_craft({
	output = "decor:pole_wrought_iron 4",
	recipe = {
		{"", "default:iron_lump", ""},
		{"", "default:iron_lump", ""},
		{"", "default:iron_lump", ""}
	}
})

-- Recipes that require materials from wool (cotton alternate)

core.register_craft({
	type = "shapeless",
	output = "decor:rug_large 8",
	recipe = {
		"fabric:block_red",
		"fabric:block_yellow",
		"fabric:block_blue",
		"fabric:block_black"
	}
})

core.register_craft({
	output = "decor:rug_persian 8",
	recipe = {
		{"", "fabric:block_yellow", ""},
		{"fabric:block_red", "fabric:block_blue", "fabric:block_red"},
		{"", "fabric:block_yellow", ""}
	}
})

-- cotton versions:

core.register_craft({
	type = "shapeless",
	output = "decor:rug_large 8",
	recipe = {
		"cotton:red",
		"cotton:yellow",
		"cotton:blue",
		"cotton:black"
	}
})

core.register_craft({
	output = "decor:rug_persian 8",
	recipe = {
		{"", "cotton:yellow", ""},
		{"cotton:red", "cotton:blue", "cotton:red"},
		{"", "cotton:yellow", ""}
	}
})

-- fuel recipes for same

core.register_craft({
	type = "fuel",
	recipe = "decor:rug_large",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "decor:rug_persian",
	burntime = 30,
})

-- Speakers

core.register_craft({
	output = "decor:speaker_driver 2",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"default:paper", "basic_materials:copper_wire", "default:iron_lump"},
		{"", "default:steel_ingot", ""}
	},
	replacements = {{"basic_materials:copper_wire", "basic_materials:empty_spool"}}
})

-- Curtains

core.register_craft({
	output = "decor:curtain_closed 4",
	recipe = {
		{"fabric:block_white", "", ""},
		{"fabric:block_white", "", ""},
		{"fabric:block_white", "", ""}
	}
})

core.register_craft({
	output = "decor:curtain_closed 4",
	recipe = {
		{"cottages:wool", "", ""},
		{"cottages:wool", "", ""},
		{"cottages:wool", "", ""}
	}
})

local mats = {
	{"brass", "decor:pole_brass"},
	{"wrought_iron", "decor:pole_wrought_iron"},
	{"wood", "group:stick" }
}

for i in ipairs(mats) do
	local material = mats[i][1]
	local ingredient = mats[i][2]
	core.register_craft({
		output = "decor:curtainrod_"..material.." 3",
		recipe = {
		{ ingredient, ingredient, ingredient }}
	})
end

-- Recycling recipes

-- Some glass objects recycle via the glass fragments item/recipe in the Vessels mod.

core.register_craft({
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {
		"decor:glass_table_small_round",
		"decor:glass_table_small_round",
		"decor:glass_table_small_round"
	}
})

core.register_craft({
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {
		"decor:glass_table_small_square",
		"decor:glass_table_small_square",
		"decor:glass_table_small_square"
	}
})

core.register_craft({
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {
		"decor:glass_table_large",
		"decor:glass_table_large",
		"decor:glass_table_large"
	}
})

core.register_craft({
	type = "shapeless",
	output = "vessels:glass_fragments 2",
	recipe = {"decor:skylight", "decor:skylight", "decor:skylight",
		"decor:skylight", "decor:skylight", "decor:skylight"}
})

-- Wooden tabletops can turn into sticks

core.register_craft({
	type = "shapeless",
	output = "default:stick 4",
	recipe = {
		"decor:wood_table_small_round",
		"decor:wood_table_small_round",
		"decor:wood_table_small_round"
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:stick 4",
	recipe = {
		"decor:wood_table_small_square",
		"decor:wood_table_small_square",
		"decor:wood_table_small_square"
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:stick 4",
	recipe = {
		"decor:wood_table_large",
		"decor:wood_table_large",
		"decor:wood_table_large"
	}
})

-- Kitchen stuff

core.register_craft({
	output = "decor:refrigerator_steel",
	recipe = {
		{"default:steel_ingot", "decor:glowlight_small_cube", "default:steel_ingot"},
		{"default:steel_ingot", "default:copper_block", "default:steel_ingot"},
		{"default:steel_ingot", "default:clay", "default:steel_ingot"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:refrigerator_white",
	recipe = {"decor:refrigerator_steel", "dye:white", "dye:white", "dye:white"}
})

core.register_craft({
	output = "decor:kitchen_cabinet",
	recipe = {
		{"group:wood", "group:stick", "group:wood"},
		{"group:wood", "group:stick", "group:wood"},
		{"group:wood", "group:stick", "group:wood"}
	}
})

core.register_craft({
	output = "decor:kitchen_cabinet_steel",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"", "decor:kitchen_cabinet", ""}
	}
})

core.register_craft({
	output = "decor:kitchen_cabinet_steel",
	recipe = {
		{"moreblocks:slab_steel_block_1"},
		{"decor:kitchen_cabinet"}
	}
})

core.register_craft({
	output = "decor:kitchen_cabinet_marble",
	recipe = {
		{"stairs:slab_clarble"},
		{"decor:kitchen_cabinet"}
	}
})

core.register_craft({
	output = "decor:kitchen_cabinet_marble",
	recipe = {
		{"decor:slab_clarble_1"},
		{"decor:kitchen_cabinet"}
	}
})

core.register_craft({
	output = "decor:kitchen_cabinet_granite",
	recipe = {
		{"moreblocks:slab_granite_1"},
		{"decor:kitchen_cabinet"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:kitchen_cabinet_half 2",
	recipe = {"decor:kitchen_cabinet"}
})

core.register_craft({
	output = "decor:kitchen_cabinet_with_sink",
	recipe = {
		{"group:wood", "default:steel_ingot", "group:wood"},
		{"group:wood", "default:steel_ingot", "group:wood"},
		{"group:wood", "group:stick", "group:wood"}
	}
})

------- Lighting

-- candles

core.register_craft({
	output = "decor:candle_thin 4",
	recipe = {
		{"fabric:string"},
		{"basic_materials:paraffin"}
	}
})

core.register_craft({
	output = "decor:candle 2",
	recipe = {
		{"fabric:string"},
		{"basic_materials:paraffin"},
		{"basic_materials:paraffin"}
	}
})

core.register_craft({
	output = "decor:wall_sconce 2",
	recipe = {
		{"default:iron_lump", "", ""},
		{"default:iron_lump", "decor:candle", ""},
		{"default:iron_lump", "", ""}
	}
})

core.register_craft({
	output = "decor:candlestick_wrought_iron",
	recipe = {
		{""},
		{"decor:candle_thin"},
		{"default:iron_lump"},
	}
})

core.register_craft({
	output = "decor:candlestick_brass",
	recipe = {
		{""},
		{"decor:candle_thin"},
		{"default:brass_ingot"},
	}
})

-- Wrought-iron wall latern

core.register_craft({
	output = "decor:ground_lantern",
	recipe = {
		{"default:iron_lump", "default:iron_lump", "default:iron_lump"},
		{"default:iron_lump", "default:meselamp_torch", "default:iron_lump"},
		{"", "default:iron_lump", "" }
	}
})

-- wood-lattice lamps

core.register_craft({
	output = "decor:lattice_lantern_large 2",
	recipe = {
		{"dye:black", "dye:yellow", "dye:black"},
		{"group:stick", "decor:woodglass", "group:stick"},
		{"group:stick", "basic_materials:energy_crystal_simple", "group:stick"}
	}
})

core.register_craft({
	output = "decor:lattice_lantern_small 8",
	recipe = {
		{"decor:lattice_lantern_large"}
	}
})

core.register_craft({
	output = "decor:lattice_lantern_large",
	recipe = {
		{"decor:lattice_lantern_small", "decor:lattice_lantern_small", "decor:lattice_lantern_small"},
		{"decor:lattice_lantern_small", "", "decor:lattice_lantern_small"},
		{"decor:lattice_lantern_small", "decor:lattice_lantern_small", "decor:lattice_lantern_small"}
	}
})

-- glowlights

core.register_craft({
	output = "decor:glowlight_half 6",
	recipe = {
		{"dye:white", "dye:white", "dye:white"},
		{"default:glass", "basic_materials:energy_crystal_simple", "default:glass"},
	}
})

core.register_craft({
	output = "decor:glowlight_half 6",
	recipe = {
		{"dye:white", "dye:white", "dye:white"},
		{"moreblocks:super_glow_glass", "moreblocks:glow_glass", "moreblocks:super_glow_glass"},
	}
})

core.register_craft({
	output = "decor:glowlight_quarter 6",
	recipe = {
		{"decor:glowlight_half", "decor:glowlight_half", "decor:glowlight_half"},
	}
})

core.register_craft({
	output = "decor:glowlight_small_cube 8",
	recipe = {
		{"dye:white"},
		{"moreblocks:super_glow_glass"},
	}
})

core.register_craft({
	output = "decor:glowlight_small_cube 4",
	recipe = {{"decor:glowlight_half"}}
})

core.register_craft({
	output = "decor:glowlight_half",
	recipe = {
		{"decor:glowlight_small_cube","decor:glowlight_small_cube"},
		{"decor:glowlight_small_cube","decor:glowlight_small_cube"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:glowlight_half",
	recipe = {"decor:glowlight_quarter", "decor:glowlight_quarter"}
})

----

core.register_craft({
	output = "decor:plasma_lamp",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "basic_materials:energy_crystal_simple", "default:glass"},
		{"", "default:glass", ""}
	}
})

core.register_craft({
	output = "decor:plasma_ball 2",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "default:copper_ingot", "default:glass"},
		{"basic_materials:plastic_sheet", "basic_materials:energy_crystal_simple", "basic_materials:plastic_sheet"}
	}
})

-- Brass/wrought iron fences

core.register_craft({
	output = "decor:fence_brass 8",
	recipe = {
		{"default:brass_block", "default:brass_ingot", "default:brass_block"},
		{"default:brass_block", "default:brass_ingot", "default:brass_block"}
	}
})

core.register_craft({
	output = "decor:fence_wrought_iron 6",
	recipe = {
		{"default:iron_lump","default:iron_lump","default:iron_lump"},
		{"default:iron_lump","default:iron_lump","default:iron_lump"}
	}
})

-- other types of fences

core.register_craft({
	output = "decor:fence_wrought_iron_2 4",
	recipe = {
		{"decor:pole_wrought_iron", "default:iron_lump"},
		{"decor:pole_wrought_iron", "default:iron_lump"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:fence_wrought_iron_2_corner",
	recipe = {"decor:fence_wrought_iron_2", "decor:fence_wrought_iron_2"}
})

core.register_craft({
	type = "shapeless",
	output = "decor:fence_wrought_iron_2 2",
	recipe = {"decor:fence_wrought_iron_2_corner"}
})

--

core.register_craft({
	output = "decor:fence_picket 6",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "", "group:stick"},
		{"group:stick", "group:stick", "group:stick"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:fence_picket_corner",
	recipe = {"decor:fence_picket", "decor:fence_picket"}
})

core.register_craft({
	type = "shapeless",
	output = "decor:fence_picket 2",
	recipe = {"decor:fence_picket_corner"}
})

--

core.register_craft({
	output = "decor:fence_picket_white 6",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "dye:white", "group:stick"},
		{"group:stick", "group:stick", "group:stick"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:fence_picket_corner_white",
	recipe = {"decor:fence_picket_white", "decor:fence_picket_white"}
})

core.register_craft({
	type = "shapeless",
	output = "decor:fence_picket_white 2",
	recipe = {"decor:fence_picket_corner_white"}
})

--

core.register_craft({
	output = "decor:fence_privacy 6",
	recipe = {
		{"group:wood", "group:stick", "group:wood"},
		{"group:wood", "", "group:wood"},
		{"group:wood", "group:stick", "group:wood"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:fence_privacy_corner",
	recipe = {"decor:fence_privacy", "decor:fence_privacy"}
})

core.register_craft({
	type = "shapeless",
	output = "decor:fence_privacy 2",
	recipe = {"decor:fence_privacy_corner"}
})

core.register_craft({
	output = "decor:fence_chainlink 9",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"basic_materials:steel_wire", "basic_materials:steel_wire", "default:steel_ingot"},
		{"basic_materials:steel_wire", "basic_materials:steel_wire", "default:steel_ingot"}
	},
	replacements = {
		{"basic_materials:steel_wire", "basic_materials:empty_spool"},
		{"basic_materials:steel_wire", "basic_materials:empty_spool"},
		{"basic_materials:steel_wire", "basic_materials:empty_spool"},
		{"basic_materials:steel_wire", "basic_materials:empty_spool"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:fence_chainlink_corner",
	recipe = {"decor:fence_chainlink", "decor:fence_chainlink"}
})

core.register_craft({
	type = "shapeless",
	output = "decor:fence_chainlink 2",
	recipe = {"decor:fence_chainlink_corner"}
})

-- Gates

core.register_craft({
	type = "shapeless",
	output = "decor:gate_picket_white_closed",
	recipe = {"decor:fence_picket_white"}
})

core.register_craft({
	type = "shapeless",
	output = "decor:fence_picket_white",
	recipe = {"decor:gate_picket_white_closed"}
})

core.register_craft({
	type = "shapeless",
	output = "decor:gate_picket_closed",
	recipe = {"decor:fence_picket"}
})

core.register_craft({
	type = "shapeless",
	output = "decor:fence_picket",
	recipe = {"decor:gate_picket_closed"}
})

core.register_craft({
	type = "shapeless",
	output = "decor:gate_chainlink_closed",
	recipe = {"decor:fence_chainlink"}
})

core.register_craft({
	type = "shapeless",
	output = "decor:fence_chainlink",
	recipe = {"decor:gate_chainlink_closed"}
})

------ Doors

-- plain wood, non-windowed

core.register_craft({
	output = "decor:door_wood_plain_left 2",
	recipe = {
		{"group:wood", "group:wood", ""},
		{"group:wood", "group:wood", "default:steel_ingot"},
		{"group:wood", "group:wood", ""}
	}
})

-- fancy exterior

core.register_craft({
	output = "decor:door_exterior_fancy_left 2",
	recipe = {
		{"group:wood", "default:glass"},
		{"group:wood", "group:wood"},
		{"group:wood", "group:wood"}
	}
})

-- wood and glass (grid style)

-- bare

core.register_craft({
	output = "decor:door_wood_glass_oak_left 2",
	recipe = {
		{"default:glass", "group:wood"},
		{"group:wood", "default:glass"},
		{"default:glass", "group:wood"}
	}
})

core.register_craft({
	output = "decor:door_wood_glass_oak_left 2",
	recipe = {
		{"group:wood", "default:glass"},
		{"default:glass", "group:wood"},
		{"group:wood", "default:glass"}
	}
})

-- mahogany

core.register_craft({
	type = "shapeless",
	output = "decor:door_wood_glass_mahogany_left 2",
	recipe = {
		"default:dirt",
		"default:coal_lump",
		"decor:door_wood_glass_oak_left",
		"decor:door_wood_glass_oak_left"
	},
})

core.register_craft({
	type = "shapeless",
	output = "decor:door_wood_glass_mahogany_left 2",
	recipe = {
		"dye:brown",
		"decor:door_wood_glass_oak_left",
		"decor:door_wood_glass_oak_left"
	},
})

-- white

core.register_craft({
	type = "shapeless",
	output = "decor:door_wood_glass_white_left 2",
	recipe = {
		"dye:white",
		"decor:door_wood_glass_oak_left",
		"decor:door_wood_glass_oak_left"
	},
})

-- Solid glass with metal handle

core.register_craft({
	output = "decor:door_glass_left 2",
	recipe = {
		{"default:glass", "default:glass"},
		{"default:glass", "default:steel_ingot"},
		{"default:glass", "default:glass"}
	}
})

-- Closet doors

-- oak

core.register_craft({
	output = "decor:door_closet_oak_left 2",
	recipe = {
		{"", "group:stick", "group:stick"},
		{"default:steel_ingot", "group:stick", "group:stick"},
		{"", "group:stick", "group:stick"}
	}
})

-- mahogany

core.register_craft({
	type = "shapeless",
	output = "decor:door_closet_mahogany_left 2",
	recipe = {
		"decor:door_closet_oak_left",
		"decor:door_closet_oak_left",
		"default:dirt",
		"default:coal_lump",
	},
})

core.register_craft({
	type = "shapeless",
	output = "decor:door_closet_mahogany_left 2",
	recipe = {
		"decor:door_closet_oak_left",
		"decor:door_closet_oak_left",
		"dye:brown"
	},
})

-- wrought fence-like door

core.register_craft({
	output = "decor:door_wrought_iron_left 2",
	recipe = {
		{"decor:pole_wrought_iron", "default:iron_lump"},
		{"decor:pole_wrought_iron", "default:iron_lump"},
		{"decor:pole_wrought_iron", "default:iron_lump"}
	}
})

-- bedroom door

core.register_craft({
	output = "decor:door_bedroom_left",
	recipe = {
		{"dye:white", "dye:white", ""},
		{"decor:door_wood_plain_left", "default:brass_ingot", ""},
		{"", "", ""}
	}
})

-- woodglass door

core.register_craft({
	output = "decor:door_woodglass_left",
	recipe = {
		{"group:wood", "default:glass", ""},
		{"group:wood", "default:glass", "default:brass_ingot"},
		{"group:wood", "group:wood", ""}
	}
})

-- woodglass door type 2

core.register_craft({
	output = "decor:door_woodglass2_left",
	recipe = {
		{"default:glass", "default:glass", ""},
		{"group:wood", "group:wood", "default:iron_lump"},
		{"group:wood", "group:wood", ""}
	}
})

-- paintings

core.register_craft({
	output = "decor:blank_canvas",
	recipe = {
		{"", "group:stick", ""},
		{"group:stick", "fabric:block_white", "group:stick"},
		{"", "group:stick", ""}
	}
})

local painting_patterns = {
	[1] = {	{"brown", "red", "brown"},
		{"dark_green", "red", "green" } },

	[2] = {	{"green", "yellow", "green"},
		{"green", "yellow", "green" } },

	[3] = {	{"green", "pink", "green"},
		{"brown", "pink", "brown" } },

	[4] = {	{"black", "orange", "grey"},
		{"dark_green", "orange", "orange" } },

	[5] = {	{"blue", "orange", "yellow"},
		{"green", "red", "brown" } },

	[6] = {	{"green", "red", "orange"},
		{"orange", "yellow", "green" } },

	[7] = {	{"blue", "dark_green", "dark_green"},
		{"green", "grey", "green" } },

	[8] = {	{"blue", "blue", "blue"},
		{"green", "green", "green" } },

	[9] = {	{"blue", "blue", "dark_green"},
		{"green", "grey", "dark_green" } },

	[10] = { {"green", "white", "green"},
		 {"dark_green", "white", "dark_green" } },

	[11] = { {"blue", "white", "blue"},
		 {"blue", "grey", "dark_green" } },

	[12] = { {"green", "green", "green"},
		 {"grey", "grey", "green" } },

	[13] = { {"blue", "blue", "grey"},
		 {"dark_green", "white", "white" } },

	[14] = { {"red", "yellow", "blue"},
		 {"blue", "green", "violet" } },

	[15] = { {"blue", "yellow", "blue"},
		 {"black", "black", "black" } },

	[16] = { {"red", "orange", "blue"},
		 {"black", "dark_grey", "grey" } },

	[17] = { {"orange", "yellow", "orange"},
		 {"black", "black", "black" } },

	[18] = { {"grey", "dark_green", "grey"},
		 {"white", "white", "white" } },

	[19] = { {"white", "brown", "green"},
		 {"green", "brown", "brown" } },

	[20] = { {"blue", "blue", "blue"},
		 {"red", "brown", "grey" } }
}

for i,recipe in pairs(painting_patterns) do

	local item1 = "dye:"..recipe[1][1]
	local item2 = "dye:"..recipe[1][2]
	local item3 = "dye:"..recipe[1][3]
	local item4 = "dye:"..recipe[2][1]
	local item5 = "dye:"..recipe[2][2]
	local item6 = "dye:"..recipe[2][3]

	core.register_craft({
		output = "decor:painting_"..i,
		recipe = {
		{item1, item2, item3},
		{item4, item5, item6},
		{"", "decor:blank_canvas", ""}}
	})
end

-- more misc stuff here

core.register_craft({
	output = "decor:chimney 2",
	recipe = {
		{"default:clay_brick", "", "default:clay_brick"},
		{"default:clay_brick", "", "default:clay_brick"},
		{"default:clay_brick", "", "default:clay_brick"}
	}
})

core.register_craft({
	output = "decor:fishtank",
	recipe = {
		{"basic_materials:plastic_sheet", "decor:glowlight_small_cube", "basic_materials:plastic_sheet"},
		{"default:glass", "bucket:bucket_water", "default:glass"},
		{"default:glass", "decor:gravel_spread", "default:glass"}
	},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})

core.register_craft({
	output = "decor:towel_rod",
	recipe = {
		{"group:wood", "group:stick", "group:wood"},
		{"", "decor:terrycloth_towel", ""}
	}
})

core.register_craft({
	output = "decor:toilet_paper",
	recipe = {
		{"", "default:paper", "default:paper"},
		{"group:wood", "group:stick", "default:paper"},
		{"", "default:paper", "default:paper"}
	}
})

core.register_craft({
	output = "decor:desk",
	recipe = {
		{"stairs:slab_wood", "stairs:slab_wood", "stairs:slab_wood"},
		{"decor:drawer_small", "default:wood", "default:wood"},
		{"decor:drawer_small", "", "default:wood"}
	}
})

core.register_craft({
	output = "decor:desk",
	recipe = {
		{"moreblocks:slab_wood", "moreblocks:slab_wood", "moreblocks:slab_wood"},
		{"decor:drawer_small", "default:wood", "default:wood"},
		{"decor:drawer_small", "", "default:wood"}
	}
})

core.register_craft({
	output = "decor:ceiling_fan",
	recipe = {
		{"basic_materials:motor"},
		{"decor:fan_blades"},
		{"decor:glowlight_small_cube" }
	}
})

core.register_craft({
	output = "decor:welcome_mat_grey 2",
	recipe = {
		{"", "dye:black", ""},
		{"fabric:block_grey", "fabric:block_grey", "fabric:block_grey"}
	}
})

core.register_craft({
	output = "decor:welcome_mat_brown 2",
	recipe = {
		{"", "dye:black", ""},
		{"fabric:block_brown", "fabric:block_brown", "fabric:block_brown"}
	}
})

core.register_craft({
	output = "decor:welcome_mat_green 2",
	recipe = {
		{"", "dye:white", ""},
		{"fabric:block_dark_green", "fabric:block_dark_green", "fabric:block_dark_green"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:window_plain 8",
	recipe = {
		"dye:white",
		"dye:white",
		"dye:white",
		"dye:white",
		"decor:woodglass"
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:window_quartered",
	recipe = {
		"dye:white",
		"group:stick",
		"group:stick",
		"decor:window_plain"
	}
})

core.register_craft({
	output = "decor:openframe_bookshelf",
	recipe = {
		{"group:wood", "", "group:wood"},
		{"default:book", "default:book", "default:book"},
		{"group:wood", "", "group:wood"}
	}
})

core.register_craft({
	output = "decor:desk_fan",
	recipe = {
		{"default:steel_ingot", "decor:fan_blades", "basic_materials:motor"},
		{"", "default:steel_ingot", ""}
	}
})

-- bathroom/kitchen tiles

core.register_craft({
	output = "decor:bathroom_tiles_light 4",
	recipe = {
		{"group:clarble", "group:clarble", ""},
		{"group:clarble", "group:clarble", "dye:white" }
	}
})

core.register_craft({
	output = "decor:bathroom_tiles_medium 4",
	recipe = {
		{"group:clarble", "group:clarble", ""},
		{"group:clarble", "group:clarble", "dye:grey" }
	}
})

core.register_craft({
	output = "decor:bathroom_tiles_dark 4",
	recipe = {
		{"group:clarble", "group:clarble", ""},
		{"group:clarble", "group:clarble", "dye:dark_grey" }
	}
})

-- japanese walls and mat

core.register_craft({
	output = "decor:japanese_wall_top",
	recipe = {
		{"group:stick", "default:paper"},
		{"default:paper", "group:stick"},
		{"group:stick", "default:paper"}
	}
})

core.register_craft({
	output = "decor:japanese_wall_top",
	recipe = {
		{"default:paper", "group:stick"},
		{"group:stick", "default:paper"},
		{"default:paper", "group:stick"}
	}
})

core.register_craft({
	output = "decor:japanese_wall_middle",
	recipe = {
		{"decor:japanese_wall_top"}
	}
})

core.register_craft({
	output = "decor:japanese_wall_bottom",
	recipe = {
		{"decor:japanese_wall_middle"}
	}
})

core.register_craft({
	output = "decor:japanese_wall_top",
	recipe = {
		{"decor:japanese_wall_bottom"}
	}
})

core.register_craft({
	output = "decor:tatami_mat",
	recipe = {
		{"farming:wheat", "farming:wheat", "farming:wheat"}
	},
	replacements = {
		{"farming:wheat", "farming:wheat_seed 8"},
		{"farming:wheat", "farming:wheat_seed 8"},
		{"farming:wheat", "farming:wheat_seed 8"}
	}
})

core.register_craft({
	output = "decor:pool_table",
	recipe = {
		{"fabric:block_dark_green", "fabric:block_dark_green", "fabric:block_dark_green"},
		{"decor:hardwood", "decor:hardwood", "decor:hardwood"},
		{"stairs:slab_wood", "", "stairs:slab_wood"}
	}
})

core.register_craft({
	output = "decor:trash_can 3",
	recipe = {
		{"basic_materials:steel_wire", "", "basic_materials:steel_wire"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
	},
	replacements = {{"basic_materials:steel_wire", "basic_materials:empty_spool"},
		{"basic_materials:steel_wire", "basic_materials:empty_spool"}}
})

core.register_craft({
	output = "decor:well",
	recipe = {
		{"decor:shingles_wood", "decor:shingles_wood", "decor:shingles_wood"},
		{"group:wood", "group:stick", "group:wood"},
		{"group:stone", "", "group:stone"}
	}
})

core.register_craft({
	output = "decor:coat_tree",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"", "group:stick", ""},
		{"", "group:wood", ""}
	}
})

core.register_craft({
	output = "decor:bench_large_1",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
		{"decor:pole_wrought_iron", "", "decor:pole_wrought_iron"}
	}
})

core.register_craft({
	output = "decor:bench_large_2",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"group:wood", "group:wood", "group:wood"},
		{"stairs:slab_wood", "", "stairs:slab_wood"}
	}
})

core.register_craft({
	output = "decor:kitchen_faucet",
	recipe = {
		{"", "default:steel_ingot"},
		{"default:steel_ingot", ""},
		{"decor:taps", ""}
	}
})

core.register_craft({
	output = "decor:simple_bench",
	recipe = {
		{"stairs:slab_wood", "stairs:slab_wood", "stairs:slab_wood"},
		{"stairs:slab_wood", "", "stairs:slab_wood"}
	}
})

core.register_craft({
	output = "decor:chains 4",
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"basic_materials:chainlink_steel", "", "basic_materials:chainlink_steel"},
		{"basic_materials:chainlink_steel", "", "basic_materials:chainlink_steel"}
	}
})

core.register_craft({
	output = "decor:dartboard",
	recipe = {
		{"dye:black", "basic_materials:plastic_sheet", "dye:white"},
		{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"},
		{"dye:dark_green", "basic_materials:plastic_sheet", "dye:red"}
	}
})

core.register_craft({
	output = "decor:piano",
	recipe = {
		{"", "basic_materials:steel_wire", "decor:hardwood"},
		{"basic_materials:plastic_strip", "basic_materials:steel_wire", "decor:hardwood"},
		{"default:brass_ingot", "default:steel_block", "decor:hardwood"}
	},
	replacements = {{"basic_materials:steel_wire", "basic_materials:empty_spool"},
		{"basic_materials:steel_wire", "basic_materials:empty_spool"}}
})

core.register_craft({
	output = "decor:deckchair",
	recipe = {
		{"group:stick", "decor:terrycloth_towel", "group:stick"},
		{"group:stick", "decor:terrycloth_towel", "group:stick"},
		{"group:stick", "decor:terrycloth_towel", "group:stick"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:deckchair_striped_blue",
	recipe = {
		"decor:deckchair",
		"dye:blue"
	}
})

core.register_craft({
	output = "decor:office_chair_basic",
	recipe = {
		{"", "", "fabric:block_black"},
		{"", "fabric:block_black", "default:steel_ingot"},
		{"group:stick", "decor:pole_wrought_iron", "group:stick"}
	}
})

core.register_craft({
	output = "decor:office_chair_upscale",
	recipe = {
		{"dye:black", "decor:sticks", "group:fabric_block"},
		{"basic_materials:plastic_sheet", "group:fabric_block", "default:steel_ingot"},
		{"decor:sticks", "decor:pole_wrought_iron", "decor:sticks"}
	}
})

core.register_craft({
	output = "decor:wall_shelf 2",
	recipe = {
		{"decor:wood_table_small_square", "decor:curtainrod_wood", "decor:curtainrod_wood"}
	}
})

core.register_craft({
	output = "decor:window_flowerbox",
	recipe = {
		{"mapgen:roof_tile_terracotta", "default:dirt", "mapgen:roof_tile_terracotta"},
		{"", "mapgen:roof_tile_terracotta", ""}
	}
})

core.register_craft({
	output = "mapgen:roof_tile_terracotta 3",
	recipe = {{"decor:window_flowerbox"}},
	replacements = {{"decor:window_flowerbox", "default:dirt"}}
})

core.register_craft({
	output = "decor:paper_towel",
	recipe = {
		{"decor:toilet_paper", "decor:toilet_paper"}
	}
})

core.register_craft({
	output = "decor:hstonepath 16",
	recipe = {
		{"stairs:slab_stone","","stairs:slab_stone"},
		{"","stairs:slab_stone",""},
		{"stairs:slab_stone","","stairs:slab_stone"}
	}
})

core.register_craft({
	output = "decor:hstonepath 3",
	recipe = {
		{"moreblocks:micro_stone_1","","moreblocks:micro_stone_1"},
		{"","moreblocks:micro_stone_1",""},
		{"moreblocks:micro_stone_1","","moreblocks:micro_stone_1"}
	}
})

core.register_craft({
	output = "decor:beer_tap",
	recipe = {
		{"group:stick", "default:steel_ingot", "group:stick"},
		{"decor:kitchen_faucet", "default:steel_ingot", "decor:kitchen_faucet"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
	}
})

core.register_craft({
	output = "decor:door_japanese_closed",
	recipe = {
		{"decor:japanese_wall_top"},
		{"decor:japanese_wall_bottom"}
	}
})

local picture_dyes = {
	{"dye:brown", "dye:green"}, -- the figure sitting by the tree, wielding a pick
	{"dye:green", "dye:blue"}	-- the "family photo"
}

for i in ipairs(picture_dyes) do
	core.register_craft({
		output = "decor:picture_frame"..i,
		recipe = {
		{ picture_dyes[i][1], picture_dyes[i][2] },
		{"decor:blank_canvas", "group:stick"}}
	})
end

core.register_craft({
	output = "decor:hanging_lantern 2",
	recipe = {
		{"default:iron_lump", "default:iron_lump", ""},
		{"default:iron_lump", "decor:lattice_lantern_large", ""},
		{"default:iron_lump", "", ""}
	}
})

core.register_craft({
	output = "decor:ceiling_lantern 2",
	recipe = {
		{"default:iron_lump", "default:iron_lump", "default:iron_lump"},
		{"default:iron_lump", "decor:lattice_lantern_large", "default:iron_lump"},
		{"", "default:iron_lump", ""}
	}
})

core.register_craft({
	output = "decor:wall_lamp 2",
	recipe = {
		{"", "decor:lattice_lantern_large", ""},
		{"default:iron_lump", "group:stick", ""},
		{"default:iron_lump", "group:stick", ""}
	}
})

core.register_craft({
	output = "decor:desk_globe",
	recipe = {
		{"group:stick", "basic_materials:plastic_sheet", "dye:green"},
		{"group:stick", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"},
		{"group:stick", "stairs:slab_wood", "dye:blue"}
	}
})

core.register_craft({
	output = "decor:ceiling_lamp",
	recipe = {
		{"", "default:brass_ingot", ""},
		{"", "basic_materials:chainlink_brass", ""},
		{"default:glass", "decor:glowlight_small_cube", "default:glass"}
	}
})

core.register_craft({
	output = "decor:ceiling_lamp",
	recipe = {
		{"", "decor:chain_top_brass", ""},
		{"default:glass", "decor:glowlight_small_cube", "default:glass"}
	}
})

core.register_craft({
	output = "decor:lattice_wood 8",
	recipe = {
		{"group:stick", "group:wood", "group:stick"},
		{"group:wood", "", "group:wood"},
		{"group:stick", "group:wood", "group:stick"}
	}
})

core.register_craft({
	output = "decor:lattice_white_wood 8",
	recipe = {
		{"group:stick", "group:wood", "group:stick"},
		{"group:wood", "dye:white", "group:wood"},
		{"group:stick", "group:wood", "group:stick"}
	}
})

core.register_craft({
	output = "decor:lattice_wood_vegetal 8",
	recipe = {
		{"group:stick", "group:wood", "group:stick"},
		{"group:wood", "group:leaves", "group:wood"},
		{"group:stick", "group:wood", "group:stick"}
	}
})

core.register_craft({
	output = "decor:lattice_white_wood_vegetal 8",
	recipe = {
		{"group:stick", "group:wood", "group:stick"},
		{"group:wood", "group:leaves", "group:wood"},
		{"group:stick", "dye:white", "group:stick"}
	}
})

core.register_craft({
	output = "decor:stained_glass 8",
	recipe = {
		{"", "dye:blue", ""},
		{"dye:red", "default:glass", "dye:green"},
		{"", "dye:yellow", ""}
	}
})

core.register_craft({
	output = "decor:stained_glass 3",
	recipe = {
		{"", "dye:blue", ""},
		{"dye:red", "xpanes:pane_flat", "dye:green"},
		{"", "dye:yellow", ""}
	}
})

core.register_craft({
	output = "decor:stained_glass 3",
	recipe = {
		{"", "dye:blue", ""},
		{"dye:red", "mapgen:pane_side", "dye:green"},
		{"", "dye:yellow", ""}
	}
})

core.register_craft({
	output = "decor:shrubbery_green 3",
	recipe = {
		{"group:leaves", "group:leaves", "group:leaves"},
		{"group:leaves", "group:leaves", "group:leaves"},
		{"group:stick", "group:stick", "group:stick"}
	}
})

for _, color in ipairs(homedecor.shrub_colors) do

	core.register_craft({
		type = "shapeless",
		output = "decor:shrubbery_large_"..color,
		recipe = {
		"decor:shrubbery_"..color
		}
	})

	core.register_craft({
		type = "shapeless",
		output = "decor:shrubbery_"..color,
		recipe = {
		"decor:shrubbery_large_"..color
		}
	})

	if color ~= "green" then
		core.register_craft({
		type = "shapeless",
		output = "decor:shrubbery_large_"..color,
		recipe = {
			"decor:shrubbery_large_green",
			"dye:"..color
		}
	})

		core.register_craft({
		type = "shapeless",
		output = "decor:shrubbery_"..color,
		recipe = {
			"decor:shrubbery_green",
			"dye:"..color
		}
	})
	end
end

for i in ipairs(homedecor.banister_materials) do

	local name	= homedecor.banister_materials[i][1]
	local topmat  = homedecor.banister_materials[i][5]
	local vertmat = homedecor.banister_materials[i][6]
	local dye1	= homedecor.banister_materials[i][7]
	local dye2	= homedecor.banister_materials[i][8]

	core.register_craft({
		output = "decor:banister_"..name.."_horizontal 2",
		recipe = {
		{ topmat,  "",	  dye1   },
		{ vertmat, topmat,  ""	 },
		{ dye2,	vertmat, topmat }
		}
	})
end

core.register_craft({
	output = "decor:table",
	recipe = {
		{"group:wood","group:wood", "group:wood"},
		{"group:stick", "", "group:stick"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:table_mahogany",
	recipe = {
		"decor:table",
		"dye:brown",
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:table_mahogany",
	recipe = {
		"decor:table",
		"unifieddyes:dark_orange",
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:table_white",
	recipe = {
		"decor:table",
		"dye:white",
	}
})

core.register_craft({
	type = "fuel",
	recipe = "decor:table",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "decor:table_mahogany",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "decor:table_white",
	burntime = 30,
})

core.register_craft({
	output = "decor:kitchen_chair_wood 2",
	recipe = {
		{"group:stick",""},
		{"group:wood","group:wood"},
		{"group:stick","group:stick"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "decor:kitchen_chair_padded",
	recipe = {
		"decor:kitchen_chair_wood",
		"fabric:block_white",
	}
})

core.register_craft({
	type = "fuel",
	recipe = "decor:kitchen_chair_wood",
	burntime = 15,
})

core.register_craft({
	type = "fuel",
	recipe = "decor:kitchen_chair_padded",
	burntime = 15,
})

core.register_craft({
	output = "decor:standing_lamp_off",
	recipe = {
		{"decor:table_lamp_off"},
		{"group:stick"},
		{"group:stick"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "decor:table_lamp_off",
	burntime = 10,
})

core.register_craft({
	output = "decor:table_lamp_off",
	recipe = {
		{"fabric:block_white", "default:torch", "fabric:block_white"},
		{"", "group:stick", ""},
		{"", "stairs:slab_wood", ""}
	}
})

core.register_craft({
	output = "decor:toilet",
	recipe = {
		{"","","bucket:bucket_water"},
		{"group:clarble","group:clarble", "group:clarble"},
		{"", "bucket:bucket_empty", ""}
	}
})

core.register_craft({
	output = "decor:sink",
	recipe = {
		{"group:clarble","bucket:bucket_empty", "group:clarble"}
	}
})

core.register_craft({
	output = "decor:taps",
	recipe = {
		{"default:steel_ingot","bucket:bucket_water", "default:steel_ingot"}
	}
})

core.register_craft({
	output = "decor:taps_brass",
	recipe = {
		{"default:brass_ingot","bucket:bucket_water", "default:brass_ingot"}
	}
})

core.register_craft({
	output = "decor:shower_tray",
	recipe = {
		{"group:clarble","bucket:bucket_water", "group:clarble"}
	}
})

core.register_craft({
	output = "decor:shower_head",
	recipe = {
		{"default:steel_ingot", "bucket:bucket_water"}
	}
})

core.register_craft({
	output = "decor:bars 6",
	recipe = {
		{"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
		{"decor:pole_wrought_iron","decor:pole_wrought_iron","decor:pole_wrought_iron"}
	}
})

core.register_craft({
	output = "decor:L_binding_bars 3",
	recipe = {
		{"decor:bars",""},
		{"decor:bars","decor:bars"}
	}
})

core.register_craft({
	output = "decor:torch_wall 10",
	recipe = {
		{"default:coal_lump"},
		{"default:steel_ingot"}
	}
})
