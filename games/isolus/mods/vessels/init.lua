-- vessels/init.lua

vessels = {}

-- Minetest Game mod: vessels
-- See README.txt for licensing and other information.

-- Load support for MT game translation.
local S = core.get_translator("vessels")


local vessels_shelf_formspec =
	"size[8,7;]" ..
	"list[context;vessels;0,0.3;8,2;]" ..
	"list[current_player;main;0,2.85;8,1;]" ..
	"list[current_player;main;0,4.08;8,3;8]" ..
	"listring[context;vessels]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0, 2.85)

local function update_vessels_shelf(pos)
	local meta = core.get_meta(pos)
	local inv = meta:get_inventory()
	local invlist = inv:get_list("vessels")

	local formspec = vessels_shelf_formspec
	-- Inventory slots overlay
	local vx, vy = 0, 0.3
	local n_items = 0
	for i = 1, 16 do
		if i == 9 then
			vx = 0
			vy = vy + 1
		end
		if not invlist or invlist[i]:is_empty() then
			formspec = formspec ..
				"image[" .. vx .. "," .. vy .. ";1,1;vessels_shelf_slot.png]"
		else
			local stack = invlist[i]
			if not stack:is_empty() then
				n_items = n_items + stack:get_count()
			end
		end
		vx = vx + 1
	end
	meta:set_string("formspec", formspec)
	if n_items == 0 then
		meta:set_string("infotext", S("Empty Vessels Shelf"))
	else
		meta:set_string("infotext", S("Vessels Shelf (@1 items)", n_items))
	end
end

local vessels_shelf_def = {
	description = S("Vessels Shelf"),
	tiles = {"default_wood.png", "default_wood.png", "default_wood.png",
		"default_wood.png", "vessels_shelf.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = core.get_meta(pos)
		update_vessels_shelf(pos)
		local inv = meta:get_inventory()
		inv:set_size("vessels", 8 * 2)
	end,
	can_dig = function(pos,player)
		local inv = core.get_meta(pos):get_inventory()
		return inv:is_empty("vessels")
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if core.get_item_group(stack:get_name(), "vessel") ~= 0 then
			return stack:get_count()
		end
		return 0
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "vessels", drops)
		drops[#drops + 1] = "vessels:shelf"
		core.remove_node(pos)
		return drops
	end,
	on_metadata_inventory_put = function(pos)
		update_vessels_shelf(pos)
	end,
	on_metadata_inventory_take = function(pos)
		update_vessels_shelf(pos)
	end,
	on_metadata_inventory_move = function(pos)
		update_vessels_shelf(pos)
	end,
}
default.set_inventory_action_loggers(vessels_shelf_def, "vessels shelf")
core.register_node("vessels:shelf", vessels_shelf_def)

core.register_craft({
	output = "vessels:shelf",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:vessel", "group:vessel", "group:vessel"},
		{"group:wood", "group:wood", "group:wood"}
	}
})

core.register_node("vessels:wood_bowl", {
	description = S("Empty Wooden Bowl"),
	drawtype = "plantlike",
	tiles = {"vessels_wood_bowl.png"},
	inventory_image = "vessels_wood_bowl_inv.png",
	wield_image = "vessels_wood_bowl.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, 0, .25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

core.register_craft({
	output = "vessels:wood_bowl 6",
	recipe = {
		{"group:wood", "", "group:wood"},
		{"", "group:wood", ""}
	}
})

core.register_node("vessels:clay_bowl", {
	description = S("Empty Clay Bowl"),
	drawtype = "plantlike",
	tiles = {"vessels_clay_bowl.png"},
	inventory_image = "vessels_clay_bowl.png",
	wield_image = "vessels_clay_bowl.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, 0, .25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("vessels:clay_bowl_unfired", {
	description = S("Unfired Clay Bowl"),
	drawtype = "plantlike",
	tiles = {"vessels_clay_bowl_unfired.png"},
	inventory_image = "vessels_clay_bowl_unfired.png",
	wield_image = "vessels_clay_bowl_unfired.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.5, -.25, .25, 0, .25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
})

core.register_craft({
	output = "vessels:clay_bowl_unfired 6",
	recipe = {
		{"default:clay_lump", "", "default:clay_lump"},
		{"", "default:clay_lump", ""}
	}
})

core.register_craft({
	type = "shapeless",
	output = "default:clay_lump",
	recipe = {"vessels:clay_bowl_unfired", "vessels:clay_bowl_unfired"},
})

core.register_craft({
	type = "cooking",
	output = "vessels:clay_bowl",
	recipe = "vessels:clay_bowl_unfired"
})

core.register_node("vessels:glass_bottle", {
	description = S("Empty Glass Bottle"),
	drawtype = "plantlike",
	tiles = {"vessels_glass_bottle.png"},
	inventory_image = "vessels_glass_bottle.png",
	wield_image = "vessels_glass_bottle.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "vessels:glass_bottle 10",
	recipe = {
		{"default:glass", "", "default:glass"},
		{"default:glass", "", "default:glass"},
		{"", "default:glass", ""}
	}
})

core.register_node("vessels:glass_jar", {
	description = S("Empty Glass Jar"),
	drawtype = "plantlike",
	tiles = {"vessels_glass_jar.png"},
	inventory_image = "vessels_glass_jar.png",
	wield_image = "vessels_glass_jar.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "vessels:glass_jar 10",
	recipe = {
		{"default:glass", "", "default:glass"},
		{"default:glass", "default:glass", "default:glass"}
	}
})

core.register_node("vessels:drinking_glass", {
	description = S("Empty Drinking Glass"),
	drawtype = "plantlike",
	tiles = {"vessels_drinking_glass.png"},
	inventory_image = "vessels_drinking_glass.png",
	wield_image = "vessels_drinking_glass.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "vessels:drinking_glass 14",
	recipe = {
		{"default:glass", "", "default:glass"},
		{"default:glass", "", "default:glass"},
		{"default:glass", "default:glass", "default:glass"}
	}
})

core.register_craftitem("vessels:ceramic_lump", {
	description = "Ceramic Lump",
	inventory_image = "vessels_ceramic_lump.png",
})

core.register_craft({
	output = "vessels:ceramic_lump 8",
	recipe = {
		{"default:clay", "default:silver_lump", "group:sand"}
	}
})

core.register_node("vessels:ceramic_cup", {
	description = S("Empty Ceramic Drinking Cup"),
	drawtype = "nodebox",
	tiles = {"vessels_ceramic_cup_top.png", "vessels_ceramic_cup.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = "fixed",
		fixed = {
			{-3/16, -.5, -3/16, 3/16, -7/16, 3/16},
			{-3/16, -.5, -3/16, -2/16, -3/16, 3/16},
			{-3/16, -.5, -3/16, 3/16, -3/16, -2/16},
			{2/16, -.5, -3/16, 3/16, -3/16, 3/16},
			{-3/16, -.5, 2/16, 3/16, -3/16, 3/16},
			{3/16, -.5, -.055, 5/16, -3/16, .055}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-3/16, -.5, -3/16, 3/16, -3/16, 3/16}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

vessels.register_cup = function(name, desc, texture, itemeat, cupgroups)

cupgroups = cupgroups or {vessel = 1, dig_immediate = 3, attached_node = 1, drink = 1}

core.register_node(name, {
	description = desc,
	drawtype = "nodebox",
	tiles = {"vessels_ceramic_cup_top.png^".. texture ..".png", "vessels_ceramic_cup.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	on_rotate = screwdriver.rotate_simple,
	on_use = itemeat,
	node_box = {
		type = "fixed",
		fixed = {
		{-3/16, -.5, -3/16, 3/16, -.22, 3/16},
		{-3/16, -.5, -3/16, -2/16, -3/16, 3/16},
		{-3/16, -.5, -3/16, 3/16, -3/16, -2/16},
		{2/16, -.5, -3/16, 3/16, -3/16, 3/16},
		{-3/16, -.5, 2/16, 3/16, -3/16, 3/16},
		{3/16, -.5, -.055, 5/16, -3/16, .055}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-3/16, -.5, -3/16, 3/16, -3/16, 3/16}
	},
	groups = cupgroups,
	on_construct = function(pos)
		core.get_node_timer(pos):start(3)
	end,
	on_timer = function(pos, elapsed)
		if core.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" then
	core.add_particlespawner({
		amount = 6,
		time = 1,
		minpos = {x=pos.x, y=pos.y-.2, z=pos.z},
		maxpos = {x=pos.x, y=pos.y+.1, z=pos.z},
		minvel = {x=-.01, y=.01, z=-.01},
		maxvel = {x=.01, y=.02, z=.01},
		minacc = {x=0,y=0,z=0},
		maxacc = {x=0,y=.01,z=0},
		exptime = {min = 1, max = 4},
		minsize = 1,
		maxsize = 3,
		collisiondetection = true,
		texture = "hot_beverage_steam.png"})
		end
		core.get_node_timer(pos):start(3)
	end,
	sounds = default.node_sound_glass_defaults(),
})
end

core.register_node("vessels:ceramic_cup_unfired", {
	description = S("Unfired Ceramic Drinking Cup"),
	drawtype = "nodebox",
	tiles = {"vessels_ceramic_cup_top.png^[colorize:yellow:8", "vessels_ceramic_cup.png^[colorize:yellow:8"},
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = "fixed",
		fixed = {
			{-3/16, -.5, -3/16, 3/16, -7/16, 3/16},
			{-3/16, -.5, -3/16, -2/16, -3/16, 3/16},
			{-3/16, -.5, -3/16, 3/16, -3/16, -2/16},
			{2/16, -.5, -3/16, 3/16, -3/16, 3/16},
			{-3/16, -.5, 2/16, 3/16, -3/16, 3/16},
			{3/16, -.5, -.055, 5/16, -3/16, .055}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-3/16, -.5, -3/16, 3/16, -3/16, 3/16}
	},
	groups = {dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
})

core.register_craft({
	output = "vessels:ceramic_cup_unfired 4",
	recipe = {
		{"vessels:ceramic_lump", "", "vessels:ceramic_lump"},
		{"vessels:ceramic_lump", "vessels:ceramic_lump", ""}
	}
})

core.register_craft({
	type = "shapeless",
	output = "vessels:ceramic_lump 2",
	recipe = {"vessels:ceramic_cup_unfired", "vessels:ceramic_cup_unfired"},
})

core.register_craft({
	type = "cooking",
	cooktime = 19,
	output = "vessels:ceramic_cup",
	recipe = "vessels:ceramic_cup_unfired",
})

core.register_node("vessels:ceramic_plate", {
	description = S("Empty Ceramic Plate"),
	drawtype = "plantlike",
	tiles = {"vessels_ceramic_plate.png"},
	inventory_image = "vessels_ceramic_plate.png",
	wield_image = "vessels_ceramic_plate.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.28, -.5, -.28, .28, -.15, .28}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("vessels:ceramic_plate_unfired", {
	description = S("Unfired Ceramic Plate"),
	drawtype = "plantlike",
	tiles = {"vessels_ceramic_plate.png^[colorize:yellow:8"},
	inventory_image = "vessels_ceramic_plate.png^[colorize:yellow:8",
	wield_image = "vessels_ceramic_plate.png^[colorize:yellow:8",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.28, -.5, -.28, .28, -.15, .28}
	},
	groups = {dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
})

core.register_craft({
	output = "vessels:ceramic_plate_unfired 3",
	recipe = {
		{"vessels:ceramic_lump", "vessels:ceramic_lump", "vessels:ceramic_lump"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "vessels:ceramic_lump 2",
	recipe = {"vessels:ceramic_plate_unfired", "vessels:ceramic_plate_unfired"},
})

core.register_craft({
	type = "cooking",
	cooktime = 19,
	output = "vessels:ceramic_plate",
	recipe = "vessels:ceramic_plate_unfired",
})

core.register_node("vessels:mixing_bowl", {
	description = S("Empty Glass Mixing Bowl"),
	drawtype = "plantlike",
	tiles = {"vessels_mixing_bowl.png"},
	inventory_image = "vessels_mixing_bowl.png",
	wield_image = "vessels_mixing_bowl.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .3, .3}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "vessels:mixing_bowl 6",
	recipe = {
		{"default:glass", "", "default:glass"},
		{"", "default:glass", ""}
	}
})

core.register_node("vessels:ceramic_vase", {
	description = S("Empty Ceramic Vase"),
	drawtype = "plantlike",
	tiles = {"vessels_ceramic_vase.png"},
	inventory_image = "vessels_ceramic_vase.png",
	wield_image = "vessels_ceramic_vase.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("vessels:ceramic_vase_unfired", {
	description = S("Unfired Ceramic Vase"),
	drawtype = "plantlike",
	tiles = {"vessels_ceramic_vase.png^[colorize:yellow:8"},
	inventory_image = "vessels_ceramic_vase.png^[colorize:yellow:8",
	wield_image = "vessels_ceramic_vase.png^[colorize:yellow:8",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
})

core.register_craft({
	output = "vessels:ceramic_vase_unfired 5",
	recipe = {
		{"vessels:ceramic_lump", "", "vessels:ceramic_lump"},
		{"vessels:ceramic_lump", "", "vessels:ceramic_lump"},
		{"", "vessels:ceramic_lump", ""}
	}
})

core.register_craft({
	type = "shapeless",
	output = "vessels:ceramic_lump 2",
	recipe = {"vessels:ceramic_vase_unfired", "vessels:ceramic_vase_unfired"},
})

core.register_craft({
	type = "cooking",
	cooktime = 19,
	output = "vessels:ceramic_vase",
	recipe = "vessels:ceramic_vase_unfired",
})

core.register_node("vessels:ceramic_vase_flowers", {
	description = S("Ceramic Vase with Flowers"),
	drawtype = "plantlike",
	tiles = {"vessels_ceramic_vase_flowers.png"},
	inventory_image = "vessels_ceramic_vase_flowers.png",
	wield_image = "vessels_ceramic_vase_flowers.png",
	paramtype = "light",
	visual_scale = 2,
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "vessels:ceramic_vase_flowers 2",
	recipe = {"group:flower,color_white", "group:flower,color_violet", "group:flower,color_blue",
	"group:flower,color_orange", "group:flower,color_red", "group:flower,color_magenta",
	"group:flower,color_pink", "vessels:ceramic_vase", "vessels:ceramic_vase"}
})

core.register_node("vessels:steel_bottle", {
	description = S("Empty Heavy Steel Bottle"),
	drawtype = "plantlike",
	tiles = {"vessels_steel_bottle.png"},
	inventory_image = "vessels_steel_bottle.png",
	wield_image = "vessels_steel_bottle.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
})

core.register_craft({
	output = "vessels:steel_bottle 5",
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"", "default:steel_ingot", ""}
	}
})


-- Glass and steel recycling

core.register_craftitem("vessels:glass_fragments", {
	description = S("Glass Fragments"),
	inventory_image = "vessels_glass_fragments.png",
})

core.register_craft({
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {"vessels:glass_bottle", "vessels:glass_bottle"},
})

core.register_craft({
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {"vessels:glass_jar", "vessels:glass_jar"},
})

core.register_craft({
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {"vessels:drinking_glass", "vessels:drinking_glass"},
})

core.register_craft({
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {"vessels:mixing_bowl", "vessels:mixing_bowl"},
})

core.register_craft({
	type = "cooking",
	output = "default:glass",
	recipe = "vessels:glass_fragments",
})

core.register_craft({
	type = "cooking",
	output = "default:steel_ingot",
	recipe = "vessels:steel_bottle",
})

core.register_craft({
	type = "fuel",
	recipe = "vessels:wood_bowl",
	burntime = 10,
})

core.register_craft({
	type = "fuel",
	recipe = "vessels:shelf",
	burntime = 30,
})

-- Register glass fragments as dungeon loot
if core.global_exists("dungeon_loot") then
	dungeon_loot.register({
		name = "vessels:glass_fragments", chance = .35, count = {1, 4}
	})
end
