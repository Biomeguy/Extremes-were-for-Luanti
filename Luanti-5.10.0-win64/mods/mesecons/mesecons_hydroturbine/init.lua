-- HYDRO_TURBINE
-- Water turbine:
-- Active if flowing >water< above it
-- (does not work with other liquids)

local function is_flowing_water(pos)
	local name = core.get_node(pos).name
	local is_water = core.get_item_group(name, "water") > 0
	local is_flowing = core.registered_items[name].liquidtype == "flowing"
	return (is_water and is_flowing)
end

core.register_node("mesecons_hydroturbine:hydro_turbine_off", {
	description="Water Turbine",
	drawtype = "mesh",
	mesh = "jeija_hydro_turbine_off.obj",
	tiles = {
		"jeija_hydro_turbine_sides_off.png",
		"jeija_hydro_turbine_top_bottom.png",
		"jeija_hydro_turbine_turbine_top_bottom_off.png",
		"jeija_hydro_turbine_turbine_misc_off.png"
	},
	inventory_image = "jeija_hydro_turbine_inv.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	is_ground_content = false,
	wield_scale = {x=0.75, y=0.75, z=0.75},
	groups = {dig_immediate=2},
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 },
	},
	sounds = default.node_sound_metal_defaults(),
	on_construct = function(pos)
		core.get_node_timer(pos):start(.2)
	end,
	on_timer = function(pos, elapsed)
		if is_flowing_water({x=pos.x, y=pos.y+1, z=pos.z}) then
			core.set_node(pos, {name = "mesecons_hydroturbine:hydro_turbine_on"})
			mesecon.receptor_on(pos)
		end
		core.get_node_timer(pos):start(.2)
	end,
	mesecons = {receptor = {
		state = mesecon.state.off
	}},
	on_blast = mesecon.on_blastnode,
})

core.register_node("mesecons_hydroturbine:hydro_turbine_on", {
	description="Water Turbine",
	drawtype = "mesh",
	is_ground_content = false,
	mesh = "jeija_hydro_turbine_on.obj",
	wield_scale = {x=0.75, y=0.75, z=0.75},
	tiles = {
		"jeija_hydro_turbine_sides_on.png",
		"jeija_hydro_turbine_top_bottom.png",
		{ name = "jeija_hydro_turbine_turbine_top_bottom_on.png",
		    animation = {type = "vertical_frames", aspect_w = 128, aspect_h = 16, length = 1.6} },
		{ name = "jeija_hydro_turbine_turbine_misc_on.png",
		    animation = {type = "vertical_frames", aspect_w = 256, aspect_h = 32, length = 0.4} }
	},
	inventory_image = "jeija_hydro_turbine_inv.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	drop = "mesecons_hydroturbine:hydro_turbine_off",
	groups = {dig_immediate=2,not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 },
	},
	sounds = default.node_sound_metal_defaults(),
	on_construct = function(pos)
		core.get_node_timer(pos):start(.2)
	end,
	on_timer = function(pos, elapsed)
		if not is_flowing_water({x=pos.x, y=pos.y+1, z=pos.z}) then
			core.set_node(pos, {name = "mesecons_hydroturbine:hydro_turbine_off"})
			mesecon.receptor_off(pos)
		end
		core.get_node_timer(pos):start(.2)
	end,
	mesecons = {receptor = {
		state = mesecon.state.on
	}},
	on_blast = mesecon.on_blastnode,
})

core.register_craft({
	output = "mesecons_hydroturbine:hydro_turbine_off 2",
	recipe = {
		{"","default:stick", ""},
		{"default:stick", "default:steel_ingot", "default:stick"},
		{"","default:stick", ""}
	}
})

