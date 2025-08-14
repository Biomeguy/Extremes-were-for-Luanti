
-- Materials

core.register_node("nssm:mantis_clay", {
	description = "Mantis Clay",
	tiles = {"mantis_clay.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("nssm:hardened_mantis_clay", {
	description = "Hardened Mantis Clay",
	tiles = {"hard_mantis_clay.png"},
	is_ground_content = false,
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("nssm:ant_stone", {
	description = "Ant Stone",
	tiles = {"ant_stone.png"},
	is_ground_content = false,
	groups = {cracky=1, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("nssm:ant_dirt", {
	description = "Ant Dirt",
	tiles = {"ant_dirt.png"},
	groups = {crumbly=3},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("nssm:mixed_dirt", {
	description = "Mixed Dirt",
	tiles = {"mixed_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("nssm:vine", {
	description = "Vine",
	drawtype = "signlike",
	tiles = {"climbing_plant.png"},
	inventory_image = "climbing_plant.png",
	wield_image = "climbing_plant.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	is_ground_content = false,
	legacy_wallmounted = true,
	selection_box = {type = "wallmounted"},
	groups = {snappy = 3, flammable = 3},
	sounds = default.node_sound_leaves_defaults()
})

core.register_node("nssm:dead_leaves", {
	description = "Dead leaves",
	drawtype = "allfaces_optional",
	tiles = {"dead_leaves.png"},
	paramtype = "light",
	groups = {snappy=3, leaves=1, flammable=3},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("nssm:dead_dirt", {
	description = "Dead Dirt",
	tiles = {"dead_dirt.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {"nssm:dead_dirt", "default:rock"}, rarity = 30},
			{items = {"nssm:dead_dirt"}}
		}
	},
	groups = {crumbly=2, oddly_breakable_by_hand=2},
	sounds = default.node_sound_sand_defaults(),
})

core.register_node("nssm:venomous_gas", {
	description = "Venomous Gas",
	drawtype = "airlike",
	inventory_image = "venomous_gas.png",
	wield_image = "venomous_gas.png",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	sunlight_propagates = true,
	drop = "",
	drowning = 1,
	damage_per_second = 1,
	post_effect_color = {a=100, r=1, g=70, b=1},
	groups = {flammable = 2},
})

core.register_node("nssm:web", {
	description = "Web",
    drawtype = "plantlike",
	tiles = {"web.png"},
	inventory_image = "web.png",
	paramtype = "light",
	walkable = false,
	drop = "",
	drowning = 0,
	liquid_renewable = false,
	liquidtype = "source",
	liquid_range= 0,
	liquid_alternative_flowing = "nssm:web",
	liquid_alternative_source = "nssm:web",
	liquid_viscosity = 20,
	groups = {flammable=2, snappy=1, liquid=1},
})

core.register_node("nssm:vertical_web", {
	description = "Vertical Web",
    drawtype = "plantlike",
	tiles = {"vertical_web.png"},
	inventory_image = "vertical_web.png",
	paramtype = "light",
	walkable = false,
	drop = "nssm:web_string",
	drowning = 0,
	liquid_renewable = false,
	liquidtype = "source",
	liquid_range= 0,
	liquid_alternative_flowing = "nssm:vertical_web",
	liquid_alternative_source = "nssm:vertical_web",
	liquid_viscosity = 20,
	groups = {flammable=2, snappy=1, liquid=1},
})

core.register_node("nssm:web_cone", {
	description = "Web Cone",
    drawtype = "plantlike",
	tiles = {"web_cone.png"},
	inventory_image = "web_cone.png",
	paramtype = "light",
	walkable = false,
	drop = "nssm:web_string",
	drowning = 0,
	liquid_renewable = false,
	liquidtype = "source",
	liquid_range= 0,
	liquid_alternative_flowing = "nssm:web_cone",
	liquid_alternative_source = "nssm:web_cone",
	liquid_viscosity = 20,
	groups = {flammable=2, snappy=1, liquid=1},
})

core.register_node("nssm:web_cocoon", {
	description = "Web Cocoon",
	tiles = {"web_cocoon.png"},
	drop = {
		max_items = 1,
		items = {
	{items = {"nssm:spider_leg 2"},				rarity = 4},
	{items = {"nssm:web"},						rarity = 4},
	{items = {"nssm:ant_sword"},				rarity = 20},
	{items = {"nssm:sun_sword"},				rarity = 100},
	{items = {"nssm:night_sword"},				rarity = 100},
	{items = {"nssm:rainbow_staff"},			rarity = 114},
	{items = {"default:sword_wood"},			rarity = 14},
	{items = {"default:sword_steel"},			rarity = 20},
	{items = {"default:sword_mese"},			rarity = 20},
	{items = {"default:axe_bronze"},			rarity = 20},
	{items = {"nssm:mantis_claw"},				rarity = 20},
	{items = {"default:axe_mese"},				rarity = 20},
	{items = {"nssm:mantis_sword"},				rarity = 20},
	{items = {"default:axe_steel"},				rarity = 20},
	{items = {"nssm:crab_light_mace"},			rarity = 20},
	{items = {"nssm:masticone_fang_sword"},		rarity = 20}
		}
	},
	is_ground_content = false,
	groups = {snappy= 1, level= 2, flammable= 2},
})

core.register_node("nssm:thick_web", {
	description = "Thick Web",
    drawtype = "firelike",
	tiles = {"thick_web.png"},
	inventory_image = "thick_web.png",
	paramtype = "light",
	walkable = false,
	drop = "",
	drowning = 2,
	liquid_renewable = false,
	liquidtype = "source",
	liquid_range = 0,
	liquid_alternative_flowing = "nssm:thick_web",
	liquid_alternative_source = "nssm:thick_web",
	liquid_viscosity = 28,
	groups = {snappy=1, level= 2, flammable=2, liquid=1},
})

core.register_node("nssm:morentir", {
	description = "Dark Stone",
	tiles = {"morentir.png"},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_craftitem("nssm:morelentir_dust", {
	description = "Dark Starred Stone Dust",
	inventory_image = "morelentir_dust.png",
	light_source = 9,
	on_place = function(item, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					item, pointd)
			end
		end

		local pos = pointd.above
	if core.get_node(pos).name ~= "air" then	return item end
		local pname = placer:get_player_name()

		if not core.is_protected(pos, pname) then
	local wdir = math.random(0, 3)
	if pos.z == pointd.under.z+1 then
		wdir = math.random(4, 7)
	elseif pos.z == pointd.under.z-1 then
		wdir = math.random(8, 11)
	elseif pos.x == pointd.under.x+1 then
		wdir = math.random(12, 15)
	elseif pos.x == pointd.under.x-1 then
		wdir = math.random(16, 19)
	elseif pos.y == pointd.under.y-1 then
		wdir = wdir+20
	end

	core.set_node(pos, {name = "nssm:vortex", param2 = wdir})
	core.sound_play("default_sand_footstep", {pos = pos, gain = .04}, true)
	core.add_particlespawner({
		amount = 77,
		time = .1,
		minpos = vector.subtract(pos, .5),
		maxpos = vector.add(pos, .5),
		minvel = {x=-.3, y=-.3, z=-.3},
		maxvel = {x=.3, y=.3, z=.3},
		exptime = {min = 1, max = 1.2},
		minsize = 1,
		maxsize = 1.7,
		texture = "morparticle.png"})
	if not core.is_creative_enabled(pname) then
		item:take_item()
	end
		else
			core.chat_send_player(pname, "Node is protected")
			core.record_protection_violation(pos, pname)
		end

		return item
	end
})

core.register_node("nssm:morelentir", {
	description = "Dark Starred Stone",
	tiles = {{
		name = "morelentir_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 6},
	}},
	inventory_image = core.inventorycube("morelentir.png"),
	light_source = 10,
	drop = "nssm:morelentir_dust 4",
	is_ground_content = false,
	groups = {cracky = 1, xn = 1},
	sounds = default.node_sound_stone_defaults(),
	after_destruct = function(pos, oldnode)
		core.add_entity(pos, "extra_energy:orb")
	end
})

core.register_node("nssm:vortex", {
	description = "Vortex Dust",
	drawtype = "nodebox",
	tiles = {{
		name = "Maelstrom_vortex_animated.png",--	Slightly violet due to its energy
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1},
	}},
	inventory_image = "morelentir_dust.png",
	wield_image = "morelentir_dust.png",
	paramtype = "light",
	paramtype2 = "facedir",
	node_placement_prediction = "",
	stack_max = 1,
	light_source = default.LIGHT_MAX,
	sunlight_propagates = true,
	is_ground_content = false,
	on_timer = function(pos, elapsed)
for _, obj in ipairs(core.get_objects_inside_radius(pos, .8)) do
	local meta = core.get_meta(pos)
	local target = meta:get_string("desti")
	if obj:is_player() and target ~= "" then
		core.remove_node(pos)
	core.add_particlespawner({
		amount = 77,
		time = .1,
		minpos = vector.subtract(pos, .5),
		maxpos = vector.add(pos, .5),
		minvel = {x=-.3, y=-.3, z=-.3},
		maxvel = {x=.3, y=.3, z=.3},
		exptime = {min = 1, max = 1.2},
		minsize = 1,
		maxsize = 1.5,
		texture = "morparticle.png"})
		obj:set_pos(core.string_to_pos(target))
	end
end
	return true
	end,
	drop = "nssm:morelentir_dust",
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.47, .5}
	},
	on_place = function(item, placer, pointd)
		-- Call on_rightclick if the pointed node defines it
		if pointd.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = core.get_node(pointd.under)
			local def_ptu = core.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointd.under, node_ptu, placer,
					item, pointd)
			end
		end

		local pos = pointd.above
	if core.get_node(pos).name ~= "air" then	return item end
		local pname = placer:get_player_name()

		if not core.is_protected(pos, pname) then
	local wdir = math.random(0, 3)
	if pos.z == pointd.under.z+1 then
		wdir = math.random(4, 7)
	elseif pos.z == pointd.under.z-1 then
		wdir = math.random(8, 11)
	elseif pos.x == pointd.under.x+1 then
		wdir = math.random(12, 15)
	elseif pos.x == pointd.under.x-1 then
		wdir = math.random(16, 19)
	elseif pos.y == pointd.under.y-1 then
		wdir = wdir+20
	end

	core.set_node(pos, {name = "nssm:vortex", param2 = wdir})
	local meta = core.get_meta(pos)
	local item_meta = item:get_meta()
	if item_meta:get_string("desti") ~= "" then
		meta:set_string("desti", item_meta:get_string("desti"))
		core.get_node_timer(pos):start(1)
	end
	core.sound_play("default_sand_footstep", {pos = pos, gain = .04}, true)
	core.add_particlespawner({
		amount = 77,
		time = .1,
		minpos = vector.subtract(pos, .5),
		maxpos = vector.add(pos, .5),
		minvel = {x=-.3, y=-.3, z=-.3},
		maxvel = {x=.3, y=.3, z=.3},
		exptime = {min = 1, max = 1.2},
		minsize = 1,
		maxsize = 1.7,
		texture = "morparticle.png"})
	if not core.is_creative_enabled(pname) then
		item:take_item()
	end
		else
			core.chat_send_player(pname, "Node is protected")
			core.record_protection_violation(pos, pname)
		end

		return item
	end,
	groups = {dig_immediate = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_sand_footstep", gain = .05},
	}),
})

core.register_node("nssm:morkemen", {
	description = "Dark Dirt",
	tiles = {"morkemen.png"},
	groups = {crumbly = 1},
	sounds = default.node_sound_dirt_defaults(),
})

core.register_node("nssm:mornar", {
	description = "Black Flame",
	drawtype = "firelike",
	tiles = {{
		name = "mornar_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1},
	}},
	inventory_image = "mornar.png",
	paramtype = "light",
	light_source = 12,
	drop = "",
	walkable = false,
	sunlight_propagates = true,
	damage_per_second = 4,
	is_ground_content = false,
	groups = {igniter = 2, fire = 1},
	on_punch = function(pos, node, user)
		local wielded = user:get_wielded_item()

		if wielded:get_count() == 0 then
			user:set_hp(user:get_hp() - 2)
		end
	end,
})

core.register_node("nssm:morlote", {
	description = "Morlote",
	drawtype = "plantlike",
	tiles = {"morlote.png"},
	inventory_image = "morlote.png",
	wield_image = "morlote.png",
	paramtype = "light",
	light_source = default.LIGHT_MAX,
	walkable = false,
	sunlight_propagates = true,
	groups = {snappy = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, -5/16, .2}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(60)
	end,
	on_timer = function(pos)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local n = core.get_node(above).name
		if n == "air" and math.random(1, 100) == 1 and core.get_modpath("mobs") then
	core.remove_node(pos)
	core.add_entity(above, "nssm:morgre")
		elseif math.random(1, 3) == 1 then
	local spread = true
	if core.find_node_near(pos, 2, "ignore") then
		spread = false
	end
	pos.y = pos.y - 1
	local under_name = core.get_node(pos).name
	pos.y = pos.y + 1
	if under_name ~= "nssm:morkemen" and core.get_item_group(under_name, "soil") == 0 then
		spread = false
	end

	local pos0 = vector.subtract(pos, 4)
	local pos1 = vector.add(pos, 4)
	if #core.find_nodes_in_area(pos0, pos1, "nssm:morlote") > 4 then
		spread = false
	end

	local soils = core.find_nodes_in_area_under_air(pos0, pos1, {"nssm:morkemen", "group:soil"})
	local num_soils = #soils
	if num_soils >= 1 and spread then
		for si = 1, math.min(3, num_soils) do
			local soil = soils[math.random(num_soils)]
			local soil_above = {x = soil.x, y = soil.y + 1, z = soil.z}
			core.set_node(soil_above, {name = "nssm:morlote"})
			core.get_node_timer(soil_above):start(60)
		end
	end
		end
		core.get_node_timer(pos):start(60)
	end,
})

core.register_node("nssm:morwa_statue", {
	description = "Morwa Statue",
	drawtype = "mesh",
	mesh = "morwa_statue.b3d",
	tiles = {"morwa_statue.png"},
	inventory_image = "morwa_statue.png",
	groups = {not_in_creative_inventory=1},
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed", fixed = {-1, -.5, -1, 1, 3, 1}
	},
	collision_box = {
		type = "fixed", fixed = {-1, -.5, -1, 1, 3, 1}
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(1)
	end,
	on_timer = function(pos)-- Conversion between statue and entity, caused by light
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local n = core.get_node(above).name
		if n == "air" and core.get_node_light(above) > 8 and core.get_modpath("mobs") then
	core.remove_node(pos)
	core.add_entity(pos, "nssm:morwa")
		end
		core.get_node_timer(pos):start(1)
	end,
})

core.register_node("nssm:moranga", {
	description = "Moranga Ore",
	tiles = {"morentir.png^moranga.png"},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("nssm:extra_energy_ore", {
	description = "Extra Energy Ore",
	tiles = {"morentir.png^extra_energy_ore.png"},
	light_source = 4,
	drop = "extra_energy:globe",
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("nssm:mornen", {
	description = "Dark Water",
	drawtype = "liquid",
	tiles = {{
		name = "mornen_animated.png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.},
		},
		{
		name = "mornen_animated.png",
		backface_culling = true,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.},
	}},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	light_source = default.LIGHT_MAX,
	drowning = 1,
	damage_per_second = 2,
	liquidtype = "source",
	liquid_alternative_flowing = "nssm:mornen_flowing",
	liquid_alternative_source = "nssm:mornen",
	liquid_viscosity = 6,
	liquid_range = 4,
	post_effect_color = {a=98, r=22, g=44, b=72},
	groups = {lava = 3, liquid = 3},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1, 2))
	end,
	on_timer = function(pos)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local n = core.get_node(above).name
		local ndef = core.registered_nodes[n]

		if n ~= "ignore" and ndef and ((ndef.sunlight_propagates or
ndef.paramtype == "light") and ndef.liquidtype == "none") and math.random(1, 5) == 1 then
	core.add_particlespawner({
		amount = 1,
		time = 2,
		minpos = {x=pos.x-.5, y=pos.y+.5, z=pos.z-.5},
		maxpos = vector.add(pos, .5),
		minvel = {x=0, y=.1, z=0},
		maxvel = {x=0, y=.3, z=0},
		exptime = {min = 1, max = 1.2},
		minsize = .7,
		maxsize = 1,
		texture = "morparticle.png"})
		end
		core.get_node_timer(pos):start(math.random(1, 2))
	end,
})

core.register_node("nssm:mornen_flowing", {
	description = "Flowing Dark Water",
	drawtype = "flowingliquid",
	tiles = {"mornen.png"},
	special_tiles = {{
		name = "mornen_animated.png",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.},
		},
		{
		name = "mornen_animated.png",
		backface_culling = true,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.},
	}},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = 10,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "nssm:mornen_flowing",
	liquid_alternative_source = "nssm:mornen",
	liquid_viscosity = 6,
	damage_per_second = 2,
	liquid_range = 4,
	post_effect_color = {a=98, r=22, g=44, b=72},
	groups = {lava = 3, liquid = 3, not_in_creative_inventory = 1},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1, 2))
	end,
	on_timer = function(pos)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local n = core.get_node(above).name
		local ndef = core.registered_nodes[n]

		if n ~= "ignore" and ndef and ((ndef.sunlight_propagates or
ndef.paramtype == "light") and ndef.liquidtype == "none") and math.random(1, 5) == 1 then
	local p2 = core.get_node(pos).param2
	local by = 10
	if p2 > 10 then
		by = 30
	end
	core.add_particlespawner({
		amount = 1,
		time = 2,
		minpos = {x=pos.x-.5, y=pos.y-.5+(p2/by), z=pos.z-.5},
		maxpos = {x=pos.x+.5, y=pos.y-.4+(p2/by), z=pos.z+.5},
		minvel = {x=0, y=.1, z=0},
		maxvel = {x=0, y=.3, z=0},
		exptime = {min = 2, max = 2.4},
		minsize = .7,
		maxsize = 1,
		texture = "morparticle.png"})
		end
		core.get_node_timer(pos):start(math.random(1, 2))
	end,
})

core.register_node("nssm:morlamp", {
	description = "Morlamp",
	tiles = {"morlamp.png"},
	light_source = default.LIGHT_MAX,
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_glass_defaults(),
})

core.register_node("nssm:morportal", {
	description = "Morlendor Portal",
	drawtype = "liquid",
	tiles = {{
		name = "default_water_source_animated.png^[colorize:#009035af",
		backface_culling = false,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.},
		},
		{
		name = "default_water_source_animated.png^[colorize:#009035af",
		backface_culling = true,
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.},
	}},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	light_source = default.LIGHT_MAX,
	liquid_range = 0,
	drowning = 1,
	liquid_renewable = false,
	liquidtype = "source",
	liquid_alternative_flowing = "nssm:morportal",
	liquid_alternative_source = "nssm:morportal",
	liquid_viscosity = 2,
	post_effect_color = {a=180, r=0, g=80, b=57},
	on_timer = function(pos, elapsed)
for _, obj in ipairs(core.get_objects_inside_radius(pos, .8)) do
	local meta = core.get_meta(pos)
	meta:set_int("delay", meta:get_int("delay")+1)
	if obj:is_player() and meta:get_int("delay") > 3 then
	meta:set_int("delay", 0)
if pos.y > -30750 then
		local posd = {x= pos.x, y= -30795, z= pos.z}
		obj:set_pos(posd)
		core.emerge_area(vector.subtract(posd, 4), vector.add(posd, 4))
		core.get_node_timer(posd):start(6)
	core.after(.5, function()
		local meta = core.get_meta(posd)
core.place_schematic({x= posd.x -1, y= posd.y -1, z= posd.z -1}, morportal)
		meta:set_int("sent_from", pos.y)
		meta:set_string("from_surface", "true")
	end, pos)
else
		local target = meta:get_int("sent_from")
		if meta:get_string("from_surface") == "true" then
	local posu = {x= pos.x, y= target, z= pos.z}
	obj:set_pos(posu)
	core.emerge_area(vector.subtract(posu, 4), vector.add(posu, 4))
	core.get_node_timer(posu):start(6)
		else
	core.remove_node(pos)
		end
end
	end
end
core.add_particlespawner({
	amount = 6,
	time = 3,
	minpos = {x=pos.x-.5, y=pos.y+.5, z=pos.z-.5},
	maxpos = vector.add(pos, .5),
	minvel = {x=0, y=.1, z=0},
	maxvel = {x=0, y=.8, z=0},
	minacc = {x=0,y=0,z=0},
	maxacc = {x=0,y=.4,z=0},
	exptime = {min = 1, max = 3},
	minsize = .5,
	maxsize = 1.4,
	texture = "earth_particle.png",
})
core.get_node_timer(pos):start(3)
	end,
	groups = {liquid = 3, attached_node = 1, not_in_creative_inventory = 1},
	on_blast = function() end,
})

core.register_lbm({
	name = "nssm:activate_morlendor_node_timers",
	nodenames = {"nssm:morportal", "nssm:morwa_statue", "nssm:morlote", "nssm:mornen", "nssm:mornen_flowing", "nssm:vortex"},
	run_at_every_load = true,
	action = function(pos)
		if not core.get_node_timer(pos):is_started() then
			core.get_node_timer(pos):start(5)
		end
	end
})

core.override_item("extra_energy:great_globe", {dropped_step = function(self, pos, dtime)
	self.ctimer = (self.ctimer or 0) + dtime
	if self.ctimer < 5. then return end
	self.ctimer = 0

	if self.node_inside and self.node_inside.name ~= "default:fresh_water_source" then
		return
	end

	local objs = core.get_objects_inside_radius(pos, .8)

	if not objs or #objs ~= 2 then return end

	local gre_glo, aspen_leaf, ent = nil, nil, nil

	for k, obj in pairs(objs) do

		ent = obj:get_luaentity()

		if ent and ent.name == "__builtin:item" then

			if ent.itemstring == "default:aspen_leaves" and not aspen_leaf then

				aspen_leaf = obj

			elseif ent.itemstring == "extra_energy:great_globe" and not gre_glo then

				gre_glo = obj
			end
		end
	end

	if pos.y > -30750 and aspen_leaf and gre_glo and #core.find_nodes_in_area({x= pos.x+ 1, y= pos.y, z= pos.z+ 1},
		{x= pos.x- 1, y= pos.y- 1, z= pos.z- 1}, {"default:mossystone_brick"}) > 4 then

		aspen_leaf:remove()
		gre_glo:remove()

	core.set_node(pos, {name = "nssm:morportal"})
	core.get_node_timer(pos):start(2)

		return false
	end
end})

core.override_item("default:bulrush_1", {on_drop = function(item, dropper, pos)
	if dropper:get_player_control().aux1 then
		return core.item_drop(item, dropper, pos)
	end
	if dropper and dropper:is_player() then
	if dropper:get_meta():get_string("_infinite_energy") ~= "true" then
local extra_energy = tonumber(dropper:get_meta():get_int("_extra_energy"))
if extra_energy >= 5 then
	dropper:get_meta():set_int("_extra_energy", extra_energy - 5)
else
	return core.item_drop(item, dropper, pos)
end
	end
	item:take_item()	pos.y = pos.y + 1.2
	local obj = core.add_item(pos, "nssm:energy_pearl")	pos.y = pos.y - .5
	local obj2 = core.add_item(pos, "farming:spent_biomasse")
	if obj and obj2 then
		local dir = dropper:get_look_dir()
		dir.x = dir.x * 2.9
		dir.y = dir.y * 2.9 + 2
		dir.z = dir.z * 2.9
		obj:set_velocity(dir)
		obj:get_luaentity().dropped_by = dropper:get_player_name()
		obj2:get_luaentity().dropped_by = dropper:get_player_name()
		return item
	end
	end
end})

core.register_node("nssm:indistructible_morentir", {
	description = "Dark Indistructible Stone",
	tiles = {"morentir.png"},
	is_ground_content = false,
	on_blast = function() end,
	--groups = {oddly_breakable_by_hand = 2},
	sounds = default.node_sound_stone_defaults(),
})

core.register_node("nssm:phoenix_fire", {
	description = "Phoenix Fire",
	drawtype = "firelike",
	tiles = {{
		name = "phoenix_fire_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1},
	}},
	inventory_image = "phoenix_fire.png",
	paramtype = "light",
	light_source = 14,
	walkable = false,
	sunlight_propagates = true,
	drop = "",
	damage_per_second = 4,
	groups = {crumbly=1, igniter = 3, fire = 1},
	on_punch = function(pos, node, user)
		local wielded = user:get_wielded_item()

		if wielded:get_count() == 0 then
			user:set_hp(user:get_hp() - 3)
		end
	end,
	sounds = default.node_sound_defaults({
		dig = {name = "", gain = 1.},
		dug = {name = "", gain = 1.},
		place = {name = "", gain = 1.},
	}),
})


-- Egg blocks
local function nssm_register_eggs(
name, -- name of the mobs and the eggs
descr, -- Description of the mob and eggs
int, -- time interval between each birth
wide, -- the radius in which mobs are generated
troppi, -- maximun number of mobs spawned
neigh) -- block that needs to be near for spawning the mobs

core.register_node("nssm:".. name .."_eggs", {
	description = descr .." Eggs",
	tiles = {name .."_eggs.png"},
	light_source = 5,
	is_ground_content = false,
	groups = {choppy=1, timer_check=1},
	on_construct = function(pos)
		core.get_node_timer(pos):start(int)
	end,
	on_timer = function(pos)
		neigh = neigh or "air"
		if core.find_node_near(pos, 1, neigh) and core.get_modpath("mobs") then
	local hpos = {x=pos.x+math.random(-wide,wide), y=pos.y+.5, z=pos.z+math.random(-wide,wide)}
	local n = core.get_node(hpos).name

	if n ~= "air" and n ~= "default:water_source" then
		core.get_node_timer(pos):start(math.random(int/2, int))
		return
	end
	local count = 0
	if name == "mantis" and math.random(3) == 3 then name = "mantis_beast" else name = "mantis" end

	local objects = core.get_objects_inside_radius(pos, 12)
	for _,obj in ipairs(objects) do
		if obj:get_luaentity() and obj:get_luaentity().name == "nssm:".. name then
		count = count +1
		--core.chat_send_all("Count: "..count)
		end
	end

	local t = core.get_timeofday()
	--core.chat_send_all("Time of day: "..t)
	if (t>=.75 and t<=1) or (t>=0 and t<=.25) then
		if count < troppi then
			core.add_entity(hpos, "nssm:" .. name)
		end
	end
		end
		core.get_node_timer(pos):start(math.random(int/2, int))
	end,
})
end

nssm_register_eggs("ant_worker", "Ant Worker", 16, 2, 4)
nssm_register_eggs("ant_soldier", "Ant Soldier", 16, 2, 4)
nssm_register_eggs("mantis", "Mantis", 16, 2, 4)
nssm_register_eggs("crab", "Crab", 18, 2, 4, "default:sand")
nssm_register_eggs("black_widow", "Black Widow", 18, 2, 4)
nssm_register_eggs("uloboros", "Uloboros", 18, 2, 4)
nssm_register_eggs("daddy_long_legs", "Daddy Long Legs", 18, 2, 4)
nssm_register_eggs("xgaloctopus", "Xgaloctopus", 18, 2, 4, "default:water_source")

nssm_register_eggs("tarantula", "Tarantula", 900, 2, 1)
nssm_register_eggs("ant_queen", "Ant Queen", 900, 6, 1)

core.register_node("nssm:morvalar_block", {
	description = "Morvalar Block",
	tiles = {"morvalar_block.png"},
	light_source = 13,
	on_construct = function(pos)
		core.get_node_timer(pos):start(.5)
	end,
	on_timer = function(pos)
		if core.find_node_near(pos, 1, "nssm:indistructible_morentir") and core.get_modpath("mobs") then
			core.remove_node(pos)
			core.add_entity(pos, "nssm:morvalar")
		else
			core.get_node_timer(pos):start(.5)
		end
	end,
})

core.register_node("nssm:dis_morvalar_block", {
	description = "Disactivated Morvalar Block",
	tiles = {"dis_morvalar_block.png"},
	on_punch = function(pos, node, puncher)
if core.get_modpath("mobs") then
		if puncher:get_wielded_item():get_name() == "extra_energy:superior_globe" then
			core.set_node(pos, {name="nssm:morvalar_block"})
			core.get_node_timer(pos):start(.5)
		end
end
	end,
})

-- Place arena in Morlendor
local arena_pos = {x=777, y=-30796, z=-777}-- respawns on each login like the portal
if arena_pos then
	if not core.get_node_or_nil(arena_pos) then
		core.emerge_area(vector.subtract(arena_pos, 50), vector.add(arena_pos, 50))
	end

	core.after(5, function()
		core.place_schematic({x=728, y=-30796, z=-826}, nssm_arena)
	end)
end

-- Non-eatable craftitems
local function nssm_rnei(name, descr)

core.register_craftitem("nssm:" ..name, {
	description = descr,
	inventory_image = name.. ".png"
})
end

nssm_rnei("snake_scute", "Snake Scute")
nssm_rnei("night_feather", "Night Feather")
nssm_rnei("ant_queen_abdomen", "Ant Queen Abdomen")
nssm_rnei("masticone_skull_fragments", "Masticone Skull Fragments")
nssm_rnei("masticone_fang", "Masticone Fang")
nssm_rnei("lava_titan_eye", "Lava Titan Eye")
nssm_rnei("digested_sand", "Digested Sand")
nssm_rnei("tarantula_chelicerae", "Tarantula Chelicerae")
nssm_rnei("crab_chela", "Crab Chela")
nssm_rnei("mantis_claw", "Mantis Claw")
nssm_rnei("ant_hard_skin", "Ant Hard Skin")
nssm_rnei("crab_carapace_fragment", "Crab Carapace Fragment")
nssm_rnei("crocodile_skin", "Crocodile Skin")
nssm_rnei("ant_mandible", "Ant Mandible")
nssm_rnei("greedy_soul_fragment", "Greedy Soul Fragment")
nssm_rnei("lustful_soul_fragment", "Lustful Soul Fragment")
nssm_rnei("wrathful_soul_fragment", "Wrathful Soul Fragment")
nssm_rnei("proud_soul_fragment", "Proud Soul Fragment")
nssm_rnei("slothful_soul_fragment", "Slothful Soul Fragment")
nssm_rnei("envious_soul_fragment", "Envious Soul Fragment")
nssm_rnei("gluttonous_soul_fragment", "Gluttonous Soul Fragment")
nssm_rnei("moranga_ingot", "Moranga Ingot")
nssm_rnei("gluttonous_moranga", "Gluttonous Moranga")
nssm_rnei("envious_moranga", "Envious Moranga")
nssm_rnei("proud_moranga", "Proud Moranga")
nssm_rnei("slothful_moranga", "Slothful Moranga")
nssm_rnei("lustful_moranga", "Lustful Moranga")
nssm_rnei("wrathful_moranga", "Wrathful Moranga")
nssm_rnei("greedy_moranga", "Greedy Moranga")
nssm_rnei("mantis_skin", "Mantis Skin")
nssm_rnei("sandworm_skin", "Sandworm Skin")
nssm_rnei("sky_iron", "Sky Iron")
nssm_rnei("web_string", "Cobweb String")
nssm_rnei("dense_web_string", "Dense Cobweb String")
nssm_rnei("black_powder", "Black Powder")
nssm_rnei("empty_evocation_bomb", "Empty Evocation Bomb")

core.register_craftitem("nssm:sky_feather", {
	description = "Sky Feather",
	inventory_image = "sky_feather.png",
	light_source = 7
})

core.register_craftitem("nssm:sun_feather", {
	description = "Sun Feather",
	inventory_image = "sun_feather.png",
	light_source = default.LIGHT_MAX
})

core.register_craftitem("nssm:energy_pearl", {
	description = "Energy Pearl",
	inventory_image = "energy_pearl.png",
	light_source = default.LIGHT_MAX,
	dropped_step = function(self, pos, dtime)
		local objs = core.get_objects_inside_radius(pos, .8)
		if not objs or #objs >= 4 then return end

		local ent = nil
		for _, obj in pairs(objs) do
	ent = obj:get_luaentity()
	if ent and ent.name == "__builtin:item" then
		local ent_stack = ItemStack(ent.itemstring)
		if ent_stack:get_name() == "nssm:morelentir_dust" then
	local vor_p = obj:get_pos()
	local vor = core.add_item(vor_p, "nssm:vortex")
	if vor then
		local vor_stack = ItemStack(vor:get_luaentity().itemstring)
		vor_stack:get_meta():set_string("desti", core.pos_to_string(vector.round(vor_p)))
		vor:get_luaentity():set_item(vor_stack:to_string())
	core.add_particlespawner({
		amount = 77,
		time = .1,
		minpos = {x=vor_p.x-.3, y=vor_p.y-.3, z=vor_p.z-.3},
		maxpos = {x=vor_p.x+.3, y=vor_p.y+.3, z=vor_p.z+.3},
		minvel = {x=-.3, y=-.3, z=-.3},
		maxvel = {x=.3, y=.3, z=.3},
		exptime = {min = 1, max = 1.2},
		minsize = .7,
		maxsize = 1,
		texture = "morparticle.png",
		glow = 9 })
	end
	if ent_stack:get_count() == 1 then
		obj:remove()
	else
		ent.age = 0 -- Handle as new entity
		ent_stack:set_count(ent_stack:get_count()-1)
		ent:set_item(ent_stack)
	end

	local own_stack = ItemStack(self.itemstring)
	if own_stack:get_count() == 1 then
		self.object:remove()
		return false
	else
		self.age = 0 -- Handle as new entity
		own_stack:set_count(own_stack:get_count()-1)
		self:set_item(own_stack)
	end
		end
	end
		end
	end
})

local function nssm_rei(name, descr, gnam)

core.register_craftitem("nssm:" ..name, {
	description = descr,
	inventory_image = name.. ".png",
	on_use = core.item_eat(gnam),
	groups = {meat=1, eatable=1},
})
end

nssm_rei("ant_leg", "Ant Leg", -1)
nssm_rei("roasted_ant_leg", "Roasted Ant Leg", 4)
nssm_rei("frosted_crocodile_heart", "Frosted Crocodile Heart", -1)
nssm_rei("crocodile_heart", "Crocodile Heart", 1)
nssm_rei("roasted_crocodile_heart", "Roasted Crocodile Heart", 8)
nssm_rei("crocodile_ribs", "Crocodile Ribs", 2)
nssm_rei("roasted_crocodile_ribs", "Roasted Crocodile Ribs", 6)
nssm_rei("crocodile_tail", "Crocodile Tail", 3)
nssm_rei("roasted_crocodile_tail", "Roasted Crocodile Tail", 6)
nssm_rei("spider_leg", "Spider Leg", -1)
nssm_rei("roasted_spider_leg", "Roasted Spider Leg", 4)
nssm_rei("tentacle", "Tentacle", 2)
nssm_rei("roasted_tentacle", "Roasted Tentacle", 5)
nssm_rei("tentacle_curly", "Curly Tentacle", 3)
nssm_rei("roasted_tentacle_curly", "Roasted Curly Tentacle", 7)
nssm_rei("worm_flesh", "Worm Flesh", -2)
nssm_rei("roasted_worm_flesh", "Roasted Worm Flesh", 4)
nssm_rei("surimantis_nuggets", "Surimantis Nuggets", 20)
nssm_rei("surimi", "Surimi", 4)
nssm_rei("mantis_meat", "Mantis Meat", 1)
nssm_rei("roasted_mantis_meat", "Roasted Mantis Meat", 4)
nssm_rei("spider_meat", "Spider Meat", -1)
nssm_rei("roasted_spider_meat", "Roasted Spider Meat", 3)
nssm_rei("silk_gland", "Silk Gland", -1)
nssm_rei("roasted_silk_gland", "Roasted Silk Gland", 3)
nssm_rei("super_silk_gland", "Super Silk Gland", -8)
nssm_rei("roasted_super_silk_gland", "Roasted Super Silk Gland", 2)

core.register_craftitem("nssm:broken_heart_tears", {
	description = "Broken Heart Tears",
	inventory_image = "broken_heart_tears.png",
	on_use = core.item_eat(15),
	groups = {eatable= 1},
})

-- Tools

core.register_entity("nssm:rainbow", {
initial_properties = {
	visual = "sprite",
	textures = {"blank.png"},
	physical = false,
	hp_max = 50,
	visual_size = {x= 0, y= 0},
	collisionbox = {0,0,0,0,0,0},
},
	on_step = function(self, dtime)
		self.timer = self.timer or os.time()

		local pos = self.object:get_pos()
		if core.is_protected(pos, "") then
			return
		end

		if os.time() - self.timer > 10 then
			core.set_node(pos, {name= "default:mese"})
			self.object:remove()
		end

		if core.get_node(pos) then
			local n = core.get_node(pos).name

			if n ~= "default:spectrum" then
	if n== "air" then
		core.set_node(pos, {name= "default:spectrum"})
	else
		core.set_node(pos, {name= "default:mese"})
		core.chat_send_all("Replaced: ".. n .." at ".. core.pos_to_string(vector.round(pos)))
		self.object:remove()
	end
			end
		end
	end
})

core.register_tool("nssm:rainbow_staff", {
	description = "Rainbow Staff",
	inventory_image = "rainbow_staff.png",
	on_use = function(item, user)
		local dir = user:get_look_dir()
		local pos = user:get_pos()
		local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+2+dir.y,z=pos.z+dir.z}, "nssm:rainbow")
		obj:set_velocity({x=dir.x*6,y=dir.y*6,z=dir.z*6})
	end,
	groups = {not_in_creative_inventory=1}
})

core.register_tool("nssm:sun_sword", {
	description = "Sun Sword",
	inventory_image = "sun_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.80, [2]=0.40, [3]=0.20}, uses=70, maxlevel=1},
			fleshy={times={[2]=0.6, [3]=0.2}, uses=70, maxlevel=1}
		},
		damage_groups = {fleshy=10},
	},
	light_source = default.LIGHT_MAX,
	on_place = function(item, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local udef = core.registered_nodes[node.name]
		if udef and udef.on_rightclick and not (placer and placer:is_player() and
				placer:get_player_control().sneak) then
			return udef.on_rightclick(under, node, placer, item, pointd) or item
		end

		local pos = pointd.above
		local name = placer:get_player_name()
		if not core.is_protected(pos, name) then
if pointd.type == "node" then
	if node.name == "nssm:mornar" and item:get_wear() < 41111 then
		core.swap_node(under, {name = "fire:basic_flame"})
core.add_particlespawner({
	amount = 39,
	time = .1,
	minpos = vector.subtract(under, .3),
	maxpos = vector.add(under, .3),
	minvel = {x=-3, y=-3, z=-3},
	maxvel = {x=3, y=4, z=3},
	minacc = {x=0,y=2,z=0},
	maxacc = {x=0,y=4,z=0},
	exptime = {min = .2, max = .5},
	minsize = 5,
	maxsize = 6,
	collisiondetection = true,
	texture = "mornar.png",
	glow = 12 })
	elseif core.get_node(pos).name == "air" then
		core.set_node(pos, {name = "fire:basic_flame"})
	end
end
		else
			core.chat_send_player(name, "This area is protected.")
		end
	end,
})

core.register_tool("nssm:masticone_fang_sword", {
	description = "Masticone Fang Sword",
	inventory_image = "masticone_fang_sword.png",
	tool_capabilities = {
		full_punch_interval =0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=200, maxlevel=1},
			fleshy={times={[2]=0.8, [3]=0.4}, uses=200, maxlevel=1}
		},
		damage_groups = {fleshy=8},
	},
})

core.register_tool("nssm:night_sword", {
	description = "Night Sword",
	inventory_image = "night_sword.png",
	tool_capabilities = {
		full_punch_interval =0.4,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.4, [2]=0.3, [3]=0.2}, uses=300, maxlevel=1},
			fleshy={times={[2]=0.7, [3]=0.3}, uses=300, maxlevel=1}
		},
		damage_groups = {fleshy=12},
	},
	on_place = function(item, placer, pointd)
		local under = pointd.under
		local node = core.get_node(under)
		local udef = core.registered_nodes[node.name]
		if udef and udef.on_rightclick and not (placer and placer:is_player() and
				placer:get_player_control().sneak) then
			return udef.on_rightclick(under, node, placer, item, pointd) or item
		end

		local name = placer:get_player_name()
		if not core.is_protected(under, name) then
if pointd.type == "node" then
	if (node.name == "fire:basic_flame" or node.name == "fire:permanent_flame") and item:get_wear() < 41111 then
		core.set_node(under, {name = "nssm:mornar"})
core.add_particlespawner({
	amount = 39,
	time = .1,
	minpos = vector.subtract(under, .3),
	maxpos = vector.add(under, .3),
	minvel = {x=-3, y=-3, z=-3},
	maxvel = {x=3, y=4, z=3},
	minacc = {x=0,y=2,z=0},
	maxacc = {x=0,y=4,z=0},
	exptime = {min = .2, max = .5},
	minsize = 5,
	maxsize = 6,
	collisiondetection = true,
	texture = "fire_basic_flame.png",
	glow = 13 })
	end
end
		else
			core.chat_send_player(name, "This area is protected.")
		end
	end,
})

core.register_tool("nssm:crab_light_mace", {
	description = "Light Crab Mace",
	inventory_image = "crab_light_mace.png",
	tool_capabilities = {
		full_punch_interval =2,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=1.4, [3]=1}, uses=20, maxlevel=1}
		},
		damage_groups = {fleshy=8},
	},
})

core.register_tool("nssm:crab_heavy_mace", {
	description = "Heavy Crab Mace",
	inventory_image = "crab_heavy_mace.png",
	tool_capabilities = {
		full_punch_interval =4,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=2, [3]=1.4}, uses=20, maxlevel=1}
		},
		damage_groups = {fleshy=12},
	},
})

core.register_tool("nssm:mantis_battleaxe", {
	description = "Mantis Battleaxe",
	inventory_image = "mantis_battleaxe.png",
	tool_capabilities = {
		full_punch_interval =3,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=2, [3]=1.4}, uses=20, maxlevel=1}
		},
		damage_groups = {fleshy=10},
	},
})

core.register_tool("nssm:mantis_sword", {
	description = "Mantis Sword",
	inventory_image = "mantis_sword.png",
	tool_capabilities = {
		full_punch_interval =0.65,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=1.0, [3]=0.4}, uses=30, maxlevel=1},
			snappy={times={[2]=0.80, [3]=0.3}, uses=40, maxlevel=1},
		},
		damage_groups = {fleshy=7},
	},
})

farming.register_hoe(":nssm:ant_hoe", {
	description = "Ant Hoe",
	inventory_image = "ant_hoe.png",
	max_uses = 350,
	material = "nssm:ant_mandible",
	groups = {hoe = 1}
})

core.register_tool("nssm:ant_sword", {
	description = "Ant Sword",
	inventory_image = "ant_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.30, [2]=0.90, [3]=0.40}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
})

core.register_tool("nssm:ant_shovel", {
	description = "Ant Shovel",
	inventory_image = "ant_shovel.png",
	wield_image = "ant_shovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = .6,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.30, [2]=0.80, [3]=0.20}, uses=25, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

core.register_tool("nssm:mantis_axe", {
	description = "Mantis Axe",
	inventory_image = "mantis_axe.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
})

core.register_tool("nssm:ant_billhook", {
	description = "Ant Billhook",
	inventory_image = "ant_billhook.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.40, [2]=1.00, [3]=0.60}, uses=30, maxlevel=3},
			snappy={times={[1]=1.40, [2]=1.00, [3]=0.60}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
})

core.register_tool("nssm:ant_pick", {
	description = "Ant Pickaxe",
	inventory_image = "ant_pick.png",
	tool_capabilities = {
		full_punch_interval = .6,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=1.5, [2]=.9, [3]=.6}, uses=23, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
})

core.register_tool("nssm:mantis_pick", {
	description = "Mantis Pickaxe",
	inventory_image = "mantis_pick.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=1.6, [2]=1.0, [3]=0.60}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

core.register_tool("nssm:tarantula_warhammer", {
	description = "Tarantula Warhammer",
	inventory_image = "tarantula_warhammer.png",
	wield_scale= {x=2,y=2,z=1.5},
	tool_capabilities = {
		full_punch_interval =1,
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=80, maxlevel=1},
			fleshy={times={[2]=0.8, [3]=0.4}, uses=200, maxlevel=1}
		},
		damage_groups = {fleshy=13},
	},
})

core.register_tool("nssm:axe_of_pride", {
	description = "Axe of Pride",
	inventory_image = "axe_of_pride.png",
	wield_scale= {x=2,y=2,z=1.5},
	tool_capabilities = {
		full_punch_interval =1.3,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=100, maxlevel=1},
			fleshy={times={[2]=0.8, [3]=0.4}, uses=400, maxlevel=1}
		},
		damage_groups = {fleshy=16},
	},
	on_drop = function(item, dropper, pos)
		local objects = core.get_objects_inside_radius(pos, 10)

		for _,obj in ipairs(objects) do
			local pname = dropper:get_player_name()
			local p_inv = core.get_inventory({type="player", name = pname})

			local found = 0
			for i = 1, 32 do
				local items = p_inv:get_stack("main", i)
				if items:get_name() == "extra_energy:globe" then
					found = i
					break
				end
			end
			if found == 0 then
				core.chat_send_player(pname, "You haven't got any Energy Globe!")	return
			else
				local part = 0
				if obj:is_player() then
					if obj:get_player_name()~= pname then
						obj:set_hp(obj:get_hp() -10)
						dropper:set_hp(dropper:get_hp() +10)

						local items = p_inv:get_stack("main", found)
						items:take_item()
						p_inv:set_stack("main", found, items)
						part = 1
					end
				else
					if obj:get_luaentity().health then
						obj:get_luaentity().health = obj:get_luaentity().health -10
						obj:get_luaentity():check_for_death({type = "unknown"})

						dropper:set_hp(dropper:get_hp() +10)

						local items = p_inv:get_stack("main", found)
						items:take_item()
						p_inv:set_stack("main", found, items)
						part = 1
					end
				end

				if part == 1 then
		local s = pos
		local p = obj:get_pos()		if not p then return end
		core.add_particlespawner({
			amount = 3,
			time = .1,
			minpos = vector.subtract(p, .5),
			maxpos = vector.add(p, .5),
			minvel = {x=(s.x-p.x)*2, y=(s.y-p.y)*2, z=(s.z-p.z)*2},
			maxvel = {x=(s.x-p.x)*2, y=(s.y-p.y)*2, z=(s.z-p.z)*2},
			minacc = {x=s.x-p.x, y=s.y-p.y, z=s.z-p.z},
			maxacc = {x=s.x-p.x, y=s.y-p.y, z=s.z-p.z},
			exptime = {min = .5, max = 1},
			minsize = 3,
			maxsize = 4,
			texture = "heart.png"})
				end
			end
		end
	end,
})

core.register_tool("nssm:gratuitousness_battleaxe", {
	description = "Gratuitousness Battleaxe",
	inventory_image = "gratuitousness_battleaxe.png",
	wield_scale= {x=2.2,y=2.2,z=1.5},
	tool_capabilities = {
		full_punch_interval =1.6,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=100, maxlevel=1},
			fleshy={times={[2]=0.8, [3]=0.4}, uses=400, maxlevel=1}
		},
		damage_groups = {fleshy=18},
	},
	on_drop = function(item, dropper, pos)
		local pname = dropper:get_player_name()
		local p_inv = core.get_inventory({type="player", name = pname})

		local found = 0
		for i = 1, 32 do
			local items = p_inv:get_stack("main", i)

			if items:get_name() == "extra_energy:globe" then
				found = i
				break
			end
		end
		if found == 0 then
			core.chat_send_player(pname, "You haven't got any Energy Globe!")	return
		else
	local dir = dropper:get_look_dir()

	for i=1, 10 do
		pos = vector.add(pos, dir)
	end
	tnt.boom(pos, {damage_radius= 5, radius= 4, ignore_protection= false})

	local items = p_inv:get_stack("main", found)
	items:take_item()
	p_inv:set_stack("main", found, items)
		end
	end,
})

core.register_tool("nssm:sword_of_eagerness", {
	description = "Sword of Eagerness",
	inventory_image = "sword_of_eagerness.png",
	wield_scale= {x=2,y=2,z=1},
	tool_capabilities = {
		full_punch_interval = .7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=100, maxlevel=1},
			fleshy={times={[2]=0.8, [3]=0.4}, uses=400, maxlevel=1}
		},
		damage_groups = {fleshy=14},
	},
	on_drop = function(item, dropper, pos)
		local objects = core.get_objects_inside_radius(pos, 10)

		for _,obj in ipairs(objects) do
			local pname = dropper:get_player_name()
			local p_inv = core.get_inventory({type="player", name = pname})

			local found = 0
			for i = 1, 32 do
				local items = p_inv:get_stack("main", i)
				if items:get_name() == "extra_energy:globe" then
					found = i
					break
				end
			end
			if found == 0 then
				core.chat_send_player(pname, "You haven't got any Energy Globe!")	return
			else
				local part = 0
				local s = obj:get_pos()
				local pos = obj:get_pos()
				pos.y = pos.y + 15
				if obj:is_player() then
					if obj:get_player_name()~= pname then
						obj:set_pos(pos)

						local items = p_inv:get_stack("main", found)
						items:take_item()
						p_inv:set_stack("main", found, items)
						part = 1
					end
				else
					if obj:get_luaentity().health then
						obj:get_luaentity().old_y = pos.y
						obj:set_pos(pos)

						local items = p_inv:get_stack("main", found)
						items:take_item()
						p_inv:set_stack("main", found, items)
						part = 1
					end
				end
				if part == 1 then
				core.add_particlespawner({
					amount = 25,
					time = .3,
					minpos = vector.subtract(s, .5),
					maxpos = vector.add(s, .5),
					minvel = {x=-.1, y=10, z=-.1},
					maxvel = {x=.1, y=11, z=.1},
					minacc = {x=0,y=1,z=0},
					maxacc = {x=0,y=1,z=0},
					exptime = {min = .5, max = 1},
					minsize = 1,
					maxsize = 2,
					texture = "slothful_soul_fragment.png"})
				end
			end
		end
	end,
})

core.register_tool("nssm:falchion_of_eagerness", {
	description = "Falchion of Eagerness",
	inventory_image = "falchion_of_eagerness.png",
	wield_scale= {x=2,y=2,z=1},
	tool_capabilities = {
		full_punch_interval =1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=100, maxlevel=1},
			fleshy={times={[2]=0.8, [3]=0.4}, uses=400, maxlevel=1}
		},
		damage_groups = {fleshy=16},
	},
	on_drop = function(item, dropper, pos)
		local pname = dropper:get_player_name()
		local p_inv = core.get_inventory({type="player", name = pname})

		local found = 0
		for i = 1, 32 do
			local items = p_inv:get_stack("main", i)
			if items:get_name() == "nssm:energy_pearl" then
				if items:get_count() >= 5 then
					found = i
					break
				end
			end
		end
		if found == 0 then
			core.chat_send_player(pname, "You haven't got enough Energy Pearls!")	return
		else
	core.add_particlespawner({
		amount = 25,
		time = .3,
		minpos = vector.subtract(pos, .5),
		maxpos = vector.add(pos, .5),
		minvel = {x=-.1, y=10, z=-.1},
		maxvel = {x=.1, y=11, z=.1},
		minacc = {x=0,y=1,z=0},
		maxacc = {x=0,y=1,z=0},
		exptime = {min = .5, max = 1},
		minsize = 1,
		maxsize = 2,
		texture = "slothful_soul_fragment.png"})

	local dir = dropper:get_look_dir()

	for i=1, 16 do
		pos = vector.add(pos, dir)
	end

	local n = core.get_node(pos).name
	local above = {x=pos.x, y=pos.y+1, z=pos.z}
	local na = core.get_node(above).name

	if n ~= "air" and n ~= "doors:hidden" and
core.registered_nodes[n].walkable and not core.registered_nodes[n].climbable then
	core.dig_node(pos) end
	if na ~= "air" and na ~= "doors:hidden" and
core.registered_nodes[na].walkable and not core.registered_nodes[na].climbable then
	core.dig_node(above) end
	dropper:set_pos(above)

	local s = above
	s.y = s.y+10
	core.add_particlespawner({
		amount = 25,
		time = .3,
		minpos = vector.subtract(s, .5),
		maxpos = vector.add(s, .5),
		minvel = {x=-.1, y=-10, z=-.1},
		maxvel = {x=.1, y=-11, z=.1},
		minacc = {x=0,y=-1,z=0},
		maxacc = {x=0,y=-1,z=0},
		exptime = {min = .5, max = 1},
		minsize = 1,
		maxsize = 2,
		texture = "slothful_soul_fragment.png"})

	local items = p_inv:get_stack("main", found)
	items:set_count(items:get_count()-5)
	p_inv:set_stack("main", found, items)
		end
	end,
})

core.register_tool("nssm:sword_of_envy", {
	description = "Sword of Envy",
	inventory_image = "sword_of_envy.png",
	wield_scale= {x=2,y=2,z=1},
	tool_capabilities = {
		full_punch_interval = .9,
		max_drop_level= 1,
		groupcaps={
			snappy= {times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=100, maxlevel=1},
			fleshy= {times={[2]=0.5, [3]=0.2}, uses=400, maxlevel=1}
		},
		damage_groups = {fleshy=14},
	},
	on_drop = function(item, dropper, pos)
		local objects = core.get_objects_inside_radius(pos, 10)

		for _,obj in ipairs(objects) do
			local pname = dropper:get_player_name()
			local p_inv = core.get_inventory({type="player", name = pname})

			local found = 0
			for i = 1, 32 do
				local items = p_inv:get_stack("main", i)
				if items:get_name() == "extra_energy:globe" then
					found = i
					break
				end
			end
			if found == 0 then
				core.chat_send_player(pname, "You haven't got any Energy Globe!")	return
			else
				if obj:is_player() then
					if obj:get_player_name()~= pname then
						local hpp = obj:get_hp()

						obj:set_hp(dropper:get_hp())
						dropper:set_hp(hpp)

						local items = p_inv:get_stack("main", found)
						items:take_item()
						p_inv:set_stack("main", found, items)
					end
				else
					if obj:get_luaentity().health then
						local hpp = obj:get_luaentity().health

						obj:get_luaentity().health = dropper:get_hp()
						if hpp > 20 then
							dropper:set_hp(20)
						else
							dropper:set_hp(hpp)
						end
						obj:get_luaentity():check_for_death({type = "unknown"})

						local items = p_inv:get_stack("main", found)
						items:take_item()
						p_inv:set_stack("main", found, items)
					end
				end
			end
		end
	end,
})

core.register_tool("nssm:sword_of_gluttony", {
	description = "Sword of Gluttony",
	inventory_image = "sword_of_gluttony.png",
	wield_scale= {x=2,y=2,z=1},
	tool_capabilities = {
		full_punch_interval =1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.9, [2]=0.7, [3]=0.4}, uses=100, maxlevel=1},
			fleshy={times={[2]=0.6, [3]=0.2}, uses=400, maxlevel=1}
		},
		damage_groups = {fleshy=14},
	},
	on_drop = function(item, dropper, pos)
		local objects = core.get_objects_inside_radius(pos, 10)

		for _,obj in ipairs(objects) do
			local pname = dropper:get_player_name()
			local p_inv = core.get_inventory({type="player", name = pname})

			local found = 0
			for i = 1, 32 do
				local items = p_inv:get_stack("main", i)
				if items:get_name() == "extra_energy:globe" then
					found = i
					break
				end
			end
			if found == 0 then
				core.chat_send_player(pname, "You haven't got any Energy Globe!")	return
			else
				if obj:is_player() then
					if obj:get_player_name()~= pname then
						obj:set_hp(obj:get_hp()-10)

						local items = p_inv:get_stack("main", found)
						items:take_item()
						p_inv:set_stack("main", found, items)
					end
	            else
	if obj:get_luaentity().health and obj:get_luaentity().health <= 32 then
		local pos = obj:get_pos()
		obj:remove()

		for i = 1, math.random(4) do
			local drop = core.add_item(pos, "nssm:surimi")
			drops(drop)
		end

		local u = dropper:get_pos()

		core.add_particlespawner({
			amount = 10,
			time = .1,
			minpos = vector.subtract(u, .5),
			maxpos = vector.add(u, .5),
			minvel = {x=(pos.x-u.x)*3, y=(pos.y-u.y)*3, z=(pos.z-u.z)*3},
			maxvel = {x=(pos.x-u.x)*3, y=(pos.y-u.y)*3, z=(pos.z-u.z)*3},
			minacc = {x=pos.x-u.x, y=pos.y-u.y, z=pos.z-u.z},
			maxacc = {x=pos.x-u.x, y=pos.y-u.y, z=pos.z-u.z},
			exptime = {min = .5, max = 1},
			minsize = 1,
			maxsize = 2,
			texture = "gluttonous_soul_fragment.png"})

		local items = p_inv:get_stack("main", found)
		items:take_item()
		p_inv:set_stack("main", found, items)
	end
	            end
			end
        end
	end,
})

core.register_tool("nssm:death_scythe", {
	description = "Death Scythe",
	wield_scale= {x=3,y=3,z=1.3},
	inventory_image = "death_scythe.png",
	tool_capabilities = {
		full_punch_interval =0.2,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.1, [2]=0.1, [3]=0.1}, uses=28000, maxlevel=1},
			fleshy={times={[2]=0.1, [3]=0.1}, uses=28000, maxlevel=1}
		},
		damage_groups = {fleshy=28},
	},
	groups ={not_in_creative_inventory=1},
	on_drop = function(item, dropper, pos)
		local pname = dropper:get_player_name()
if dropper:get_meta():get_string("_infinite_energy") ~= "true" then
	local extra_energy = tonumber(dropper:get_meta():get_int("_extra_energy"))
	if extra_energy >= 31 then
		dropper:get_meta():set_int("_extra_energy", extra_energy - 31)
	elseif core.get_modpath("chi") and chi.subtract(pname, 31) then
	else
		dropper:set_hp(dropper:get_hp()-7)
	end
end
		local objects = core.get_objects_inside_radius(pos, 10)
		pos.y = pos.y +.7
		for _,obj in ipairs(objects) do
			local flag = 0

			if obj:is_player() then
				if obj:get_player_name() ~= pname then
					obj:set_hp(obj:get_hp()-40)
					flag = 1
				end
			else
				if obj:get_luaentity().health then
					obj:get_luaentity().health = obj:get_luaentity().health -40
					obj:get_luaentity():check_for_death({type = "unknown"})
					flag = 1
				end
			end
			if flag == 1 then
				for i= 1, math.random(2) do
					local drop = core.add_item(pos, "extra_energy:globe")

					if drop then
						drop:set_velocity({
							x = math.random(-10, 10) / 9,
							y = 5,
							z = math.random(-10, 10) / 9,
						})
					end
				end
			end
		end

		local poslist = core.find_nodes_in_area(vector.subtract(pos, 5), vector.add(pos, 5),
	{"group:soil", "default:compost_pile", "default:mud", "default:dry_dirt", "default:dry_clay_dirt"})
		for _,v in pairs(poslist) do
 if not core.is_protected(v, pname) then
		local meta = core.get_meta(v)
		local node = core.get_node(v).name
		--core.chat_send_all(core.pos_to_string(v))
		swap_preserved(v, "nssm:dead_dirt")
	if node == "default:dirt_with_short_grass" then
		node = "default:dirt_with_grass"
	elseif node == "default:dry_dirt" then
		node = "default:dirt"
	elseif node == "default:dry_clay_dirt" then
		node = "default:clay_dirt"
	end
		meta:set_string("death_of", node)
		if math.random(3)== 1 then
			v.y = v.y +1
			local drop = core.add_item(v, "nssm:energy_pearl")
			drops(drop)
		end
 end
		end

		poslist = core.find_nodes_in_area(vector.subtract(pos, 5), vector.add(pos, 5),
	{"group:flora", "group:plant", "group:poison", "group:water_flora", "group:sapling"})
		for _,v in pairs(poslist) do
 if not core.is_protected(v, pname) then
		local meta = core.get_meta(v)
		local node = core.get_node(v).name
		--core.chat_send_all(core.pos_to_string(v))
		swap_preserved(v, "default:dry_shrub")
		meta:set_string("death_of", node)
		if math.random(3)== 1 then
			v.y = v.y +1
			local drop = core.add_item(v, "nssm:energy_pearl")
			drops(drop)
		end
 end
		end

		poslist = core.find_nodes_in_area(vector.subtract(pos, 5), vector.add(pos, 5), "group:leaves")
		for _,v in pairs(poslist) do
 if not core.is_protected(v, pname) then
		local node = core.get_node(v).name
	if node ~= "nssm:dead_leaves" then
		local meta = core.get_meta(v)
		--core.chat_send_all(core.pos_to_string(v))
		swap_preserved(v, "nssm:dead_leaves")
	if node == "default:bush_leaves" and meta:get_string("bush_fruits") == "true" then
		node = "default:bush_leaves_fruiting"
	elseif node == "default:pine_needles" and meta:get_string("pinecones") == "true" then
		node = "default:pinecone_needles"
	elseif node == "black_oak:leaves" and meta:get_string("acorns") == "true" then
		node = "black_oak:leaves_fruiting"
	elseif node == "black_spruce:needles" and meta:get_string("sprucecones") == "true" then
		node = "black_spruce:cones"
	elseif node == "blue_spruce:needles" and meta:get_string("sprucecones") == "true" then
		node = "blue_spruce:cones"
	elseif node == "cedar:needles" and meta:get_string("cedarcones") == "true" then
		node = "cedar:cones"
	elseif node == "fir:needles" and meta:get_string("fircones") == "true" then
		node = "fir:cones"
	elseif node == "juniper:needles" and meta:get_string("junifruit") == "true" then
		node = "juniper:with_berries"
	elseif node == "white_spruce:needles" and meta:get_string("sprucecones") == "true" then
		node = "white_spruce:cones"
	end
		meta:set_string("death_of", node)
		if math.random(3)== 1 then
			v.y = v.y +1
			local drop = core.add_item(v, "nssm:energy_pearl")
			drops(drop)
		end end
 end
		end
	end,
})

-- Recipes

core.register_craft({
	type = "shapeless",
	output = "nssm:mixed_dirt",
	recipe = {"nssm:ant_dirt", "default:dirt"}
})

core.register_craft({
	output = "nssm:web_string",
	recipe = {
		{"nssm:web", "nssm:web"},
		{"nssm:web", "nssm:web"}
	}
})

core.register_craft({
	output = "nssm:dense_web_string",
	recipe = {
		{"nssm:web_string", "nssm:web_string", "nssm:web_string"},
		{"nssm:web_string", "nssm:web_string", "nssm:web_string"},
		{"nssm:web_string", "nssm:web_string", "nssm:web_string"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "nssm:vine",
	recipe = {"nssm:web_string", "default:bush_leaves"}
})

core.register_craft({
	type = "shapeless",
	output = "nssm:vine",
	recipe = {"nssm:web_string", "default:beech_leaves"}
})

core.register_craft({
	output = "nssm:mantis_sword",
	recipe = {
		{"nssm:mantis_claw"},
		{"nssm:mantis_claw"},
		{"group:stick"}
	}
})

core.register_craft({
	output = "nssm:masticone_fang_sword",
	recipe = {
		{"nssm:masticone_fang", "nssm:masticone_fang"},
		{"nssm:masticone_fang", ""},
		{"group:stick", ""}
	}
})

core.register_craft({
	output = "nssm:web 4",
	recipe = {{"nssm:silk_gland"}}
})

core.register_craft({
	output = "nssm:web 12",
	recipe = {{"nssm:super_silk_gland"}}
})

core.register_craft({
	output = "nssm:crab_light_mace",
	recipe = {
		{"nssm:crab_chela"},
		{"group:stick"},
		{"group:stick"}
	}
})

core.register_craft({
	output = "nssm:crab_heavy_mace",
	recipe = {
		{"", "nssm:crab_chela", ""},
		{"nssm:crab_chela", "nssm:crab_chela", "nssm:crab_chela"},
		{"", "group:stick", ""}
	}
})

core.register_craft({
	output = "default:rope 12",
	recipe = {
		{"nssm:web_string", "nssm:web_string"},
		{"nssm:web_string", "nssm:web_string"},
		{"nssm:web_string", "nssm:web_string"}
	}
})

core.register_craft({
	output = "nssm:sun_feather",
	recipe = {{"bucket:bucket_lava", "nssm:night_feather"}},
	replacements = {{"bucket:bucket_lava", "bucket:bucket_empty"}}
})

core.register_craft({
	output = "nssm:sun_feather",
	recipe = {{"bucket:clay_bucket_lava", "nssm:night_feather"}},
	replacements = {{"bucket:clay_bucket_lava", "bucket:clay_bucket_empty"}}
})

core.register_craft({
	type = "shapeless",
	output = "nssm:sky_feather",
	recipe = {"nssm:sun_feather", "nssm:night_feather"}
})

core.register_craft({
	output = "nssm:sun_sword",
	recipe = {
		{"default:diamond"},
		{"nssm:sun_feather"},
		{"group:stick"}
	}
})

core.register_craft({
	output = "nssm:night_sword",
	recipe = {
		{"default:diamond"},
		{"nssm:night_feather"},
		{"group:stick"}
	}
})

local function nssm_register_recip(ingredient, dish, tictac)

core.register_craft({
	type = "cooking",
	output = "nssm:".. dish,
	recipe = "nssm:".. ingredient,
	cooktime = tictac,
})
end

nssm_register_recip("ant_leg", "roasted_ant_leg", 6)
nssm_register_recip("frosted_crocodile_heart", "crocodile_heart", 8)
nssm_register_recip("crocodile_heart", "roasted_crocodile_heart", 6)
nssm_register_recip("crocodile_tail", "roasted_crocodile_tail", 16)
nssm_register_recip("crocodile_ribs", "roasted_crocodile_ribs", 12)
nssm_register_recip("worm_flesh", "roasted_worm_flesh", 12)
nssm_register_recip("spider_leg", "roasted_spider_leg", 6)
nssm_register_recip("tentacle", "roasted_tentacle", 6)
nssm_register_recip("tentacle_curly", "roasted_tentacle_curly", 8)
nssm_register_recip("mantis_meat", "roasted_mantis_meat", 6)
nssm_register_recip("spider_meat", "roasted_spider_meat", 6)
nssm_register_recip("silk_gland", "roasted_silk_gland", 4)

core.register_craft({
	output = "nssm:surimantis_nuggets",
	recipe = {
		{"nssm:surimi", "nssm:roasted_mantis_meat"},
		{"nssm:roasted_mantis_meat", "nssm:surimi"}
	}
})

core.register_craft({
	output = "nssm:ant_sword",
	recipe = {
		{"nssm:ant_mandible"},
		{"nssm:ant_mandible"},
		{"group:stick"}
	}
})

core.register_craft({
	output = "nssm:ant_billhook",
	recipe = {
		{"nssm:ant_mandible", "nssm:ant_mandible"},
		{"nssm:ant_mandible", "group:stick"},
		{"", "group:stick"}
	}
})

core.register_craft({
	output = "nssm:ant_shovel",
	recipe = {
		{"nssm:ant_mandible"},
		{"group:stick"},
		{"group:stick"}
	}
})

core.register_craft({
	output = "nssm:ant_pick",
	recipe = {
		{"nssm:ant_mandible", "nssm:ant_mandible", "nssm:ant_mandible"},
		{"", "group:stick", ""},
		{"", "group:stick", ""}
	}
})

core.register_craft({
	output = "nssm:mantis_pick",
	recipe = {
		{"nssm:mantis_claw", "nssm:mantis_claw", "nssm:mantis_claw"},
		{"", "group:stick", ""},
		{"", "group:stick", ""}
	}
})

core.register_craft({
	output = "nssm:mantis_axe",
	recipe = {
		{"nssm:mantis_claw", "nssm:mantis_claw"},
		{"nssm:mantis_claw", "group:stick"},
		{"", "group:stick"}
	}
})

core.register_craft({
	output = "nssm:tarantula_warhammer",
	recipe = {
		{"nssm:tarantula_chelicerae"},
		{"group:stick"},
		{"group:stick"}
	}
})

core.register_craft({
	output = "nssm:mantis_battleaxe",
	recipe = {
		{"nssm:mantis_claw", "nssm:mantis_claw", "nssm:mantis_claw"},
		{"nssm:mantis_claw", "group:stick", "nssm:mantis_claw"},
		{"", "group:stick", ""}
	}
})

core.register_craft({
	output = "nssm:sky_iron 30",
	recipe = {
		{"default:wrought_iron_block", "default:wrought_iron_block", "default:wrought_iron_block"},
		{"default:wrought_iron_block", "nssm:sky_feather", "default:wrought_iron_block"},
		{"default:wrought_iron_block", "default:wrought_iron_block", "default:wrought_iron_block"}
	}
})

core.register_craft({
	type = "cooking",
	output = "nssm:moranga_ingot 9",
	recipe = "nssm:moranga",
	cooktime = 160,
})

core.register_craft({
	output = "nssm:morlamp",
	recipe = {
		{"nssm:morelentir_dust", "nssm:morelentir_dust", "nssm:morelentir_dust"},
		{"nssm:morelentir_dust", "nssm:morelentir_dust", "nssm:morelentir_dust"},
		{"nssm:morelentir_dust", "nssm:morelentir_dust", "nssm:morelentir_dust"}
	}
})

core.register_craft({
	output = "nssm:axe_of_pride",
	recipe = {
		{"nssm:proud_moranga", "nssm:proud_moranga", "nssm:proud_moranga"},
		{"nssm:proud_moranga", "nssm:moranga_ingot", ""},
		{"", "nssm:moranga_ingot", ""}
	}
})

core.register_craft({
	output = "nssm:gratuitousness_battleaxe",
	recipe = {
		{"nssm:greedy_moranga", "nssm:greedy_moranga", "nssm:greedy_moranga"},
		{"nssm:greedy_moranga", "nssm:moranga_ingot", "nssm:greedy_moranga"},
		{"", "nssm:moranga_ingot", ""}
	}
})

core.register_craft({
	output = "nssm:sword_of_envy",
	recipe = {
		{"nssm:envious_moranga"},
		{"nssm:envious_moranga"},
		{"nssm:moranga_ingot"}
	}
})

core.register_craft({
	output = "nssm:sword_of_eagerness",
	recipe = {
		{"nssm:slothful_moranga"},
		{"nssm:slothful_moranga"},
		{"nssm:moranga_ingot"}
	}
})

core.register_craft({
	output = "nssm:falchion_of_eagerness",
	recipe = {
		{"nssm:slothful_moranga", "nssm:slothful_moranga"},
		{"nssm:slothful_moranga", ""},
		{"nssm:moranga_ingot", ""}
	}
})

core.register_craft({
	output = "nssm:sword_of_gluttony",
	recipe = {
		{"nssm:gluttonous_moranga", "nssm:gluttonous_moranga", "nssm:gluttonous_moranga"},
		{"", "nssm:gluttonous_moranga", ""},
		{"", "nssm:moranga_ingot", ""}
	}
})

local function nssm_register_moranga(viz)
	local tmp = "nssm:".. viz .."_soul_fragment"

core.register_craft({
	output = "nssm:".. viz .."_moranga",
	recipe = {
		{tmp, "nssm:moranga_ingot", tmp},
		{"nssm:moranga_ingot", tmp, "nssm:moranga_ingot"},
		{tmp, "nssm:moranga_ingot", tmp}
	}
})
end

nssm_register_moranga("lustful")
nssm_register_moranga("greedy")
nssm_register_moranga("slothful")
nssm_register_moranga("wrathful")
nssm_register_moranga("gluttonous")
nssm_register_moranga("envious")
nssm_register_moranga("proud")

-- Eggs

if core.get_modpath("mobs") then
local function nssm_register_egg(name, descr)

	core.register_craftitem("nssm:".. name, {
		description = descr.. " Egg",
		inventory_image = name.."_egg.png",

		on_place = function(item, placer, pointd)
			local pos= core.get_pointed_thing_position(pointd, true)
			pos.y= pos.y+ 1.5

			core.add_entity(pos, "nssm:".. name)
			item:take_item()
			return item
		end
	})
end

nssm_register_egg("echidna", "Echidna")
nssm_register_egg("lava_titan", "Lava Titan")
nssm_register_egg("masticone", "Masticone")
nssm_register_egg("mantis_beast", "Mantis Beast")
nssm_register_egg("mantis", "Mantis")
nssm_register_egg("sandworm", "Sandworm")
nssm_register_egg("ant_queen", "Ant Queen")
nssm_register_egg("ant_soldier", "Ant Soldier")
nssm_register_egg("ant_worker", "Ant Worker")
nssm_register_egg("crocodile", "Crocodile")
nssm_register_egg("crab", "Crab")
nssm_register_egg("octopus", "Octopus")
nssm_register_egg("xgaloctopus", "Xgaloctopus")
nssm_register_egg("black_widow", "Black Widow")
nssm_register_egg("uloboros", "Uloboros")
nssm_register_egg("tarantula", "Tarantula")
nssm_register_egg("daddy_long_legs", "Daddy Long Legs")
nssm_register_egg("mordain", "Mordain")
nssm_register_egg("morgre", "Morgre")
nssm_register_egg("morvy", "Morvy")
nssm_register_egg("morgut", "Morgut")
nssm_register_egg("morde", "Morde")
nssm_register_egg("morlu", "Morlu")
nssm_register_egg("morwa", "Morwa")
nssm_register_egg("morvalar", "Morvalar")
end
