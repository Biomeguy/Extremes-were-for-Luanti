
core.register_craftitem("rangedweapons:glass_shards", {
	description = "" ..core.colorize("#35cdff","Glass shards\n")..core.colorize("#FFFFFF", "3 of those, can be crafted into a file of glass fragments"),
	inventory_image = "rangedweapons_glass_shards.png",
})

core.register_craft({
	output = "vessels:glass_fragments",
	recipe = {{"rangedweapons:glass_shards", "rangedweapons:glass_shards", "rangedweapons:glass_shards"}}
})

core.override_item("default:glass", {
	on_timer = function(pos)
		core.swap_node(pos, {name = "rangedweapons:broken_glass"})
		core.sound_play("glass_break",{pos})
	end,
})

core.register_node("rangedweapons:broken_glass", {
	description = "Broken glass",
	drawtype = "glasslike",
	tiles = {"rangedweapons_broken_glass.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	liquidtype = "source",
	liquid_alternative_flowing = "rangedweapons:broken_glass",
	liquid_alternative_source = "rangedweapons:broken_glass",
	liquid_viscosity = 7,
	liquid_range= 0,
	liquid_renewable = false,
	damage_per_second = 2,
	groups = {oddly_breakable_by_hand = 3},
})

if core.get_modpath("doors") then

core.override_item("doors:door_glass_a", {
	on_timer = function(pos)
		core.swap_node(pos, {name = "air"})
		core.add_item(pos, "vessels:glass_fragments 5")
		core.sound_play("glass_break",{pos})
	end,
})

core.override_item("doors:door_glass_b", {
	on_timer = function(pos)
		core.swap_node(pos, {name = "air"})
		core.add_item(pos, "vessels:glass_fragments 5")
		core.sound_play("glass_break",{pos})
	end,
})

end

if core.get_modpath("xpanes") then

core.override_item("xpanes:pane", {
	on_timer = function(pos)
		core.swap_node(pos, {name = "air"})
		core.add_item(pos, "rangedweapons:glass_shards")
		core.sound_play("glass_break",{pos})
	end,
})

core.override_item("xpanes:pane_flat", {
	on_timer = function(pos)
		core.swap_node(pos, {name = "air"})
		core.add_item(pos, "rangedweapons:glass_shards")
		core.sound_play("glass_break",{pos})
	end,
})

end

if core.get_modpath("vessels") then

core.override_item("vessels:glass_bottle", {
	on_timer = function(pos)
		core.swap_node(pos, {name = "air"})
		core.add_item(pos, "rangedweapons:glass_shards")
		core.sound_play("glass_break",{pos})
	end,
	walkable = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.2, 0.2, -0.1, 0.2},
		},
	},
})

core.override_item("vessels:drinking_glass", {
	on_timer = function(pos)
		core.swap_node(pos, {name = "air"})
		core.add_item(pos, "rangedweapons:glass_shards")
		core.sound_play("glass_break",{pos})
	end,
	walkable = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.2, 0.2, -0.1, 0.2},
		},
	},
})

end
