
local S = technic.getter

technic.register_recipe_type("extracting", { description = S("Extracting") })

function technic.register_extractor_recipe(data)
	data.time = data.time or 4
	technic.register_recipe("extracting", data)
end

if core.get_modpath("dye") then
	-- check if we are using dye or unifieddyes
	local unifieddyes = core.get_modpath("unifieddyes")

	-- register recipes with the same crafting ratios as `dye` provides
	local dye_recipes = {
		{"technic:coal_dust",		"dye:black 2"},
		{"default:grass_1",			"dye:green 1"},
		{"default:dry_shrub",		"dye:brown 1"},
		{"default:jungle_grass",	"dye:green 2"},
		{"default:cactus",			"dye:green 4"},
		{"flowers:geranium",		"dye:blue 4"},
		{"flowers:daisy",			"dye:white 4"},
		{"flowers:dandelion",		"dye:yellow 4"},
		{"flowers:tulip",			"dye:orange 4"},
		{"flowers:rose",			"dye:red 4"},
		{"flowers:viola",			"dye:violet 4"},
		{"farming:blackberries",	unifieddyes and "unifieddyes:magenta_s50 4" or "dye:violet 4"},
		{"farming:blueberries",		unifieddyes and "unifieddyes:magenta_s50 4" or "dye:magenta 4"},
	}

	for _, data in ipairs(dye_recipes) do
		technic.register_extractor_recipe({input = {data[1]}, output = data[2]})
	end

	-- overwrite the existing crafting recipes
	local dyes = {"white", "red", "yellow", "blue", "violet", "orange"}
	for _, color in ipairs(dyes) do
		core.clear_craft({
			type = "shapeless",
			recipe = {"group:flower,color_"..color},
		})
		core.register_craft({
			type = "shapeless",
			output = "dye:"..color.." 1",
			recipe = {"group:flower,color_"..color},
		})
	end

	core.clear_craft({
		type = "shapeless",
		recipe = {"group:coal"},
	})
	core.register_craft({
		type = "shapeless",
		output = "dye:black",
		recipe = {"group:coal"},
	})

	if unifieddyes then
		core.clear_craft({
			type = "shapeless",
			recipe = {"default:cactus"},
		})
		core.register_craft({
			type = "shapeless",
			output = "dye:green",
			recipe = {"default:cactus"},
		})
	end
end
