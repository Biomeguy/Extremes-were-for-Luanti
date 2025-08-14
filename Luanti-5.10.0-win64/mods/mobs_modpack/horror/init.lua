--other file
if core.get_modpath("mobs") then
	dofile(core.get_modpath("horror").."/mobs.lua")
end

if core.settings:get_bool("scary_ambience", true) then
core.register_globalstep(function()
	if math.random(1,1000) == 1 then
		local sound = math.random(1,7)
		core.sound_play(sound, {gain = .4, max_hear_distance = 1, loop = false})
	end
end)
end

--Vignette overlay from Vignette mod by TriBlade9(license MIT)
--permanent dawn
if core.settings:get_bool("darkness", true) then
core.register_on_joinplayer(function(player)
	core.after(0,function()
		player:override_day_night_ratio(.41)
		if core.settings:get_bool("dark_sky", true) then
		player:set_sky({base_color={r=0, g=0, b=0}, type="plain"})
		end
	end)
	player:hud_add({
	type = "image",
	position = {x = .5, y = .5},
	scale = {
		x = -100,
		y = -100
	},
	text = "horror_hud.png"
	})
	if core.settings:get_bool("possession", true) and math.random(1,700) == 616 then
		player:hud_add({
		type = "image",
		position = {x = .5, y = .5},
		scale = {
			x = -55,
			y = -100
		},
		text = "horror_possessed.png"
		})
		local name = player:get_player_name()
		core.chat_send_all(name.." is possessed")
		core.after(3, function()
			player:set_sky({base_color={r=216, g=40, b=8}, type="plain"})
		end)
		core.after(50, function()
			if player ~= nil then
				local playerpos = player:get_pos()
				tnt.boom(
					{x=playerpos.x, y=playerpos.y+1, z=playerpos.z},
					{damage_radius=5,radius=4,ignore_protection=false, disable_playerdamage=false}
				)
			end
		end)
	end
end)
end

--drop head on death
core.register_on_dieplayer(function(player)
	local pos = player:get_pos()
	core.add_item(pos, "horror:sam_head")
end)

--ABM
local punch_entities = {}
punch_entities["horror:ghost"] = true
punch_entities["horror:spider"] = true
punch_entities["horror:hellbaron"] = true
punch_entities["horror:pinky"] = true
punch_entities["horror:lost_soul"] = true
punch_entities["horror:manticore"] = true
punch_entities["horror:cacodemon"] = true
punch_entities["horror:mogall"] = true

core.register_abm({
	nodenames = {"horror:sunorb", "horror:gloworb"},
	interval = 5,
	chance = 1,
	action = function(pos)
		for _, obj in pairs(core.get_objects_inside_radius(pos, 5)) do
	local ent = obj:get_luaentity().name
	if ent and punch_entities[ent] then
		obj:punch(obj, .5, {
			full_punch_interval=.5,
			damage_groups={fleshy=4},
		}, nil)
	end
		end
	end
})

core.register_node("horror:sunorb", {
	description = "Sun orb",
	drawtype = "plantlike",
	tiles = {"horror_orb.png"},
	inventory_image = "horror_orb.png",
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 14,
	use_texture_alpha = "blend",
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-.2, -.5, -.2, .2, 0, .2}
	},
	groups = {cracky=3,dig_immediate=3},
})

core.register_node("horror:gloworb", {
	description = "Glow orb",
	tiles = {"horror_orb.png"},
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 14,
	use_texture_alpha = "opaque",
	walkable = false,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-.375, -.1875, -.1875, .375, .1875, .1875},
			{-.1875, -.375, -.1875, .1875, .375, .1875},
			{-.3125, -.25, -.25, .3125, .25, .25},
			{-.25, -.25, -.3125, .25, .25, .3125},
			{-.25, -.3125, -.25, .25, .3125, .25},
			{-.1875, -.1875, -.375, .1875, .1875, .375}
		}
	},
	groups = {cracky=1,dig_immediate=2}
})

core.register_node("horror:pentagram", {
	description = "Pentagram (Wrong use)",
	drawtype = "signlike",
	visual_scale = 3.,
	tiles = {"horror_pentagram.png"},
	inventory_image = "horror_pentagram.png",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	light_source = 14,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		fixed = {-.5, -.5, -.5, .5, -.4, .5}
	},
	on_rightclick = function(pos)
		core.get_node_timer(pos):start(1)
	end,
	on_timer = function(pos)
		if core.get_modpath("mobs") then
	local p2 = core.get_node(pos).param2
	core.set_node(pos, {name="horror:portal", param2= p2})
	core.add_particlespawner({
		amount = 25,
		time = 1,
		minpos = {x=pos.x-1, y=pos.y, z=pos.z-1},
		maxpos = {x=pos.x+1, y=pos.y, z=pos.z+1},
		minacc = {x=-.5,y=1,z=-.5},
		maxacc = {x=.5,y=1,z=.5},
		exptime = {min = 1, max = 1.5},
		minsize = 5,
		maxsize = 6,
		texture = "horror_flame.png"})
		end
	end,
	groups = {crumbly=3, oddly_breakable_by_hand=2, attached_node=1},
})

core.register_node("horror:portal", {
	description = "Portal",
	drawtype = "signlike",
	visual_scale = 3.,
	tiles = {"horror_portal.png"},
	inventory_image = "horror_portal.png",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	light_source = 14,
	walkable = false,
	pointable = false,
	diggable = false,
	is_ground_content = false,
	drop = "",
	on_construct = function(pos)
		core.get_node_timer(pos):start(1)
	end,
	on_timer = function(pos)
		core.add_entity(pos, "horror:pinky")
		core.remove_node(pos)
	end,
	groups = {attached_node=1, not_in_creative_inventory=1},
})

core.register_node("horror:gfire", {
	description = "Decorative green fire",
	drawtype = "plantlike",
	sunlight_propagates = true,
	paramtype = "light",
	light_source = 14,
	walkable = false,
	damage_per_second = 2,
	is_ground_content = false,
	tiles = {{
		name = "horror_gfire.png",
		animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 1.},
	}},
	inventory_image = "horror_gfire_inv.png",
	groups = {crumbly=1, fire = 1, not_in_creative_inventory=1},
	on_construct = function(pos)
		core.get_node_timer(pos):start(5)
	end,
	on_timer = function(pos, elapsed)
		core.remove_node(pos)
	end,
})

core.register_node("horror:spiderweb", {
	description = "Spiderweb",
	drawtype = "plantlike",
	visual_scale = 1.25,
	sunlight_propagates = true,
	paramtype = "light",
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "horror:spiderweb",
	liquid_alternative_source = "horror:spiderweb",
	liquid_renewable = false,
	liquid_range = 0,
	walkable = false,
	is_ground_content = false,
	tiles = {"horror_spiderweb.png"},
	inventory_image = "horror_spiderweb.png",
	groups = {snappy=1, oddly_breakable_by_hand=1, liquid=3, dig_immediate=1}
})

core.register_node("horror:sam_head", {
	description = "Sam head",
	tiles = {"horror_sam_top.png", "horror_sam_bottom.png", "horror_sam_right.png",
		"horror_sam_left.png", "horror_sam_back.png", "horror_sam_front.png"},
	drawtype = "nodebox",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky=1, oddly_breakable_by_hand=1},
	node_box = {
		type = "fixed",
		fixed = {-.3125, -.5, -.3125, .3125, .125, .3125}
	}
})


core.register_tool("horror:cleaver", {
	description = "Cleaver",
	inventory_image = "horror_cleaver.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level = 0,
		groupcaps = {
			fleshy = {times={[3]=1.35}, uses=45, maxlevel=1},
		},
		damage_groups = {fleshy = 6},
	},
})

core.register_tool("horror:rapier", {
	description = "Rapier",
	inventory_image = "horror_rapier.png",
	wield_scale = {x = 1.5, y = 1.5, z = .6},
	tool_capabilities = {
		full_punch_interval = .9,
		max_drop_level = 0,
		groupcaps = {
			fleshy = {times={[3]=1.35}, uses=15, maxlevel=1},
		},
		damage_groups = {fleshy = 9},
	},
})

core.register_tool("horror:pitchfork", {
	description = "Pitchfork",
	inventory_image = "horror_pitchfork.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1.5},
	tool_capabilities = {
		full_punch_interval = 2.9,
		max_drop_level = 0,
		groupcaps = {
			fleshy = {times={[3]=1.35}, uses=15, maxlevel=1},
		},
		damage_groups = {fleshy = 12},
	},
})

core.register_craftitem("horror:ring", {
	description = "Ghosts Ring",
	inventory_image = "horror_ring.png"
})

-- crafting
core.register_craft({
	output = "horror:cleaver",
	recipe = {
		{"group:stick", "default:steel_ingot", ""},
		{"group:stick", "default:steel_ingot", ""},
		{"group:stick", "", ""}
	}
})

core.register_craft({
	output = "horror:rapier",
	recipe = {
		{"default:steel_ingot", ""},
		{"default:steel_ingot", ""},
		{"group:stick", "default:steel_ingot"}
	}
})

core.register_craft({
	output = "horror:pitchfork",
	recipe = {
		{"default:copper_ingot", "default:copper_ingot", "default:copper_ingot"},
		{"", "group:stick", ""},
		{"", "group:stick", ""}
	}
})
