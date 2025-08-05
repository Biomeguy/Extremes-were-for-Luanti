-- dye/init.lua

dye = {}

-- Load support for MT game translation.
local S = core.get_translator("dye")

-- Make dye names and descriptions available globally

dye.dyes = {
	{"white",      "White"},
	{"grey",       "Grey"},
	{"dark_grey",  "Dark Grey"},
	{"black",      "Black"},
	{"violet",     "Violet"},
	{"blue",       "Blue"},
	{"light_blue", "Light Blue"},
	{"cyan",       "Cyan"},
	{"dark_green", "Dark Green"},
	{"green",      "Green"},
	{"yellow",     "Yellow"},
	{"brown",      "Brown"},
	{"orange",     "Orange"},
	{"red",        "Red"},
	{"magenta",    "Magenta"},
	{"pink",       "Pink"},
}

-- Define items

for _, row in ipairs(dye.dyes) do
	local name = row[1]
	local description = row[2]
	local groups = {dye = 1}
	groups["color_" .. name] = 1

	core.register_craftitem("dye:" .. name, {
		inventory_image = "dye_" .. name .. ".png",
		description = S(description .. " Dye"),
		groups = groups
	})

	core.register_craft({
		output = "dye:" .. name .. " 4",
		recipe = {
			{"group:flower,color_" .. name}
		}
	})
end

-- Coal lump to black dye

core.register_craft({
	output = "dye:black 4",
	recipe = {{"group:coal"}}
})

core.register_craft({
	output = "dye:black 2",
	recipe = {{"fire:charcoal_small_lump"}}
})

-- Cactus to green dye

core.register_craft({
	type = "shapeless",
	output = "dye:green 4",
	recipe = {"default:cactus", "group:grinder"},
	replacements = {
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"},
		{"default:cactus", "default:stick 3"}
	}
})

-- Dry shrub to brown dye

core.register_craft({
	type = "shapeless",
	output = "dye:brown 4",
	recipe = {"default:dry_shrub", "group:grinder"},
	replacements = {
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"},
		{"default:dry_shrub", "default:stick"}
	}
})

-- Blueberries to violet dye

core.register_craft({
	output = "dye:violet 2",
	recipe = {{"default:blueberries"}}
})

-- Mix recipes

local dye_recipes = {
	-- src1, src2, dst
	-- RYB mixes
	{"red", "blue", "violet"}, -- "purple"
	{"yellow", "red", "orange"},
	{"yellow", "blue", "green"},
	-- RYB complementary mixes
	{"yellow", "violet", "dark_grey"},
	{"blue", "orange", "dark_grey"},
	-- CMY mixes - approximation
	{"cyan", "yellow", "green"},
	{"cyan", "magenta", "blue"},
	{"yellow", "magenta", "red"},
	-- other mixes that result in a color we have
	{"red", "green", "brown"},
	{"magenta", "blue", "violet"},
	{"green", "blue", "cyan"},
	{"pink", "violet", "magenta"},
	-- mixes with black
	{"white", "black", "grey"},
	{"grey", "black", "dark_grey"},
	{"green", "black", "dark_green"},
	{"orange", "black", "brown"},
	-- mixes with white
	{"white", "red", "pink"},
	{"white", "dark_grey", "grey"},
	{"white", "dark_green", "green"},
	{"white", "blue", "light_blue"},
}

for _, mix in pairs(dye_recipes) do
	core.register_craft({
		type = "shapeless",
		output = "dye:" .. mix[3] .. " 2",
		recipe = {"dye:" .. mix[1], "dye:" .. mix[2]},
	})
end

core.register_craft({
	type = "shapeless",
	output = "dye:dark_grey 3",
	recipe = {"dye:black", "dye:black", "dye:white"}
})

core.register_craft({
	type = "shapeless",
	output = "dye:grey 3",
	recipe = {"dye:black", "dye:white", "dye:white"}
})

-- Dummy calls to S() to allow translation scripts to detect the strings.
-- To update this run:
-- for _,e in ipairs(dye.dyes) do print(("S(%q)"):format(e[2].." Dye")) end

--[[
S("White Dye")
S("Grey Dye")
S("Dark Grey Dye")
S("Black Dye")
S("Violet Dye")
S("Blue Dye")
S("Light Blue Dye")
S("Cyan Dye")
S("Dark Green Dye")
S("Green Dye")
S("Yellow Dye")
S("Brown Dye")
S("Orange Dye")
S("Red Dye")
S("Magenta Dye")
S("Pink Dye")
--]]
