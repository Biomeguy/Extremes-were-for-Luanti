
local S = ethereal.intllib

-- Firethorn (poisonous when eaten raw, must be crushed and washed in flowing water first)
core.register_node("ethereal:firethorn", {
	description = S("Firethorn Shrub"),
	drawtype = "plantlike",
	tiles = {"ethereal_firethorn.png"},
	inventory_image = "ethereal_firethorn.png",
	paramtype = "light",
	waving = 1,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	on_use = core.item_eat(-2, "farming:spent_biomasse"),
	groups = {snappy = 3, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.plant_sbox,
})

-- Fire Flower
core.register_node("ethereal:fire_flower", {
	description = S("Fire Flower"),
	drawtype = "plantlike",
	tiles = {"ethereal_fire_flower.png"},
	inventory_image = "ethereal_fire_flower.png",
	paramtype = "light",
	light_source = 5,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	damage_per_second = 2,
	groups = {snappy = 1, oddly_breakable_by_hand = 3, attached_node = 1, igniter = 2},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-3/16, -.5, -3/16, 3/16, 1/2, 3/16}
	},
	on_punch = function(pos, node, puncher)
		puncher:punch(puncher, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2}
		}, nil)
	end,
})

core.register_craft({
	type = "fuel",
	recipe = "ethereal:fire_flower",
	burntime = 20,
})

-- Fire Dust
core.register_craftitem("ethereal:fire_dust", {
	description = S("Fire Dust"),
	inventory_image = "fire_dust.png",
})

core.register_craft({
	output = "ethereal:fire_dust 2",
	recipe = {{"ethereal:fire_flower"}}
})

core.register_craft({
	type = "fuel",
	recipe = "ethereal:fire_dust",
	burntime = 10,
})

-- vines
core.register_node("ethereal:vine", {
	description = S("Vine"),
	drawtype = "signlike",
	tiles = {"vine.png"},
	inventory_image = "vine.png",
	wield_image = "vine.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	is_ground_content = false,
	legacy_wallmounted = true,
	selection_box = {type = "wallmounted"},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(15, 30))
	end,

	on_timer = function(pos)
	local bottom = {x = pos.x, y = pos.y - 1, z = pos.z}
	local node = core.get_node(pos)

		if core.get_node(bottom).name == "air" and
		(node.param2 == 2 or node.param2 == 3 or node.param2 == 4 or node.param2 == 5) then
	local spos = {x = pos.x, y = pos.y, z = pos.z}
	local snode = core.get_node(spos)
	local height = 0
	while snode.name == node.name and height < 7 do
		height = height + 1
		spos.y = spos.y + 1
		snode = core.get_node(spos)
	end
	if height == 7 then
		core.get_node_timer(pos):stop()
		return
	end
	local light_level = 13
	local meta = core.get_meta(pos)
	if meta:get_int("light_level") > 0 then
		light_level = light_level - (meta:get_int("light_level") * 3)
		meta:set_int("light_level", 0)
	end
	local light = core.get_node_light(pos)
	if not light or light < light_level then
		core.get_node_timer(pos):start(300)
		return
	end
	core.set_node(bottom, {name = node.name, param2 = node.param2})
	core.get_node_timer(bottom):start(math.random(15, 30))
		end
	end,
	groups = {choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
})

-- light strings (glowing vine)
core.register_node("ethereal:lightstring", {
	description = S("Light String Vine"),
	drawtype = "signlike",
	tiles = {"lightstring.png"},
	inventory_image = "lightstring.png",
	wield_image = "lightstring.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = 10,
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	is_ground_content = false,
	legacy_wallmounted = true,
	selection_box = {type = "wallmounted"},
	groups = {choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	output = "ethereal:lightstring 8",
	recipe = {
		{"ethereal:vine", "ethereal:vine", "ethereal:vine"},
		{"ethereal:vine", "ethereal:fire_dust", "ethereal:vine"},
		{"ethereal:vine", "ethereal:vine", "ethereal:vine"}
	}
})

-- Fern (boston)
core.register_node("ethereal:fern", {
	description = S("Fern"),
	drawtype = "plantlike",
	visual_scale = 1.4,
	tiles = {"fern.png"},
	inventory_image = "fern.png",
	wield_image = "fern.png",
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:fern_tubers"}, rarity = 6},
			{items = {"ethereal:fern"}}
		}
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.plant_sbox,
})

-- Fern feather
core.register_node("ethereal:feather_fern", {
	description = S("Feather Fern"),
	drawtype = "mesh",
	mesh = "plant_poof_2.obj",
	tiles = {"feather_fern.png"},
	inventory_image = "feather_fern.png",
	wield_image = "feather_fern.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	waving = 1,
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{items = {"ethereal:fern_tubers"}, rarity = 6},
			{items = {"ethereal:feather_fern"}}
		}
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.plant_sbox,
})

-- Tubers
core.register_craftitem("ethereal:fern_tubers", {
	description = S("Fern Tubers"),
	inventory_image = "fern_tubers.png",
	groups = {tuber = 1, flammable = 2},
	on_use = core.item_eat(1),
})

-- Red Shrub (not flammable)
core.register_node("ethereal:dry_shrub", {
	description = S("Fiery Dry Shrub"),
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"ethereal_dry_shrub.png"},
	inventory_image = "ethereal_dry_shrub.png",
	wield_image = "ethereal_dry_shrub.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	waving = 1,
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.plant_sbox,
})

-- Grey Shrub (not Flammable - too cold to burn)
core.register_node("ethereal:snowygrass", {
	description = S("Snowy Grass"),
	drawtype = "mesh",
	mesh = "plant_poof_1.obj",
	tiles = {"ethereal_snowygrass.png"},
	inventory_image = "ethereal_snowygrass.png",
	wield_image = "ethereal_snowygrass.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	waving = 1,
	light_source = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.plant_sbox,
})

-- Define Moss Types (Has grass textures on all sides)
local add_moss = function(typ, descr, texture, receipe_item)

	core.register_node("ethereal:" .. typ .. "_moss", {
		description = S(descr .. " Moss"),
		tiles = {texture},
		groups = {crumbly = 3},
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = .13}})
	})

	core.register_craft({
		output = "ethereal:"..typ.."_moss",
		recipe = {{"default:dirt", receipe_item }}
	})
end

add_moss("fiery", "Fiery", "ethereal_fiery_grass_top.png", "ethereal:dry_shrub")
add_moss("gray", "Gray", "ethereal_gray_moss.png", "ethereal:snowygrass")
add_moss("green", "Green", "default_grass.png", "default:jungle_leaves")

-- Illuminated Cave Shrooms (Red, Green and Blue)
core.register_node("ethereal:illumishroom", {
	description = S("Red Illumishroom"),
	drawtype = "plantlike",
	tiles = {"illumishroom.png"},
	inventory_image = "illumishroom.png",
	paramtype = "light",
	light_source = 5,
	sunlight_propagates = true,
	walkable = false,
	groups = {mushroom = 1, dig_immediate = 3, attached_node = 1, flammable = 3},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.plant_sbox,
})

core.register_node("ethereal:illumishroom2", {
	description = S("Green Illumishroom"),
	drawtype = "plantlike",
	tiles = {"illumishroom2.png"},
	inventory_image = "illumishroom2.png",
	paramtype = "light",
	light_source = 5,
	sunlight_propagates = true,
	walkable = false,
	groups = {mushroom = 1, dig_immediate = 3, attached_node = 1, flammable = 3},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.plant_sbox,
})

core.register_node("ethereal:illumishroom3", {
	description = S("Aqua Illumishroom"),
	drawtype = "plantlike",
	tiles = {"illumishroom3.png"},
	inventory_image = "illumishroom3.png",
	paramtype = "light",
	light_source = 5,
	sunlight_propagates = true,
	walkable = false,
	groups = {mushroom = 1, dig_immediate = 3, attached_node = 1, flammable = 3},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = default.plant_sbox,
})

-- Healing Flower
core.register_node("ethereal:healing_flower", {
	description = "Healing Flower",
	drawtype = "plantlike",
	visual_scale = 1.8,
	tiles = {"healing_flower.png"},
	inventory_image = "healing_flower.png",
	paramtype = "light",
	light_source = 9,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	damage_per_second = -4,
	on_punch = function(pos, node, user)
		local wielded = user:get_wielded_item()

		if wielded:get_count() == 0 then
			user:set_hp(user:get_hp() + 4)
		end
	end,
	on_construct = function(pos)
		core.get_node_timer(pos):start(7)
	end,
	on_timer = default.fireflies,
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1, timer_check=1},
	selection_box = {
		type = "fixed",
		fixed = {-2/16, -.5, -2/16, 2/16, 1, 2/16}
	},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craftitem("ethereal:healing_flower_head", {
	description = "Healing Flower Head",
	inventory_image = "healing_flower_head.png",
	on_use = core.item_eat(20),
})

core.register_craft({
	output = "ethereal:healing_flower_head",
	recipe = {{"ethereal:healing_flower"}}
})
