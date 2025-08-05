
schem_spawn = {}

local path = core.get_modpath("schem_spawn").."/schematics/"
dofile(path.. "schem_0.lua")
dofile(path.. "schem_1.lua")
dofile(path.. "schem_2.lua")
dofile(path.. "schem_village.lua")
--dofile(path.. "schem_trees.lua")

-- Load support for MT game translation.
local S = core.get_translator("schem_spawn")
--[[
function schem_spawn.convert_mts_to_lua()
	local building = path.. "schem_name.mts"
--	local building2 = path.. "schem_name.mts"
	local str = core.serialize_schematic(building, "lua", {lua_use_comments = true, lua_num_indent_spaces = 0}).." return(schematic)"
--	local str2 = core.serialize_schematic(building2, "lua", {lua_use_comments = true, lua_num_indent_spaces = 0}).." return(schematic)"
	local schematic = loadstring(str)()
--	local schematic2 = loadstring(str2)()
	local file = io.open(path.. "schem_name.lua", "w")
--	local file2 = io.open(path.. "schem_name.lua", "w")
	file:write(dump(schematic))
--	file2:write(dump(schematic2))
	file:close() print(dump(schematic))
--	file2:close() print(dump(schematic2))
end]]

-- things that can be found in private, not locked chests belonging to npc
-- contains tables of the following structure: { node_name, chance (in percent, 100=always, 0=never), max_amount, repeat (for more than one stack) }
local random_chest_content = {
	{"default:pick_stone",				10,	1,	3},
	{"default:pick_steel",				5,	1,	2},
	{"default:pick_mese",				2,	1,	2},
	{"default:shovel_stone",			5,	1,	3},
	{"default:shovel_steel",			5,	1,	2},
	{"default:axe_stone",				5,	1,	3},
	{"default:axe_steel",				5,	1,	2},
	{"default:sword_bronze",			1,	1,	3},
	{"default:sword_stone",				1,	1,	3},
	{"default:sword_steel",				1,	1,	3},

	{"default:stick",					20,	40,	2},
	{"default:torch",					50,	10,	4},

	{"default:book",					60,	31,	1},
	{"default:book",					90,	31,	6},

	{"default:paper",					60,	6,	4},
	{"default:apple",					50,	10,	2},
	{"default:ladder",					20,	18,	2},
	{"default:raw_coconut",				80,	5,	2},
	{"default:pine_nuts",				80,	99,	1},

	{"default:dirt",					30,	53,	2},
	{"default:coal_lump",				80,	30,	1},
	{"default:steel_ingot",				30,	4,	2},
	{"default:mese_crystal_fragment",	10,	3,	1},

	{"default:oil_extract",				80,	1,	3},

	{"bucket:bucket_empty",				10,	3,	2},
	{"bucket:bucket_water",				5,	3,	2},
	{"bucket:bucket_lava",				3,	3,	2},

	{"vessels:glass_bottle",			10,	10,	2},
	{"vessels:drinking_glass",			20,	2,	1},
	{"vessels:steel_bottle",			10,	1,	1},

	{"fabric:block_white",				60,	8,	2},
	{"fabric:string",					60,	5,	2},

-- that someone will hide valuable ingots in chests that are not locked is fairly unrealistic; thus, those items are rare
	{"default:gold_ingot",				1,	2,	1},
	{"default:silver_ingot",			1,	2,	1},
	{"default:copper_ingot",			30,	10,	1},
	{"default:tin_ingot",				1,	5,	1},
	{"default:bronze_ingot",			1,	1,	1},
	{"default:mithril_ingot",			1,	1,	1},
	{"default:diamond",					1,	2,	1},
	{"default:mese_crystal",			20,	2,	1},

	{"fishing:pole",					60,	1,	1},

	{"default:rope",					60,	5,	2},
	{"ropes:rope",						60,	5,	2},
	{"moreblocks:rope",					60,	5,	2},

	{"bees:bottle_honey",				50,	4,	1},
	{"bees:extractor",					80,	1,	2},
	{"bees:frame_empty",				50,	2,	5},
	{"bees:frame_full",					80,	1,	1},
	{"bees:grafting_tool",				50,	1,	3},
	{"bees:hive_industrial",		100,	1,	1},
	{"bees:honey_comb",					50,	2,	2},
	{"bees:queen_bee",					50,	2,	3},
	{"bees:smoker",						80,	1,	2},
	{"bees:wax",						80,	3,	3},

	{"carts:cart",						80,	1,	2},

	{"currency:minegeld",				80,	10,	2},

	{"farming:hoe_stone",				80,	1,	2},
	{"farming:wheat_bread",				40,	17,	2},

	{"moretrees:cedar_nuts",			80,	99,	1},
	{"moretrees:spruce_nuts",			80,	99,	1},

	{"gems:quartz_crystal",				80,	1,	1},

	{"screwdriver:screwdriver",			80,	1,	1},

	{"unified_inventory:bag_large",		5,	1,	1},
	{"unified_inventory:bag_medium",	10,	1,	1},
	{"unified_inventory:bag_small",		80,	1,	1}
}

local P = 130
local cashe_mods = 0

if core.get_modpath("es") then
	P = (P - 10)
	cashe_mods = (cashe_mods + 3)
end

if core.get_modpath("gems") then
	P = (P - 10)
	cashe_mods = (cashe_mods + 7)
end

if core.get_modpath("gloop") then
	P = (P - 10)
	cashe_mods = (cashe_mods + 3)
end

if core.get_modpath("technic") then
	P = (P - 3)
	cashe_mods = (cashe_mods + 1)
end

if core.get_modpath("xtraores") then
	P = (P - 17)
	cashe_mods = (cashe_mods + 15)
end

local cashe_chest_content = {
	{"default:coal_block",			P, 144, 2},
	{"default:sulfur",				P, 144, 2},
	{"default:tin_block",			P, 144, 2},
	{"default:copper_block",		P, 144, 2},
	{"default:wrought_iron_block",	P, 144, 2},
	{"default:silver_block",		P, 144, 2},
	{"default:gold_block",			P, 144, 2},
	{"default:mese",				P, 144, 2},
	{"default:mithril_block",		P, 144, 2},
	{"default:diamond_block",		P, 144, 2},
	{"default:blue_diamond_block",	P, 144, 2},
	{"default:chromium_block",		P, 144, 2},
	{"default:zinc_block",			P, 144, 2},
	{"default:diamite",				P, 144, 2},
	{"default:white_marble",		P, 144, 2},
	{"default:marble",				P, 144, 2},
	{"default:granite",				P, 144, 2},

	{"spawn:anak",					80, 144, 2},

	{"es:aikerumblock",				80, 144, 2},
	{"es:infiniumblock",			80, 144, 2},
	{"es:magentiumblock",			80, 144, 2},

	{"gems:lapis_block",			80, 144, 2},
	{"gems:amethyst_block",			80, 144, 2},
	{"gems:aquamarine_block",		80, 144, 2},
	{"gems:emerald_block",			80, 144, 2},
	{"gems:ruby_block",				80, 144, 2},
	{"gems:sapphire_block",			80, 144, 2},
	{"gems:jade_block",				80, 144, 2},
	{"gems:quartz_block",			80, 144, 2},

	{"gloop:compressed_kalite",		80, 144, 2},
	{"gloop:talinite_block",		80, 144, 2},
	{"gloop:arol_ingot",			80, 144, 2},

	{"technic:lead_block",			80, 144, 2},

	{"xtraores:nickel_ingot",		80, 999, 2},
	{"xtraores:platinum_ingot",		80, 999, 2},
	{"xtraores:palladium_ingot",	80, 999, 2},
	{"xtraores:cobalt_ingot",		80, 999, 2},
	{"xtraores:thorium_ingot",		80, 999, 2},
	{"xtraores:antracite_ore",		80, 999, 2},
	{"xtraores:osmium_ingot",		80, 999, 2},
	{"xtraores:rhenium_ingot",		80, 999, 2},
	{"xtraores:vanadium_ingot",		80, 999, 2},
	{"xtraores:rarium_ingot",		80, 999, 2},
	{"xtraores:orichalcum_ingot",	80, 999, 2},
	{"xtraores:titanium_ingot",		80, 999, 2},
	{"xtraores:geminite_ingot",		80, 999, 2},
	{"xtraores:uranium_ingot",		80, 999, 2},-- sword_radioactive
	{"xtraores:chromium_ingot",		80, 999, 2}-- tools and armor
}

-- increase this value if you think that the generated chests contain too many items
local random_chest_chance_factor = 200

function schem_spawn.fill_chest(pos)
	local meta = core.get_meta(pos)
	local inv = meta:get_inventory()
	local stuff = random_chest_content
	if meta:get_string("chest_type") == "cashe" then
		stuff = cashe_chest_content
		if cashe_mods < 28 then
		random_chest_chance_factor = 140
		if cashe_mods > 0 then
	random_chest_chance_factor = (random_chest_chance_factor + cashe_mods)
		end
		end
	end

	local count
	for _,v in ipairs(stuff) do

		-- repeat this many times
		for count=1, v[4] do

	local inv_size = inv:get_size('main')
	-- to avoid too many things inside a chest, lower chance
	if(count<30 -- make sure it does not get too much and there is still room for a new stack
		and ( core.registered_nodes[ v[1] ] or core.registered_items[ v[1] ]) and inv_size and inv_size > 0
		and v[2] > math.random( 1, random_chest_chance_factor )) then

	local itemdef = core.registered_items[ v[1] ]
	local num = 1
	if meta:get_string("chest_type") == "cashe" then
		num = (v[3] / 3 * 2)
	end
	-- add itemstack at a random empty position in the chest's inventory
	local index = math.random(1, inv:get_size("main"))
	local stack = ItemStack({name = v[1], count = math.random(num, v[3])})
	if itemdef.tool_capabilities or v[1] == "screwdriver:screwdriver" or itemdef.groups.hoe then
		stack = ItemStack({name = v[1], wear = math.random(0, .6 * 65535)}) -- 0% to 60% wear
	end
	if inv:get_stack("main", index):is_empty() then
		inv:set_stack("main", index, stack)
	else
		inv:add_item("main", stack)
	end
	count = count+1
	end
		end
	end
end

core.register_node("schem_spawn:chest_placer", {
	description = S("Chest Placer"),
	tiles = {"default_cloud.png"},
	inventory_image = "unknown_node.png",
	paramtype2 = "facedir",
	diggable = false,
	drop = "",
	--on_use = schem_spawn.convert_mts_to_lua(),
	on_blast = function() end,
	on_timer = function(pos, elapsed)
		local p2 = core.get_node(pos).param2
		if p2 == 0 or p2 == 1 or p2 == 2 or p2 == 3 then
			core.set_node(pos, {name = "default:chest", param2 = p2})
			schem_spawn.fill_chest(pos)
			return
		elseif p2 == 20 or p2 == 22 then
			core.set_node(pos, {name = "default:chest", param2 = p2-20})
		elseif p2 == 21 then
			core.set_node(pos, {name = "default:chest", param2 = 3})
		elseif p2 == 23 then
			core.set_node(pos, {name = "default:chest", param2 = 1})
		end
		local meta = core.get_meta(pos)
		meta:set_string("chest_type", "cashe")
		schem_spawn.fill_chest(pos)
	end,
	groups = {cracky = 11, timer_check = 1, not_in_creative_inventory = 1},
})

core.register_node("schem_spawn:furnace_placer", {
	description = S("Furnace Placer"),
	tiles = {"default_cloud.png"},
	inventory_image = "unknown_node.png",
	paramtype2 = "facedir",
	diggable = false,
	drop = "",
	on_blast = function() end,
	on_timer = function(pos, elapsed)
		local p2 = core.get_node(pos).param2
		if p2 == 0 or p2 == 1 or p2 == 2 or p2 == 3 then
			core.set_node(pos, {name = "default:furnace", param2 = p2})
		end
	end,
	groups = {cracky = 11, timer_check = 1, not_in_creative_inventory = 1},
})

local schem_auto = core.settings:get_bool("auto_spawn_structures") and 1 or 0

core.register_node("schem_spawn:cashe", {
	description = S("Cashe"),
	tiles = {"schem_spawn_C.png"},
	inventory_image = "schem_spawn_C.png",
	paramtype2 = "facedir",
	on_rotate = screwdriver.rotate_simple,
	on_punch = function(pos, node, puncher)
		if puncher:get_wielded_item():get_name() == "default:ocealite" then
			core.get_node_timer(pos):start(5)
			if core.settings:get_bool("enable_schem_spawn_announce") == true then
				core.chat_send_player(puncher:get_player_name(), S("In 5, 4, 3, 2, 1."))
			end
		else
	local meta = core.get_meta(pos)
	meta:set_string("infotext", S("Cashe 1; size 3 (-1, 4) 3"))
		end
	end,
	on_timer = function(pos, elapsed)
		if core.find_node_near(pos, 4, {"ignore", "default:bedrock_barrier", "group:cashe_spawner", "group:schem_spawner"}) then
			core.get_node_timer(pos):start(300)
			core.chat_send_all(core.pos_to_string(pos)..S(" Could not spawn, an ignore or spawner node is too close"))
			return
		end
		local p2 = core.get_node(pos).param2
		local ro = "0"
		if p2 == 1 then
			ro = "90"
		elseif p2 == 2 then
			ro = "180"
		elseif p2 == 3 then
			ro = "270"
		end
		core.remove_node(pos)
		core.place_schematic({x = pos.x - 3, y = pos.y - 1, z = pos.z - 3}, cashe, ro, nil, false)
	end,
	groups = {cracky = 1, level = 3, cashe_spawner = 1, timer_check = schem_auto},
	sounds = default.node_sound_stone_defaults(),
})

core.register_on_generated(function(minp, maxp)
	if maxp.y < -24672 or maxp.y > -112 then -- in 64 node mapblocks
		return
	end
	local spot = core.find_nodes_in_area(minp, maxp, "default:stone")
	for n = 1, #spot do
		if math.random(1, 35000) == 1 then
			local pos = {x = spot[n].x, y = spot[n].y, z = spot[n].z}
			if not core.find_node_near(pos, 6, {"group:water", "group:lava"}) then
				core.set_node(pos, {name = "schem_spawn:cashe", param2 = math.random(0, 3)})
			end
		end
	end
end)

local ScSp = "schem_spawn:"

function schem_spawn.register(schem_name, schem_type, schem_desc, schem_size_desc, ofxz, ofy, schem_model, schem_replace, rotatable)
core.register_node(schem_name, {
	description = S(schem_desc),
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, .47, .5, .5, .5},
			{-.5, -.5, -.5, -.47, .5, .5},
			{-.5, -.5, -.5, .5, -.47, .5}
		}
	},
	tiles = {"schem_spawn_"..schem_type..".png"},
	inventory_image = "schem_spawn_"..schem_type..".png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	is_ground_content = false,
	sunlight_propagates = true,
	on_rotate = screwdriver.rotate_simple,
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("infotext", S(schem_desc.."; size "..schem_size_desc))
	end,
	on_punch = function(pos, node, puncher)
		if puncher:get_wielded_item():get_name() == "default:ocealite" then
			core.get_node_timer(pos):start(5)
			if core.settings:get_bool("enable_schem_spawn_announce") == true then
				core.chat_send_player(puncher:get_player_name(), S("In 5, 4, 3, 2, 1."))
			end
		else
	local meta = core.get_meta(pos)
	meta:set_string("infotext", S(schem_desc.."; size "..schem_size_desc))
		end
	end,
	on_timer = function(pos, elapsed)
		local p2 = core.get_node(pos).param2
	if p2 > 3 then
		core.get_node_timer(pos):start(300)
		core.chat_send_all(core.pos_to_string(pos)..S(" Could not spawn, invalid orientation"))
		return
	end
		local px, pz = ofxz, ofxz
		if not schem_size_desc:find("(Centered)") and ofxz == 0 then
	px = schem_model.size.x
	pz = schem_model.size.z
	if p2 == 1 or p2 == 3 then
		px = schem_model.size.z
		pz = schem_model.size.x
	end
		end
		if #core.find_nodes_in_area({x = pos.x +px -1, y = pos.y +schem_model.size.y -1 -ofy, z = pos.z +pz -1},
{x = pos.x -ofxz, y = pos.y -ofy, z = pos.z -ofxz}, {"ignore", "default:bedrock_barrier", "group:schem_spawner", "group:cashe_spawner"}) > 1 then
			core.get_node_timer(pos):start(300)
			core.chat_send_all(core.pos_to_string(pos)..S(" Could not spawn, an ignore or spawner node is in the way"))
			return
		end
		local ro = "0"
	if rotatable == nil or rotatable == true then
		if p2 == 1 then
			ro = "90"
		elseif p2 == 2 then
			ro = "180"
		elseif p2 == 3 then
			ro = "270"
		end
	end
		core.remove_node(pos)
		core.place_schematic({x = pos.x - ofxz, y = pos.y - ofy, z = pos.z - ofxz}, schem_model, ro, schem_replace, false)
	if schem_name == ScSp.."ice_castle" and core.get_modpath("frostyqueen") then
		core.add_entity({x=pos.x, y=pos.y+11, z=pos.z}, "frostyqueen:frostyqueen") end
	if schem_name == ScSp.."pyramid_aztec" and core.get_modpath("aztec") then
		core.get_meta({x=pos.x+2, y=pos.y+1, z=pos.z+2}):set_string("aztec_seeds", "true")
		core.get_meta({x=pos.x+2, y=pos.y+1, z=pos.z-2}):set_string("aztec_seeds", "true")
		core.get_meta({x=pos.x-2, y=pos.y+1, z=pos.z+2}):set_string("aztec_seeds", "true")
		core.get_meta({x=pos.x-2, y=pos.y+1, z=pos.z-2}):set_string("aztec_seeds", "true") end
	if core.get_modpath("habitents") then
if schem_name == ScSp.."house_trader" then
		core.add_entity({x=pos.x, y=pos.y+1, z=pos.z}, "habitents:producer") end
if schem_name == ScSp.."house_4" then
	core.add_entity({x=pos.x, y=pos.y+3.8, z=pos.z}, "habitents:npc") end
if schem_name == ScSp.."house_11" then
		core.add_entity({x=pos.x+6, y=pos.y+2, z=pos.z+5}, "habitents:npc") end
	end
	if core.get_modpath("habitents") and core.get_modpath("mapgen") and core.get_modpath("mobs_loz") then
if schem_name == ScSp.."house_2" then
	local obj2 = core.add_entity({x=pos.x, y=pos.y+7, z=pos.z}, "habitents:npc_custom")
	local npc2 = obj2:get_luaentity()
	npc2.text = "I'll trade you something cool for a 'weird beard'"
	npc2.reward_text = "Thanks!"
	npc2.item = "mapgen:obsidian_axe"
	npc2.reward_item = "mobs_loz:weird_beard"
	npc2.skin = "mobs_npc_toby109tt.png" end

if schem_name == ScSp.."house_3" then
	local obj3 = core.add_entity({x=pos.x, y=pos.y+6, z=pos.z}, "habitents:npc_custom")
	local npc3 = obj3:get_luaentity()
	npc3.reward_text = "I heard there is a strange land deep underground, this should help you reach there"
	npc3.item = "mapgen:doompick"
	npc3.skin = "mobs_npc_old.png" end
if schem_name == "mapgen:trader_house" then
		core.add_entity({x=pos.x, y=pos.y+1, z=pos.z}, "habitents:producer_lom") end
	end
	end,
	groups = {dig_immediate = 2, schem_spawner = 1, timer_check = schem_auto},
	sounds = default.node_sound_defaults(),
})
end

--[[
schem_spawn.register(ScSp.."willow_1", "B", "1 willow branch", "_", 3, 5, willow_1)
schem_spawn.register(ScSp.."willow_2", "B", "2 willow branch", "_", 3, 5, willow_2)
schem_spawn.register(ScSp.."willow_3", "B", "3 willow head", "_", 3, 4, willow_3)
schem_spawn.register(ScSp.."yellow_ipe", "B", "yellow ipe", "_", 3, 2, yellow_ipe)
schem_spawn.register(ScSp.."redwood_1", "B", "1 redwood head", "_", 4, 2, redwood_1)
schem_spawn.register(ScSp.."redwood_2", "B", "2 redwood branch", "_", 3, 1, redwood_2)
schem_spawn.register(ScSp.."redwood_3", "B", "3 redwood branch", "_", 3, 1, redwood_3)
schem_spawn.register(ScSp.."silvery", "B", "silvery head", "_", 2, 3, silvery)
schem_spawn.register(ScSp.."aspen_1", "B", "1 aspen branch", "_", 2, 3, aspen_1)
schem_spawn.register(ScSp.."aspen_2", "B", "2 aspen branch", "_", 2, 3, aspen_2)

schem_spawn.register(ScSp.."tree_1", "B", "1 tall_tree_1", "_", 0, 0, tall_tree_1)
schem_spawn.register(ScSp.."tree_2", "B", "2 tall_tree_2", "_", 0, 0, tall_tree_2)
schem_spawn.register(ScSp.."tree_3", "B", "3 big_tree", "_", 0, 0, big_tree)
schem_spawn.register(ScSp.."tree_4", "B", "4 big_tree2", "_", 0, 0, big_tree2)
schem_spawn.register(ScSp.."tree_5", "B", "5 jungle_Y_1", "_", 0, 0, jungle_Y_1)
schem_spawn.register(ScSp.."tree_6", "B", "6 jungle_Y_2", "_", 0, 0, jungle_Y_2)
]]

schem_spawn.register(ScSp.."ocealite_temple", "B", "Ocealite temple", "9 (-3, 10) 9 (Centered)", 9, 7, ocealite_temple, nil, false)
schem_spawn.register(ScSp.."ocealite_pyramid", "B", "Ocealite pyramid", "12 (-1, 12) 12 (Centered)", 12, 7, ocealite_pyramid)
schem_spawn.register(ScSp.."ice_castle", "B", " Ice castle", "14 (-1, 26) 14 (Centered)", 14, 1, ice_castle)
schem_spawn.register(ScSp.."bunker", "B", "ES Bunker", "5 (-12) 5 (Centered)", 5, 12, bunker)

schem_spawn.register(ScSp.."house_trader", "B", "Trader house", "4 (-2, 5) 4 (Centered)", 4, 2, house_1)
schem_spawn.register(ScSp.."chest_tower", "B", "Chest tower", "2 (4) 2, in any direction place at -x and -z corner", 0, 0, chest_tower, nil, false)
schem_spawn.register(ScSp.."fountain_well", "B", "Fountain well", "5 (-1, 7) 5 (Centered)", 5, 1, fountain_well, nil, false)
schem_spawn.register(ScSp.."field", "B", "Field", "4 (-2) 4 (Centered)", 4, 2, field, nil, false)
schem_spawn.register(ScSp.."tree_place", "B", "Tree place", "3 (2) 3 (Centered)", 3, 0, tree_place, nil, false)
schem_spawn.register(ScSp.."house_2", "B", "House 2", "7 (-1, 11) 7 (Centered)", 7, 1, house_2)
schem_spawn.register(ScSp.."house_3", "B", "House 3", "6 (-1, 12) 6 (Centered)", 6, 1, house_3)
schem_spawn.register(ScSp.."house_4", "B", "House 4", "6 (-1, 11) 6 (Centered)", 6, 1, house_4)
schem_spawn.register(ScSp.."house_5", "B", "House 5", "5 (-1, 12) 5 (Centered)", 5, 1, house_5)
schem_spawn.register(ScSp.."house_6", "B", "House 6", "20 wide (15) 17 long, in any direction place at -x and -z corner", 0, 0, house_6)
schem_spawn.register(ScSp.."house_7", "B", "House 7", "23 wide (-1, 12) 14 long, in any direction place at -x and -z corner", 0, 1, house_7)
schem_spawn.register(ScSp.."house_8", "B", "House 8", "17 wide (-1, 12) 18 long, in any direction place at -x and -z corner", 0, 1, house_8)
schem_spawn.register(ScSp.."house_9", "B", "House 9", "17 wide (-1, 12) 13 long, in any direction place at -x and -z corner", 0, 1, house_9)
schem_spawn.register(ScSp.."house_10", "B", "House 10", "13 wide (-1, 12) 9 long, in any direction place at -x and -z corner", 0, 1, house_10)
schem_spawn.register(ScSp.."house_11", "B", "House 11", "11 wide (11) 13 long, in any direction place at -x and -z corner", 0, 0, house_11)
schem_spawn.register(ScSp.."house_12", "B", "House 12", "12 wide (10) 12 long, in any direction place at -x and -z corner", 0, 0, house_12)
schem_spawn.register(ScSp.."house_13", "B", "House 13", "18 wide (-1, 10) 14 long, in any direction place at -x and -z corner", 0, 1, house_13)
schem_spawn.register(ScSp.."house_14", "B", "House 14", "12 wide (-1, 14) 12 long, in any direction place at -x and -z corner", 0, 1, house_14)
schem_spawn.register(ScSp.."house_15", "B", "House 15", "11 wide (-1, 12) 14 long, in any direction place at -x and -z corner", 0, 1, house_15)
schem_spawn.register(ScSp.."house_16", "B", "House 16", "9 wide (-1, 10) 11 long, in any direction place at -x and -z corner", 0, 1, house_16)
schem_spawn.register(ScSp.."house_17", "B", "House 17", "13 wide (-1, 7) 14 long, in any direction place at -x and -z corner", 0, 1, house_17)
schem_spawn.register(ScSp.."house_18", "B", "House 18", "12 wide (-1, 6) 10 long, in any direction place at -x and -z corner", 0, 1, house_18)
schem_spawn.register(ScSp.."house_19", "B", "House 19", "12 wide (-1, 9) 12 long, in any direction place at -x and -z corner", 0, 1, house_19)
schem_spawn.register(ScSp.."house_20", "B", "House 20", "11 wide (-1, 9) 13 long, in any direction place at -x and -z corner", 0, 1, house_20)
schem_spawn.register(ScSp.."house_21", "B", "House 21", "14 wide (-1, 8) 9 long, in any direction place at -x and -z corner", 0, 1, house_21)
schem_spawn.register(ScSp.."house_22", "B", "House 22", "9 wide (-1, 7) 13 long, in any direction place at -x and -z corner", 0, 1, house_22)
schem_spawn.register(ScSp.."khcmt", "B", "Kingdom hall, Church, Mosque, Tower", "18 wide (-1, 20) 27 long, in any direction place at -x and -z corner", 0, 1, khcmt)
schem_spawn.register(ScSp.."khcmt_roof_1", "B", "1 Roof KhCMT Dome", "8 (9) 8, in any direction place at -x and -z corner", 0, 0, khcmt_roof_1)
schem_spawn.register(ScSp.."khcmt_roof_2", "B", "2 Roof KhCMT Spire", "8 (14) 8, in any direction place at -x and -z corner", 0, 0, khcmt_roof_2)
schem_spawn.register(ScSp.."stlabapuirgen", "B", "Stlabapuirgen (Stone, lava, basalt, pumice, iron generator)", "9 (-2, 8) 9 (Centered)", 9, 2, stlabapuirgen)
schem_spawn.register(ScSp.."modern", "B", "Modern", "28 (-4, 11) 33, in any direction place at -x and -z corner", 0, 4, modern)
schem_spawn.register(ScSp.."bale_pile", "B", "Bale pile", "2 (-1, 3) 2 (Centered)", 2, 1, bale_pile)
if core.get_modpath("decor") then
schem_spawn.register(ScSp.."benches", "B", "Benches", "2 (-1) 2 (Centered)", 2, 1, benches)
end

schem_spawn.register(ScSp.."village", "V", "Village (doesn't rotate because of all the rectangular schems)", "60 (-4) 60 (Centered)", 60, 4, village, nil, false)

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then
	-- Villages
	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 80,
		fill_ratio = .000002,
		biomes = {"deciduous_forest", "grassland"},
		y_max = 5000,
		y_min = 1,
		decoration = "schem_spawn:village",
		spawn_by = "default:dirt_with_grass",
		num_spawn_by = 8,
	})
	-- Modern house
	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 40,
		fill_ratio = .00005,
		biomes = {"deciduous_forest", "grassland"},
		y_max = 5000,
		y_min = 1,
		decoration = "schem_spawn:modern",
		spawn_by = "default:dirt_with_grass",
		num_spawn_by = 8,
		param2 = 0,
		param2_max = 3,
	})

	-- Ocealite temple
	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:sand"},
		sidelen = 80,
		fill_ratio = .00003,
		y_max = -25,
		y_min = -45,
		flags = "force_placement",
		decoration = "schem_spawn:ocealite_temple",
	})

	-- Ocealite pyramid
	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:sand"},
		sidelen = 80,
		fill_ratio = .00003,
		y_max = -29,
		y_min = -49,
		flags = "force_placement",
		decoration = "schem_spawn:ocealite_pyramid",
		param2 = 0,
		param2_max = 3,
	})

	-- Ice castle
	core.register_decoration({
		deco_type = "simple",
		place_on = {"default:snow_block"},
		sidelen = 80,
		fill_ratio = .00001,
		biomes = {"icesheet"},
		y_max = 11000,
		y_min = 1,
		decoration = "schem_spawn:ice_castle",
		param2 = 0,
		param2_max = 3,
	})
end

c0 = nil
c1 = nil
c2 = nil
c3 = nil
C0 = nil
C1 = nil
C2 = nil
C3 = nil
F0 = nil
F1 = nil
F2 = nil
F3 = nil