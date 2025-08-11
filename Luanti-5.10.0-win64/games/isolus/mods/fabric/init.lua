-- fabric/init.lua

-- Load support for MT game translation.
local S = core.get_translator("fabric")

core.register_node("fabric:spinning_wheel", {
	description = S("Spinning Wheel"),
	drawtype = "nodebox",
	tiles = {"default_wood.png"},
	inventory_image = "fabric_spinning_wheel.png",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = "fixed",
		fixed = {
			{-.25, -.5, -.1875, -.1875, .5, -.125},
			{-.25, -.5, .3125, -.1875, -.125, .375},
			{.1875, -.5, -.1875, .25, .5, -.125},
			{.1875, -.5, .3125, .25, -.125, .375},
			{-.1875, -.125, -.3125, -.125, -.0625, .4375},
			{.125, -.125, -.3125, .1875, -.0625, .4375},
			{-.0625, -.3125, -.5, .0625, .125, -.4375},
			{.0625, -.3125, .125, -.0625, .125, .1875},
			{-.0625, .1875, -.375, .0625, .25, .0625},
			{-.0625, -.4375, -.375, .0625, -.375, .0625},
			{-.125, -.125, -.1875, .125, -.0625, -.125},
			{-.03125, -.375, -.1875, .03125, .1875, -.125},
			{-.03125, -.125, -.4375, .03125, -.0625, .125},
			{-.1875, -.0625, .25, .1875, 0, .5},
			{-.0625, .125, .0625, .0625, .1875, .125},
			{-.0625, -.375, .0625, .0625, -.3125, .125},
			{-.0625, -.375, -.4375, .0625, -.3125, -.375},
			{-.0625, .125, -.4375, .0625, .1875, -.375},
		}
	},
	groups = {choppy=2, oddly_breakable_by_hand=1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

core.register_craft({
	output = "fabric:spinning_wheel",
	recipe = {
		{"group:stick", "default:glue", ""},
		{"group:stick", "default:steel_ingot", "group:stick"},
		{"group:wood", "group:wood", "group:slab"}
	}
})

-- string
core.register_craftitem("fabric:string", {
	description = S("String"),
	inventory_image = "fabric_string.png",
	groups = {flammable = 2},
})

-- fibre to string
core.register_craft({
	output = "fabric:string 2",
	recipe = {
		{"group:fibre"},
		{"group:fibre"},
		{"fabric:spinning_wheel"}
	},
	replacements = {{"fabric:spinning_wheel", "fabric:spinning_wheel"}}
})

core.register_craft({
	type = "fuel",
	recipe = "fabric:string",
	burntime = 1,
})

local dyes = dye.dyes

for i = 1, #dyes do
	local name, desc = unpack(dyes[i])

	local FT = "(fabric_block_".. name ..".png^[mask:fabric_item_overlay.png)"
	local color_group = "color_".. name

	core.register_node("fabric:sheet_".. name, {
		description = S(desc .." Fabric"),
		drawtype = "nodebox",
		tiles = {"fabric_block_".. name ..".png"},
		inventory_image = FT,
		wield_image = FT,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		node_box = {
			type = "fixed",
			fixed = {-.5, -.5, -.5, .5, -.45, .5}
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, fabric = 1, [color_group] = 1},
		sounds = default.node_sound_defaults(),
		on_place = core.rotate_node
	})

	core.register_node("fabric:block_".. name, {
		description = S(desc .." Fabric Block"),
		tiles = {"fabric_block_".. name ..".png"},
		is_ground_content = false,
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, fabric_block = 1, [color_group] = 1},
		sounds = default.node_sound_defaults(),
	})

	register_nine("fabric:block_".. name, "fabric:sheet_".. name)

	core.register_craft{
		type = "shapeless",
		output = "fabric:sheet_".. name,
		recipe = {"group:dye,".. color_group, "group:fabric"},
	}

	core.register_craft{
		type = "shapeless",
		output = "fabric:block_".. name,
		recipe = {"group:dye,".. color_group, "group:fabric_block"},
	}

	core.register_craft({
		type = "fuel",
		recipe = "fabric:sheet_".. name,
		burntime = 2,
	})

	core.register_craft({
		type = "fuel",
		recipe = "fabric:block_".. name,
		burntime = 19,
	})

	stairs.register_stair("block_".. name, "fabric:block_".. name,
		{snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3, [color_group] = 1},
		{"fabric_block_".. name ..".png"}, S(desc .." Fabric Block Stair"), default.node_sound_defaults(), true)
	stairs.register_stair_inner("block_".. name, "fabric:block_".. name,
		{snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3, [color_group] = 1},
		{"fabric_block_".. name ..".png"}, "", default.node_sound_defaults(), true, S("Inner ".. desc .." Fabric Block Stair"))
	stairs.register_stair_outer("block_".. name, "fabric:block_".. name,
		{snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3, [color_group] = 1},
		{"fabric_block_".. name ..".png"}, "", default.node_sound_defaults(), true, S("Outer ".. desc .." Fabric Block Stair"))
	stairs.register_slab("block_".. name, "fabric:block_".. name,
		{snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3, [color_group] = 1},
		{"fabric_block_".. name ..".png"}, S(desc .." Fabric Block Slab"), default.node_sound_defaults(), true)
end
register_nine("fabric:sheet_white", "fabric:string")

-- wool if sheep available
if core.get_modpath("mobs_animal") then
core.register_craftitem("fabric:wool_white", {
	description = S("White Wool"),
	inventory_image = "fabric_wool.png",
	groups = {flammable = 2},
})

core.register_craftitem("fabric:wool_grey", {
	description = S("Grey Wool"),
	inventory_image = "fabric_wool.png^[colorize:#5b5b5b:209",
	groups = {flammable = 2},
})

core.register_craftitem("fabric:wool_brown", {
	description = S("Brown Wool"),
	inventory_image = "fabric_wool.png^[colorize:#763300:206",
	groups = {flammable = 2},
})

core.register_craftitem("fabric:wool_dark_grey", {
	description = S("Dark Grey Wool"),
	inventory_image = "fabric_wool.png^[colorize:#3a3a3a:209",
	groups = {flammable = 2},
})

core.register_craftitem("fabric:wool_black", {
	description = S("Black Wool"),
	inventory_image = "fabric_wool.png^[colorize:#000:206",
	groups = {flammable = 2},
})

-- wool to string
core.register_craft({
	output = "fabric:string 8",
	recipe = {
		{"fabric:wool_white"},
		{"fabric:wool_white"},
		{"fabric:spinning_wheel"}
	},
	replacements = {{"fabric:spinning_wheel", "fabric:spinning_wheel"}}
})

core.register_craft({-- Notice; I know it should be 9 wools but there's no room
	output = "fabric:sheet_grey 2",
	recipe = {
		{"fabric:wool_grey", "fabric:wool_grey", "fabric:wool_grey"},
		{"fabric:wool_grey", "fabric:wool_grey", "fabric:wool_grey"},
		{"fabric:wool_grey", "fabric:spinning_wheel", "fabric:wool_grey"}
	},
	replacements = {{"fabric:spinning_wheel", "fabric:spinning_wheel"}}
})

core.register_craft({
	output = "fabric:sheet_brown 2",
	recipe = {
		{"fabric:wool_brown", "fabric:wool_brown", "fabric:wool_brown"},
		{"fabric:wool_brown", "fabric:wool_brown", "fabric:wool_brown"},
		{"fabric:wool_brown", "fabric:spinning_wheel", "fabric:wool_brown"}
	},
	replacements = {{"fabric:spinning_wheel", "fabric:spinning_wheel"}}
})

core.register_craft({
	output = "fabric:sheet_dark_grey 2",
	recipe = {
		{"fabric:wool_dark_grey", "fabric:wool_dark_grey", "fabric:wool_dark_grey"},
		{"fabric:wool_dark_grey", "fabric:wool_dark_grey", "fabric:wool_dark_grey"},
		{"fabric:wool_dark_grey", "fabric:spinning_wheel", "fabric:wool_dark_grey"}
	},
	replacements = {{"fabric:spinning_wheel", "fabric:spinning_wheel"}}
})


core.register_craft({
	output = "fabric:sheet_black 2",
	recipe = {
		{"fabric:wool_black", "fabric:wool_black", "fabric:wool_black"},
		{"fabric:wool_black", "fabric:wool_black", "fabric:wool_black"},
		{"fabric:wool_black", "fabric:spinning_wheel", "fabric:wool_black"}
	},
	replacements = {{"fabric:spinning_wheel", "fabric:spinning_wheel"}}
})
end

-- Legacy
-- Backwards compatibility with jordach's 16-color wool mod
core.register_alias("wool:dark_blue", "fabric:block_blue")
core.register_alias("wool:gold", "fabric:block_yellow")

-- Dummy calls to S() to allow translation scripts to detect the strings.
-- To update this run:
-- for _,e in ipairs(dye.dyes) do print(("S(%q)"):format(e[2].." Fabric Block")) end

--[[
S("White Fabric Block")
S("Grey Fabric Block")
S("Dark Grey Fabric Block")
S("Black Fabric Block")
S("Violet Fabric Block")
S("Blue Fabric Block")
S("Light Blue Fabric Block")
S("Cyan Fabric Block")
S("Dark Green Fabric Block")
S("Green Fabric Block")
S("Yellow Fabric Block")
S("Brown Fabric Block")
S("Orange Fabric Block")
S("Red Fabric Block")
S("Magenta Fabric Block")
S("Pink Fabric Block")
--]]
