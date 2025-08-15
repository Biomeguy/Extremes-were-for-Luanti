local stats = {
	lead = { name="Lead", material="technic:lead_ingot", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	tin = { name="Tin", material="default:tin_ingot", armor=1.6, heal=0, use=750, radiation=37 }
}

local parts = {
	helmet = { place="head", name="Helmet", level=5, radlevel = .1, craft={{1,1,1},{1,0,1}} },
	chestplate = { place="torso", name="Chestplate", level=8, radlevel = .35, craft={{1,0,1},{1,1,1},{1,1,1}} },
	leggings = { place="legs", name="Leggings", level=7, radlevel = .15, craft={{1,1,1},{1,0,1},{1,0,1}} },
	boots = { place="feet", name="Boots", level=4, radlevel = .1, craft={{1,0,1},{1,0,1}} },
}
if core.get_modpath("shields") then
	parts.shield = { place="shield", name="Shield", level=5, radlevel=0, craft={{1,1,1},{1,1,1},{0,1,0}} }
end

-- Makes a craft recipe based on a template
-- template is a recipe-like table but indices are used instead of actual item names:
-- 0 means nothing, everything else is treated as an index in the materials table
local function make_recipe(template, materials)
	local recipe = {}
	for j, trow in ipairs(template) do
		local rrow = {}
		for i, tcell in ipairs(trow) do
			if tcell == 0 then
				rrow[i] = ""
			else
				rrow[i] = materials[tcell]
			end
		end
		recipe[j] = rrow
	end
	return recipe
end

for key, armor in pairs(stats) do
	for partkey, part in pairs(parts) do
		local partname = "technic_armor:"..partkey.."_"..key
		core.register_tool(partname, {
			description = armor.name.." "..part.name,
			inventory_image = "technic_armor_inv_"..partkey.."_"..key..".png",
			groups = {["armor_"..part.place]=1, armor_heal=armor.heal, armor_use=armor.use, armor_radiation=math.floor(part.radlevel*armor.radiation)},
			armor_groups = {fleshy=math.floor(part.level*armor.armor)},
			damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		})
		core.register_craft({
			output = partname,
			recipe = make_recipe(part.craft, {armor.material}),
		})
	end
end
