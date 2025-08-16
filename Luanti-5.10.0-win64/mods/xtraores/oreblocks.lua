
-- Nickel

core.register_node("xtraores:brick_nickel", {
	description = "" ..core.colorize("#68fff6", "Nickel brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_brick_nickel.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:brick_nickel",
	recipe = {"xtraores:nickel_ore", "default:cobble"},
})

core.register_node("xtraores:block_nickel", {
	description = "" ..core.colorize("#68fff6", "Nickel block"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_block_nickel.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

register_nine('xtraores:block_nickel', 'xtraores:nickel_ingot')

core.register_node("xtraores:decobrick_nickel", {
	description = "" ..core.colorize("#68fff6", "Decorative Nickel brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_decobrick_nickel.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = 'xtraores:decobrick_nickel 4',
	recipe = {
		{'xtraores:brick_nickel', 'xtraores:brick_nickel'},
		{'xtraores:brick_nickel', 'xtraores:brick_nickel'},
	}
})

-- Platinum

core.register_node("xtraores:brick_platinum", {
	description = "" ..core.colorize("#68fff6", "Platinum brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_brick_platinum.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:brick_platinum",
	recipe = {"xtraores:platinum_ore", "default:cobble"},
})

core.register_node("xtraores:block_platinum", {
	description = "" ..core.colorize("#68fff6", "Platinum block"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_block_platinum.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

register_nine('xtraores:block_platinum', 'xtraores:platinum_ingot')

core.register_node("xtraores:decobrick_platinum", {
	description = "" ..core.colorize("#68fff6", "Decorative Platinum brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_decobrick_platinum.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = 'xtraores:decobrick_platinum 4',
	recipe = {
		{'xtraores:brick_platinum', 'xtraores:brick_platinum'},
		{'xtraores:brick_platinum', 'xtraores:brick_platinum'},
	}
})

-- Palladium

core.register_node("xtraores:brick_palladium", {
	description = "" ..core.colorize("#68fff6", "Palladium brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_brick_palladium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:brick_palladium",
	recipe = {"xtraores:palladium_ore", "default:cobble"},
})

core.register_node("xtraores:block_palladium", {
	description = "" ..core.colorize("#68fff6", "Palladium block"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_block_palladium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

register_nine('xtraores:block_palladium', 'xtraores:palladium_ingot')

core.register_node("xtraores:decobrick_palladium", {
	description = "" ..core.colorize("#68fff6", "Decorative Palladium brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_decobrick_palladium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = 'xtraores:decobrick_palladium 4',
	recipe = {
		{'xtraores:brick_palladium', 'xtraores:brick_palladium'},
		{'xtraores:brick_palladium', 'xtraores:brick_palladium'},
	}
})

-- Cobalt

core.register_node("xtraores:brick_cobalt", {
	description = "" ..core.colorize("#68fff6", "Cobalt brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_brick_cobalt.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 4},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:brick_cobalt",
	recipe = {"xtraores:cobalt_ore", "default:cobble"},
})

core.register_node("xtraores:block_cobalt", {
	description = "" ..core.colorize("#68fff6", "Cobalt block"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_block_cobalt.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 4},
	sounds = default.node_sound_stone_defaults(),
})

register_nine('xtraores:block_cobalt', 'xtraores:cobalt_ingot')

core.register_node("xtraores:decobrick_cobalt", {
	description = "" ..core.colorize("#68fff6", "Decorative Cobalt brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_decobrick_cobalt.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 4},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = 'xtraores:decobrick_cobalt 4',
	recipe = {
		{'xtraores:brick_cobalt', 'xtraores:brick_cobalt'},
		{'xtraores:brick_cobalt', 'xtraores:brick_cobalt'},
	}
})

-- Thorium

core.register_node("xtraores:brick_thorium", {
	description = "" ..core.colorize("#68fff6", "Thorium brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_brick_thorium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 5},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:brick_thorium",
	recipe = {"xtraores:thorium_ore", "default:cobble"},
})

core.register_node("xtraores:block_thorium", {
	description = "" ..core.colorize("#68fff6", "Thorium block"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_block_thorium.png"},
	is_ground_content = false,
	stack_max = 999,
	on_construct = function(pos)
		core.get_node_timer(pos):start(.7)
	end,
	on_timer = function(pos, elapsed)
		if core.find_node_near(pos, 1, {"air"}) then
			for i=-1,1 do
			for j=-1,1 do
			for k=-1,1 do
				local p = {x=pos.x+i, y=pos.y+j, z=pos.z+k}
				local n = core.get_node(p)
				if (n.name == "air") then
					core.set_node(p, {name="fire:basic_flame"})
					core.get_node_timer(pos):start(math.random(.5, .7))
				end
			end
			end
			end
		else
			core.get_node_timer(pos):start(math.random(.5, .7))
		end
	end,
	groups = {cracky = 5},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

register_nine('xtraores:block_thorium', 'xtraores:thorium_ingot')

core.register_node("xtraores:decobrick_thorium", {
	description = "" ..core.colorize("#68fff6", "Decorative Thorium brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_decobrick_thorium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 5},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = 'xtraores:decobrick_thorium 4',
	recipe = {
		{'xtraores:brick_thorium', 'xtraores:brick_thorium'},
		{'xtraores:brick_thorium', 'xtraores:brick_thorium'},
	}
})

-- Osmium

core.register_node("xtraores:brick_osmium", {
	description = "" ..core.colorize("#68fff6", "Osmium brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_brick_osmium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 6},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:brick_osmium",
	recipe = {"xtraores:osmium_ore", "default:cobble"},
})

core.register_node("xtraores:block_osmium", {
	description = "" ..core.colorize("#68fff6", "Osmium block"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_block_osmium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 6},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

register_nine('xtraores:block_osmium', 'xtraores:osmium_ingot')

core.register_node("xtraores:decobrick_osmium", {
	description = "" ..core.colorize("#68fff6", "Decorative Osmium brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_decobrick_osmium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 6},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = 'xtraores:decobrick_osmium 4',
	recipe = {
		{'xtraores:brick_osmium', 'xtraores:brick_osmium'},
		{'xtraores:brick_osmium', 'xtraores:brick_osmium'},
	}
})

-- Rhenium

core.register_node("xtraores:brick_rhenium", {
	description = "" ..core.colorize("#68fff6", "Rhenium brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_brick_rhenium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 7},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:brick_rhenium",
	recipe = {"xtraores:rhenium_ore", "default:cobble"},
})

core.register_node("xtraores:block_rhenium", {
	description = "" ..core.colorize("#68fff6", "Rhenium block"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_block_rhenium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 7},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

register_nine('xtraores:block_rhenium', 'xtraores:rhenium_ingot')

core.register_node("xtraores:decobrick_rhenium", {
	description = "" ..core.colorize("#68fff6", "Decorative Rhenium brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_decobrick_rhenium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 7},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = 'xtraores:decobrick_rhenium 4',
	recipe = {
		{'xtraores:brick_rhenium', 'xtraores:brick_rhenium'},
		{'xtraores:brick_rhenium', 'xtraores:brick_rhenium'},
	}
})

-- Vanadium

core.register_node("xtraores:brick_vanadium", {
	description = "" ..core.colorize("#68fff6", "Vanadium brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_brick_vanadium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 8},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:brick_vanadium",
	recipe = {"xtraores:vanadium_ore", "default:cobble"},
})

core.register_node("xtraores:block_vanadium", {
	description = "" ..core.colorize("#68fff6", "Vanadium block"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_block_vanadium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 8},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

register_nine('xtraores:block_vanadium', 'xtraores:vanadium_ingot')

core.register_node("xtraores:decobrick_vanadium", {
	description = "" ..core.colorize("#68fff6", "Decorative Vanadium brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"xtraores_decobrick_vanadium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 8},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = 'xtraores:decobrick_vanadium 4',
	recipe = {
		{'xtraores:brick_vanadium', 'xtraores:brick_vanadium'},
		{'xtraores:brick_vanadium', 'xtraores:brick_vanadium'},
	}
})

-- Rarium

core.register_node("xtraores:brick_rarium", {
	description = "" ..core.colorize("#68fff6", "Rarium brick"),
	tiles = {{
		name = "xtraores_brick_rarium.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 0.66}
	}},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 9},
	light_source = 5,
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:brick_rarium",
	recipe = {"xtraores:rarium_ore", "default:cobble"},
})

core.register_node("xtraores:block_rarium", {
	description = "" ..core.colorize("#68fff6", "Rarium block"),
	tiles = {{
		name = "xtraores_block_rarium.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 0.66}
	}},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 9},
	light_source = 5,
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

register_nine('xtraores:block_rarium', 'xtraores:rarium_ingot')

core.register_node("xtraores:decobrick_rarium", {
	description = "" ..core.colorize("#68fff6", "Decorative Rarium brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {{
		name = "xtraores_decobrick_rarium.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 0.66}
	}},
	is_ground_content = false,
	light_source = 5,
	stack_max = 999,
	groups = {cracky = 9},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = 'xtraores:decobrick_rarium 4',
	recipe = {
		{'xtraores:brick_rarium', 'xtraores:brick_rarium'},
		{'xtraores:brick_rarium', 'xtraores:brick_rarium'},
	}
})

-- Orichalcum

core.register_node("xtraores:brick_orichalcum", {
	description = "" ..core.colorize("#68fff6", "Orichalcum brick"),
	tiles = {"xtraores_brick_orichalcum.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 10},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:brick_orichalcum",
	recipe = {"xtraores:orichalcum_ore", "default:cobble"},
})

core.register_node("xtraores:block_orichalcum", {
	description = "" ..core.colorize("#68fff6", "Orichalcum block"),
	tiles = {"xtraores_block_orichalcum.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 10},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

register_nine('xtraores:block_orichalcum', 'xtraores:orichalcum_ingot')

core.register_node("xtraores:decobrick_orichalcum", {
	description = "" ..core.colorize("#68fff6", "Decorative Orichalcum brick"),
	tiles = {"xtraores_decobrick_orichalcum.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 10},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = 'xtraores:decobrick_orichalcum 4',
	recipe = {
		{'xtraores:brick_orichalcum', 'xtraores:brick_orichalcum'},
		{'xtraores:brick_orichalcum', 'xtraores:brick_orichalcum'},
	}
})

-- Titanium

core.register_node("xtraores:brick_titanium", {
	description = "" ..core.colorize("#68fff6", "Titanium brick"),
	tiles = {"xtraores_brick_titanium.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 11},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:brick_titanium",
	recipe = {"xtraores:titanium_ore", "default:cobble"},
})

core.register_node("xtraores:block_titanium", {
	description = "" ..core.colorize("#68fff6", "Titanium block"),
	tiles = {"xtraores_block_titanium.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 11},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

register_nine('xtraores:block_titanium', 'xtraores:titanium_ingot')

core.register_node("xtraores:decobrick_titanium", {
	description = "" ..core.colorize("#68fff6", "Decorative Titanium brick"),
	tiles = {"xtraores_decobrick_titanium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 11},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = 'xtraores:decobrick_titanium 4',
	recipe = {
		{'xtraores:brick_titanium', 'xtraores:brick_titanium'},
		{'xtraores:brick_titanium', 'xtraores:brick_titanium'},
	}
})

-- Uranium

core.register_node("xtraores:brick_uranium", {
	description = "" ..core.colorize("#68fff6", "Uranium brick"),
	tiles = {{
		name = "xtraores_brick_uranium.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 0.75}
	}},
	paramtype2 = "facedir",
	place_param2 = 0,
	light_source = 10,
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 11},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:brick_uranium",
	recipe = {"xtraores:uranium_ore", "default:cobble"},
})

core.register_node("xtraores:block_uranium", {
	description = "" ..core.colorize("#68fff6", "Uranium block"),
	tiles = {{
		name = "xtraores_block_uranium.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 0.75}
	}},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	stack_max = 999,
	light_source = 14,
	groups = {cracky = 11},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

register_nine('xtraores:block_uranium', 'xtraores:uranium_ingot')

core.register_node("xtraores:decobrick_uranium", {
	description = "" ..core.colorize("#68fff6", "Decorative Uranium brick"),
	tiles = {{
		name = "xtraores_decobrick_uranium.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 0.75}
	}},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 11},
	light_source = 8,
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = 'xtraores:decobrick_uranium 4',
	recipe = {
		{'xtraores:brick_uranium', 'xtraores:brick_uranium'},
		{'xtraores:brick_uranium', 'xtraores:brick_uranium'},
	}
})

-- Chromium

core.register_node("xtraores:brick_chromium", {
	description = "" ..core.colorize("#68fff6", "Chromium brick"),
	tiles = {"xtraores_brick_chromium.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 12},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	type = "shapeless",
	output = "xtraores:brick_chromium",
	recipe = {"xtraores:chromium_ore", "default:cobble"},
})

core.register_node("xtraores:block_chromium", {
	description = "" ..core.colorize("#68fff6", "Chromium block"),
	tiles = {"xtraores_block_chromium.png"},
	paramtype2 = "facedir",
	place_param2 = 0,
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 12},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

register_nine('xtraores:block_chromium', 'xtraores:chromium_ingot')

core.register_node("xtraores:decobrick_chromium", {
	description = "" ..core.colorize("#68fff6", "Decorative Chromium brick"),
	tiles = {"xtraores_decobrick_chromium.png"},
	is_ground_content = false,
	stack_max = 999,
	groups = {cracky = 12},
	on_blast = function() end,
	sounds = default.node_sound_stone_defaults(),
})

core.register_craft({
	output = 'xtraores:decobrick_chromium 4',
	recipe = {
		{'xtraores:brick_chromium', 'xtraores:brick_chromium'},
		{'xtraores:brick_chromium', 'xtraores:brick_chromium'},
	}
})
