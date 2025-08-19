local S = technic.getter
local rubber_tree = core.get_modpath("rubber_tree")
local dye = core.get_modpath("dye")

-- sawdust, the finest wood/tree grinding
local sawdust = "technic:sawdust"
core.register_craftitem(sawdust, {
	description = S("Sawdust"),
	inventory_image = "technic_sawdust.png",
})
core.register_craft({ type = "fuel", recipe = sawdust, burntime = 6 })
technic.register_compressor_recipe({ input = {sawdust .. " 4"}, output = "default:wood" })

-- tree/wood grindings
local function register_tree_grinding(name, tree, wood, extract, grinding_color)
	local lname = string.lower(name)
	lname = string.gsub(lname, ' ', '_')
	local grindings_name = "technic:"..lname.."_grindings"
	local inventory_image = "technic_"..lname.."_grindings.png"
	if grinding_color then
		inventory_image = inventory_image .. "^[colorize:" .. grinding_color
	end
	core.register_craftitem(grindings_name, {
		description = S("%s Grinding"):format(S(name)),
		inventory_image = inventory_image,
	})
	core.register_craft({
		type = "fuel",
		recipe = grindings_name,
		burntime = 8,
	})
	technic.register_grinder_recipe({ input = { tree }, output = grindings_name .. " 4" })
	technic.register_grinder_recipe({ input = { grindings_name }, output = sawdust .. " 4" })
	if wood then
		technic.register_grinder_recipe({ input = { wood }, output = grindings_name })
	end
	if extract then
		technic.register_extractor_recipe({ input = { grindings_name .. " 4" }, output = extract})
		technic.register_separating_recipe({
			input = { grindings_name .. " 4" },
			output = { sawdust .. " 4", extract }
		})
	end
end

local rubber_tree_wood = rubber_tree and "rubber_tree:wood"
local default_extract = dye and "dye:brown 2"

local grinding_recipes = {
	{"Common Tree",	"group:trunk",			"group:wood",		default_extract},
	{"Rubber Tree",	"rubber_tree:trunk",	rubber_tree_wood,	"technic:raw_latex"},
	-- https://en.wikipedia.org/wiki/Catechu ancient brown dye from acacia wood
	{"Acacia", "default:acacia_trunk", "default:acacia_wood", "dye:brown 8"}
}

for _, data in pairs(grinding_recipes) do
	register_tree_grinding(unpack(data))
end
