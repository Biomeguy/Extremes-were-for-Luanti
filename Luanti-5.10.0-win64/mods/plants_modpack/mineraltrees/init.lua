--============Mineral Trees Mod for Luanti 0.4.12!=============--
--Notice: All material shown here is property of Gravelpunch <gravelpunch@gmail.com>, (C) 2015, licensed under GLPGL and the art under CC-BY-SA 3.0 unported. See readme.txt for more details.

mineraltrees = {}

--sets up tables for mineral trees--
mineraltrees.bloom_array = {}
mineraltrees.bark_array = {}
mineraltrees.tree_array = {}

modpath = core.get_modpath("mineraltrees")
--loads config options
dofile(modpath.."/config.txt")
--loads mineraltrees.register_mineral_tree
dofile(modpath.."/tree.lua")

mineraltrees.mineraltree_defs = {
	coaltree = {
		name = "Coal",
		has_bloom = false,
		rarity = mineraltrees.coal_rarity,
		enabled = mineraltrees.enable_coal_tree
	},
	irontree = {
		name = "Iron",
		has_bloom = true,
		rarity = mineraltrees.iron_rarity,
		enabled = mineraltrees.enable_iron_tree
	},
	coppertree = {
		name = "Copper",
		has_bloom = true,
		rarity = mineraltrees.copper_rarity,
		enabled = mineraltrees.enable_copper_tree
	},
	goldtree = {
		name = "Gold",
		has_bloom = true,
		rarity = mineraltrees.gold_rarity,
		enabled = mineraltrees.enable_gold_tree
	},
	mesetree = {
		name = "Mese",
		has_bloom = true,
		rarity = mineraltrees.mese_rarity,
		enabled = mineraltrees.enable_mese_tree
	},
	diamondtree = {
		name = "Diamond",
		has_bloom = true,
		rarity = mineraltrees.diamond_rarity,
		enabled = mineraltrees.enable_diamond_tree
	}
}

mineraltrees.sapling_rarity_array = {}

--registers all mineraltrees
for _, mineraltree_def in pairs(mineraltrees.mineraltree_defs) do
	mineraltrees.register_mineral_tree(mineraltree_def.name, mineraltree_def.has_bloom, mineraltree_def.rarity, mineraltree_def.enabled)
end

function table.contains(table, element)
	for key, value in pairs(table) do
		if value == element then
			return key
		end
	end
	return
end

--Bark Splitter definition--
core.register_craftitem("mineraltrees:splitter", {
	description = "Bark Splitter",
	inventory_image = "mineraltrees_splitter.png",
	weild_image = "mineraltrees_splitter.png",
	weild_scale = 1.7,
	stack_max = 1,
	on_use = function(itemstack, user, pointd)
		if pointd.type == "node" then
			pointed_pos = pointd.under
			pointed_node = core.get_node(pointed_pos)
			print(pointed_node.name)
			
			node_index = table.contains(mineraltrees.tree_array, pointed_node.name)
			
			if (mineraltrees.tree_array[node_index] ~= nil) and (mineraltrees.bark_array[node_index] ~= nil) then
				user:get_inventory():add_item("main", mineraltrees.bark_array[node_index])
				core.set_node(pointed_pos, {name="mineraltrees:barelog"})
			end
		end
		return itemstack
	end		
})

--Bare Log definition
core.register_node("mineraltrees:barelog", {
	description = "Bare Log",
	tiles = {"mineraltrees_barelog.png", "mineraltrees_barelog.png", "mineraltrees_barelogside.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	on_place = core.rotate_node
})

core.register_craft({
	output = "default:copper_lump",
	recipe = {
		{"mineraltrees:Copper_bloom", "mineraltrees:Copper_bloom", "mineraltrees:Copper_bloom"},
		{"mineraltrees:Copper_bloom", "mineraltrees:Copper_bloom", "mineraltrees:Copper_bloom"},
		{"mineraltrees:Copper_bloom", "mineraltrees:Copper_bloom", "mineraltrees:Copper_bloom"}
	}
})

core.register_craft({
	output = "default:iron_lump",
	recipe = {
		{"mineraltrees:Iron_bloom", "mineraltrees:Iron_bloom", "mineraltrees:Iron_bloom"},
		{"mineraltrees:Iron_bloom", "mineraltrees:Iron_bloom", "mineraltrees:Iron_bloom"},
		{"mineraltrees:Iron_bloom", "mineraltrees:Iron_bloom", "mineraltrees:Iron_bloom"}
	}
})

core.register_craft({
	output = "default:mese_crystal",
	recipe = {
		{"mineraltrees:Mese_bloom", "mineraltrees:Mese_bloom", "mineraltrees:Mese_bloom"},
		{"mineraltrees:Mese_bloom", "mineraltrees:Mese_bloom", "mineraltrees:Mese_bloom"},
		{"mineraltrees:Mese_bloom", "mineraltrees:Mese_bloom", "mineraltrees:Mese_bloom"}
	}
})

core.register_craft({
	output = "default:diamond",
	recipe = {
		{"mineraltrees:Diamond_bloom", "mineraltrees:Diamond_bloom", "mineraltrees:Diamond_bloom"},
		{"mineraltrees:Diamond_bloom", "mineraltrees:Diamond_bloom", "mineraltrees:Diamond_bloom"},
		{"mineraltrees:Diamond_bloom", "mineraltrees:Diamond_bloom", "mineraltrees:Diamond_bloom"}
	}
})

core.register_craft({
	output = "default:gold_lump",
	recipe = {
		{"mineraltrees:Gold_bloom", "mineraltrees:Gold_bloom", "mineraltrees:Gold_bloom"},
		{"mineraltrees:Gold_bloom", "mineraltrees:Gold_bloom", "mineraltrees:Gold_bloom"},
		{"mineraltrees:Gold_bloom", "mineraltrees:Gold_bloom", "mineraltrees:Gold_bloom"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "mineraltrees:splitter",
	recipe = {"default:axe_steel"}
})
