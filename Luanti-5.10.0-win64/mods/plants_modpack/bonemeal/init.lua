
bonemeal = {}

local path = core.get_modpath("bonemeal")
local min, max, random = math.min, math.max, math.random


-- Load support for intllib.
local S = core.get_translator and core.get_translator("bonemeal") or
		dofile(path .. "/intllib.lua")


-- default crops
local crops = {
	{"default:poison_ivy_", "default:poison_ivy_3", nil, true},
	{"default:kelp_brown", 112, nil, true},
	{"default:kelp_dark_green", 112, nil, true},
	{"default:kelp_green", 112, nil, true},
	{"default:kelp_yellow", 112, nil, true},
	{"default:seaweed", 112, nil, true},
	{"default:sand_with_alga_", "default:alga", nil, true},
	{"default:sand_with_seagrass_", "default:seagrass", nil, true},
	{"farming:cotton_S", 8, "farming:seed_cotton"},
	{"farming:wheat_S", 8, "farming:seed_wheat"},
	{"farming:alfalfa_S", 9, "farming:seed_alfalfa"},
	{"farming:amaranth_", "farming:amaranth_6", "farming:seed_amaranth", true},
	{"farming:amaranth2_", "farming:amaranth2_6", nil, true},
	{"farming:artichoke_S", 6},
	{"farming:asparagus_S", 7},
	{"farming:barley_S", 7, "farming:seed_barley"},
	{"farming:beanpole_S", 6},
	{"farming:blackberry_S", 6},
	{"farming:blackcurrant_S", 7},
	{"farming:blueberry_S", 7},
	{"farming:buckwheat_S", 5, "farming:seed_buckwheat"},
	{"farming:carrot_S", 8},
	{"farming:wildcarrot_S", 8},
	{"farming:cauliflower_S", 9},
	{"farming:celery_S", 5},
	{"farming:chili_S", 9},
	{"farming:chive_S", 6},
	{"farming:cilantro_S", 5},
	{"farming:coffee_S", 5},
	{"farming:cucumber_S", 7},
	{"farming:flax_S", 8, "farming:seed_flax"},
	{"farming:garlic_S", 6},
	{"farming:ginger_S", 6},
	{"farming:gooseberry_S", 8},
	{"farming:grapes_S", 11},
	{"farming:green_onion_S", 5},
	{"farming:habanero_S", 8},
	{"farming:hemp_S", 8, "farming:seed_hemp"},
	{"farming:hops_S", 9, "farming:hops_seed_with_bine"},
	{"farming:huckleberry_S", 6},
	{"farming:kohlrabi_S", 7},
	{"farming:leek_S", 6},
	{"farming:iceberg_lettuce_S", 7},
	{"farming:romaine_lettuce_S", 5},
	{"farming:maize_S", 10},
	{"farming:melon_S", 7},
	{"farming:mint_S", 5},
	{"farming:mustard_S", 8},
	{"farming:oat_S", 8, "farming:seed_oat"},
	{"farming:onion_S", 5},
	{"farming:parsley_S", 5},
	{"farming:peanut_S", 7},
	{"farming:pea_S", 8},
	{"farming:peppercorn_S", 7},
	{"farming:pineapple_S", 10},
	{"farming:potato_S", 4},
	{"farming:pumpkin_S", 8},
	{"farming:quinoa_S", 6, "farming:seed_quinoa"},
	{"farming:raddish_S", 6},
	{"farming:raspberry_S", 6},
	{"farming:red_beet_S", 6},
	{"farming:rhubarb_S", 4},
	{"farming:rice_S", 6, "farming:seed_rice"},
	{"farming:rosebush_S", 8},
	{"farming:rosemary_S", 6},
	{"farming:rye_S", 8, "farming:seed_rye"},
	{"farming:strawberry_S", 10},
	{"farming:sugar_beet_S", 6},
	{"farming:sunflower_S", 10},
	{"farming:sweet_pepper_S", 10},
	{"farming:tea_S", 7},
	{"farming:teosinte_S", 8},
	{"farming:tomato_S", 9},
	{"farming:turmeric_S", 7},
	{"farming:vanillapole_S", 7},
	{"farming:zucchini_S", 8}
}


-- default saplings
local saplings = {
	{"default:acacia_sapling", default.grow_new_acacia_tree, "soil"},
	{"default:apple_sapling", default.grow_new_apple_tree, "soil"},
	{"default:aspen_sapling", default.grow_new_aspen_tree, "soil"},
	{"default:sapling", default.grow_new_beech_tree, "soil"},
	{"default:birch_sapling", default.grow_new_birch_tree, "soil"},
	{"default:coco_palm_sapling", default.grow_new_coco_palm, "sand"},
	{"default:jungle_sapling", default.grow_new_jungle_tree, "soil"},
	{"default:emergent_jungle_sapling", default.grow_new_emergent_jungle_tree, "soil"},
	{"default:mangrove_sapling", nil, "soil"},
	{"default:orange_sapling", default.grow_new_orange_tree, "soil"},
	{"default:pine_sapling", default.grow_new_pine_tree, "soil"},
	{"default:large_cactus_seedling", default.grow_large_cactus, "sand"},
	{"default:bush_sapling", default.grow_bush, "soil"},
	{"default:blueberry_bush_sapling", default.grow_blueberry_bush, "soil"},
	{"default:acacia_bush_sapling", default.grow_acacia_bush, "soil"},
	{"default:pine_bush_sapling", default.grow_pine_bush, "soil"},
	{"farming:avocado_sapling", farming.grow_avocado_tree, "soil"},
	{"farming:cherry_sapling", farming.grow_cherry_tree, "soil"},
	{"farming:cinnamon_sapling", farming.grow_cinnamon_tree, "soil"},
	{"farming:cocoa_sapling", farming.grow_cocoa_tree, "soil"},
	{"farming:date_palm_sapling", farming.grow_date_palm, "sand"},
	{"farming:fig_sapling", farming.grow_fig_tree, "soil"},
	{"farming:hazelnut_sapling", farming.grow_hazelnut_tree, "soil"},
	{"farming:lemon_sapling", farming.grow_lemon_tree, "soil"},
	{"farming:lime_sapling", farming.grow_lime_tree, "soil"},
	{"farming:mandarin_sapling", farming.grow_mandarin_tree, "soil"},
	{"farming:mango_sapling", farming.grow_mango_tree, "soil"},
	{"farming:mirabelle_sapling", farming.grow_mirabelle_tree, "soil"},
	{"farming:nutmeg_sapling", farming.grow_nutmeg_tree, "soil"},
	{"farming:olive_sapling", farming.grow_olive_tree, "soil"},
	{"farming:peach_sapling", farming.grow_peach_tree, "soil"},
	{"farming:pear_sapling", farming.grow_pear_tree, "soil"},
	{"farming:pecan_sapling", farming.grow_pecan_tree, "soil"},
	{"farming:plum_sapling", farming.grow_plum_tree, "soil"},
	{"farming:pomegranate_sapling", farming.grow_pomegranate_tree, "soil"},
	{"farming:walnut_sapling", farming.grow_walnut_tree, "soil"},
}

-- helper tables ( "" denotes a blank item )
local green_grass = {
	"default:grass_2", "default:grass_3", "default:grass_4",
	"default:grass_5", "", ""
}

local savanna_grass = {
	"default:savanna_grass_2", "default:savanna_grass_3", "default:savanna_grass_4",
	"default:savanna_grass_5", "", ""
}

-- loads mods then add all in-game flowers except waterlily
local flowers = {}

core.after(0.1, function()

	for node, def in pairs(core.registered_nodes) do

		if def.groups
		and def.groups.flower
		and not node:find("waterlily") then--and not node:find("decor:potted_")
			flowers[#flowers + 1] = node
		end
	end
end)


local snow_plant = {"default:dry_shrub", "", ""}
if core.registered_items["ethereal:snowygrass"] then
	snow_plant = {"default:dry_shrub", "ethereal:snowygrass", "", ""}
end

local ssand_plant = {"default:dry_shrub", "", "", ""}
local sand_plant = {"default:dry_shrub", "default:marram_grass_1", "default:marram_grass_2", "default:marram_grass_3", "", ""}
local dsand_plant = {"default:dry_shrub", "", "", ""}
if core.get_modpath("ecology") then
	ssand_plant = {"default:dry_shrub", "ecology:arctic_carrot", "", "", ""}
	sand_plant = {"default:dry_shrub", "default:marram_grass_1", "default:marram_grass_2", "default:marram_grass_3", "ecology:aloe_vera", "ecology:small_cactus", "ecology:prickly_pear", "ecology:dark_cactus", "", ""}
	dsand_plant = {"default:dry_shrub", "ecology:fire_flower", "ecology:aloe_vera", "ecology:small_cactus", "ecology:prickly_pear", "ecology:fireflower", "ecology:eyeweed", "ecology:small_cactus_dark", "ecology:sunshroom", "ecology:small_cactus_prikly", "ecology:small_cactus_prikly2", "", ""}
end

-- default biomes deco
local deco = {
	{"default:clay_dirt", savanna_grass, {}},
	{"default:clay_dirt_with_savanna_grass", savanna_grass, {}},
	{"default:dirt_with_savanna_grass", savanna_grass, flowers},
	{"default:dirt_with_rainforest_litter", {"default:grass_3", "default:grass_4", "default:grass_5", ""},
		{"default:jungle_grass_3", "default:jungle_grass_2", "default:boston_fern", "", ""}},
	{"default:dirt_with_coniferous_litter", {"default:fern_1", "default:fern_2", "default:fern_3", "", ""}, {}},
	{"default:dirt_with_snow", snow_plant, {}},
	{"default:dirt_with_blue_moss", {"default:frost_grass", "", "", "", ""}, {}},
	{"default:sand", {}, sand_plant},
	{"default:desert_sand", {}, dsand_plant},
	{"default:silver_sand", {}, ssand_plant},
}


--
-- local functions
--


-- particles
local function particle_effect(pos)

core.add_particlespawner({
	amount = 4,
	time = .15,
	pos = pos,
	minvel = {x = -1, y = 2, z = -1},
	maxvel = {x = 1, y = 4, z = 1},
	minacc = {x = -1, y = -1, z = -1},
	maxacc = {x = 1, y = 1, z = 1},
	exptime = 1,
	minsize = 1,
	maxsize = 3,
	texture = "bonemeal_particle.png"})
end


-- tree type check
local function grow_tree(pos, object)

	if type(object) == "table" and object.axiom then
		-- grow L-system tree
		core.remove_node(pos)
		core.spawn_tree(pos, object)

	elseif type(object) == "string" and core.registered_nodes[object] then
		-- place node
		core.set_node(pos, {name = object})

	elseif type(object) == "function" then
		-- function
		object(pos)
	end
end


-- sapling check
local function check_sapling(pos, nodename, strength)

	-- what is sapling placed on?
	local under = core.get_node({x = pos.x, y = pos.y - 1, z = pos.z})

	local can_grow, grow_on

	-- check list for sapling and function
	for n = 1, #saplings do

	if saplings[n][1] == nodename then

		grow_on = saplings[n][3]

		-- sapling grows on top of specific node
		if grow_on
		and grow_on ~= "soil"
		and grow_on ~= "sand"
		and grow_on == under.name then
			can_grow = true
		end

		-- sapling grows on top of soil (default)
		if can_grow == nil
		and (grow_on == nil or grow_on == "soil")
		and core.get_item_group(under.name, "soil") > 0 then
			can_grow = true
		end

		-- sapling grows on top of sand
		if can_grow == nil
		and grow_on == "sand"
		and core.get_item_group(under.name, "sand") > 0 then
			can_grow = true
		end

		local height = core.registered_nodes[saplings[n][1]].grown_height
		-- is there enough height to grow sapling?
		if not height or not enough_height(pos, height) then
			can_grow = nil
		end

		-- check if we can grow sapling
		if can_grow then
			local meta = core.get_meta(pos)
			meta:set_int("light_level", strength+1)

			particle_effect(pos)

			if saplings[n][2] == nil then
				core.get_node_timer(pos):start(0)
				return true
			end
			grow_tree(pos, saplings[n][2])
			return true
		end
	end
	end
end


-- crops check
local function check_crops(pos, nodename, strength, nodeparam2)

	local mod, crop, stage, nod, def

	-- grow registered crops
	for n = 1, #crops do

	if nodename:find(crops[n][1]) or nodename == crops[n][3] then

		if crops[n][4] then

			-- stop if fully grown
			if nodename == crops[n][2] or nodeparam2 == crops[n][2] then return end

			local meta = core.get_meta(pos)
			meta:set_int("light_level", strength)	meta:set_int("soil_need", 1)
			core.get_node_timer(pos):start(0)

			particle_effect(pos)

			return true
		end

		-- stop if fully grown
		if nodename == crops[n][1] .. crops[n][2] then return end

		-- separate mod and node name
		mod = nodename:split(":")[1] .. ":"
		crop = nodename:split(":")[2]

		-- get stage number or set to 0 for seed
		stage = tonumber( crop:split("S")[2] ) or 0
		stage = min(stage + strength, crops[n][2])

		-- check for place_param2 setting
		nod = crops[n][1] .. stage
		def = core.registered_nodes[nod]
		def = def and def.place_param2 or 0

		core.set_node(pos, {name = nod, param2 = def})

		particle_effect(pos)

		return true
	end
	end
end


-- check soil for specific decoration placement
local function check_soil(pos, nodename, strength)

	-- set radius according to strength
	local side = strength - 1
	local tall = max(strength - 2, 0)
	local floor
	local groups = core.registered_items[nodename]
		and core.registered_items[nodename].groups or {}

	-- only place decoration on one type of surface
	if groups.soil then
		floor = {"group:soil"}
	elseif groups.sand then
		floor = {"group:sand"}
	else
		floor = {nodename}
	end

	-- get area of land with free space above
	local dirt = core.find_nodes_in_area_under_air(
		{x = pos.x - side, y = pos.y - tall, z = pos.z - side},
		{x = pos.x + side, y = pos.y + tall, z = pos.z + side}, floor)

	-- set default grass and decoration
	local grass = green_grass
	local decor = flowers

	-- choose grass and decoration to use on dirt patch
	for n = 1, #deco do

		-- do we have a grass match?
		if nodename == deco[n][1] then
			grass = deco[n][2] or {}
			decor = deco[n][3] or {}
		end
	end

	local pos2, nod, def

	-- loop through soil
	for _, n in pairs(dirt) do

		if random(5) == 5 then
			if decor and #decor > 0 then
				-- place random decoration (rare)
				local dnum = #decor or 1
				nod = decor[random(dnum)] or ""
			end
		else
			if grass and #grass > 0 then
				-- place random grass (common)
				local dgra = #grass or 1
				nod = #grass > 0 and grass[random(dgra)] or ""
			end
		end

		pos2 = n

		if core.get_node(pos2).name == "default:dirt_with_short_grass" then
			core.set_node(pos2, {name = "default:dirt_with_grass"})
			particle_effect(pos2)
		end

		pos2.y = pos2.y + 1

		if nod and nod ~= "" then

			-- get crop param2 value
			def = core.registered_nodes[nod]
			def = def and def.place_param2

			-- if param2 not preset then get from existing node
			if not def then
				local node = core.get_node_or_nil(pos2)
				def = node and node.param2 or 0
			end

			core.set_node(pos2, {name = nod, param2 = def})
		end

		particle_effect(pos2)
	end
end


-- global functions


-- add to sapling list
-- {sapling node, schematic or function name, "soil"|"sand"|specific_node}
--e.g. {"default:sapling", default.grow_new_apple_tree, "soil"}

function bonemeal:add_sapling(list)

	for n = 1, #list do
		saplings[#saplings + 1] = list[n]
	end
end


-- add to crop list to force grow
-- {crop name start_, growth steps, seed node (if required)}
-- e.g. {"farming:wheat_S", 8, "farming:seed_wheat"}
function bonemeal:add_crop(list)

	for n = 1, #list do
		crops[#crops + 1] = list[n]
	end
end


-- add grass and flower/plant decoration for specific dirt types
--  {dirt_node, {grass_nodes}, {flower_nodes}
-- e.g. {"default:dirt_with_savanna_grass", savanna_grass, flowers}
-- if an entry already exists for a given dirt type, it will add new entries and all empty
-- entries, allowing to both add decorations and decrease their frequency.
function bonemeal:add_deco(list)

	for l = 1, #list do

		for n = 1, #deco do

			-- update existing entry
			if list[l][1] == deco[n][1] then

				-- adding grass types
				for _, extra in pairs(list[l][2]) do

					if extra ~= "" then

						for _, entry in pairs(deco[n][2]) do

							if extra == entry then
								extra = false
								break
							end
						end
					end

					if extra then
						deco[n][2][#deco[n][2] + 1] = extra
					end
				end

				-- adding decoration types
				for _, extra in ipairs(list[l][3]) do

					if extra ~= "" then

						for __, entry in pairs(deco[n][3]) do

							if extra == entry then
								extra = false
								break
							end
						end
					end

					if extra then
						deco[n][3][#deco[n][3] + 1] = extra
					end
				end

				list[l] = false
				break
			end
		end

		if list[l] then
			deco[#deco + 1] = list[l]
		end
	end
end


-- definitively set a decration scheme
-- this function will either add a new entry as is, or replace the existing one
function bonemeal:set_deco(list)

	for l = 1, #list do

		for n = 1, #deco do

			-- replace existing entry
			if list[l][1] == deco[n][1] then
				deco[n][2] = list[l][2]
				deco[n][3] = list[l][3]
				list[l] = false
				break
			end
		end

		if list[l] then
			deco[#deco + 1] = list[l]
		end
	end
end


-- global on_use function for bonemeal
function bonemeal:on_use(pos, strength, node)

	-- get node pointed at
	local node = node or core.get_node(pos)

	-- return if nothing there
	if node.name == "ignore" then
		return
	end

	-- make sure strength is between 1 and 4
	strength = strength or 1
	strength = max(strength, 1)
	strength = min(strength, 4)

	-- reed and cactus
	if node.name == "default:reed" and default.grow_reed(pos, node) then
		particle_effect(pos)
		return true

	elseif node.name == "default:cactus" and default.grow_cactus(pos, node) then
		particle_effect(pos)
		return true
	end

	-- grow grass and flowers
	if core.get_item_group(node.name, "soil") > 0
	or core.get_item_group(node.name, "sand") > 0
	or core.get_item_group(node.name, "can_bonemeal") > 0 then
		check_soil(pos, node.name, strength)
		return true
	end

	-- light check depending on strength (strength of 4 = no light needed)
	if (core.get_node_light(pos) or 0) < (12 - (strength * 3)) then
		return
	end

	-- check for tree growth if pointing at sapling
	if (core.get_item_group(node.name, "sapling") > 0 or core.get_item_group(node.name, "sapling2") > 0) and random(5 - strength) == 1 then
		if check_sapling(pos, node.name, strength) then
			return true
		end
		return
	end

	-- check for crop growth
	if check_crops(pos, node.name, strength, node.param2) then
		return true
	end

	if core.get_item_group(node.name, "flora") > 0 or core.get_item_group(node.name, "water_flora") > 0 or node.name == "default:poison_ivy_3" then
	pos.y = pos.y - 1
	local under = core.get_node(pos)
	pos.y = pos.y + 1
	if core.get_item_group(under.name, "sand") == 1 and under.name ~= "default:sand" then
		core.set_node(pos, {name = "default:dry_shrub"})
		return
	end

	if core.get_item_group(under.name, "soil") == 0 then
		if node.name ~= "ethereal:dry_shrub" and under.name ~= "ethereal:dry_dirt_with_fiery_grass" then
			return
		end
	end
	local pos0 = vector.subtract(pos, strength)
	local pos1 = vector.add(pos, strength)
	local ns = core.find_nodes_in_area_under_air(pos0, pos1, "group:soil")
	if node.name == "ethereal:dry_shrub" then
		ns = core.find_nodes_in_area_under_air(pos0, pos1, "ethereal:dry_dirt_with_fiery_grass")
	end
	if ns and #ns > 0 then
		for _ = 1, math.min(strength, #ns) do
			local p = table.copy(ns[math.random(#ns)])
			p.y = p.y + 1
			if core.get_item_group(node.name, "water_flora") > 0 and not core.find_node_near(p, 1, "group:water") then return end
			if node.name == "default:poison_ivy_3" then node.name = "default:poison_ivy_1" end
			if node.name == "ecology:sumbrellia_full" then node.name = "ecology:sumbrellia" end
			core.set_node(p, {name = node.name})
			particle_effect(p)
		end
		particle_effect(pos)
		return true
	end
	return
	end
end


--
-- items
--


-- mulch (strength 1)
core.register_craftitem("bonemeal:mulch", {
	description = S("Mulch"),
	inventory_image = "bonemeal_mulch.png",

	on_use = function(itemstack, user, pointd)

		-- did we point at a node?
		if pointd.type ~= "node" then
			return
		end

		-- is area protected?
		if core.is_protected(pointd.under, user:get_player_name()) then
			return
		end

		-- call global on_use function with strength of 1
		if bonemeal:on_use(pointd.under, 1) then

			-- take item if not in creative
			if not core.is_creative_enabled(user:get_player_name()) then
				itemstack:take_item()
			end
		end

		return itemstack
	end
})


-- bonemeal (strength 2)
core.register_craftitem("bonemeal:bonemeal", {
	description = S("Bone Meal"),
	inventory_image = "bonemeal_item.png",

	on_use = function(itemstack, user, pointd)

		-- did we point at a node?
		if pointd.type ~= "node" then
			return
		end

		-- is area protected?
		if core.is_protected(pointd.under, user:get_player_name()) then
			return
		end

		-- call global on_use function with strength of 2
		if bonemeal:on_use(pointd.under, 2) then

			-- take item if not in creative
			if not core.is_creative_enabled(user:get_player_name()) then
				itemstack:take_item()
			end
		end

		return itemstack
	end
})


-- fertiliser (strength 3)
core.register_craftitem("bonemeal:fertiliser", {
	description = S("Fertiliser"),
	inventory_image = "bonemeal_fertiliser.png",

	on_use = function(itemstack, user, pointd)

		-- did we point at a node?
		if pointd.type ~= "node" then
			return
		end

		-- is area protected?
		if core.is_protected(pointd.under, user:get_player_name()) then
			return
		end

		-- call global on_use function with strength of 3
		if bonemeal:on_use(pointd.under, 3) then

			-- take item if not in creative
			if not core.is_creative_enabled(user:get_player_name()) then
				itemstack:take_item()
			end
		end

		return itemstack
	end
})


-- superliser (strength 4)
core.register_craftitem("bonemeal:superliser", {
	description = S("Superliser"),
	inventory_image = "bonemeal_superliser.png",

	on_use = function(itemstack, user, pointd)

		-- did we point at a node?
		if pointd.type ~= "node" then
			return
		end

		-- is area protected?
		if core.is_protected(pointd.under, user:get_player_name()) then
			return
		end

		-- call global on_use function with strength of 4
		if bonemeal:on_use(pointd.under, 4) then

			-- take item if not in creative
			if not core.is_creative_enabled(user:get_player_name()) then
				itemstack:take_item()
			end
		end

		return itemstack
	end
})


-- bone
core.register_craftitem("bonemeal:bone", {
	description = S("Bone"),
	inventory_image = "bonemeal_bone.png",
	groups = {bone = 1}
})

-- egg shell
core.register_craftitem("bonemeal:egg_shell", {
	description = S("Egg Shell"),
	inventory_image = "bonemeal_egg_shell.png",
})

-- gelatin powder
core.register_craftitem("bonemeal:gelatin_powder", {
	description = S("Gelatin Powder"),
	inventory_image = "bonemeal_gelatin_powder.png",
	groups = {food_gelatin = 1, flammable = 2}
})

core.register_node("bonemeal:cartilage", {
	description = S("Cartilage"),
	tiles = {"bonemeal_cartilage.png"},--default_silver_sandstone^[colorize:#a78c45:50
	groups = {crumbly = 3, slippery = 5000},
	sounds = default.node_sound_defaults({
		dig = {name = "default_dirt_footstep", gain = .2},
		dug = {name = "default_dirt_footstep", gain = .2},
	}),
})


--
-- crafting recipes
--


-- gelatin powder
core.register_craft({
	output = "bonemeal:gelatin_powder 4",
	recipe = {
		{"group:bone", "group:bone", "group:bone"},
		{"group:salt_water_bucket", "group:salt_water_bucket", "group:salt_water_bucket"},
		{"group:salt_water_bucket", "default:torch", "group:salt_water_bucket"}
	},
	replacements = {
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:clay_bucket_water", "bucket:clay_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:wooden_bucket_water", "bucket:wooden_bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"},
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

core.register_craft({
	output = "bonemeal:cartilage",
	recipe = {
		{"bonemeal:gelatin_powder", "bonemeal:gelatin_powder", "bonemeal:gelatin_powder"},
		{"bonemeal:gelatin_powder", "group:water_bucket", "bonemeal:gelatin_powder"},
		{"bonemeal:gelatin_powder", "bonemeal:gelatin_powder", "bonemeal:gelatin_powder"}
	},
	replacements = {
		{"group:water_bucket_clay", "bucket:clay_bucket_empty"},
		{"group:water_bucket_wooden", "bucket:wooden_bucket_empty"},
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

-- bonemeal
core.register_craft({
	output = "bonemeal:bonemeal 2",
	recipe = {{"group:bone"}}
})

core.register_craft({
	output = "bonemeal:bonemeal 18",
	recipe = {{"bones:bones"}}
})

core.register_craft({
	output = "bonemeal:bonemeal 2",
	recipe = {{"default:coral_skeleton_tip"}}
})

core.register_craft({
	output = "bonemeal:bonemeal 9",
	recipe = {{"default:coral_skeleton"}}
})

core.register_craft({
	output = 'bonemeal:bonemeal',
	recipe = {
		{'bonemeal:egg_shell', 'bonemeal:egg_shell', 'bonemeal:egg_shell'},
		{'bonemeal:egg_shell', 'bonemeal:egg_shell', 'bonemeal:egg_shell'},
		{'bonemeal:egg_shell', 'bonemeal:egg_shell', 'bonemeal:egg_shell'}
	}
})

core.register_craft({
	output = "bonemeal:bonemeal 4",
	recipe = {{"mapgen:old_skull"}}
})

core.register_craft({
	output = "bonemeal:bonemeal 12",
	recipe = {{"mapgen:old_skeleton"}}
})

core.register_craft({
	output = "bonemeal:bonemeal 12",
	recipe = {{"mapgen:old_skeleton_alt"}}
})

-- mulch
core.register_craft({
	output = "bonemeal:mulch 4",
	recipe = {
		{"group:trunk", "group:leaves", "group:leaves"},
		{"group:leaves", "group:leaves", "group:leaves"},
		{"group:leaves", "group:leaves", "group:leaves"}
	}
})

core.register_craft({
	output = "bonemeal:mulch",
	recipe = {
		{"group:seed", "group:seed", "group:seed"},
		{"group:seed", "group:seed", "group:seed"},
		{"group:seed", "group:seed", "group:seed"}
	}
})

core.register_craft({
	output = "bonemeal:mulch",
	recipe = {
		{"farming:spent_biomasse", "farming:spent_biomasse", "farming:spent_biomasse"},
		{"farming:spent_biomasse", "farming:spent_biomasse", "farming:spent_biomasse"},
		{"farming:spent_biomasse", "farming:spent_biomasse", "farming:spent_biomasse"}
	}
})

-- fertiliser
core.register_craft({
	type = "shapeless",
	output = "bonemeal:fertiliser 2",
	recipe = {"bonemeal:bonemeal", "bonemeal:mulch"}
})


-- add support for other mods
dofile(path .. "/mods.lua")
dofile(path .. "/lucky_block.lua")

print (S("[MOD] bonemeal loaded"))
