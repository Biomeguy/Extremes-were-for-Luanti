
local S = core.get_translator("farming")

-- Sapling Registration Functions

function farming.grow_avocado_tree(pos)
	add_tree(pos, 3, 1, 3, farming.avocado_tree)
end

function farming.grow_date_palm(pos)
	if math.random(2) == 1 then
		add_tree(pos, 5, 1, 5, farming.date_palm, "0")
	else
		add_tree(pos, 5, 1, 5, farming.date_palm, "0",
			{{"farming:dates_4", "farming:male_date_flower_mark"}})
	end
	pos.y = pos.y+14
	if core.get_node(pos).name == "farming:date_palm_trunk" then
		core.get_node_timer(pos):start(6)
		pos.y = pos.y+1
		if core.get_node(pos).name == "farming:date_palm_trunk" then
			core.get_node_timer(pos):start(6)
			pos.y = pos.y+1
			if core.get_node(pos).name == "farming:date_palm_trunk" then
				core.get_node_timer(pos):start(6)
			end
		end
	end
end

function farming.grow_cherry_tree(pos)
	if core.find_node_near(pos, 1, {"default:crystal_spike", "default:crystal_block", "group:icy", "group:snowy"}) then
add_tree(pos, 4, 1, 4, farming.cherry_tree, nil, {{"farming:cherry_leaves_fruiting", "farming:cherry_leaves_blooming"}})
	else
		add_tree(pos, 4, 1, 4, farming.cherry_tree)
	end
end

function farming.grow_cinnamon_tree(pos)
	if math.random(3) == 1 then
		add_tree(pos, 3, 1, 3, farming.cinnamon_tree2)
	else
		add_tree(pos, 4, 1, 4, farming.cinnamon_tree)
	end
end

function farming.grow_cocoa_tree(pos)
	add_tree(pos, 2, 1, 2, farming.cocoa_tree)
end

function farming.grow_fig_tree(pos)
	add_tree(pos, 3, 1, 3, farming.fig_tree)
end

function farming.grow_hazelnut_tree(pos)
	add_tree(pos, 3, 1, 3, farming.hazelnut_tree)
end

function farming.grow_lemon_tree(pos)
	add_tree(pos, 3, 1, 3, farming.lemon_tree)
end

function farming.grow_lime_tree(pos)
	add_tree(pos, 3, 1, 3, farming.lime_tree)
end

function farming.grow_mandarin_tree(pos)
	add_tree(pos, 0, 1, 0, farming.mandarin_tree, "0")
end

function farming.grow_mango_tree(pos)
	add_tree(pos, 3, 1, 3, farming.mango_tree)
end

function farming.grow_mirabelle_tree(pos)
	add_tree(pos, 3, 1, 3, farming.mirabelle_tree)
end

function farming.grow_nutmeg_tree(pos)
	add_tree(pos, 3, 1, 3, farming.nutmeg_tree)
end

function farming.grow_olive_tree(pos)
	add_tree(pos, 3, 1, 3, farming.olive_tree, "0")
end

function farming.grow_peach_tree(pos)
	add_tree(pos, 3, 1, 3, farming.peach_tree)
end

function farming.grow_pear_tree(pos)
	add_tree(pos, 3, 1, 3, farming.pear_tree)
end

function farming.grow_pecan_tree(pos)
	add_tree(pos, 3, 1, 3, farming.pecan_tree)
end

function farming.grow_plum_tree(pos)
	add_tree(pos, 3, 1, 3, farming.plum_tree)
end

function farming.grow_pomegranate_tree(pos)
	add_tree(pos, 3, 1, 3, farming.pomegranate_tree)
end

function farming.grow_walnut_tree(pos)
	add_tree(pos, 3, 1, 3, farming.walnut_tree)
end

function farming.grow_sapling(pos, node)
	if not default.can_grow(pos) then
		core.get_node_timer(pos):start(300)
		return
	end

	if node.name == "farming:avocado_sapling" then
		farming.grow_avocado_tree(pos)

	elseif node.name == "farming:cherry_sapling" then
		farming.grow_cherry_tree(pos)

	elseif node.name == "farming:cinnamon_sapling" then
		farming.grow_cinnamon_tree(pos)

	elseif node.name == "farming:cocoa_sapling" then
		farming.grow_cocoa_tree(pos)

	elseif node.name == "farming:fig_sapling" then
		farming.grow_fig_tree(pos)

	elseif node.name == "farming:hazelnut_sapling" then
		farming.grow_hazelnut_tree(pos)

	elseif node.name == "farming:lemon_sapling" then
		farming.grow_lemon_tree(pos)

	elseif node.name == "farming:lime_sapling" then
		farming.grow_lime_tree(pos)

	elseif node.name == "farming:mandarin_sapling" then
		farming.grow_mandarin_tree(pos)

	elseif node.name == "farming:mango_sapling" then
		farming.grow_mango_tree(pos)

	elseif node.name == "farming:mirabelle_sapling" then
		farming.grow_mirabelle_tree(pos)

	elseif node.name == "farming:nutmeg_sapling" then
		farming.grow_nutmeg_tree(pos)

	elseif node.name == "farming:olive_sapling" then
		farming.grow_olive_tree(pos)

	elseif node.name == "farming:peach_sapling" then
		farming.grow_peach_tree(pos)

	elseif node.name == "farming:pear_sapling" then
		farming.grow_pear_tree(pos)

	elseif node.name == "farming:pecan_sapling" then
		farming.grow_pecan_tree(pos)

	elseif node.name == "farming:plum_sapling" then
		farming.grow_plum_tree(pos)

	elseif node.name == "farming:pomegranate_sapling" then
		farming.grow_pomegranate_tree(pos)

	elseif node.name == "farming:walnut_sapling" then
		farming.grow_walnut_tree(pos)
	end
end

-- register saplings
function farming.register_sapling(name, desc, texture, height)

	texture = texture or "default_apple_sapling"

	core.register_node("farming:".. name .."_sapling", {
		description = S(desc .." Tree Sapling"),
		drawtype = "plantlike",
		tiles = {texture ..".png"},
		inventory_image = texture ..".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-.3, -.5, -.3, .3, .35, .3}
		},
		on_construct = function(pos)
			core.get_node_timer(pos):start(math.random(300, 1500))
		end,
		on_timer = function(pos, elapsed)
			local node = core.get_node(pos)
			farming.grow_sapling(pos, node)
		end,
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),
		grown_height = height,
	})
end

farming.register_sapling("avocado", "Avocado", nil, 4)
farming.register_sapling("cherry", "Cherry", "farming_cherry_sapling", 6)
farming.register_sapling("cinnamon", "Cinnamon", nil, 7)
farming.register_sapling("cocoa", "Cocoa", "farming_cocoa_sapling", 13)
farming.register_sapling("fig", "Fig", nil, 4)
farming.register_sapling("hazelnut", "Hazelnut", nil, 4)
farming.register_sapling("lemon", "Lemon", nil, 4)
farming.register_sapling("lime", "Lime", nil, 4)
farming.register_sapling("mandarin", "Mandarin", "farming_mandarin_sapling", 1)
farming.register_sapling("mango", "Mango", nil, 4)
farming.register_sapling("mirabelle", "Mirabelle", nil, 4)
farming.register_sapling("nutmeg", "Nutmeg", nil, 4)
farming.register_sapling("olive", "Olive", "farming_olive_sapling", 4)
farming.register_sapling("peach", "Peach", nil, 4)
farming.register_sapling("pear", "Pear", nil, 4)
farming.register_sapling("pecan", "Pecan", nil, 5)
farming.register_sapling("plum", "Plum", nil, 4)
farming.register_sapling("pomegranate", "Pomegranate", "farming_pomegranate_sapling", 4)
farming.register_sapling("walnut", "Walnut", nil, 5)

local function after_place_leaves(...)
	return default.after_place_leaves(...)
end

-- avocado
core.register_craftitem("farming:avocado", {
	description = S("Avocado"),
	inventory_image = "farming_avocado.png",
	groups = {flammable = 2},
	on_use = core.item_eat(5, "farming:avocado_pit"),
})

core.register_craftitem("farming:avocado_pit", {
	description = S("Avocado Pit"),
	inventory_image = "farming_avocado_pit.png",
	groups = {flammable = 2},
})

core.register_craft({
	output = "farming:avocado_sapling",
	recipe = {
		{"farming:avocado_pit"},
		{"default:dirt"},
	}
})

-- trunk
core.register_node("farming:avocado_trunk", {
	description = "Avocado Trunk",
	tiles = {"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	is_ground_content = false,
	drop = "default:apple_trunk",
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"farming:avocado_leaves", "farming:avocado_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:avocado_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:avocado_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:avocado_leaves_blooming" then
					core.set_node(p, {name = "farming:avocado_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

-- leaves
core.register_node("farming:avocado_leaves", {
	description = S("Avocado Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_mango_leaves.png^[colorize:green:30"},
	inventory_image = leaf_image("farming_mango_leaves.png^[colorize:green:30"),
	wield_image = leaf_image("farming_mango_leaves.png^[colorize:green:30"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:avocado_sapling"}, rarity = 20},
			{items = {"farming:avocado_leaves"}}
		}
	},
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

-- blooming
core.register_node("farming:avocado_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_mango_leaves.png^[colorize:green:30^farming_avocado_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:avocado_sapling"}, rarity = 20},
			{items = {"farming:avocado_leaves"}}
		}
	},
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})

-- fruiting
core.register_node("farming:avocado_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_mango_leaves.png^[colorize:green:30^farming_avocados.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:avocado_leaves",
	drop = {
		items = {
			{items = {"farming:avocado 5"}},
			{items = {"farming:avocado 2"}, rarity = 2},
			{items = {"farming:avocado 4"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:avocado_leaves"})
		local f = core.find_node_near(pos, 2, {"farming:avocado_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local L = {name = "farming:avocado_leaves_fruiting"}
local T = {name = "farming:avocado_trunk", force_place = true}

farming.avocado_tree = {size = {x = 7, y = 8, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,T,_,_,L,L,
_,L,L,_,T,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,_,_,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,T,L,L,
_,L,T,_,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- Giant bean stalk
core.register_node("farming:beanstalk_trunk", {
	description = S("Bean Stalk Trunk"),
	tiles = {"farming_beanstalk_top.png", "farming_beanstalk_top.png", "farming_beanstalk.png"},
	is_ground_content = false,
	groups = {choppy = 3, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:beanstalk_sapling", {
	description = S("Bean Stalk"),
	tiles = {"farming_beanstalk_top.png", "farming_beanstalk_top.png", "farming_beanstalk.png"},
	inventory_image = "farming_beans_green.png^[colorize:maroon:60",
	wield_image = "farming_beans_green.png^[colorize:maroon:60",
	drop = "farming:beanstalk_trunk",
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(3, 5))
	end,
	on_timer = function(pos, elapsed)
		local under_name = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z}).name
		local pos1 = 5
		local pos2 = 5
		if core.settings:get_bool("enable_curly_bean_stalks") == true then
			pos1 = math.random(4, 6)
			pos2 = math.random(4, 6)
		end
		if core.get_item_group(under_name, "soil") == 0 or under_name ~= "farming:beanstalk_trunk" then
			core.get_node_timer(pos):start(math.random(3, 5))
		end
		add_tree(pos, pos1, 9, pos2, farming.beanstalk, "0")
		if pos1 == 4 then
			pos.x = pos.x+1
		elseif pos1 == 6 then
			pos.x = pos.x-1
		end
		pos.y = pos.y+4
		if pos2 == 4 then
			pos.z = pos.z+1
		elseif pos2 == 6 then
			pos.z = pos.z-1
		end
		core.get_node_timer(pos):start(math.random(3, 5))
	end,
	groups = {choppy = 3, flammable = 2, timer_check = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:beanstalk_leaves", {
	description = S("Bean Stalk Leaves"),
	drawtype = "plantlike",
	tiles = {"farming_beanstalk_leaves.png"},
	inventory_image = "farming_beanstalk_leaves.png",
	paramtype = "light",
	visual_scale = 2,
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:beans_green 3"}, rarity = 20},
			{items = {"farming:beanstalk_leaves"}}
		}
	},
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leafdecay = 3, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	output = "farming:beanstalk_sapling 3",
	recipe = {
		{"farming:beans_green"},
		{"default:compost"}
	}
})

core.register_craft({
	output = "farming:beanstalk_sapling 3",
	recipe = {
		{"farming:beans_green"},
		{"bonemeal:fertiliser"}
	}
})

core.register_craft({
	output = "default:stick 16",
	recipe = {
		{"farming:beanstalk_trunk"},
		{"farming:beanstalk_trunk"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "farming:beanstalk_leaves",
	burntime = 7,
})

core.register_craft({
	type = "fuel",
	recipe = "farming:beanstalk_trunk",
	burntime = 31,
})

local T = {name = "farming:beanstalk_trunk", force_place = true}
local V = {name = "farming:beanstalk_trunk", prob = 80, force_place = true}
local s = {name = "farming:beanstalk_sapling", prob = 252, force_place = true}
local L = {name = "farming:beanstalk_leaves", prob = 200}

farming.beanstalk = {size = {x = 11, y = 17, z = 11}, data = {
_,_,_,_,L,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,T,_,T,_,L,_,_,
_,_,L,L,T,L,T,L,_,_,_,
_,_,_,_,T,_,T,_,L,_,_,
_,_,L,L,T,L,T,L,_,_,_,
_,_,_,_,L,_,L,_,L,_,_,
_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,
_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,L,T,_,_,_,_,_,T,_,_,
_,_,T,_,_,_,_,_,T,L,_,
_,L,T,L,_,_,_,L,T,_,_,
_,_,T,_,V,_,V,_,T,L,_,
_,L,T,L,T,L,T,L,T,_,_,
_,_,T,_,_,_,_,_,T,L,_,
_,L,T,_,L,_,L,_,T,_,_,
_,_,T,_,_,_,_,_,T,L,_,
_,L,T,_,_,_,_,_,T,_,_,
_,_,_,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,_,_,_,
_,_,_,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,T,T,_,T,T,_,_,_,
_,L,_,T,T,_,T,T,_,L,_,
_,_,_,T,T,_,T,T,_,_,_,
_,L,_,T,T,_,T,T,_,L,_,
_,_,L,_,T,_,T,_,L,_,_,
_,_,_,L,T,_,T,L,_,_,_,
_,_,_,_,T,L,T,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
_,_,_,T,_,L,_,T,_,_,_,
_,_,_,T,L,_,L,T,L,_,_,
_,_,L,T,_,L,_,T,_,_,_,
_,_,_,T,L,_,L,T,L,_,_,
_,_,L,T,_,_,_,T,_,_,_,
_,_,_,_,L,_,_,_,_,_,_,
_,_,_,_,_,_,L,_,_,_,_,
_,_,_,_,L,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

L,T,_,T,T,T,T,T,_,T,L,
_,T,_,T,T,T,T,T,_,T,_,
L,T,_,T,T,T,T,T,_,T,L,
_,T,V,T,T,T,T,T,V,T,_,
_,L,T,T,T,T,T,T,T,L,_,
_,_,_,T,T,T,T,T,_,_,_,
_,_,L,T,T,T,T,T,L,_,_,
_,_,_,L,T,T,T,L,_,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,L,T,T,T,L,_,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,L,T,_,T,L,_,_,_,
_,_,_,_,T,L,T,_,_,_,_,
_,_,_,_,T,_,T,L,_,_,_,
_,_,_,L,T,L,T,_,_,_,_,
_,_,_,_,T,_,T,L,_,_,_,
_,_,_,_,V,_,V,_,_,_,_,

_,_,_,_,T,T,T,_,_,_,_,
_,L,_,_,T,T,T,_,_,L,_,
_,_,_,_,T,T,T,_,_,_,_,
_,L,_,_,T,T,T,_,_,L,_,
_,_,L,_,T,T,T,_,L,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,L,T,T,T,L,_,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,L,T,T,T,L,_,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,L,T,T,T,L,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,L,T,L,_,_,_,_,
_,_,_,_,_,s,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

L,T,_,T,T,T,T,T,_,T,L,
_,T,_,T,T,T,T,T,_,T,_,
L,T,_,T,T,T,T,T,_,T,L,
_,T,V,T,T,T,T,T,V,T,_,
_,L,T,T,T,T,T,T,T,L,_,
_,_,_,T,T,T,T,T,_,_,_,
_,_,L,T,T,T,T,T,L,_,_,
_,_,_,L,T,T,T,L,_,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,L,T,T,T,L,_,_,_,
_,_,_,_,T,T,T,_,_,_,_,
_,_,_,L,T,_,T,L,_,_,_,
_,_,_,_,T,L,T,_,_,_,_,
_,_,_,L,T,_,T,_,_,_,_,
_,_,_,_,T,L,T,L,_,_,_,
_,_,_,L,T,_,T,_,_,_,_,
_,_,_,_,V,_,V,_,_,_,_,

_,_,_,T,T,_,T,T,_,_,_,
_,L,_,T,T,_,T,T,_,L,_,
_,_,_,T,T,_,T,T,_,_,_,
_,L,_,T,T,_,T,T,_,L,_,
_,_,L,_,T,_,T,_,L,_,_,
_,_,_,L,T,_,T,L,_,_,_,
_,_,_,_,T,L,T,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
_,_,_,T,_,L,_,T,_,_,_,
_,_,L,T,L,_,L,T,_,_,_,
_,_,_,T,_,L,_,T,L,_,_,
_,_,L,T,L,_,L,T,_,_,_,
_,_,_,T,_,_,_,T,L,_,_,
_,_,_,_,_,_,L,_,_,_,_,
_,_,_,_,L,_,_,_,_,_,_,
_,_,_,_,_,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,T,_,_,_,_,_,T,L,_,
_,L,T,_,_,_,_,_,T,_,_,
_,_,T,L,_,_,_,L,T,L,_,
_,L,T,_,V,_,V,_,T,_,_,
_,_,T,L,T,L,T,L,T,L,_,
_,L,T,_,_,_,_,_,T,_,_,
_,_,T,_,L,_,L,_,T,L,_,
_,L,T,_,_,_,_,_,T,_,_,
_,_,T,_,_,_,_,_,T,L,_,
_,_,_,_,_,_,_,L,_,_,_,
_,_,_,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,L,_,_,_,
_,_,_,L,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,L,_,T,_,T,_,_,_,_,
_,_,_,L,T,L,T,L,L,_,_,
_,_,L,_,T,_,T,_,_,_,_,
_,_,_,L,T,L,T,L,L,_,_,
_,_,L,_,L,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,
_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,L,_,_,
_,_,L,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,L,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_}}

-- cherry
core.register_craftitem("farming:cherry", {
	description = S("Cherries"),
	inventory_image = "farming_cherry.png",
	groups = {flammable = 2},
	on_use = core.item_eat(4, "farming:spent_biomasse"),
})

core.register_craft({
	output = "farming:cherry_sapling 2",
	recipe = {
		{"farming:cherry"},
		{"default:dirt"},
	}
})

core.register_node("farming:cherry_trunk", {
	description = "Cherry Trunk",
	tiles = {"farming_cherry_trunk_top.png", "farming_cherry_trunk_top.png", "farming_cherry_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"farming:cherry_leaves", "farming:cherry_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:cherry_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:cherry_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:cherry_leaves_blooming" then
					core.set_node(p, {name = "farming:cherry_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("farming:cherry_wood", {
	description = S("Cherry Wood Planks"),
	tiles = {"farming_cherry_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_craft({
	output = 'farming:cherry_wood 4',
	recipe = {
		{'farming:cherry_trunk'},
	}
})

core.register_node("farming:cherry_leaves", {
	description = S("Cherry Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_cherry_leaves.png"},
	inventory_image = leaf_image("farming_cherry_leaves.png"),
	wield_image = leaf_image("farming_cherry_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:cherry_sapling"}, rarity = 20},
			{items = {"farming:cherry_leaves"}}
		}
	},
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:cherry_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_cherry_leaves.png^farming_cherry_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:cherry_sapling"}, rarity = 20},
			{items = {"farming:cherry_leaves"}}
		}
	},
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:cherry_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_cherry_leaves.png^farming_cherries.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:cherry_leaves",
	drop = {
		items = {
			{items = {"farming:cherry 13"}},
			{items = {"farming:cherry 2"}, rarity = 2},
			{items = {"farming:cherry 12"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:cherry_leaves"})
		local f = core.find_node_near(pos, 2, {"farming:cherry_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local L = {name = "farming:cherry_leaves_fruiting"}
local M = {name = "farming:cherry_leaves_fruiting", prob = 191}
local T = {name = "farming:cherry_trunk", force_place = true}

farming.cherry_tree = {size = {x = 9, y = 10, z = 9}, data = {
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,M,L,M,_,_,_,_,_,
_,M,M,M,_,_,_,_,_,
_,_,_,_,_,M,L,M,_,
_,_,_,_,_,M,M,M,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,M,_,_,_,_,_,_,
M,L,L,L,M,_,_,_,_,
M,L,L,L,M,M,M,_,_,
_,M,L,M,M,L,L,L,M,
_,_,_,_,M,L,L,L,M,
_,_,_,_,_,M,L,M,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,M,_,M,_,_,_,_,_,
L,L,T,L,L,_,_,_,_,
M,L,L,L,M,L,_,M,_,
_,M,L,L,L,L,T,L,L,
_,_,_,_,M,L,L,L,M,
_,_,_,_,_,M,L,M,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,M,T,_,_,_,_,_,
M,L,L,L,M,_,M,_,_,
M,L,L,L,M,T,L,M,_,
_,M,L,M,L,L,L,L,M,
_,_,_,_,M,L,L,L,M,
_,_,_,_,_,M,L,M,_,

_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,M,L,M,T,M,L,M,_,
_,M,M,L,L,L,M,M,_,
_,M,L,L,L,L,L,M,_,
_,M,M,M,M,M,M,M,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,T,M,_,_,
_,_,M,_,M,L,L,L,M,
_,M,L,T,L,L,L,L,M,
M,L,L,L,M,M,L,M,_,
M,L,L,L,M,_,_,_,_,
_,M,L,M,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,M,_,M,_,
_,_,_,_,L,L,T,L,L,
_,M,_,L,M,L,L,L,M,
L,L,T,L,L,L,L,L,_,
M,L,L,L,M,_,_,_,_,
_,L,L,L,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,M,_,_,
_,_,_,_,M,L,L,L,M,
_,_,M,M,M,L,L,L,M,
M,L,L,L,M,M,L,M,_,
M,L,L,L,M,_,_,_,_,
_,M,L,M,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,M,L,M,_,
_,_,_,_,_,M,M,M,_,
_,M,L,M,_,_,_,_,_,
_,M,M,M,_,_,_,_,_,
_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- cinnamon
core.register_craftitem("farming:cinnamon", {
	description = S("Cinnamon"),
	inventory_image = "farming_cinnamon.png",
	groups = {flammable = 2},
})

core.register_node("farming:cinnamon_trunk", {
	description = "Cinnamon Trunk",
	tiles = {"farming_olive_trunk_top.png^[colorize:red:10^[colorize:white:30",
		"farming_olive_trunk_top.png^[colorize:red:10^[colorize:white:30",
		"farming_olive_trunk.png^[colorize:red:10^[colorize:white:30"},
	is_ground_content = false,
	drop = "default:apple_trunk",
	on_timer = function(pos, elapsed)
		if not core.find_node_near(pos, 2, {"farming:cinnamon_leaves", "farming:cinnamon_trunk_peeling"}) then
			core.get_node_timer(pos):start(200)
		else
			core.set_node(pos, {name = "farming:cinnamon_trunk_peeling"})
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:cinnamon_trunk_peeling", {
	description = "Cinnamon Trunk Peeling",
	tiles = {"farming_olive_trunk_top.png^[colorize:red:10^[colorize:white:30",
		"farming_olive_trunk_top.png^[colorize:red:10^[colorize:white:30",
		"farming_olive_trunk.png^[colorize:red:10^[colorize:white:30^farming_cinnamon_trunk_peeling.png"},
	is_ground_content = false,
	node_dig_prediction = "farming:cinnamon_trunk",
	drop = {
		items = {
			{items = {"farming:cinnamon 3"}},
			{items = {"farming:cinnamon 3"}, rarity = 2},
			{items = {"farming:cinnamon 6"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:cinnamon_trunk"})
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	groups = {snappy = 3, choppy = 2, trunk = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:cinnamon_leaves", {
	description = S("Cinnamon Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png^[colorize:lime:30"},
	inventory_image = leaf_image("default_citrus_leaves.png^[colorize:lime:30"),
	wield_image = leaf_image("default_citrus_leaves.png^[colorize:lime:30"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:cinnamon_sapling"}, rarity = 20},
			{items = {"farming:cinnamon_leaves"}}
		}
	},
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

local L = {name = "farming:cinnamon_leaves"}
local T = {name = "farming:cinnamon_trunk_peeling", force_place = true}
local R = {name = "farming:cinnamon_trunk", force_place = true}

farming.cinnamon_tree = {size = {x = 9, y = 11, z = 9}, data = {
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,L,L,L,_,_,_,_,
_,_,L,L,L,L,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,L,L,L,_,_,_,_,
_,L,L,L,L,L,_,_,_,
_,L,L,L,L,L,L,_,_,
_,_,L,L,L,L,L,_,_,
_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,L,T,L,T,L,_,_,_,
L,L,T,L,T,L,L,_,_,
L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,L,_,
_,_,_,_,L,L,L,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,T,_,_,_,_,_,
_,_,_,T,_,_,_,_,_,
_,_,L,T,_,_,T,_,_,
_,L,L,L,_,L,T,L,_,
L,L,L,L,L,L,T,L,L,
_,L,L,L,L,L,L,L,L,
_,_,L,L,L,L,L,L,_,

_,_,_,_,R,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,_,_,_,_,
_,_,_,_,T,T,_,_,_,
_,_,_,_,_,T,_,_,_,
_,_,_,_,_,T,L,_,_,
_,L,T,_,_,_,L,L,_,
L,L,T,L,_,L,L,L,L,
L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,L,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,T,_,_,_,_,_,
_,_,_,T,_,_,_,_,_,
_,_,_,T,_,_,T,L,_,
_,L,L,T,_,L,T,L,L,
L,L,L,L,L,L,L,L,L,
L,L,L,L,L,L,L,L,_,
_,L,L,L,L,L,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,L,_,_,
_,L,T,L,T,L,L,L,_,
L,L,T,L,T,L,L,L,_,
L,L,L,L,L,L,L,_,_,
_,L,L,L,L,L,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,L,_,_,
_,L,L,L,L,L,L,_,_,
_,L,L,L,L,L,_,_,_,
_,_,L,L,L,_,_,_,_,

_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,
_,_,L,L,L,L,_,_,_,
_,_,L,L,L,_,_,_,_,
_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

farming.cinnamon_tree2 = {size = {x = 7, y = 17, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,L,_,_,
_,_,_,_,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,L,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,L,_,_,
_,_,L,L,L,L,_,
_,_,L,L,L,L,_,
_,_,_,_,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,L,_,_,
_,_,_,L,L,L,_,
_,_,_,_,L,_,_,
_,_,L,_,_,_,_,
_,L,L,L,_,_,_,
_,_,L,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,T,_,_,
_,_,L,L,T,L,_,
_,L,L,L,T,L,L,
_,L,L,L,L,L,L,
_,_,L,L,L,L,_,

_,_,_,R,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,T,L,_,
_,_,_,T,L,L,L,
_,_,_,T,L,L,_,
_,L,T,T,_,_,_,
L,L,L,T,_,_,_,
_,L,L,T,_,_,_,
_,_,_,T,_,_,_,
_,_,T,T,_,_,_,
_,L,T,_,L,L,_,
L,L,T,L,L,L,L,
L,L,L,L,L,L,L,
_,L,L,L,L,L,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,L,_,_,
_,_,_,L,L,L,_,
_,_,_,_,L,_,_,
_,_,L,_,_,_,_,
_,L,L,L,_,_,_,
_,_,L,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,T,_,_,
_,_,L,L,T,L,_,
_,L,L,L,T,L,L,
_,L,L,L,L,L,L,
_,_,L,L,L,L,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,L,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,L,_,_,
_,_,L,L,L,L,_,
_,_,L,L,L,L,_,
_,_,_,_,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,L,_,_,
_,_,_,_,L,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- cocoa beans
core.register_craftitem("farming:cocoa_beans", {
	description = S("Cocoa Beans"),
	inventory_image = "farming_cocoa_beans.png",
	groups = {flammable = 2},
	on_use = core.item_eat(2),
})

core.register_craft({
	output = "farming:cocoa_sapling",
	recipe = {
		{"farming:cocoa_beans"},
		{"default:dirt"},
	}
})

core.register_craftitem("farming:cocoa_powder", {
	description = S("Cocoa Powder"),
	inventory_image = "farming_cocoa_powder.png",
	groups = {flammable = 2},
	on_use = core.item_eat(-3),-- < Choking
})

core.register_craft({
	output = "farming:cocoa_powder 16",
	recipe = {
		{"farming:cocoa_beans", "farming:cocoa_beans", "farming:cocoa_beans"},
		{"farming:cocoa_beans", "group:grinder", "farming:cocoa_beans"},
		{"farming:cocoa_beans", "farming:cocoa_beans", "farming:cocoa_beans"},
	},
	replacements = {
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"}
	}
})

core.register_craft({
	output = "dye:brown 2",
	recipe = {
		{"farming:cocoa_powder"}
	}
})

-- dark chocolate
core.register_craftitem("farming:dark_chocolate", {
	description = S("Dark Chocolate"),
	inventory_image = "farming_chocolate_dark.png",
	on_use = core.item_eat(4),
})

core.register_craft({
	output = "farming:dark_chocolate",
	recipe = {
		{"farming:cocoa_powder", "farming:cocoa_powder", "farming:cocoa_powder"},
		{"farming:cocoa_powder", "farming:cocoa_powder", "farming:cocoa_powder"}
	}
})

-- milk chocolate
core.register_craftitem("farming:milk_chocolate", {
	description = S("Milk Chocolate"),
	inventory_image = "farming_chocolate_milk.png",
	on_use = core.item_eat(3),
})

core.register_craft({
	output = "farming:milk_chocolate 4",
	recipe = {
		{"farming:dark_chocolate", "farming:dark_chocolate", "group:sugar"},
		{"mobs:glass_milk", "farming:dark_chocolate", "farming:dark_chocolate"}
	},
	replacements = {{"mobs:glass_milk", "vessels:drinking_glass"}}
})

core.register_craft({
	output = "farming:milk_chocolate 4",
	recipe = {
		{"farming:dark_chocolate", "farming:dark_chocolate", "foods:molasses_1"},
		{"mobs:glass_milk", "farming:dark_chocolate", "farming:dark_chocolate"}
	},
	replacements = {
		{"mobs:glass_milk", "vessels:drinking_glass"},
		{"foods:molasses_1", "vessels:glass_bottle"}
	}
})

-- white chocolate
core.register_craftitem("farming:white_chocolate", {
	description = S("White Chocolate"),
	inventory_image = "farming_chocolate_white.png",
	on_use = core.item_eat(3),
})

core.register_craft({
	output = "farming:white_chocolate 6",
	recipe = {
		{"farming:dark_chocolate", "farming:dark_chocolate", "group:sugar"},
		{"group:milk", "farming:dark_chocolate", "farming:dark_chocolate"}
	},
	replacements = {{"group:milk", "bucket:bucket_empty"}}
})

core.register_craft({
	output = "farming:white_chocolate 6",
	recipe = {
		{"farming:dark_chocolate", "farming:dark_chocolate", "foods:molasses_1"},
		{"group:milk", "farming:dark_chocolate", "farming:dark_chocolate"}
	},
	replacements = {
		{"group:milk", "bucket:bucket_empty"},
		{"foods:molasses_1", "vessels:glass_bottle"}
	}
})

-- chocolate blocks
core.register_node("farming:dark_chocolate_block", {
	description = S("Dark Chocolate Block"),
	tiles = {"farming_chocolate_block_dark.png"},
	is_ground_content = false,
	groups = {cracky = 2, oddly_breakable_by_hand = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("farming:milk_chocolate_block", {
	description = S("Milk Chocolate Block"),
	tiles = {"farming_chocolate_block_milk.png"},
	is_ground_content = false,
	groups = {cracky = 2, oddly_breakable_by_hand = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("farming:white_chocolate_block", {
	description = S("White Chocolate Block"),
	tiles = {"farming_chocolate_block_white.png"},
	is_ground_content = false,
	groups = {cracky = 2, oddly_breakable_by_hand = 2},
	sounds = default.node_sound_stone_defaults(),
})

register_nine("farming:dark_chocolate_block", "farming:dark_chocolate")
register_nine("farming:milk_chocolate_block", "farming:milk_chocolate")
register_nine("farming:white_chocolate_block", "farming:white_chocolate")

core.register_node("farming:cocoa_trunk", {
	description = "Cocoa Trunk",
	tiles = {"default_jungle_trunk_top.png", "default_jungle_trunk_top.png", "default_jungle_trunk.png"},
	is_ground_content = false,
	drop = "default:jungle_trunk",
	on_timer = function(pos, elapsed)
		for i=-1,1 do
		for k=-1,1 do
		local p = {x=pos.x+i, y=pos.y, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 1, {"farming:cocoa_1", "farming:cocoa_2", "farming:cocoa_3"}) then
			if not core.find_node_near(pos, 1, {"farming:cocoa_4"}) then
				core.set_node(pos, {name = "farming:cocoa_trunk_blooming"})
				core.get_node_timer(pos):start(math.random(300, 1500))
			else
				core.get_node_timer(pos):stop()
			end
		else
			if core.get_node_light(p) < 11 then
				core.get_node_timer(pos):start(200)
			else
				if (n.name == "farming:cocoa_1") then
					core.set_node(p, {name = "farming:cocoa_2"})
					core.get_node_timer(pos):start(math.random(300, 600))
				else
					if (n.name == "farming:cocoa_2") then
						core.set_node(p, {name = "farming:cocoa_3"})
						core.get_node_timer(pos):start(math.random(300, 600))
					else
						if (n.name == "farming:cocoa_3") then
							core.set_node(p, {name = "farming:cocoa_4"})
							core.get_node_timer(pos):start(math.random(300, 600))
						end
					end
				end
			end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:cocoa_trunk_blooming", {
	description = "Cocoa Trunk Blooming",
	tiles = {"default_jungle_trunk_top.png", "default_jungle_trunk_top.png",
		"default_jungle_trunk.png^farming_cocoa_flowers.png"},
	is_ground_content = false,
	drop = "default:jungle_trunk",
	on_timer = function(pos, elapsed)
		for i=-1,1 do
		for k=-1,1 do
		local p = {x=pos.x+i, y=pos.y, z=pos.z+k}
		if not core.find_node_near(pos, 1, "air") then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			add_tree(pos, 1, 0, 1, farming.cocoa_pods, "0")
			core.get_node_timer(pos):start(math.random(300, 600))
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:cocoa_leaves", {
	description = S("Cocoa Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_cocoa_leaves.png"},
	inventory_image = leaf_image("farming_cocoa_leaves.png"),
	wield_image = leaf_image("farming_cocoa_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:cocoa_sapling"}, rarity = 20},
			{items = {"farming:cocoa_leaves"}}
		}
	},
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

-- cocoa pod definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_cocoa_1.png"},
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .5, .3}
	},
	drop = {
		items = {
			{items = {"farming:cocoa_beans"}, rarity = 2},
		}
	},
	after_dig_node = function(pos)
		local f = core.find_node_near(pos, 1, {"farming:cocoa_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, not_in_creative_inventory = 1,
		leafdecay = 1, leafdecay_drop = 1},
	sounds = default.node_sound_leaves_defaults(),
}

-- stage 1
core.register_node("farming:cocoa_1", table.copy(def))

-- stage 2
def.tiles = {"farming_cocoa_2.png"}
core.register_node("farming:cocoa_2", table.copy(def))

-- stage 3
def.tiles = {"farming_cocoa_3.png"}
def.drop = {
	items = {
		{items = {"farming:cocoa_beans"} },
	}
}
core.register_node("farming:cocoa_3", table.copy(def))

-- stage 4 (final)
def.tiles = {"farming_cocoa_4.png"}
def.drop = {
	items = {
		{items = {"farming:cocoa_beans 3"}, rarity = 1},
		{items = {"farming:cocoa_beans 6"}, rarity = 2},
	}
}
core.register_node("farming:cocoa_4", table.copy(def))

local C = {name = "farming:cocoa_3", prob = 223}
local L = {name = "farming:cocoa_leaves"}
local M = {name = "farming:cocoa_leaves", prob = 223}
local V = {name = "farming:cocoa_leaves", prob = 191}
local T = {name = "farming:cocoa_trunk", force_place = true}
local U = {name = "farming:cocoa_trunk", prob = 127, force_place = true}

local P = {name = "farming:cocoa_1"}

farming.cocoa_pods = {size = {x = 3, y = 1, z = 3}, data = {_,P,_,	P,T,P,	_,P,_}}

farming.cocoa_tree = {size = {x = 5, y = 17, z = 5}, data = {
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
M,L,M,_,_,
_,_,M,L,M,
_,_,_,_,_,
_,_,_,_,_,
V,M,M,M,V,
V,M,M,M,V,
_,_,_,_,_,

_,_,T,_,_,
_,_,T,_,_,
_,_,U,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,C,_,_,
_,_,_,_,_,
_,_,C,_,_,
_,_,_,_,_,
_,_,_,_,_,
L,T,L,_,_,
_,_,L,T,L,
_,_,C,_,_,
_,_,_,_,_,
M,T,L,T,M,
M,L,L,L,M,
_,M,M,M,_,

_,T,T,T,_,
_,T,T,T,_,
_,U,T,U,_,
_,_,T,_,_,
_,_,T,_,_,
_,_,T,_,_,
_,_,T,C,_,
_,C,T,_,_,
_,_,T,L,M,
M,L,T,_,_,
M,L,T,C,_,
_,_,T,L,M,
_,C,T,L,M,
_,_,T,_,_,
M,L,L,L,M,
M,L,L,L,M,
_,M,L,M,_,

_,_,T,_,_,
_,_,T,_,_,
_,_,U,_,_,
_,_,_,_,_,
_,_,C,_,_,
_,_,_,_,_,
_,_,C,_,_,
_,_,_,_,_,
_,_,L,T,L,
L,T,L,_,_,
_,_,C,_,_,
_,_,_,_,_,
_,_,L,T,L,
_,_,_,_,_,
M,T,L,T,M,
M,L,L,L,M,
_,M,M,M,_,

_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,M,L,M,
M,L,M,_,_,
_,_,_,_,_,
_,_,_,_,_,
_,_,M,L,M,
_,_,_,_,_,
V,M,M,M,V,
V,M,M,M,V,
_,_,_,_,_},
yslice_prob = {{ypos = 6, prob = 191}, {ypos = 7, prob = 191},
	{ypos = 8, prob = 191}, {ypos = 9, prob = 191}, {ypos = 10, prob = 191}}}

-- date
core.register_craftitem("farming:date", {
	description = S("Date"),
	inventory_image = "farming_date.png",
	on_use = core.item_eat(1, "farming:date_pit"),
	groups = {flammable = 1},
})

core.register_craftitem("farming:date_pit", {
	description = S("Date Pit"),
	inventory_image = "farming_date_pit.png",
	groups = {flammable = 2},
})

core.register_craft({
	output = "farming:date_palm_sapling",
	recipe = {
		{"farming:date_pit"},
		{"default:dirt"},
	}
})

core.register_node("farming:date_palm_trunk", {
	description = "Date Palm Trunk",
	tiles = {"farming_date_palm_trunk_top.png", "farming_date_palm_trunk_top.png", "farming_date_palm_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	on_timer = function(pos, elapsed)
		local male_flowers = core.find_node_near(pos, 7, "farming:dates_male_flowers")
		for i=-1,1 do
		for k=-1,1 do
		local p = {x=pos.x+i, y=pos.y, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 1, {"farming:date_mark", "farming:male_date_flower_mark", "farming:dates_female_flowers",
			"farming:dates_1", "farming:dates_2", "farming:dates_3", "farming:dates_male_flowers"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			pos.y = pos.y+1
			if core.get_node(pos).name == "farming:date_palm_leaves" and core.get_node(pos).param2 == 0 then
				pos.y = pos.y-1
				if (n.name == "farming:date_mark") then
					core.set_node(p, {name = "farming:dates_female_flowers"})
					core.get_node_timer(pos):start(math.random(300, 600))
				else
					if not male_flowers then-- TODO, hand pollination using meta tagging with male flowers
						if (n.name == "farming:dates_female_flowers") then
							core.set_node(p, {name = "farming:date_mark"})
							core.get_node_timer(pos):start(math.random(300, 600))
						end
					else
						if (n.name == "farming:dates_female_flowers") then
							core.set_node(p, {name = "farming:dates_1"})
							core.get_node_timer(pos):start(math.random(300, 600))
							return
						end
					end
					if (n.name == "farming:dates_1") then
						core.set_node(p, {name = "farming:dates_2"})
						core.get_node_timer(pos):start(math.random(300, 600))
					else
						if (n.name == "farming:dates_2") then
							core.set_node(p, {name = "farming:dates_3"})
							core.get_node_timer(pos):start(math.random(300, 600))
						else
							if (n.name == "farming:dates_3") then
								core.set_node(p, {name = "farming:dates_4"})
								core.get_node_timer(pos):start(math.random(300, 600))
							end
						end
					end
				end
				if (n.name == "farming:male_date_flower_mark") then
					core.set_node(p, {name = "farming:dates_male_flowers"})
					core.get_node_timer(pos):start(math.random(300, 600))
				else
					if (n.name == "farming:dates_male_flowers") then
						core.set_node(p, {name = "farming:male_date_flower_mark"})
						core.get_node_timer(pos):start(math.random(300, 600))
					end
				end
			end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node
})

core.register_node("farming:date_palm_wood", {
	description = S("Date Palm Wood Planks"),
	tiles = {"farming_date_palm_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_craft({
	output = 'farming:date_palm_wood 4',
	recipe = {{'farming:date_palm_trunk'}}
})

core.register_node("farming:date_palm_leaves", {
	description = S("Date Palm Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_droop.obj",
	waving = waving_style,
	tiles = {"farming_date_palm_leaves.png"..leaf_image("^[transformFY")},
	inventory_image = leaf_image("farming_date_palm_leaves.png"),
	wield_image = leaf_image("farming_date_palm_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:date_palm_sapling"}, rarity = 20},
			{items = {"farming:date_palm_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:date_mark", {
	description = "Date Marker",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	groups = {leafdecay = 3, not_in_creative_inventory = 1},
})

core.register_node("farming:male_date_flower_mark", {
	description = "Male Date Flower Marker",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	groups = {leafdecay = 3, not_in_creative_inventory = 1},
})

local dates_drop = {
	items = {
		{items = {"farming:date 400"}},
		{items = {"farming:date 25"}, rarity = 2},
		{items = {"farming:date 15"}, rarity = 2},
		{items = {"farming:date 10"}, rarity = 2}
	}
}

for _,suffix in ipairs({"female_flowers", "1", "2", "3", "4", "male_flowers"}) do
	local name
	if suffix == "female_flowers" or suffix == "male_flowers" then
		name = S("Date Flowers")
	else
		name = S("Date Cluster")
	end
	local dropfn = suffix == "4" and dates_drop or ""
	local datedef = {
		description = name,
		drawtype = "mesh",
		mesh = "leaf_droop.obj",
		tiles = {"farming_dates_"..suffix..".png^[transformFY"},
		inventory_image = "farming_dates_"..suffix..".png",
		use_texture_alpha = "clip",
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-.3, -.5, -.3, .3, .5, .3}
		},
		drop = dropfn,
		groups = {snappy = 3, fleshy = 3, flammable = 2, leafdecay = 3,
			leafdecay_drop = 1, not_in_creative_inventory = 1},
		after_dig_node = function(pos, oldnode)
			if oldnode.name == "farming:dates_male_flowers" then
				core.set_node(pos, {name = "farming:male_date_flower_mark"})
			else
				core.set_node(pos, {name = "farming:date_mark"})
			end
			local f = core.find_node_near(pos, 1, "farming:date_palm_trunk")
			if f then
				core.get_node_timer(f):start(math.random(300, 1500))
			end
		end,
		sounds = default.node_sound_defaults(),
	}
	core.register_node("farming:dates_"..suffix, datedef)
end

core.register_node("farming:date_palm_sapling", {
	description = S("Date Palm Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"farming_date_palm_sapling.png"},
	inventory_image = "farming_date_palm_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = function(pos, elapsed)
		if not default.can_grow(pos, "sand") then
			core.get_node_timer(pos):start(math.random(250, 1450))
		else
	for _, obj in pairs(core.get_objects_inside_radius(pos, 9)) do
		if obj:is_player() then
			core.log("action", "A date palm sapling grows into a tree at ".. core.pos_to_string(pos))
			farming.grow_date_palm(pos)
			return
		end
	end
	core.get_node_timer(pos):start(5)
		end
	end,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .35, .3}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	grown_height = 19,
	heat_min = -5,
	heat_max = 95,
	humidity_min = -5,
	humidity_max = 32,
})

core.register_lbm({
	name = "farming:convert_date_palm_saplings_to_node_timer",
	nodenames = {"farming:date_palm_sapling"},
	run_at_every_load = true,
	action = function(pos)
		if not core.get_node_timer(pos):is_started() then
			core.get_node_timer(pos):start(math.random(250, 500))
		end
	end
})

local L = {name = "farming:date_palm_leaves"}
local T = {name = "farming:date_palm_trunk", force_place = true}
local D = {name = "farming:dates_4", prob = 225}

farming.date_palm = {size = {x = 11, y = 26, z = 11}, data = {
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,_,_,L,_,_,L,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,_,L,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,_,L,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
_,L,L,_,_,_,_,_,L,L,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,D,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,L,_,_,L,_,_,L,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,_,T,_,_,_,_,_,
_,_,_,_,D,T,D,_,_,_,_,
_,_,_,_,L,L,L,_,_,_,_,
_,_,L,L,_,T,_,L,L,_,_,
L,L,_,_,L,L,L,_,_,L,L,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
_,_,_,L,_,_,_,L,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,D,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,L,_,_,L,_,_,L,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,_,L,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,L,_,L,_,_,_,_,
_,L,L,_,_,_,_,_,L,L,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,L,_,_,L,_,_,L,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,L,_,L,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,L,_,_,_,L,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,

_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,L,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_,
_,_,_,_,_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}, {ypos = 3, prob = 117}, {ypos = 4, prob = 107}}}

-- fig
core.register_craftitem("farming:fig", {
	description = S("Fig"),
	inventory_image = "farming_fig.png",
	groups = {flammable = 2},
	on_use = core.item_eat(3, "farming:spent_biomasse"),
})

core.register_craft({
	output = "farming:fig_sapling 5",
	recipe = {
		{"farming:fig"},
		{"default:dirt"},
	}
})

core.register_node("farming:fig_trunk", {
	description = "Fig Trunk",
	tiles = {"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	is_ground_content = false,
	drop = "default:apple_trunk",
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"farming:fig_leaves", "farming:fig_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:fig_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:fig_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:fig_leaves_blooming" then
					core.set_node(p, {name = "farming:fig_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:fig_leaves", {
	description = S("Fig Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_fig_leaves.png"},
	inventory_image = leaf_image("farming_fig_leaves.png"),
	wield_image = leaf_image("farming_fig_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:fig_sapling"}, rarity = 20},
			{items = {"farming:fig_leaves"}}
		}
	},
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:fig_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_fig_leaves.png^farming_figs_green.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:fig_sapling"}, rarity = 20},
			{items = {"farming:fig_leaves"}}
		}
	},
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:fig_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_fig_leaves.png^farming_figs.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:fig_leaves",
	drop = {
		items = {
			{items = {"farming:fig 3"}},
			{items = {"farming:fig 2"}, rarity = 2},
			{items = {"farming:fig 2"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:fig_leaves"})
		local f = core.find_node_near(pos, 2, {"farming:fig_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local L = {name = "farming:fig_leaves_fruiting"}
local T = {name = "farming:fig_trunk", force_place = true}

farming.fig_tree = {size = {x = 7, y = 7, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,T,_,_,L,L,
_,L,L,_,T,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,_,_,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,T,L,L,
_,L,T,_,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_}}

-- hazelnut
core.register_craftitem("farming:hazelnut", {
	description = S("Hazelnut"),
	inventory_image = "farming_hazelnut.png",
	groups = {flammable = 2},
	on_use = core.item_eat(4, "farming:spent_biomasse"),
})

core.register_craft({
	output = "farming:hazelnut_sapling",
	recipe = {
		{"farming:hazelnut"},
		{"default:dirt"},
	}
})

core.register_node("farming:hazelnut_trunk", {
	description = "Hazelnut Trunk",
	tiles = {"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	is_ground_content = false,
	drop = "default:apple_trunk",
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"farming:hazelnut_leaves", "farming:hazelnut_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:hazelnut_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:hazelnut_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:hazelnut_leaves_blooming" then
					core.set_node(p, {name = "farming:hazelnut_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:hazelnut_leaves", {
	description = S("Hazelnut Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_prunus_leaves.png"},
	inventory_image = leaf_image("farming_prunus_leaves.png"),
	wield_image = leaf_image("farming_prunus_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:hazelnut_sapling"}, rarity = 20},
			{items = {"farming:hazelnut_leaves"}}
		}
	},
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:hazelnut_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_prunus_leaves.png^farming_hazelnut_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:hazelnut_sapling"}, rarity = 20},
			{items = {"farming:hazelnut_leaves"}}
		}
	},
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:hazelnut_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_prunus_leaves.png^farming_hazelnuts.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:hazelnut_leaves",
	drop = {
		items = {
			{items = {"farming:hazelnut 13"}},
			{items = {"farming:hazelnut 2"}, rarity = 2},
			{items = {"farming:hazelnut 12"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:hazelnut_leaves"})
		local f = core.find_node_near(pos, 2, {"farming:hazelnut_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local L = {name = "farming:hazelnut_leaves_fruiting"}
local T = {name = "farming:hazelnut_trunk", force_place = true}

farming.hazelnut_tree = {size = {x = 7, y = 8, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,T,_,_,L,L,
_,L,L,_,T,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,_,_,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,T,L,L,
_,L,T,_,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- lemon
core.register_craftitem("farming:lemon", {
	description = S("Lemon"),
	inventory_image = "farming_lemon.png",
	groups = {flammable = 2},
	on_use = core.item_eat(3),
})

core.register_craft({
	output = "farming:lemon_sapling 5",
	recipe = {
		{"farming:lemon"},
		{"default:dirt"},
	}
})

core.register_node("farming:lemon_trunk", {
	description = "Lemon Trunk",
	tiles = {"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	is_ground_content = false,
	drop = "default:apple_trunk",
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"farming:lemon_leaves", "farming:lemon_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:lemon_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:lemon_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:lemon_leaves_blooming" then
					core.set_node(p, {name = "farming:lemon_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:lemon_leaves", {
	description = S("Lemon Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png"},
	inventory_image = leaf_image("default_citrus_leaves.png"),
	wield_image = leaf_image("default_citrus_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:lemon_sapling"}, rarity = 20},
			{items = {"farming:lemon_leaves"}}
		}
	},
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:lemon_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png^farming_lemon_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:lemon_sapling"}, rarity = 20},
			{items = {"farming:lemon_leaves"}}
		}
	},
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:lemon_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png^farming_lemons.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:lemon_leaves",
	drop = {
		items = {
			{items = {"farming:lemon 5"}},
			{items = {"farming:lemon 2"}, rarity = 2},
			{items = {"farming:lemon 4"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:lemon_leaves"})
		local f = core.find_node_near(pos, 2, {"farming:lemon_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local V = {name = "farming:lemon_leaves_fruiting", prob = 127}
local L = {name = "farming:lemon_leaves_fruiting"}
local T = {name = "farming:lemon_trunk", force_place = true}

farming.lemon_tree = {size = {x = 7, y = 8, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,T,_,_,L,L,
_,L,L,_,T,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,_,_,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,T,L,L,
_,L,T,_,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- lime
core.register_craftitem("farming:lime", {
	description = S("Lime"),
	inventory_image = "farming_lime.png",
	groups = {flammable = 2},
	on_use = core.item_eat(3),
})

core.register_craft({
	output = "farming:lime_sapling 5",
	recipe = {
		{"farming:lime"},
		{"default:dirt"},
	}
})

core.register_node("farming:lime_trunk", {
	description = "Lime Trunk",
	tiles = {"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	is_ground_content = false,
	drop = "default:apple_trunk",
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"farming:lime_leaves", "farming:lime_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:lime_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:lime_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:lime_leaves_blooming" then
					core.set_node(p, {name = "farming:lime_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:lime_leaves", {
	description = S("Lime Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png"},
	inventory_image = leaf_image("default_citrus_leaves.png"),
	wield_image = leaf_image("default_citrus_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:lime_sapling"}, rarity = 20},
			{items = {"farming:lime_leaves"}}
		}
	},
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:lime_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png^farming_lemon_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:lime_sapling"}, rarity = 20},
			{items = {"farming:lime_leaves"}}
		}
	},
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:lime_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png^farming_limes.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:lime_leaves",
	drop = {
		items = {
			{items = {"farming:lime 5"}},
			{items = {"farming:lime 2"}, rarity = 2},
			{items = {"farming:lime 4"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:lime_leaves"})
		local f = core.find_node_near(pos, 2, {"farming:lime_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local L = {name = "farming:lime_leaves_fruiting"}
local T = {name = "farming:lime_trunk", force_place = true}

farming.lime_tree = {size = {x = 7, y = 8, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,T,_,_,L,L,
_,L,L,_,T,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,_,_,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,T,L,L,
_,L,T,_,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- mandarin
core.register_craftitem("farming:mandarin", {
	description = S("Mandarin"),
	inventory_image = "farming_mandarin.png",
	groups = {flammable = 2},
	on_use = core.item_eat(2),
})

core.register_craft({
	output = "farming:mandarin_sapling 5",
	recipe = {
		{"farming:mandarin"},
		{"default:dirt"},
	}
})

core.register_node("farming:mandarin_trunk", {
	drawtype = "plantlike",
	tiles = {"farming_mandarin_trunk.png"},
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-.13, -.5, -.13, .13, .5, .13},
	},
	collision_box = {
		type = "fixed",
		fixed = {-.12, -.5, -.12, .12, .5, .12},
	},
	after_dig_node = function(pos)
		pos.y = pos.y+1
		if core.get_node(pos).name == "farming:mandarin_leaves" then
			core.remove_node(pos, {name = "farming:mandarin_leaves"})
		end
	end,
	drop = {
		items = {
			{items = {"default:stick"}, rarity = 1},
			{items = {"default:stick"}, rarity = 2},
			{items = {"default:stick"}, rarity = 4},
		}
	},
	on_timer = function(pos, elapsed)
		pos.y = pos.y+1
		if not core.get_node(pos).name == "farming:mandarin_leaves" then
		elseif core.get_node(pos).name == "air" then
			core.set_node(pos, {name = "farming:mandarin_leaves"})
			pos.y = pos.y-1
			core.get_node_timer(pos):start(200)
		elseif core.get_node_light(pos) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if core.get_node(pos).name == "farming:mandarin_leaves" then
				if core.get_node(pos).param2 == 0 then
					core.set_node(pos, {name = "farming:mandarin_leaves_blooming"})
				end
			end
			pos.y = pos.y-1
			core.set_node(pos, {name = "farming:mandarin_trunk_blooming"})
			core.get_node_timer(pos):start(math.random(300, 1500))
		end
	end,
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:mandarin_trunk_blooming", {
	drawtype = "plantlike",
	tiles = {"farming_mandarin_trunk.png^farming_mandarin_flowers.png"},
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-.13, -.5, -.13, .13, .5, .13},
	},
	collision_box = {
		type = "fixed",
		fixed = {-.12, -.5, -.12, .12, .5, .12},
	},
	after_dig_node = function(pos)
		pos.y = pos.y+1
		if core.get_node(pos).name == "farming:mandarin_leaves_blooming" then
			core.remove_node(pos, {name = "farming:mandarin_leaves_blooming"})
		end
	end,
	drop = {
		items = {
			{items = {"default:stick"}, rarity = 1},
			{items = {"default:stick"}, rarity = 2},
			{items = {"default:stick"}, rarity = 4},
		}
	},
	on_timer = function(pos, elapsed)
		if core.get_node_light(pos) < 11 then
			core.get_node_timer(pos):start(200)
		else
			core.set_node(pos, {name = "farming:mandarin_trunk_fruiting"})
			pos.y = pos.y+1
			if core.get_node(pos).name == "farming:mandarin_leaves_blooming" then
				core.set_node(pos, {name = "farming:mandarin_leaves_fruiting"})
			end
		end
	end,
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:mandarin_trunk_fruiting", {
	drawtype = "plantlike",
	tiles = {"farming_mandarin_trunk.png^farming_mandarins.png"},
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-.13, -.5, -.13, .13, .5, .13},
	},
	collision_box = {
		type = "fixed",
		fixed = {-.12, -.5, -.12, .12, .5, .12},
	},
	node_dig_prediction = "farming:mandarin_trunk",
	after_dig_node = function(pos)
		core.set_node(pos, {name="farming:mandarin_trunk"})
		core.get_node_timer(pos):start(math.random(300, 1500))
		pos.y = pos.y+1
		if core.get_node(pos).name == "farming:mandarin_leaves_fruiting" then
			core.set_node(pos, {name="farming:mandarin_leaves"})
		end
	end,
	drop = {
		items = {
			{items = {"farming:mandarin 6"}, rarity = 1},
			{items = {"farming:mandarin 4"}, rarity = 2},
			{items = {"farming:mandarin 8"}, rarity = 3},
		}
	},
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("farming:mandarin_leaves", {
	description = S("Mandarin Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png"},
	inventory_image = leaf_image("default_citrus_leaves.png"),
	wield_image = leaf_image("default_citrus_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:mandarin_sapling"}, rarity = 20},
			{items = {"farming:mandarin_leaves"}}
		}
	},
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leaves = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:mandarin_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png^farming_mandarin_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:mandarin_sapling"}, rarity = 20},
			{items = {"farming:mandarin_leaves"}}
		}
	},
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:mandarin_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png^farming_mandarins.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = 1,
	node_dig_prediction = "farming:mandarin_leaves",
	after_dig_node = function(pos)
		core.set_node(pos, {name="farming:mandarin_leaves"})
		pos.y = pos.y-1
		core.set_node(pos, {name="farming:mandarin_trunk"})
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	drop = {
		items = {
			{items = {"farming:mandarin 6"}, rarity = 1},
			{items = {"farming:mandarin 4"}, rarity = 2},
			{items = {"farming:mandarin 8"}, rarity = 3},
		}
	},
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leaves = 1, flammable = 2, attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

farming.mandarin_tree = {size = {x = 1, y = 3, z = 1}, data = {
_, {name = "farming:mandarin_trunk_fruiting", force_place = true}, {name = "farming:mandarin_leaves_fruiting"}}}

-- mango
core.register_craftitem("farming:mango", {
	description = S("Mango"),
	inventory_image = "farming_mango.png",
	groups = {flammable = 2},
	on_use = core.item_eat(4),
})

core.register_craft({
	output = "farming:mango_sapling",
	recipe = {
		{"farming:mango"},
		{"default:dirt"},
	}
})

core.register_node("farming:mango_trunk", {
	description = "Mango Trunk",
	tiles = {"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	is_ground_content = false,
	drop = "default:apple_trunk",
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"farming:mango_leaves", "farming:mango_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:mango_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:mango_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:mango_leaves_blooming" then
					core.set_node(p, {name = "farming:mango_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:mango_leaves", {
	description = S("Mango Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_mango_leaves.png"},
	inventory_image = leaf_image("farming_mango_leaves.png"),
	wield_image = leaf_image("farming_mango_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:mango_sapling"}, rarity = 20},
			{items = {"farming:mango_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:mango_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_mango_leaves.png^farming_mango_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:mango_sapling"}, rarity = 20},
			{items = {"farming:mango_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:mango_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_mango_leaves.png^farming_mangos.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:mango_leaves",
	drop = {
		items = {
			{items = {"farming:mango 5"}},
			{items = {"farming:mango 2"}, rarity = 2},
			{items = {"farming:mango 4"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:mango_leaves"})
		local f = core.find_node_near(pos, 2, {"farming:mango_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local L = {name = "farming:mango_leaves_fruiting"}
local T = {name = "farming:mango_trunk", force_place = true}

farming.mango_tree = {size = {x = 7, y = 8, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,T,_,_,L,L,
_,L,L,_,T,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,_,_,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,T,L,L,
_,L,T,_,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- mirabelle
core.register_craftitem("farming:mirabelle", {
	description = S("Mirabelle"),
	inventory_image = "farming_mirabelle.png",
	groups = {flammable = 2},
	on_use = core.item_eat(3),
})

core.register_craft({
	output = "farming:mirabelle_sapling 5",
	recipe = {
		{"farming:mirabelle"},
		{"default:dirt"},
	}
})

core.register_node("farming:mirabelle_trunk", {
	description = "Mirabelle Trunk",
	tiles = {"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	is_ground_content = false,
	drop = "default:apple_trunk",
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"farming:mirabelle_leaves", "farming:mirabelle_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:mirabelle_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:mirabelle_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:mirabelle_leaves_blooming" then
					core.set_node(p, {name = "farming:mirabelle_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:mirabelle_leaves", {
	description = S("Mirabelle Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_prunus_leaves.png"},
	inventory_image = leaf_image("farming_prunus_leaves.png"),
	wield_image = leaf_image("farming_prunus_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:mirabelle_sapling"}, rarity = 20},
			{items = {"farming:mirabelle_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:mirabelle_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_prunus_leaves.png^farming_mirabelle_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:mirabelle_sapling"}, rarity = 20},
			{items = {"farming:mirabelle_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:mirabelle_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_prunus_leaves.png^farming_mirabelles.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:mirabelle_leaves",
	drop = {
		items = {
			{items = {"farming:mirabelle 12"}},
			{items = {"farming:mirabelle 2"}, rarity = 2},
			{items = {"farming:mirabelle 11"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:mirabelle_leaves"})
		local f = core.find_node_near(pos, 2, {"farming:mirabelle_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local L = {name = "farming:mirabelle_leaves_fruiting"}
local T = {name = "farming:mirabelle_trunk", force_place = true}

farming.mirabelle_tree = {size = {x = 7, y = 8, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,T,_,_,L,L,
_,L,L,_,T,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,_,_,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,T,L,L,
_,L,T,_,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- nutmeg
core.register_craftitem("farming:nutmeg", {
	description = S("Nutmeg"),
	inventory_image = "farming_nutmeg.png",
	groups = {nutmeg = 1, flammable = 2},
	on_use = core.item_eat(3, "farming:nutmeg_nut"),
})

core.register_craftitem("farming:nutmeg_nut", {
	description = S("Nutmeg Nut"),
	inventory_image = "farming_nutmeg_nut.png",
	groups = {nutmeg = 1, flammable = 2},
})

core.register_craft({
	output = "farming:nutmeg_sapling",
	recipe = {
		{"group:nutmeg"},
		{"default:dirt"},
	}
})

core.register_node("farming:nutmeg_trunk", {
	description = "Nutmeg Trunk",
	tiles = {"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	is_ground_content = false,
	drop = "default:apple_trunk",
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"farming:nutmeg_leaves", "farming:nutmeg_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:nutmeg_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:nutmeg_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:nutmeg_leaves_blooming" then
					core.set_node(p, {name = "farming:nutmeg_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:nutmeg_leaves", {
	description = S("Nutmeg Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png"},
	inventory_image = leaf_image("default_citrus_leaves.png"),
	wield_image = leaf_image("default_citrus_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:nutmeg_sapling"}, rarity = 20},
			{items = {"farming:nutmeg_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:nutmeg_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png^farming_nutmeg_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:nutmeg_sapling"}, rarity = 20},
			{items = {"farming:nutmeg_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:nutmeg_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"default_citrus_leaves.png^farming_nutmegs.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:nutmeg_leaves",
	drop = {
		items = {
			{items = {"farming:nutmeg 12"}},
			{items = {"farming:nutmeg 2"}, rarity = 2},
			{items = {"farming:nutmeg 11"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:nutmeg_leaves"})
		local f = core.find_node_near(pos, 2, {"farming:nutmeg_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local L = {name = "farming:nutmeg_leaves_fruiting"}
local T = {name = "farming:nutmeg_trunk", force_place = true}

farming.nutmeg_tree = {size = {x = 7, y = 8, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,T,_,_,L,L,
_,L,L,_,T,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,_,_,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,T,L,L,
_,L,T,_,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- olives
core.register_craftitem("farming:olive_green", {
	description = S("Green Olive"),
	inventory_image = "farming_olive_green.png",
	groups = {olive = 1, flammable = 2},
	on_use = core.item_eat(2),
})

core.register_craftitem("farming:olive_ripe", {
	description = S("Ripe Olive"),
	inventory_image = "farming_olive_ripe.png",
	groups = {olive = 1, flammable = 2},
	on_use = core.item_eat(3),
})

-- olive oil
core.register_node("farming:olive_oil", {
	description = S("Olive Oil"),
	drawtype = "plantlike",
	tiles = {"farming_olive_oil.png"},
	inventory_image = "farming_olive_oil.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(4, "vessels:glass_bottle"),
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, food_oil = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "farming:olive_oil",
	recipe = {
		{"group:olive", "group:olive", "group:olive"},
		{"group:olive", "group:olive", "group:olive"},
		{"group:olive", "vessels:glass_bottle", "group:olive"}
	}
})

core.register_craft({
	output = "farming:olive_sapling",
	recipe = {
		{"farming:olive_ripe"},
		{"default:dirt"},
	}
})

core.register_node("farming:olive_trunk", {
	description = "Olive Trunk",
	tiles = {"farming_olive_trunk_top.png", "farming_olive_trunk_top.png", "farming_olive_trunk.png"},
	is_ground_content = false,
	drop = "default:apple_trunk",
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"farming:olive_leaves",
			"farming:olive_leaves_blooming", "farming:olive_leaves_fruiting_green"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:olive_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:olive_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:olive_leaves_blooming" then
					core.set_node(p, {name = "farming:olive_leaves_fruiting_green"})
					core.get_node_timer(pos):start(200)
				elseif n.name == "farming:olive_leaves_fruiting_green" then
					core.set_node(p, {name = "farming:olive_leaves_fruiting_ripe"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:olive_leaves", {
	description = S("Olive Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_olive_leaves.png"},
	inventory_image = leaf_image("farming_olive_leaves.png"),
	wield_image = leaf_image("farming_olive_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:olive_sapling"}, rarity = 20},
			{items = {"farming:olive_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:olive_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_olive_leaves.png^farming_olive_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:olive_sapling"}, rarity = 20},
			{items = {"farming:olive_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:olive_leaves_fruiting_green", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_olive_leaves.png^farming_olives_green.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:olive_leaves",
	drop = {
		items = {
			{items = {"farming:olive_green 12"}},
			{items = {"farming:olive_green 2"}, rarity = 2},
			{items = {"farming:olive_green 11"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:olive_leaves"})
		local f = core.find_node_near(pos, 2, {"farming:olive_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("farming:olive_leaves_fruiting_ripe", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_olive_leaves.png^farming_olives_ripe.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:olive_leaves",
	drop = {
		items = {
			{items = {"farming:olive_ripe 12"}},
			{items = {"farming:olive_ripe 2"}, rarity = 2},
			{items = {"farming:olive_ripe 11"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:olive_leaves"})
		local f = core.find_node_near(pos, 2, {"farming:olive_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local L = {name = "farming:olive_leaves_fruiting_ripe"}
local T = {name = "farming:olive_trunk", force_place = true}

farming.olive_tree = {size = {x = 7, y = 8, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,T,_,T,_,_,
L,L,T,_,T,L,L,
L,L,T,L,T,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,T,_,_,_,
_,_,T,T,T,_,_,
_,_,T,T,T,_,_,
_,_,_,T,_,_,_,
L,_,_,_,_,_,L,
L,L,L,L,L,L,L,
L,L,L,L,L,L,L,
_,L,L,_,L,L,_,

_,_,_,_,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,T,_,T,_,_,
L,L,T,_,T,L,L,
L,L,T,L,T,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- peach
core.register_craftitem("farming:peach", {
	description = S("Peach"),
	inventory_image = "farming_peach.png",
	groups = {flammable = 2},
	on_use = core.item_eat(4, "farming:peach_pit"),
})

core.register_craftitem("farming:peach_pit", {
	description = S("Peach Pit"),
	inventory_image = "farming_peach_pit.png",
	groups = {flammable = 2},
})

core.register_craftitem("farming:almond", {
	description = S("Almond"),
	inventory_image = "farming_almond.png",
	groups = {flammable = 2},
	on_use = core.item_eat(1),
})

core.register_craft({
	output = "farming:almond",
	recipe = {
		{"group:rock"},
		{"farming:peach_pit"},
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

-- almond flour
core.register_craftitem("farming:almond_flour", {
	description = S("Almond Flour"),
	inventory_image = "farming_wheat_flour.png",
	groups = {flour = 1, flammable = 1},
})

core.register_craft({
	output = "farming:almond_flour",
	recipe = {
		{"farming:almond", "farming:almond", "farming:almond"},
		{"farming:almond", "group:grinder", "farming:almond"},
		{"farming:almond", "farming:almond", "farming:almond"},
	},
	replacements = {
		{"farming:handmill", "farming:handmill"},
		{"farming:mortar_pestle", "farming:mortar_pestle"},
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"},
		{"default:clay_brick", "default:clay_brick"}
	}
})

-- almond milk bucket
core.register_craftitem("farming:almond_milk", {
	description = S("Almond Milk Bucket"),
	inventory_image = "foods_bucket_1.png",
	stack_max = 1,
	groups = {milk = 1},
	on_use = core.item_eat(8, "bucket:bucket_empty"),
})

core.register_craft({
	output = "farming:almond_milk",
	recipe = {
		{"farming:almond_flour", "farming:almond_flour", "farming:almond_flour"},
		{"farming:almond_flour", "farming:almond_flour", "farming:almond_flour"},
		{"group:sugar", "bucket:bucket_fresh_water", "farming:maizestarch"},
	},
	replacements = {{"farming:maizestarch", "vessels:wood_bowl"}}
})

core.register_craft({
	output = "farming:almond_milk",
	recipe = {
		{"farming:almond_flour", "farming:almond_flour", "farming:almond_flour"},
		{"farming:almond_flour", "farming:almond_flour", "farming:almond_flour"},
		{"foods:molasses_1", "bucket:bucket_fresh_water", "farming:maizestarch"},
	},
	replacements = {
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"farming:maizestarch", "vessels:wood_bowl"}
	}
})

-- almond butter
core.register_node("farming:almond_butter", {
	description = S("Almond Butter"),
	drawtype = "plantlike",
	tiles = {"farming_almond_butter.png"},
	inventory_image = "farming_almond_butter.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(7, "vessels:glass_jar"),
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, nut_butter = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "farming:almond_butter",
	recipe = {
		{"farming:almond", "farming:almond", "farming:almond"},
		{"farming:almond", "farming:almond", "farming:almond"},
		{"farming:almond", "vessels:glass_jar", "farming:almond"}
	}
})

-- almond oil
core.register_node("farming:almond_oil", {
	description = S("Almond Oil"),
	drawtype = "plantlike",
	tiles = {"farming_almond_oil.png"},
	inventory_image = "farming_almond_oil.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(2, "vessels:glass_bottle"),
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, food_oil = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "farming:almond_oil",
	recipe = {"farming:almond_butter", "group:fresh_water_bucket", "vessels:glass_bottle"},
	replacements = {
		{"farming:almond_butter", "farming:almond_flour"},
		{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
		{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
		{"bucket:bucket_fresh_water", "bucket:bucket_empty"},
		{"vessels:glass_bottle", "vessels:glass_jar"}
	}
})

core.register_craft({
	type = "fuel",
	recipe = "farming:almond_oil",
	burntime = 30,
	replacements = {{"farming:almond_oil", "vessels:glass_bottle"}}
})

core.register_craft({
	output = "farming:peach_sapling",
	recipe = {
		{"farming:peach_pit"},
		{"default:dirt"},
	}
})

core.register_node("farming:peach_trunk", {
	description = "Peach Trunk",
	tiles = {"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	is_ground_content = false,
	drop = "default:apple_trunk",
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"farming:peach_leaves", "farming:peach_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:peach_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:peach_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:peach_leaves_blooming" then
					core.set_node(p, {name = "farming:peach_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:peach_leaves", {
	description = S("Peach Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_prunus_leaves.png"},
	inventory_image = leaf_image("farming_prunus_leaves.png"),
	wield_image = leaf_image("farming_prunus_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:peach_sapling"}, rarity = 20},
			{items = {"farming:peach_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:peach_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_prunus_leaves.png^farming_peach_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:peach_sapling"}, rarity = 20},
			{items = {"farming:peach_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:peach_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_prunus_leaves.png^farming_peaches.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:peach_leaves",
	drop = {
		items = {
			{items = {"farming:peach 5"}},
			{items = {"farming:peach 2"}, rarity = 2},
			{items = {"farming:peach 4"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:peach_leaves"})
		local f = core.find_node_near(pos, 2, {"farming:peach_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local L = {name = "farming:peach_leaves_fruiting"}
local T = {name = "farming:peach_trunk", force_place = true}

farming.peach_tree = {size = {x = 7, y = 8, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,T,_,_,L,L,
_,L,L,_,T,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,_,_,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,T,L,L,
_,L,T,_,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- pear
core.register_craftitem("farming:pear", {
	description = S("Pear"),
	inventory_image = "farming_pear.png",
	groups = {flammable = 2},
	on_use = core.item_eat(4, "farming:spent_biomasse"),
})

core.register_craft({
	output = "farming:pear_sapling 5",
	recipe = {
		{"farming:pear"},
		{"default:dirt"},
	}
})

core.register_node("farming:pear_trunk", {
	description = "Pear Trunk",
	tiles = {"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	is_ground_content = false,
	drop = "default:apple_trunk",
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"farming:pear_leaves", "farming:pear_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:pear_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:pear_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:pear_leaves_blooming" then
					core.set_node(p, {name = "farming:pear_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:pear_leaves", {
	description = S("Pear Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_pear_leaves.png"},
	inventory_image = leaf_image("farming_pear_leaves.png"),
	wield_image = leaf_image("farming_pear_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:pear_sapling"}, rarity = 20},
			{items = {"farming:pear_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:pear_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_pear_leaves.png^farming_pear_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:pear_sapling"}, rarity = 20},
			{items = {"farming:pear_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:pear_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_pear_leaves.png^farming_pears.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:pear_leaves",
	drop = {
		items = {
			{items = {"farming:pear 5"}},
			{items = {"farming:pear 2"}, rarity = 2},
			{items = {"farming:pear 4"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:pear_leaves"})
		local f = core.find_node_near(pos, 2, {"farming:pear_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local L = {name = "farming:pear_leaves_fruiting"}
local T = {name = "farming:pear_trunk", force_place = true}

farming.pear_tree = {size = {x = 7, y = 8, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,T,_,_,L,L,
_,L,L,_,T,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,_,_,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,T,L,L,
_,L,T,_,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- pecan
core.register_craftitem("farming:pecan", {
	description = S("Pecan"),
	inventory_image = "farming_pecan.png",
	groups = {flammable = 2},
})

-- shelled pecan
core.register_craftitem("farming:pecan_shelled", {
	description = S("Shelled Pecan"),
	inventory_image = "farming_pecan_shelled.png",
	groups = {flammable = 2},
	on_use = core.item_eat(2),
})

core.register_craft({
	output = "farming:pecan_shelled",
	recipe = {
		{"farming:pecan"},
	},
	replacements = {{"farming:pecan", "farming:spent_biomasse"}}
})

core.register_craft({
	output = "farming:pecan_sapling",
	recipe = {
		{"farming:pecan"},
		{"default:dirt"},
	}
})

core.register_node("farming:pecan_trunk", {
	description = "Pecan Trunk",
	tiles = {"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	is_ground_content = false,
	drop = "default:apple_trunk",
	on_timer = function(pos, elapsed)
		for i=-3,3 do
		for j=-3,3 do
		for k=-3,3 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 3, {"farming:pecan_leaves", "farming:pecan_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:pecan_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:pecan_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:pecan_leaves_blooming" then
					core.set_node(p, {name = "farming:pecan_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:pecan_leaves", {
	description = S("Pecan Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_droop.obj",
	waving = waving_style,
	tiles = {"farming_pecan_leaves.png"..leaf_image("^[transformFY")},
	inventory_image = leaf_image("farming_pecan_leaves.png"),
	wield_image = leaf_image("farming_pecan_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:pecan_sapling"}, rarity = 20},
			{items = {"farming:pecan_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:pecan_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_droop.obj",
	waving = waving_style,
	tiles = {"farming_pecan_leaves.png^farming_pecan_flowers.png"..leaf_image("^[transformFY")},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:pecan_sapling"}, rarity = 20},
			{items = {"farming:pecan_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:pecan_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_droop.obj",
	waving = waving_style,
	tiles = {"farming_pecan_leaves.png^farming_pecans.png"..leaf_image("^[transformFY")},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:pecan_leaves",
	drop = {
		items = {
			{items = {"farming:pecan 5"}},
			{items = {"farming:pecan 2"}, rarity = 2},
			{items = {"farming:pecan 4"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:pecan_leaves"})
		local f = core.find_node_near(pos, 3, {"farming:pecan_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local L = {name = "farming:pecan_leaves_fruiting"}
local T = {name = "farming:pecan_trunk", force_place = true}

farming.pecan_tree = {size = {x = 7, y = 9, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,T,_,_,L,L,
L,L,L,_,T,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,T,_,L,L,
L,L,L,T,L,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,T,L,L,
L,L,T,_,L,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- plum
core.register_craftitem("farming:plum", {
	description = S("Plum"),
	inventory_image = "farming_plum.png",
	groups = {flammable = 2},
	on_use = core.item_eat(3, "farming:plum_pit"),
})

core.register_craftitem("farming:plum_pit", {
	description = S("Plum Pit"),
	inventory_image = "farming_peach_pit.png^[colorize:white:20",
	groups = {flammable = 2},
})

core.register_craft({
	output = "farming:almond",
	recipe = {
		{"group:rock"},
		{"farming:plum_pit"},
	},
	replacements = {
		{"default:rock", "default:rock"},
		{"default:desert_rock", "default:desert_rock"}
	}
})

core.register_craft({
	output = "farming:plum_sapling",
	recipe = {
		{"farming:plum_pit"},
		{"default:dirt"},
	}
})

core.register_node("farming:plum_trunk", {
	description = "Plum Trunk",
	tiles = {"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	is_ground_content = false,
	drop = "default:apple_trunk",
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"farming:plum_leaves", "farming:plum_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:plum_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:plum_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:plum_leaves_blooming" then
					core.set_node(p, {name = "farming:plum_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:plum_leaves", {
	description = S("Plum Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_prunus_leaves.png"},
	inventory_image = leaf_image("farming_prunus_leaves.png"),
	wield_image = leaf_image("farming_prunus_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:plum_sapling"}, rarity = 20},
			{items = {"farming:plum_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:plum_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_prunus_leaves.png^farming_plum_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:plum_sapling"}, rarity = 20},
			{items = {"farming:plum_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:plum_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_prunus_leaves.png^farming_plums.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:plum_leaves",
	drop = {
		items = {
			{items = {"farming:plum 5"}},
			{items = {"farming:plum 2"}, rarity = 2},
			{items = {"farming:plum 4"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:plum_leaves"})
		local f = core.find_node_near(pos, 2, {"farming:plum_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local L = {name = "farming:plum_leaves_fruiting"}
local T = {name = "farming:plum_trunk", force_place = true}

farming.plum_tree = {size = {x = 7, y = 8, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,T,_,_,L,L,
_,L,L,_,T,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,_,_,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,T,L,L,
_,L,T,_,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- pomegranate
core.register_craftitem("farming:pomegranate", {
	description = S("Pomegranate"),
	inventory_image = "farming_pomegranate.png",
	groups = {flammable = 2},
	on_use = core.item_eat(3, "farming:spent_biomasse"),
})

core.register_craft({
	output = "farming:pomegranate_sapling 5",
	recipe = {
		{"farming:pomegranate"},
		{"default:dirt"},
	}
})

core.register_node("farming:pomegranate_trunk", {
	description = "Pomegranate Trunk",
	tiles = {"farming_pomegranate_trunk_top.png", "farming_pomegranate_trunk_top.png", "farming_pomegranate_trunk.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	on_timer = function(pos, elapsed)
		for i=-2,2 do
		for j=-2,2 do
		for k=-2,2 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 2, {"farming:pomegranate_leaves", "farming:pomegranate_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:pomegranate_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:pomegranate_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:pomegranate_leaves_blooming" then
					core.set_node(p, {name = "farming:pomegranate_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("farming:pomegranate_wood", {
	description = S("Pomegranate Wood Planks"),
	tiles = {"farming_pomegranate_wood.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_craft({
	output = 'farming:pomegranate_wood 4',
	recipe = {
		{'farming:pomegranate_trunk'},
	}
})

core.register_node("farming:pomegranate_leaves", {
	description = S("Pomegranate Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_pomegranate_leaves.png"},
	inventory_image = leaf_image("farming_pomegranate_leaves.png"),
	wield_image = leaf_image("farming_pomegranate_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:pomegranate_sapling"}, rarity = 20},
			{items = {"farming:pomegranate_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:pomegranate_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_pomegranate_leaves.png^farming_pomegranate_flowers.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:pomegranate_sapling"}, rarity = 20},
			{items = {"farming:pomegranate_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:pomegranate_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_poof.obj",
	waving = waving_style,
	tiles = {"farming_pomegranate_leaves.png^farming_pomegranates.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:pomegranate_leaves",
	drop = {
		items = {
			{items = {"farming:pomegranate 5"}},
			{items = {"farming:pomegranate 2"}, rarity = 2},
			{items = {"farming:pomegranate 4"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:pomegranate_leaves"})
		local f = core.find_node_near(pos, 2, {"farming:pomegranate_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local L = {name = "farming:pomegranate_leaves_fruiting"}
local T = {name = "farming:pomegranate_trunk", force_place = true}

farming.pomegranate_tree = {size = {x = 7, y = 8, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,T,_,_,L,L,
_,L,L,_,T,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,_,_,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,T,L,L,
_,L,T,_,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

-- walnut
core.register_craftitem("farming:walnut", {
	description = S("Walnut"),
	inventory_image = "farming_walnut.png",
	groups = {flammable = 2},
	on_use = core.item_eat(1, "farming:spent_biomasse"),
})

core.register_node("farming:soaked_walnuts", {
	description = S("Soaked Walnuts"),
	drawtype = "plantlike",
	tiles = {"farming_soaked_walnuts.png"},
	inventory_image = "farming_soaked_walnuts.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = core.item_eat(14, "vessels:glass_jar"),
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, .2, .2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

core.register_craft({
	output = "farming:soaked_walnuts",
	recipe = {
		{"farming:walnut", "farming:walnut", "farming:walnut"},
		{"farming:walnut", "group:fresh_water_bucket", "farming:walnut"},
		{"farming:walnut", "vessels:glass_jar", "farming:walnut"},
	},
	replacements = {
		{"farming:walnut", "farming:spent_biomasse"},
		{"farming:walnut", "farming:spent_biomasse"},
		{"farming:walnut", "farming:spent_biomasse"},
		{"farming:walnut", "farming:spent_biomasse"},
		{"farming:walnut", "farming:spent_biomasse"},
		{"farming:walnut", "farming:spent_biomasse"},
		{"farming:walnut", "farming:spent_biomasse"},
		{"bucket:clay_bucket_fresh_water", "bucket:clay_bucket_empty"},
		{"bucket:wooden_bucket_fresh_water", "bucket:wooden_bucket_empty"},
		{"bucket:bucket_fresh_water", "bucket:bucket_empty"}
	}
})

core.register_craft({
	output = "farming:walnut_sapling",
	recipe = {
		{"farming:walnut"},
		{"default:dirt"},
	}
})

core.register_node("farming:walnut_trunk", {
	description = "Walnut Trunk",
	tiles = {"default_apple_trunk_top.png", "default_apple_trunk_top.png", "default_apple_trunk.png"},
	is_ground_content = false,
	drop = "default:apple_trunk",
	on_timer = function(pos, elapsed)
		for i=-3,3 do
		for j=-3,3 do
		for k=-3,3 do
		local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
		local n = core.get_node_or_nil(p)
		if not n then
			-- Nodes not yet loaded, try later
			core.get_node_timer(pos):start(200)
			return
		end
		if not core.find_node_near(pos, 3, {"farming:walnut_leaves", "farming:walnut_leaves_blooming"}) then
			core.get_node_timer(pos):stop()
		elseif core.get_node_light(p) < 11 then
			core.get_node_timer(pos):start(200)
		else
			if n.name == "farming:walnut_leaves" then
				if n.param2 == 0 then
					core.set_node(p, {name = "farming:walnut_leaves_blooming"})
					core.get_node_timer(pos):start(200)
				end
			else
				if n.name == "farming:walnut_leaves_blooming" then
					core.set_node(p, {name = "farming:walnut_leaves_fruiting"})
					core.get_node_timer(pos):start(200)
				end
			end
		end
		end
		end
		end
	end,
	groups = {choppy = 2, flammable = 2, trunk = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("farming:walnut_leaves", {
	description = S("Walnut Tree Leaves"),
	drawtype = leaf_drawtype,
	mesh = "leaf_droop.obj",
	waving = waving_style,
	tiles = {"farming_pecan_leaves.png"..leaf_image("^[transformFY")},
	inventory_image = leaf_image("farming_pecan_leaves.png"),
	wield_image = leaf_image("farming_pecan_leaves.png"),
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:walnut_sapling"}, rarity = 20},
			{items = {"farming:walnut_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = after_place_leaves,
})

core.register_node("farming:walnut_leaves_blooming", {
	drawtype = leaf_drawtype,
	mesh = "leaf_droop.obj",
	waving = waving_style,
	tiles = {"farming_pecan_leaves.png^farming_pecan_flowers.png"..leaf_image("^[transformFY")},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"farming:walnut_sapling"}, rarity = 20},
			{items = {"farming:walnut_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("farming:walnut_leaves_fruiting", {
	drawtype = leaf_drawtype,
	mesh = "leaf_droop.obj",
	waving = waving_style,
	tiles = {"farming_pecan_leaves.png^farming_walnuts.png"..leaf_image("^[transformFY")},
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	collision_box = leaf_cbox,
	node_dig_prediction = "farming:walnut_leaves",
	drop = {
		items = {
			{items = {"farming:walnut 5"}},
			{items = {"farming:walnut 2"}, rarity = 2},
			{items = {"farming:walnut 4"}, rarity = 3}
		}
	},
	after_dig_node = function(pos)
		core.set_node(pos, {name = "farming:walnut_leaves"})
		local f = core.find_node_near(pos, 3, {"farming:walnut_trunk"})
		if f then
			core.get_node_timer(f):start(math.random(300, 1500))
		end
	end,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_fruits_defaults(),
})

local L = {name = "farming:walnut_leaves_fruiting"}
local T = {name = "farming:walnut_trunk", force_place = true}

farming.walnut_tree = {size = {x = 7, y = 9, z = 7}, data = {
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,T,_,_,L,L,
L,L,L,_,T,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,

_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
_,_,_,T,_,_,_,
L,_,_,T,_,_,L,
L,L,_,T,_,L,L,
L,L,L,T,L,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
L,L,_,_,T,L,L,
L,L,T,_,L,L,L,
_,L,L,L,L,L,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,L,L,_,L,L,_,
_,L,L,L,L,L,_,
_,L,L,L,L,L,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,

_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_,
_,_,L,L,L,_,_,
_,_,L,L,L,_,_,
_,_,_,L,_,_,_,
_,_,_,_,_,_,_,
_,_,_,_,_,_,_},
yslice_prob = {{ypos = 2, prob = 127}}}

default.register_leafdecay({
	trunks = {"farming:avocado_trunk"},
	leaves = {"farming:avocado_leaves", "farming:avocado_leaves_blooming", "farming:avocado_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:beanstalk_trunk"},
	leaves = {"farming:beanstalk_leaves"},
	radius = 1,
})

default.register_leafdecay({
	trunks = {"farming:cherry_trunk"},
	leaves = {"farming:cherry_leaves", "farming:cherry_leaves_blooming", "farming:cherry_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:cinnamon_trunk", "farming:cinnamon_trunk_peeling"},
	leaves = {"farming:cinnamon_leaves"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:cocoa_trunk", "farming:cocoa_trunk_blooming"},
	leaves = {"farming:cocoa_leaves", "farming:cocoa_1", "farming:cocoa_2", "farming:cocoa_3", "farming:cocoa_4"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:date_palm_trunk"},
	leaves = {"farming:date_palm_leaves", "farming:dates_4", "farming:dates_3", "farming:dates_2", "farming:dates_1",
		"farming:dates_female_flowers", "farming:dates_male_flowers", "farming:date_mark", "farming:male_date_flower_mark"},
	radius = 5,
})

default.register_leafdecay({
	trunks = {"farming:fig_trunk"},
	leaves = {"farming:fig_leaves", "farming:fig_leaves_blooming", "farming:fig_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:hazelnut_trunk"},
	leaves = {"farming:hazelnut_leaves", "farming:hazelnut_leaves_blooming", "farming:hazelnut_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:lemon_trunk"},
	leaves = {"farming:lemon_leaves", "farming:lemon_leaves_blooming", "farming:lemon_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:lime_trunk"},
	leaves = {"farming:lime_leaves", "farming:lime_leaves_blooming", "farming:lime_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:mango_trunk"},
	leaves = {"farming:mango_leaves", "farming:mango_leaves_blooming", "farming:mango_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:mirabelle_trunk"},
	leaves = {"farming:mirabelle_leaves", "farming:mirabelle_leaves_blooming", "farming:mirabelle_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:nutmeg_trunk"},
	leaves = {"farming:nutmeg_leaves", "farming:nutmeg_leaves_blooming", "farming:nutmeg_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:olive_trunk"},
	leaves = {"farming:olive_leaves", "farming:olive_leaves_blooming",
		"farming:olive_leaves_fruiting_green", "farming:olive_leaves_fruiting_ripe"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:peach_trunk"},
	leaves = {"farming:peach_leaves", "farming:peach_leaves_blooming", "farming:peach_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:pecan_trunk"},
	leaves = {"farming:pecan_leaves", "farming:pecan_leaves_blooming", "farming:pecan_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:pear_trunk"},
	leaves = {"farming:pear_leaves", "farming:pear_leaves_blooming", "farming:pear_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:plum_trunk"},
	leaves = {"farming:plum_leaves", "farming:plum_leaves_blooming", "farming:plum_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:pomegranate_trunk"},
	leaves = {"farming:pomegranate_leaves", "farming:pomegranate_leaves_blooming", "farming:pomegranate_leaves_fruiting"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"farming:walnut_trunk"},
	leaves = {"farming:walnut_leaves", "farming:walnut_leaves_blooming", "farming:walnut_leaves_fruiting"},
	radius = 2,
})
