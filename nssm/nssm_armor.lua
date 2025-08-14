-- Armors
local stats = {
	croco = {name= "Crocodile", armor= 3, heal= 0, use= 450},
	ant = {name= "Ant", armor= 3, heal= 0, use= 400},
	mor = {name= "Morlu", armor= 5.3, heal= 0, use= 30},
	sky = {name= "Sky", armor= 4.2, heal= 12, use= 100},
	sandworm = {name= "Sandworm", armor= 3.4, heal= 0, use= 400},
	web = {name= "Cobweb String", armor= 2.4, heal= 0, use= 900},
	denseweb = {name= "Dense Cobweb String", armor= 3.5, heal= 0, use= 400}
}

for k, v in pairs(stats) do
	core.register_tool("nssm:helmet_".. k, {
		description = v.name .." Helmet",
		inventory_image ="inv_helmet_".. k ..".png",
		groups = {armor_head=math.floor(4* v.armor), armor_heal= v.heal, armor_use= v.use},
		wear = 0
	})
	core.register_tool("nssm:chestplate_".. k, {
		description = v.name .." Chestplate",
		inventory_image ="inv_chestplate_".. k ..".png",
		groups = {armor_torso=math.floor(6* v.armor), armor_heal= v.heal, armor_use= v.use},
		wear = 0
	})
	core.register_tool("nssm:leggings_".. k, {
		description = v.name .." Leggings",
		inventory_image = "inv_leggings_".. k ..".png",
		groups = {armor_legs=math.floor(5* v.armor), armor_heal= v.heal, armor_use= v.use},
		wear = 0
	})
	core.register_tool("nssm:boots_".. k, {
		description = v.name .." Boots",
		inventory_image ="inv_boots_".. k ..".png",
		groups = {armor_feet=math.floor(3* v.armor), armor_heal= v.heal, armor_use= v.use},
		wear = 0
	})
end

local materials = {
	croco= "nssm:crocodile_skin",
	ant= "nssm:ant_hard_skin",
	mor= "nssm:lustful_moranga",
	sandworm= "nssm:sandworm_skin",
	sky= "nssm:sky_iron",
	web= "nssm:web_string",
	denseweb= "nssm:dense_web_string"
}

for k, v in pairs(materials) do
	core.register_craft({
		output = "nssm:helmet_".. k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{"", "", ""}
		}
	})
	core.register_craft({
		output = "nssm:chestplate_".. k,
		recipe = {
			{v, "", v},
			{v, v, v},
			{v, v, v}
		}
	})
	core.register_craft({
		output = "nssm:leggings_".. k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{v, "", v}
		}
	})
	core.register_craft({
		output = "nssm:boots_".. k,
		recipe = {
			{v, "", v},
			{v, "", v}
		}
	})
end

--shields
if core.get_modpath("shields") then
	local stats = {
		crab = {name= "Crab", armor= 4, heal= 0, use= 500},
		ice = {name= "Ice", armor= 3.5, heal= 0, use= 600},
		mor = {name= "Morlu", armor= 5, heal= 11, use= 100},
		masticone = {name= "Masticone", armor= 4.5, use= 300},
		mantis = {name= "Mantis", armor= 3, use= 500}
	}
	local materials = {
		crab = "nssm:crab_carapace_fragment",
		ice = "default:ice",
		mor = "nssm:lustful_moranga",
		masticone = "nssm:masticone_skull_fragments",
		mantis = "nssm:mantis_skin"
	}
	for k, v in pairs(stats) do
		core.register_tool("nssm:shield_".. k, {
			description = v.name .." Shield",
			inventory_image ="inv_shield_".. k ..".png",
			groups = {armor_shield= math.floor(5* v.armor), armor_heal= v.heal, armor_use= v.use},
			wear = 0
		})

		local m = materials[k]
		core.register_craft({
			output = "nssm:shield_".. k,
			recipe = {
				{m, m, m},
				{m, m, m},
				{"", m, ""}
			}
		})
	end
end

-- Special objects masticone helmet, crown, crowned masticone helmet
local stats = {
	masticone = {name= "Masticone Head", armor= 4, heal= 0, use= 100},
	crown = {name= "Crown", armor= 2, heal= 0, use= 50},
	masticone_crowned = {name= "Crowned Masticone Head", armor= 6, heal= 0, use= 20},
}

for k, v in pairs(stats) do
	core.register_tool("nssm:helmet_".. k, {
		description = v.name,
		inventory_image ="inv_helmet_".. k ..".png",
		groups = {armor_head= math.floor(5* v.armor), armor_heal= v.heal, armor_use= v.use},
		wear = 0
	})
end

core.register_tool("nssm:chestplate_snake", {
	description = "Snake Scute Chestplate",
	inventory_image ="inv_chestplate_snake.png",
	groups = {armor_torso= 40, armor_heal= 0, armor_use= 100},
	wear = 0
})

core.register_craft({
	output = "nssm:chestplate_snake",
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "nssm:snake_scute", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
	}
})

local tmp = "nssm:masticone_skull_fragments"

core.register_craft({
	output = "nssm:helmet_masticone",
	recipe = {
		{tmp, tmp, tmp},
		{tmp, tmp, tmp},
		{tmp, tmp, tmp}
	}
})

core.register_craft({
	output = "nssm:helmet_masticone_crowned",
	recipe = {
		{"", "nssm:helmet_crown", ""},
		{"", "nssm:helmet_masticone", ""},
		{"", "", ""}
	}
})
