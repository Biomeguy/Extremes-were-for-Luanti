local depends, default_sounds =  ...

core.register_craftitem("noel:led_rgb", {
	description = "RGB Led Light",
	inventory_image = "noel_led_rgb.png",
})

core.register_craftitem("noel:led_white", {
	description = "White Led Light",
	inventory_image = "noel_led_white.png",
})

core.register_craftitem("noel:wire", {
	description = "Wire",
	inventory_image = "noel_wire.png",
})

if depends.basic_materials then
	core.register_craft({
		output = "noel:led_white 8",
		recipe = {
			{"basic_materials:white_led", "basic_materials:white_led", "basic_materials:white_led"},
			{"basic_materials:white_led", "basic_materials:plastic_sheet", "basic_materials:white_led"},
			{"basic_materials:white_led", "basic_materials:white_led", "basic_materials:white_led"}
		}
	})

	core.register_craft({
		type = "shapeless",
		output = "noel:led_rgb 2",
		recipe = {"basic_materials:plastic_strip", "basic_materials:red_led", "basic_materials:green_led", "basic_materials:blue_led",
			"basic_materials:red_led", "basic_materials:green_led", "basic_materials:blue_led"},
	})

	core.register_craft({
		output = "noel:wire 16",
		recipe = {
			{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"},
			{"basic_materials:copper_strip", "basic_materials:copper_strip", "basic_materials:copper_strip"},
			{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"}
		}
	})
end

local function register_lights(desc, nodename, aspect, length)
	core.register_node("noel:lights_" .. nodename, {
		description = desc .. " Noel Lights",
		tiles = {{
			image = "noel_lights_" .. nodename .. ".png",
			backface_culling = false,
			animation = {type = "vertical_frames", aspect_w = aspect, aspect_h = aspect, length = length},
		}},
		inventory_image = "noel_lights_" .. nodename .. "_inv.png",
		wield_image = "noel_lights_" .. nodename .. "_inv.png",
		sunlight_propagates = true,
		walkable = false,
		is_ground_content = false,
		selection_box = {type = "wallmounted"},
		legacy_wallmounted = true,
		use_texture_alpha = "blend",
		drawtype = "signlike",
		paramtype = "light",
		light_source = 10,
		paramtype2 = "wallmounted",
		connects_to = {"group:noel_lights"},
		groups = {snappy = 3, noel_lights = 1},
		sounds = default_sounds("node_sound_leaves_defaults"),
	})

	if not depends.xpanes then return end
	local tileFX = {
		name = "noel_lights_" .. nodename .. ".png^[transformFX",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = aspect, aspect_h = aspect, length = length}
	}

	local tile = {
		name = "noel_lights_" .. nodename .. ".png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = aspect, aspect_h = aspect, length = length}
	}

	xpanes.register_pane("lights_" .. nodename .. "_pane", {
		description = desc .. " Noel Lights (pane)",
		textures = {},
		use_texture_alpha = "blend",
		groups = {snappy = 3},
		sounds = default_sounds("node_sound_leaves_defaults"),
		recipe = {
			{"noel:lights_" .. nodename, "noel:lights_" .. nodename, "noel:lights_" .. nodename},
			{"noel:lights_" .. nodename, "noel:lights_" .. nodename, "noel:lights_" .. nodename}
		}
	})

	core.override_item("xpanes:lights_" .. nodename .. "_pane", {
		tiles = {"blank.png", "blank.png", tile, tileFX, tileFX, tile},
		walkable = false,
		light_source = 10,
	})

	core.override_item("xpanes:lights_" .. nodename .. "_pane_flat", {
		tiles = {"blank.png", "blank.png", tile, tile, tileFX, tile},
		walkable = false,
		light_source = 10,
	})
end

register_lights("White", "white", 16, 6)
register_lights("White Icicle", "white_icicle", 16, 6)
register_lights("Multicolor", "multicolor", 16, 6)
register_lights("Multicolor Bulb", "multicolor_bulb", 8, 3)

core.register_craft({
	output = "noel:lights_white 6",
	recipe = {
		{"noel:led_white", "noel:led_white", "noel:led_white"},
		{"noel:wire", "noel:wire", "noel:wire"},
		{"noel:led_white", "noel:led_white", "noel:led_white"}
	}
})

core.register_craft({
	output = "noel:lights_white_icicle 6",
	recipe = {
		{"noel:wire", "noel:wire", "noel:wire"},
		{"noel:led_white", "noel:led_white", "noel:led_white"},
		{"noel:led_white", "noel:led_white", "noel:led_white"}
	}
})

core.register_craft({
	output = "noel:lights_multicolor 6",
	recipe = {
		{"noel:led_rgb", "noel:led_rgb", "noel:led_rgb"},
		{"noel:wire", "noel:wire", "noel:wire"},
		{"noel:led_rgb", "noel:led_rgb", "noel:led_rgb"}
	}
})

core.register_craft({
	output = "noel:lights_multicolor_bulb 6",
	recipe = {
		{"noel:led_rgb", "default:glass", "noel:led_rgb"},
		{"noel:wire", "noel:wire", "noel:wire"},
		{"noel:led_rgb", "default:glass", "noel:led_rgb"}
	}
})

core.register_node("noel:garland", {
	description = "Garland",
	tiles = {"noel_garland.png"},
	inventory_image = "noel_garland.png",
	wield_image = "noel_garland.png",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {type = "wallmounted"},
	legacy_wallmounted = true,
	drawtype = "signlike",
	paramtype = "light",
	paramtype2 = "wallmounted",
	groups = {snappy = 3},
	sounds = default_sounds("node_sound_leaves_defaults"),
})

core.register_node("noel:garland_lights", {
	description = "Garland with Lights",
	tiles = {{
		image = "noel_garland_lights.png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 64, aspect_h = 64, length = 16},
	}},
	inventory_image = "noel_garland_lights_inv.png",
	wield_image = "noel_garland_lights_inv.png",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {type = "wallmounted"},
	legacy_wallmounted = true,
	use_texture_alpha = "blend",
	drawtype = "signlike",
	paramtype = "light",
	light_source = 8,
	paramtype2 = "wallmounted",
	groups = {snappy = 3},
	sounds = default_sounds("node_sound_leaves_defaults"),
})

if depends.default then
	core.register_craft({
		output = "noel:garland 3",
		recipe = {
			{"default:pine_needles", "default:pine_needles", "default:pine_needles"}
		}
	})
end

if depends.fir then
	core.register_craft({
		output = "noel:garland 3",
		recipe = {
			{"fir:needles", "fir:needles", "fir:needles"}
		}
	})
end

core.register_craft({
	type = "shapeless",
	output = "noel:garland_lights",
	recipe = {"noel:garland", "noel:led_white", "noel:led_white", "noel:led_white"}
})

local col ={
	{"ffffff"},--White
	{"0000ff"},--Blue
	{"2000c9"},
	{"0000ac"},
	{"000088"},
	{"2a80e7"},--Powder Blue
	{"8bb9f9"},
	{"ffff00"},--Yellow
	{"d3e420"},--Greenish Yellow
	{"aaff00"},--Yellowish Green
	{"fff9c5"},--Banana Cream Yellow
	{"eced9f"},
	{"feffaa"},
	{"a78c45"},--Burnt Cream
	{"501f08"},--Brown
	{"704214"},
	{"604000"},
	{"463215"},
	{"814f3c"},
	{"ff05bb"},--Pink
	{"ffbbff"},
	{"fd7995"},
	{"ff0000"},--Red
	{"b20056"},
	{"610b21"},
	{"8a0808"},
	{"fb8461"},--Salmon
	{"ed6b74"},
	{"ff00ff"},--Purple
	{"aa00aa"},
	{"800080"},
	{"550055"},
	{"ff009c"},
	{"ea00cc"},
	{"581845"},
	{"551a8b"},--Violet
	{"61ff01"},--Lime Green
	{"30ac00"},
	{"00ff00"},--Green
	{"00aa00"},
	{"66aa11"},--Olive
	{"00ffff"},--Cyan
	{"00bbff"},--Blueish Cyan
	{"43e9a5"},--Aqua
	{"00c482"},
	{"005b07"},--Dark Green
	{"a51"},--Burnt Orange
	{"ff8400"},--Orange
	{"fe642e"},
	{"ecb100"},--Light Orange
}

core.register_node("noel:slow_blink_lights", {
	description = "Slowly Blinking Lights",
	drawtype = "airlike",
	inventory_image = "noel_slow_blink_lights.png",
	wield_image = "noel_slow_blink_lights.png",
	paramtype = "light",
	light_source = 7,
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3},
	on_construct = function(pos)
		core.get_node_timer(pos):start(0)
	end,
	on_timer = function(pos)
for _, d in ipairs(col) do
	if math.random(50) < 10 then
core.add_particlespawner({
	amount = 1,
	time = 1,
	minpos = vector.subtract(pos, .5),
	maxpos = vector.add(pos, .5),
	exptime = {min = 15, max = 19},
	texture = "noel_light_anim.png^[colorize:#".. d[1],
	animation = {type = "vertical_frames", aspect_w = 5, aspect_h = 5, length = -1},
	glow = 13 })
	end
end
core.get_node_timer(pos):start(math.random(7, 12))
	end,
	sounds = default.node_sound_defaults(),
})

core.register_craft({
	output = "noel:slow_blink_lights",
	recipe = {
		{"noel:led_rgb", "noel:led_rgb", "noel:led_rgb"},
		{"noel:led_rgb", "noel:led_rgb", "noel:led_rgb"},
		{"noel:led_rgb", "noel:led_rgb", "noel:led_rgb"}
	}
})

core.register_node("noel:blue_red_lights", {
	description = "Blue or Red Lights",
	drawtype = "airlike",
	inventory_image = "Maelstrom_shot_blue.png",
	wield_image = "Maelstrom_shot_blue.png",
	paramtype = "light",
	light_source = 7,
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3},
	after_place_node = function(pos, placer)
		core.get_node_timer(pos):start(0)
		if placer:get_player_control().sneak then
	core.get_meta(pos):set_string("red", "true")
		end
	end,
	on_timer = function(pos)
		local colr = "blue"
		if core.get_meta(pos):get_string("red") == "true" then
	colr = "red"
		end
core.add_particlespawner({
	amount = 25,
	time = 1,
	minpos = vector.subtract(pos, .5),
	maxpos = vector.add(pos, .5),
	exptime = 15,
	texture = "Maelstrom_shot_".. colr ..".png",
	glow = 13 })
core.get_node_timer(pos):start(math.random(13, 15))
	end,
	sounds = default.node_sound_defaults(),
})

if depends.basic_materials then
	core.register_craft({
		type = "shapeless",
		output = "noel:blue_red_lights 3",
		recipe = {"basic_materials:plastic_strip", "basic_materials:red_led", "basic_materials:red_led", "basic_materials:red_led",
			"basic_materials:plastic_strip", "basic_materials:blue_led", "basic_materials:blue_led", "basic_materials:blue_led"},
	})
end
