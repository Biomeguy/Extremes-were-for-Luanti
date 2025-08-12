
-- Present boxs --

core.register_node("noel:present_box", {
	description = "Present Box",
	tiles = {"noel_present_box.png"},
	is_ground_content = false,
	groups = {crumbly=3},
	sounds = default.node_sound_defaults(),
})

-- coloured Present --

local function register_present(name, description, colorCode, dye)

core.register_node("noel:present_"..name, {
	description = description .." Noel Present",
	tiles = {"noel_present.png^[colorize:#" ..colorCode.. "^noel_bow_top.png",
		"noel_present.png^[colorize:#" ..colorCode.. "^noel_bow_bottom.png",
		"noel_present.png^[colorize:#" ..colorCode.. "^noel_bow_side.png"},
	is_ground_content = false,
	groups = {crumbly=3},
	drop = {
		max_items = 1, items = {
			{items = {"default:bookshelf"}, rarity = 13},
			{items = {"default:pick_mese"}, rarity = 16},
			{items = {"default:shovel_steel"}, rarity = 17},
			{items = {"default:axe_steel"}, rarity = 17},
			{items = {"default:pick_steel"}, rarity = 17},
			{items = {"default:sign_wall_wood"}, rarity = 8},
			{items = {"default:chest"}, rarity = 8},
			{items = {"default:furnace"}, rarity = 9},
			{items = {"default:steel_block"}, rarity = 16},
			{items = {"default:coal_lump"}, rarity = 10},
			{items = {"default:pick_diamond"}, rarity = 15},
			{items = {"default:shovel_diamond"}, rarity = 15},
			{items = {"default:axe_diamond"}, rarity = 15},
			{items = {"default:diamond_block"}, rarity = 15},
			{items = {"fire:flint_and_steel"}, rarity = 14},
			{items = {"default:chest_locked"}, rarity = 11},
			{items = {"default:brick"}, rarity = 12},
			{items = {"default:dirt_with_grass"}},
	}},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=.4},
	}),
})

core.register_craft({
	output = "noel:present_".. name,
	recipe = {
		{"noel:paper_".. name, "noel:red_ribbon", "noel:paper_".. name},
		{"noel:paper_".. name, "noel:present_box", "noel:paper_".. name},
		{"noel:paper_".. name, "noel:red_ribbon", "noel:paper_".. name}
	}
})

end

core.register_node("noel:glass_bauble",{
	description = "Bauble",
	drawtype = "nodebox",
	tiles = {"noel_baubles-top.png^noel_baubles_top.png",
		"noel_baubles-top.png^noel_baubles_side.png",
		"noel_baubles-side.png^noel_baubles_side.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	is_ground_content = false,
	groups = {crumbly=3},
	sounds = default.node_sound_glass_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-.0625, .375, -.0625, .0625, .5, .0625},
			{-.25, -.0625, -.25, .25, .4375, .25}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.0625, -.25, .25, .4375, .25}
	},
})

core.register_craft({
	output = "noel:glass_bauble 8",
	recipe = {
		{"default:glass", "default:gold_ingot", "default:glass"},
		{"default:glass", "", "default:glass"},
		{"default:glass", "default:glass", "default:glass"}
	}
})

local function register_baubles(name, description, colorCode, dye)

core.register_node("noel:" .. name .. "_baubles",{
	description = description.. " Baubles",
	drawtype = "nodebox",
	tiles = { "noel_baubles.png^[colorize:#" ..colorCode.. "^noel_baubles_top.png",
		"noel_baubles.png^[colorize:#" ..colorCode.. "^noel_baubles_side.png",
		"noel_baubles.png^[colorize:#" ..colorCode.. "^noel_baubles_side.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	is_ground_content = false,
	groups = {crumbly=3},
	sounds = default.node_sound_glass_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-.0625, .375, -.0625, .0625, .5, .0625},
			{-.25, -.0625, -.25, .25, .4375, .25}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.25, -.0625, -.25, .25, .4375, .25}
	},
})

core.register_craft({
	output = "noel:" .. name .. "_baubles 8",
	recipe = {
		{"default:glass", "default:gold_ingot", "default:glass"},
		{"default:glass", "dye:".. dye, "default:glass"},
		{"default:glass", "default:glass", "default:glass"}
	}
})
end

local function register_paper(name, description, colorCode, dye)

core.register_craftitem("noel:paper_".. name, {
	description = description .." paper",
	inventory_image = "default_paper.png^[colorize:#" .. colorCode,
})

core.register_craft({
	type = "shapeless",
	output = "noel:paper_".. name,
	recipe = {"dye:".. dye, "default:paper"},
})
end

colours = {
	-- RGB Prime Colours --
	{name="red", code="FF000099", description="Red", dye="red"},
	{name="green", code="00FF0099", description="Green", dye="green"},
	{name="blue", code="0000FF99", description="Blue", dye="blue"},
	-- RGB Secondary Colour --
	{name="yellow", code="FFFF0099", description="Yellow", dye="yellow"},
	{name="magenta", code="FF00FF99", description="Magenta", dye="magenta"},
	{name="cyan", code="00FFFF99", description="Cyan", dye="cyan"},
	-- RGB Other Colours --
	{name="orange", code="E5940099", description="Orange", dye="orange"},
	{name="darkgreen", code="004C0099", description="Dark Green", dye="dark_green"},
	{name="violet", code="80008099", description="Violet", dye="purple"},
	{name="pink", code="fd7995cc", description="Pink", dye="pink"},
	{name="brown", code="732c0b99", description="Brown", dye="brown"},
	-- MonoChrome --
	{name="white", code="FFFFFFcc", description="White", dye="white"},
	{name="grey", code="80808099", description="Grey", dye="grey"},
	{name="darkgrey", code="14141499", description="Dark Grey", dye="dark_grey"}
}

for i,colour in ipairs(colours) do
	register_present(colour.name, colour.description, colour.code, colour.dye)
	register_baubles(colour.name, colour.description, colour.code, colour.dye)
	register_paper(colour.name, colour.description, colour.code, colour.dye)
	-- register whatever here
end

-- misc nodes
core.register_node("noel:wreath", {
	description = "Noel Wreath",
	drawtype = "signlike",
	tiles = {"noel_wreath.png"},
	inventory_image = "noel_wreath.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	selection_box = {
		type = "wallmounted",
	},
	walkable = false,
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 3},
})

core.register_node("noel:star", {
	description = "Noel Star",
	drawtype = "plantlike",
	light_source = 10,
	tiles = {"noel_star.png"},
	inventory_image = "noel_star.png",
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.4, -.3, .3, .4, .3},
	},
	groups = {dig_immediate=2},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("noel:leaves", {
	description = "Noel leaves",
	drawtype = "allfaces_optional",
	tiles = {"noel_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {crumbly=3},
	sounds = default.node_sound_leaves_defaults(),
})

-- snowman
core.register_node("noel:snowman_head", {
	description = "Snowman Head",
	tiles = {"default_snow.png", "default_snow.png", "default_snow.png",
		"default_snow.png", "default_snow.png", "Snowman_F.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {crumbly=3},
	sounds = default.node_sound_snow_defaults(),
})

-- snow steps
core.register_node("noel:snow_slab",{
	description = "Snow Slab",
	drawtype = "nodebox",
	tiles = {"default_snow.png"},
	walkable = false,
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {crumbly=3},
	sounds = default.node_sound_snow_defaults(),
	drop = "default:snow",
	node_box = {
		type = "fixed",
		fixed = {-.5, -1, -.5, .5, -.625, .5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-.5, -1, -.5, .5, -.4375, .5}
	},
})

core.register_node("noel:snow_steps",{
	description = "Snow Stairs",
	drawtype = "nodebox",
	tiles = {"default_snow.png"},
	walkable = false,
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {crumbly=3},
	sounds = default.node_sound_snow_defaults(),
	drop = "default:snow 2",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -1, -.5, .5, -.625, 0},
			{-.5, -.5, 0, .5, -.125, .5}
		}
	},
})

core.register_node("noel:snow_steps_1",{
	description = "Snow Stairs",
	drawtype = "nodebox",
	tiles = {"default_snow.png"},
	walkable = false,
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {crumbly=3},
	sounds = default.node_sound_snow_defaults(),
	drop = "default:snow 2",
	node_box = {
		type = "fixed",
		fixed = {
			{0, -1, -.5, .5, -.625, 0},
			{-.5, -.5, 0, .5, -.125, .5},
			{-.5, -.5, -.5, 0, -.125, .0625}
		}
	},
})

core.register_node("noel:snow_steps_2",{
	description = "Snow Stairs",
	drawtype = "nodebox",
	tiles = {"default_snow.png"},
	walkable = false,
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {crumbly=3},
	sounds = default.node_sound_snow_defaults(),
	drop = "default:snow 3",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -1, -.5, .5, -.625, 0},
			{-.5, -.5, 0, 0, -.125, .5},
			{0, -1, 0, .5, -.625, .5}
		}
	},
})

core.register_node("noel:apple_pudding", {
	description = "Apple Pudding",
	tiles = {"apple_pud-top.png", "apple_pud-bot.png", "apple_pud-side.png"},
	drawtype = "nodebox",
	paramtype = "light",
	use_texture_alpha = "clip",
	groups = {crumbly=3},
	sounds = default.node_sound_sand_defaults(),
	on_use = core.item_eat(8),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, 0.0625, 0.3125},
			{-0.0625, 0.0625, 0, 0, 0.125, 0.0625},
			{0, 0.0625, -0.0625, 0.0625, 0.125, 0}
		}
	}
})

local stocking_formspec = [[
size[8,7]
list[context;main;0,.2;8,2;]
list[current_player;main;0,2.85;8,1;]
list[current_player;main;0,4.08;8,3;8]
listring[context;main]
listring[current_player;main]
]]

core.register_node("noel:stocking_bag", {
	description = "Noel Stocking Bag",
	drawtype = "signlike",
	walkable = false,
	tiles = {"noel_stocking_bag.png"},
	inventory_image = "noel_stocking_bag.png",
	wield_image = "noel_stocking_bag.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	selection_box = {
		type = "wallmounted",
	},
	groups = {oddly_breakable_by_hand = 3},
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec", stocking_formspec)
		meta:set_string("infotext", "Noel Stocking Bag")
		local inv = meta:get_inventory()
		inv:set_size("main", 16)
	end,
	can_dig = function(pos,player)
		local meta = core.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		core.log("action", player:get_player_name()..
				" moves stuff in box at "..core.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name()..
				" moves stuff to box at "..core.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		core.log("action", player:get_player_name()..
				" takes stuff from box at "..core.pos_to_string(pos))
	end,
})

-- candy cane --
core.register_node("noel:candy_cane", {
	description = "Candy Cane",
	drawtype = "torchlike",
	tiles = {"noel_candy_cain_stick_wall.png"},
	inventory_image = "noel_candy_cain_stick.png",
	wield_image = "noel_candy_cain_stick.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	on_use = core.item_eat(1),
	selection_box = {
		type = "wallmounted",
		wall_side = {-.5, -.3, -.1, -.5+.3, .3, .1},
	},
	groups = {choppy=2,dig_immediate=3,flammable=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})

core.register_node("noel:candy_cane_node", {
	description = "Giant Candy Cane",
	tiles = {"noel-candy_cabe.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("noel:candy_cane_tree", {
	description = "Candy Cane Tree",
	tiles = {"noel-candy_cabe_top.png", "noel-candy_cabe_top.png", "noel-candy_cabe.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_craftitem("noel:red_ribbon", {
	description = "Red Ribbon",
	inventory_image = "noel_red_ribbon.png",
})

core.register_craftitem("noel:wish_list", {
	description = "Wish list",
	inventory_image = "noel_which_list.png",
})

core.register_craftitem("noel:apple_pudding_mix", {
	description = "Apple Pudding Mix",
	inventory_image = "apple_pud-mix.png",
})

core.register_craftitem("noel:ginger_mix", {
	description = "Ginger Chocolate Bread Cookie Mix",
	inventory_image = "noel_ginger-mix.png",
})

core.register_node("noel:ginger_bread_cookie", {
	description = "Ginger Chocolate Bread Cookie",
	drawtype = "signlike",
	walkable = false,
	tiles = {"ginger_bread_cookie.png"},
	inventory_image = "ginger_bread_cookie.png",
	wield_image = "ginger_bread_cookie.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	selection_box = {type = "wallmounted"},
	groups = {oddly_breakable_by_hand = 3},
	on_use = core.item_eat(6),
})

-- decorations --
core.register_craft({
	output = "noel:leaves 4",
	recipe = {
		{"default:beech_leaves", "default:beech_leaves"},
		{"default:beech_leaves", "default:beech_leaves"}
	}
})

core.register_craft({
	output = "noel:star 4",
	recipe = {
		{"","default:gold_ingot",""},
		{"","default:meselamp",""},
		{"default:gold_ingot","","default:gold_ingot"}
	}
})

core.register_craft({
	output = "noel:wreath",
	recipe = {
		{"noel:leaves","noel:leaves","noel:leaves"},
		{"noel:leaves", "", "noel:leaves"},
		{"noel:leaves","noel:red_ribbon","noel:leaves"}
	}
})

core.register_craft({
	output = "noel:wreath",
	recipe = {
		{"fir:needles","fir:needles","fir:needles"},
		{"fir:needles", "", "fir:needles"},
		{"fir:needles","noel:red_ribbon","fir:needles"}
	}
})

core.register_craft({
	output = "noel:stocking_bag 2",
	recipe = {
		{"fabric:sheet_white","","fabric:sheet_white"},
		{"fabric:sheet_red","fabric:sheet_red","fabric:sheet_red"}
	}
})

-- snow node --

core.register_craft({
	output = "noel:snow_slab 3",
	recipe = {{"default:snow", "default:snow", "default:snow"}}
})

core.register_craft({
	output = "noel:snow_steps 3",
	recipe = {
		{"default:snow", "", ""},
		{"default:snow", "default:snow", ""},
		{"default:snow", "default:snow", "default:snow"}
	}
})

core.register_craft({
	output = "noel:snow_steps_1 3",
	recipe = {
		{"noel:snow_steps", "noel:snow_steps", ""},
		{"noel:snow_steps", "", ""}
	}
})

core.register_craft({
	output = "noel:snow_steps_2",
	recipe = {{"noel:snow_steps"}}
})

core.register_craft({
	output = "noel:snowman_head",
	recipe = {
		{"default:coal_lump", "default:snow", "default:coal_lump"},
		{"default:snow", "farming:carrot", "default:snow"},
		{"default:snow", "default:coal_lump", "default:snow"}
	},
	replacements = {{"farming:carrot", "farming:carrot_leaves"}}
})

-- food --

core.register_craft({
	output = "noel:ginger_mix",
	type = "shapeless",
	recipe = {"group:flour", "group:sugar", "farming:ginger", "farming:cutting_board",
"farming:cocoa_powder", "farming:mortar_pestle", "bucket:bucket_water"},
	replacements = {
		{"farming:cutting_board", "farming:cutting_board"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

core.register_craft({
	type = "cooking",
	output = "noel:ginger_bread_cookie 6",
	recipe = "noel:ginger_mix",
})

core.register_craft({
	output = "noel:apple_pudding_mix",
	recipe = {
		{"group:sugar", "group:sugar", "group:sugar"},
		{"default:apple", "group:flour", "default:apple"},
		{"group:flour", "default:apple", "group:flour"}
	}
})

core.register_craft({
	type = "cooking",
	output = "noel:apple_pudding",
	recipe = "noel:apple_pudding_mix",
})

core.register_craft({
	output = "noel:candy_cane",
	recipe = {
		{"", "group:sugar", "group:sugar"},
		{"dye:red", "group:sugar", "farming:mint_leaf"},
		{"group:sugar", "farming:mint_leaf", ""}
	}
})

core.register_craft({
	output = "noel:candy_cane_node",
	recipe = {
		{"noel:candy_cane", "noel:candy_cane", "noel:candy_cane"},
		{"noel:candy_cane", "", "noel:candy_cane"},
		{"noel:candy_cane", "noel:candy_cane", "noel:candy_cane"}
	}
})

core.register_craft({
	output = "noel:candy_cane_tree",
	recipe = {
		{"noel:candy_cane", "noel:candy_cane", "noel:candy_cane"},
		{"noel:candy_cane", "group:trunk", "noel:candy_cane"},
		{"noel:candy_cane", "noel:candy_cane", "noel:candy_cane"}
	}
})

-- ribbon craft --

core.register_craft({
	type = "shapeless",
	output = "noel:red_ribbon",
	recipe = {"dye:red", "fabric:string", "fabric:string"},
})

-- wish list craft --

core.register_craft({
	type = "shapeless",
	output = "noel:wish_list",
	recipe = {"default:stick", "default:mese_crystal", "default:paper", "dye:black"},
})

-- present box --

core.register_craft({
	output = "noel:present_box",
	recipe = {
		{"default:paper", "default:paper", "default:paper"},
		{"default:paper", "noel:wish_list", "default:paper"},
		{"default:paper", "default:paper", "default:paper"}
	}
})
