
local S = technic.getter

technic.register_recipe_type("grinding", { description = S("Grinding") })

function technic.register_grinder_recipe(data)
	data.time = data.time or 3
	technic.register_recipe("grinding", data)
end

local recipes = {
	-- Dusts
	{"default:coal_lump",		"technic:coal_dust 2"},
	{"default:copper_lump",		"technic:copper_dust 2"},
	{"default:desert_stone",	"default:desert_sand 4"},
	{"default:gold_lump",		"technic:gold_dust 2"},
	{"default:brass_ingot",		"technic:brass_dust 1"},
	{"default:iron_lump",		"technic:wrought_iron_dust 2"},
	{"default:tin_lump",		"technic:tin_dust 2"},
	{"default:chromium_lump",	"technic:chromium_dust 2"},
	{"technic:uranium_lump",	"technic:uranium_dust 2"},
	{"default:zinc_lump",		"technic:zinc_dust 2"},
	{"technic:lead_lump",		"technic:lead_dust 2"},
	{"default:sulfur",			"technic:sulfur_dust 2"},
	{"default:mithril_lump",	"technic:mithril_dust 2"},
	{"default:silver_lump",		"technic:silver_dust 2"},
	{"default:stone",			"technic:stone_dust"},
	{"default:sand",			"technic:stone_dust"},

	-- Other
	{"default:cobble",				"default:gravel"},
	{"default:gravel",				"default:sand"},
	{"default:sandstone",			"default:sand 2"}, -- reverse recipe can be found in the compressor
	{"default:desert_sandstone",	"default:desert_sand 2"}, -- reverse recipe can be found in the compressor
	{"default:silver_sandstone",	"default:silver_sand 2"}, -- reverse recipe can be found in the compressor

	{"default:ice",				"default:snow_block"},
}

-- defuse the sandstone -> 4 sand recipe to avoid infinite sand bugs (also consult the inverse compressor recipe)
core.clear_craft({
	recipe = {{"default:sandstone"}}
})
core.clear_craft({
	recipe = {{"default:desert_sandstone"}}
})
core.clear_craft({
	recipe = {{"default:silver_sandstone"}}
})

if core.get_modpath("farming") then
	table.insert(recipes, {"farming:seed_wheat 8",   "farming:wheat_flour 1"})
end

if core.get_modpath("gloop") then
	table.insert(recipes, {"gloop:alatro_lump",   "technic:alatro_dust 2"})
	table.insert(recipes, {"gloop:kalite_lump",   "technic:kalite_dust 2"})
	table.insert(recipes, {"gloop:arol_lump",     "technic:arol_dust 2"})
	table.insert(recipes, {"gloop:talinite_lump", "technic:talinite_dust 2"})
	table.insert(recipes, {"gloop:akalin_lump",   "technic:akalin_dust 2"})
end

for _, data in pairs(recipes) do
	technic.register_grinder_recipe({input = {data[1]}, output = data[2]})
end

-- dusts
local function register_dust(name, ingot)
	local lname = string.lower(name)
	lname = string.gsub(lname, ' ', '_')
	core.register_craftitem("technic:"..lname.."_dust", {
		description = S("%s Dust"):format(S(name)),
		inventory_image = "technic_"..lname.."_dust.png",
	})
	if ingot then
		core.register_craft({
			type = "cooking",
			recipe = "technic:"..lname.."_dust",
			output = ingot,
		})
		technic.register_grinder_recipe({ input = {ingot}, output = "technic:"..lname.."_dust 1" })
	end
end

-- Sorted alphibeticaly
register_dust("Brass",				nil)
register_dust("Bronze",				"default:bronze_ingot")
register_dust("Steel",				"default:steel_ingot")
register_dust("Cast Iron",			"default:cast_iron_ingot")
register_dust("Chernobylite",		"technic:chernobylite_block")
register_dust("Chromium",			"default:chromium_ingot")
register_dust("Coal",				nil)
register_dust("Copper",				"default:copper_ingot")
register_dust("Lead",				"technic:lead_ingot")
register_dust("Gold",				"default:gold_ingot")
register_dust("Mithril",			"default:mithril_ingot")
register_dust("Silver",				"default:silver_ingot")
register_dust("Stainless Steel",	"default:stainless_steel_ingot")
register_dust("Stone",				nil)
register_dust("Sulfur",				nil)
register_dust("Tin",				"default:tin_ingot")
register_dust("Wrought Iron",		"default:wrought_iron_ingot")
register_dust("Zinc",				"default:zinc_ingot")
if core.get_modpath("gloop") then
	register_dust("Akalin",          "gloop:akalin_ingot")
	register_dust("Alatro",          "gloop:alatro_ingot")
	register_dust("Arol",            "gloop:arol_ingot")
	register_dust("Kalite",          nil)
	register_dust("Talinite",        "gloop:talinite_ingot")
end

for p = 0, 35 do
	local nici = (p ~= 0 and p ~= 7 and p ~= 35) and 1 or nil
	local psuffix = p == 7 and "" or p
	local ingot = "technic:uranium"..psuffix.."_ingot"
	local dust = "technic:uranium"..psuffix.."_dust"
	core.register_craftitem(dust, {
		description = S("%s Dust"):format(string.format(S("%.1f%%-Fissile Uranium"), p/10)),
		inventory_image = "technic_uranium_dust.png",
		on_place_on_ground = core.craftitem_place_item,
		groups = {uranium_dust=1, not_in_creative_inventory=nici},
	})
	core.register_craft({
		type = "cooking",
		recipe = dust,
		output = ingot,
	})
	technic.register_grinder_recipe({ input = {ingot}, output = dust })
end

local function uranium_dust(p)
	return "technic:uranium"..(p == 7 and "" or p).."_dust"
end
for pa = 0, 34 do
	for pb = pa+1, 35 do
		local pc = (pa+pb)/2
		if pc == math.floor(pc) then
			core.register_craft({
				type = "shapeless",
				recipe = { uranium_dust(pa), uranium_dust(pb) },
				output = uranium_dust(pc).." 2",
			})
		end
	end
end

core.register_craft({
	type = "fuel",
	recipe = "technic:coal_dust",
	burntime = 50,
})

if core.get_modpath("gloop") then
	core.register_craft({
		type = "fuel",
		recipe = "technic:kalite_dust",
		burntime = 37.5,
	})
end
