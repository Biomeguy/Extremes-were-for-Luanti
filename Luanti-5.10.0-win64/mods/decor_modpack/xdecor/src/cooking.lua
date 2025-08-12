local cauldron, sounds = {}, {}
local S = core.get_translator("xdecor")

local hint_fire = S("Light a fire below to heat it up")
local hint_eat = S("Use a bowl to eat the soup")
local hint_recipe = S("Drop foods inside to make a soup")

local infotexts = {
	["xdecor:cauldron_empty"] = S("Cauldron (empty)"),
	["xdecor:cauldron_idle"] = S("Cauldron (cold water)").."\n"..hint_fire,
	["xdecor:cauldron_idle_river_water"] = S("Cauldron (cold river water)").."\n"..hint_fire,
	["xdecor:cauldron_idle_soup"] = S("Cauldron (cold soup)").."\n"..hint_eat,
	["xdecor:cauldron_boiling"] = S("Cauldron (boiling water)").."\n"..hint_recipe,
	["xdecor:cauldron_boiling_river_water"] = S("Cauldron (boiling river water)").."\n"..hint_recipe,
	["xdecor:cauldron_soup"] = S("Cauldron (boiling soup)").."\n"..hint_eat,
}

local function set_infotext(meta, node)
	if infotexts[node.name] then
		meta:set_string("infotext", infotexts[node.name])
	end
end

-- Add more ingredients here that make a soup.
local ingredients_list = {
	"apple", "mushroom", "honey", "pumpkin", "egg", "bread", "meat",
	"chicken", "carrot", "potato", "melon", "rhubarb", "cucumber",
	"maize", "beans", "berries", "grapes", "tomato", "wheat"
}

cauldron.cbox = {
	{0,  0, 0,  16, 16, 0},
	{0,  0, 16, 16, 16, 0},
	{0,  0, 0,  0,  16, 16},
	{16, 0, 0,  0,  16, 16},
	{0,  0, 0,  16, 8,  16}
}

-- Returns true if the node at pos is above fire
local function is_heated(pos)
	local below_node = {x = pos.x, y = pos.y - 1, z = pos.z}
	local nn = core.get_node(below_node).name
	-- Check fire group
	if core.get_item_group(nn, "fire") ~= 0 then
		return true
	else
		return false
	end
end

function cauldron.stop_sound(pos)
	local spos = core.hash_node_position(pos)
	if sounds[spos] then
		core.sound_stop(sounds[spos])
		sounds[spos] = nil
	end
end

function cauldron.start_sound(pos)
	local spos = core.hash_node_position(pos)
	-- Stop sound if one already exists.
	-- Only 1 sound per position at maximum allowed.
	if sounds[spos] then
		cauldron.stop_sound(pos)
	end
	sounds[spos] = core.sound_play("xdecor_boiling_water", {
		pos = pos,
		max_hear_distance = 5,
		gain = 0.8,
		loop = true
	})
end

function cauldron.idle_construct(pos)
	local timer = core.get_node_timer(pos)
	local node = core.get_node(pos)
	local meta = core.get_meta(pos)
	set_infotext(meta, node)
	timer:start(10.0)
	cauldron.stop_sound(pos)
end

function cauldron.boiling_construct(pos)
	cauldron.start_sound(pos)

	local meta = core.get_meta(pos)
	local node = core.get_node(pos)
	set_infotext(meta, node)

	local timer = core.get_node_timer(pos)
	timer:start(5.0)
end


function cauldron.filling(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wielded = itemstack:get_name()
	local type_name = ""

	do
	if (wielded == "bucket:bucket_empty" or wielded == "bucket:clay_bucket_empty" or
		wielded == "bucket:wooden_bucket_empty") and node.name:sub(-6) ~= "_empty" then
		local give_back
		if wielded == "bucket:clay_bucket_empty" then
			type_name = "clay_"
		elseif wielded == "bucket:wooden_bucket_empty" then
			type_name = "wooden_"
		end
		if node.name:sub(-11) == "river_water" then
			give_back = "bucket:".. type_name .."bucket_fresh_water 1"
		else
			give_back = "bucket:".. type_name .."bucket_water 1"
		end
		if itemstack:get_count() > 1 then
			if inv:room_for_item("main", {name=give_back}) then
				itemstack:take_item()
				inv:add_item("main", give_back)
			else
				itemstack:take_item()
				local pos = clicker:get_pos()
				pos.y = math.floor(pos.y + 0.5)
				core.add_item(pos, give_back)
			end
		else
			itemstack:replace(give_back)
		end
		core.set_node(pos, {name = "xdecor:cauldron_empty", param2 = node.param2})

	elseif core.get_item_group(wielded, "water_bucket") == 1 and node.name:sub(-6) == "_empty" then
		local newnode
		if core.get_item_group(wielded, "fresh_water_bucket") == 1 then
			newnode = "xdecor:cauldron_idle_river_water"
		else
			newnode = "xdecor:cauldron_idle"
		end
		if core.get_item_group(wielded, "water_bucket_clay") == 1 then
			type_name = "clay_"
		elseif core.get_item_group(wielded, "water_bucket_wooden") == 1 then
			type_name = "wooden_"
		end
		core.set_node(pos, {name = newnode, param2 = node.param2})
		itemstack:replace("bucket:".. type_name .."bucket_empty")
	end

	return itemstack
	end
end

function cauldron.idle_timer(pos)
	if not is_heated(pos) then
		return true
	end

	local node = core.get_node(pos)
	if node.name:sub(-4) == "soup" then
		node.name = "xdecor:cauldron_soup"
	elseif node.name:sub(-11) == "river_water" then
		node.name = "xdecor:cauldron_boiling_river_water"
	else
		node.name = "xdecor:cauldron_boiling"
	end
	core.set_node(pos, node)
	return true
end

-- Ugly hack to determine if an item has the function `core.item_eat` in its definition.
local function eatable(itemstring)
	local item = itemstring:match("[%w_:]+")
	local on_use_def = core.registered_items[item].on_use
	if not on_use_def then return end

	return string.format("%q", string.dump(on_use_def)):find("item_eat")
end

function cauldron.boiling_timer(pos)
	-- Cool down cauldron if there is no fire
	local node = core.get_node(pos)
	if not is_heated(pos) then
		local newnode
		if node.name:sub(-4) == "soup" then
			newnode = "xdecor:cauldron_idle_soup"
		elseif node.name:sub(-11) == "river_water" then
			newnode = "xdecor:cauldron_idle_river_water"
		else
			newnode = "xdecor:cauldron_idle"
		end
		core.set_node(pos, {name = newnode, param2 = node.param2})
		return true
	end

	if node.name:sub(-4) == "soup" then
		return true
	end

	-- Cooking:

	-- Count the ingredients in the cauldron
	local objs = core.get_objects_inside_radius(pos, 0.5)

	if not next(objs) then
		return true
	end

	local ingredients = {}
	for _, obj in pairs(objs) do
		if obj and not obj:is_player() and obj:get_luaentity().itemstring then
			local itemstring = obj:get_luaentity().itemstring
			local food = itemstring:match(":([%w_]+)")

			for _, ingredient in ipairs(ingredients_list) do
				if food and (eatable(itemstring) or food:find(ingredient)) then
					ingredients[#ingredients + 1] = food
					break
				end
			end
		end
	end

	-- Remove ingredients and turn liquid into soup
	if #ingredients >= 2 then
		for _, obj in pairs(objs) do
			obj:remove()
		end

		core.set_node(pos, {name = "xdecor:cauldron_soup", param2 = node.param2})
	end


	return true
end

function cauldron.take_soup(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item()
	local item_name = wield_item:get_name()

	if item_name == "xdecor:bowl" or item_name == "farming:bowl" then
		if wield_item:get_count() > 1 then
			if inv:room_for_item("main", "xdecor:bowl_soup 1") then
				itemstack:take_item()
				inv:add_item("main", "xdecor:bowl_soup 1")
			else
				core.chat_send_player(clicker:get_player_name(),
					S("No room in your inventory to add a bowl of soup."))
				return itemstack
			end
		else
			itemstack:replace("xdecor:bowl_soup 1")
		end

		core.set_node(pos, {name = "xdecor:cauldron_empty", param2 = node.param2})
	end

	return itemstack
end

xdecor.register("cauldron_empty", {
	description = S("Cauldron"),
	_tt_help = S("For storing water and cooking soup"),
	groups = {cracky=2, oddly_breakable_by_hand=1,cauldron=1},
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
	tiles = {"xdecor_cauldron_top_empty.png", "xdecor_cauldron_sides.png"},
	sounds = default.node_sound_metal_defaults(),
	collision_box = xdecor.pixelbox(16, cauldron.cbox),
	on_rightclick = cauldron.filling,
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		local node = core.get_node(pos)
		set_infotext(meta, node)
		cauldron.stop_sound(pos)
	end,
})

xdecor.register("cauldron_idle", {
	description = S("Cauldron with Water (cold)"),
	groups = {cracky=2, oddly_breakable_by_hand=1, not_in_creative_inventory=1,cauldron=2},
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
	tiles = {"xdecor_cauldron_top_idle.png", "xdecor_cauldron_sides.png"},
	sounds = default.node_sound_metal_defaults(),
	drop = "xdecor:cauldron_empty",
	collision_box = xdecor.pixelbox(16, cauldron.cbox),
	on_rightclick = cauldron.filling,
	on_construct = cauldron.idle_construct,
	on_timer = cauldron.idle_timer,
})

xdecor.register("cauldron_idle_river_water", {
	description = S("Cauldron with River Water (cold)"),
	groups = {cracky=2, oddly_breakable_by_hand=1, not_in_creative_inventory=1,cauldron=2},
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
	tiles = {"xdecor_cauldron_top_idle_river_water.png", "xdecor_cauldron_sides.png"},
	sounds = default.node_sound_metal_defaults(),
	drop = "xdecor:cauldron_empty",
	collision_box = xdecor.pixelbox(16, cauldron.cbox),
	on_rightclick = cauldron.filling,
	on_construct = cauldron.idle_construct,
	on_timer = cauldron.idle_timer,
})

xdecor.register("cauldron_idle_soup", {
	description = S("Cauldron with Soup (cold)"),
	groups = {cracky = 2, oddly_breakable_by_hand = 1, not_in_creative_inventory = 1,cauldron=2},
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
	drop = "xdecor:cauldron_empty",
	tiles = {"xdecor_cauldron_top_idle_soup.png", "xdecor_cauldron_sides.png"},
	sounds = default.node_sound_metal_defaults(),
	collision_box = xdecor.pixelbox(16, cauldron.cbox),
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		local node = core.get_node(pos)
		set_infotext(meta, node)
		local timer = core.get_node_timer(pos)
		timer:start(10.0)
		cauldron.stop_sound(pos)
	end,
	on_timer = cauldron.idle_timer,
	on_rightclick = cauldron.take_soup,
})

xdecor.register("cauldron_boiling", {
	description = S("Cauldron with Water (boiling)"),
	groups = {cracky=2, oddly_breakable_by_hand=1, not_in_creative_inventory=1,cauldron=3},
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
	drop = "xdecor:cauldron_empty",
	damage_per_second = 2,
	tiles = {
		{
			name = "xdecor_cauldron_top_anim_boiling_water.png",
			animation = {type = "vertical_frames", length = 3.0}
		},
		"xdecor_cauldron_sides.png"
	},
	sounds = default.node_sound_metal_defaults(),
	collision_box = xdecor.pixelbox(16, cauldron.cbox),
	on_rightclick = cauldron.filling,
	on_construct = cauldron.boiling_construct,
	on_timer = cauldron.boiling_timer,
	on_destruct = function(pos)
		cauldron.stop_sound(pos)
	end,
})

xdecor.register("cauldron_boiling_river_water", {
	description = S("Cauldron with River Water (boiling)"),
	groups = {cracky=2, oddly_breakable_by_hand=1, not_in_creative_inventory=1,cauldron=3},
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
	drop = "xdecor:cauldron_empty",
	damage_per_second = 2,
	tiles = {
		{
			name = "xdecor_cauldron_top_anim_boiling_river_water.png",
			animation = {type = "vertical_frames", length = 3.0}
		},
		"xdecor_cauldron_sides.png"
	},
	sounds = default.node_sound_metal_defaults(),
	collision_box = xdecor.pixelbox(16, cauldron.cbox),
	on_rightclick = cauldron.filling,
	on_construct = cauldron.boiling_construct,
	on_timer = cauldron.boiling_timer,
	on_destruct = function(pos)
		cauldron.stop_sound(pos)
	end,
})



xdecor.register("cauldron_soup", {
	description = S("Cauldron with Soup (boiling)"),
	groups = {cracky = 2, oddly_breakable_by_hand = 1, not_in_creative_inventory = 1,cauldron=3},
	is_ground_content = false,
	on_rotate = screwdriver.rotate_simple,
	drop = "xdecor:cauldron_empty",
	damage_per_second = 2,
	tiles = {
		{
			name = "xdecor_cauldron_top_anim_soup.png",
			animation = {type = "vertical_frames", length = 3.0}
		},
		"xdecor_cauldron_sides.png"
	},
	sounds = default.node_sound_metal_defaults(),
	collision_box = xdecor.pixelbox(16, cauldron.cbox),
	on_construct = function(pos)
		cauldron.start_sound(pos)
		local meta = core.get_meta(pos)
		local node = core.get_node(pos)
		set_infotext(meta, node)

		local timer = core.get_node_timer(pos)
		timer:start(5.0)
	end,
	on_timer = cauldron.boiling_timer,
	on_rightclick = cauldron.take_soup,
	on_destruct = function(pos)
		cauldron.stop_sound(pos)
	end,
})

-- Craft items

core.register_craftitem("xdecor:bowl", {
	description = S("Bowl"),
	inventory_image = "xdecor_bowl.png",
	wield_image = "xdecor_bowl.png",
	groups = {food_bowl = 1, flammable = 2},
})

core.register_craftitem("xdecor:bowl_soup", {
	description = S("Bowl of soup"),
	inventory_image = "xdecor_bowl_soup.png",
	wield_image = "xdecor_bowl_soup.png",
	groups = {},
	stack_max = 1,
	on_use = core.item_eat(30, "xdecor:bowl")
})

-- Recipes

core.register_craft({
	output = "xdecor:bowl",
	recipe = {{"vessels:wood_bowl"}}
})

core.register_craft({
	output = "vessels:wood_bowl",
	recipe = {{"xdecor:bowl"}}
})

core.register_craft({
	output = "xdecor:cauldron_empty",
	recipe = {
		{"default:iron_lump", "", "default:iron_lump"},
		{"default:iron_lump", "", "default:iron_lump"},
		{"default:iron_lump", "default:iron_lump", "default:iron_lump"}
	}
})

core.register_lbm({
	label = "Restart boiling cauldron sounds",
	name = "xdecor:restart_boiling_cauldron_sounds",
	nodenames = {"xdecor:cauldron_boiling", "xdecor:cauldron_boiling_river_water", "xdecor:cauldron_soup"},
	run_at_every_load = true,
	action = function(pos, node)
		cauldron.start_sound(pos)
	end,
})

core.register_lbm({
	label = "Update cauldron infotexts",
	name = "xdecor:update_cauldron_infotexts",
	nodenames = {"group:cauldron"},
	run_at_every_load = false,
	action = function(pos, node)
		local meta = core.get_meta(pos)
		set_infotext(meta, node)
	end,
})
