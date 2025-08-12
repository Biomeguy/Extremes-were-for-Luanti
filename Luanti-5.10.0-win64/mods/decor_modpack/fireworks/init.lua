
local lp = core.settings:get_bool("limit_particles")

core.register_entity("fireworks:spark", {
initial_properties = {
	visual = "sprite",
	physical = true,
	textures = {"firework_rocket_spark.png"},
	collisionbox = {-.1,-.1,-.1,.1,.1,.1},
	glow = 14
},
	age = 0,
	on_step = function(self, dtime)
		self.age = self.age+dtime

		local pos = self.object:get_pos()	if not pos then return end
		local n = core.get_node(pos)
	if n.name ~= "air" and core.get_item_group(n.name, "water") > 0 or lp == true then
		core.add_item(pos, "fireworks:firework_".. self.value)
		self.object:remove() return
	end

	if self.age > 3 then
		local fwtype = self.value or 0
if fwtype ~= 1 and fwtype ~= 2 and fwtype ~= 3 and fwtype ~= 4 and fwtype ~= 5 then
	core.add_particle({
		pos = pos,
		expirationtime = .9,
		size = 70,
		texture = "firework_flare.png",
		animation = {type = "vertical_frames", aspect_w = 64, aspect_h = 64, length = 1.},
		glow = 13 }) end

if fwtype >= 1 and fwtype ~= 5 and fwtype ~= 10 and fwtype ~= 11 and fwtype ~= 12 then
		local V = math.random(2, 4)
		local C = "r"
	if fwtype == 2 or fwtype == 7 then	C = "g"
	elseif fwtype == 3 or fwtype == 8 then	C = "b"
	elseif fwtype == 4 or fwtype == 9 then	C = "pmv" end
	if fwtype > 5 then
	core.add_particlespawner({
		amount = 99,
		time = .1,
		minpos = vector.subtract(pos, .2),
		maxpos = vector.add(pos, .2),
		minvel = {x=-V,y=6.5,z=-V},
		maxvel = {x=V,y=9,z=V},
		minacc = {x=-2,y=-9,z=-2},
		maxacc = {x=2,y=-12,z=2},
		exptime = {min = 2.7, max = 3},
		minsize = 9,
		maxsize = 10,
		collisiondetection = true,
		texture = "firework_spark_".. C ..".png",
		animation = {type = "vertical_frames", aspect_w = 8, aspect_h = 8, length = -1},
		glow = 14 })
	else
	core.add_particlespawner({
		amount = 99,
		time = .1,
		minpos = vector.subtract(pos, .2),
		maxpos = vector.add(pos, .2),
		minvel = {x=-V,y=-V,z=-V},
		maxvel = {x=V,y=V,z=V},
		minacc = {x=-2,y=-2,z=-2},
		maxacc = {x=2,y=2,z=2},
		exptime = {min = 2.7, max = 3},
		minsize = 9,
		maxsize = 11,
		collisiondetection = true,
		texture = "firework_spark_".. C ..".png",
		animation = {type = "vertical_frames", aspect_w = 8, aspect_h = 8, length = -1},
		glow = 14 }) end
elseif fwtype == 5 then
	core.add_particle({
		pos = pos,
		expirationtime = .9,
		size = 120,
		texture = "firework_flare.png",
		animation = {type = "vertical_frames", aspect_w = 64, aspect_h = 64, length = 1.},
		glow = 13 })
	core.add_particle({
		pos = pos,
		acceleration = {x=0, y=-.1, z=0},
		expirationtime = .9,
		size = 120,
		texture = "firework_face.png",
		animation = {type = "vertical_frames", aspect_w = 64, aspect_h = 64, length = 1.},
		glow = 13 })
elseif fwtype == 10 then
	core.add_particlespawner({
		amount = 99,
		time = .1,
		minpos = pos,
		maxpos = pos,
		minvel = {x=-5, y=-5, z=-5},
		maxvel = {x=5, y=5, z=5},
		minacc = {x=0, y=-1, z=0},
		maxacc = {x=0, y=-2, z=0},
		exptime = {min = 1.5, max = 2},
		minsize = 5,
		maxsize = 6,
		collisiondetection = true,
		texture = "small_sparkle.png",
		glow = 14 })
elseif fwtype == 11 or fwtype == 12 then
		local C = "red"
	if fwtype == 12 then	C = "blue" end
	core.add_particlespawner({
		amount = 256,
		time = .1,
		minpos = pos,
		maxpos = pos,
		minvel = {x=-3, y=-2, z=-3},
		maxvel = {x=3,  y=6,  z=3},
		minacc = {x=0, y=-2, z=0},
		maxacc = {x=0, y=-4, z=0},
		exptime = {min = 2, max = 2.7},
		minsize = 4,
		maxsize = 5,
		collisiondetection = true,
		texture = "sparkle_".. C ..".png",
		glow = 14 })
else
	core.add_particlespawner({
		amount = 99,
		time = .1,
		minpos = vector.subtract(pos, .3),
		maxpos = vector.add(pos, .3),
		minvel = {x=-3,y=-2,z=-3},
		maxvel = {x=3,y=6,z=3},
		minacc = {x=0,y=-2,z=0},
		maxacc = {x=0,y=-4,z=0},
		exptime = {min = 2.7, max = 3},
		minsize = 5,
		maxsize = 5,
		collisiondetection = true,
		texture = "firework_spark_y.png",
		animation = {type = "vertical_frames", aspect_w = 5, aspect_h = 5, length = -1},
		glow = 14 }) end
	core.sound_play("firework_pop", {pos = pos, gain = 1, max_hear_distance = 128})
	if n.name == "air" then
		core.set_node(pos, {name = "default:light"})
		core.get_node_timer(pos):start(1)
	end
	self.object:remove() return end

	core.add_particle({
		pos = pos,
		acceleration = {x=math.random(-5,5)/10, y=-1, z=math.random(-5,5)/10},
		expirationtime = math.random(10,13)/10,
		size = math.random(4,6),
		collisiondetection = true,
		texture = "firework_rocket_spark.png",
		glow = 13 })
	end,
})

core.register_tool("fireworks:gun", {
	description = "Firework Gun",
	inventory_image = "firework_gun_0.png^[transformFX",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	on_use = function(item, user, pointd)
		if pointd.type == "node" or lp == true then
			return
		end
		local inv = user:get_inventory()
		local number = nil
	for i= 0, 12 do
		if number == nil then
	if inv:contains_item("main", "fireworks:firework_".. i) then
		if not core.is_creative_enabled(user:get_player_name()) then
			inv:remove_item("main", "fireworks:firework_".. i)
			item:add_wear(5)
		end
		number = i
	end
		end
	end
	if number == nil then
		return
	end
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local obj = core.add_entity({x=pos.x+dir.x, y=pos.y+dir.y+1.5, z=pos.z+dir.z}, "fireworks:spark")
		obj:get_luaentity().value = number
		core.sound_play("firework_whistle", {object = obj, gain = .8, max_hear_distance = 15})
		obj:set_velocity({x=dir.x*19, y=dir.y*19, z=dir.z*19})
		obj:set_acceleration({x=dir.x*2, y=-2, z=dir.z*2})
		return item
	end
})

core.register_craft({
	output = "fireworks:gun",
	recipe = {
		{"default:sword_steel", "group:wood", "default:glue"},
		{"", "default:stick", "stairs:slab_wood"}
	},
	replacements = {{"default:sword_steel", "default:sword_steel"}}
})

local function firework_launch(pos, fwtype)
	if lp ~= true then
	core.remove_node(pos)
	local obj = core.add_entity({x=pos.x, y=pos.y+.2, z=pos.z}, "fireworks:spark")
	core.sound_play("firework_whistle", {object = obj, gain = .8, max_hear_distance = 15})
	obj:get_luaentity().value = fwtype
	obj:set_velocity({x=0, y=15, z=0})
	obj:set_acceleration({x=0, y=-2, z=0})
	end
end

core.register_node("fireworks:firework_0", {
	description = "Yellow Firework",
	inventory_image = "firework_rocket_item.png",
	drawtype = "mesh",
	mesh = "firework_rocket.b3d",
	tiles = {"firework_rocket.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
collision_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
selection_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3, firework=1},
	color = {r=225,g=225,b=100},
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "fire:flint_and_steel" then
		firework_launch(pos, 0)
		end
	end,
	on_timer = function(pos)
		firework_launch(pos, 0)
	end
})

core.register_node("fireworks:firework_1", {
	description = "Red Firework",
	inventory_image = "firework_rocket_item.png",
	drawtype = "mesh",
	mesh = "firework_rocket.b3d",
	tiles = {"firework_rocket.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
collision_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
selection_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3, firework=1},
	color = {r=255,g=100,b=100},
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "fire:flint_and_steel" then
		firework_launch(pos, 1)
		end
	end,
	on_timer = function(pos)
		firework_launch(pos, 1)
	end
})

core.register_node("fireworks:firework_2", {
	description = "Green Firework",
	inventory_image = "firework_rocket_item.png",
	drawtype = "mesh",
	mesh = "firework_rocket.b3d",
	tiles = {"firework_rocket.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
collision_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
selection_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3, firework=1},
	color = {r=100,g=255,b=100},
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "fire:flint_and_steel" then
		firework_launch(pos, 2)
		end
	end,
	on_timer = function(pos)
		firework_launch(pos, 2)
	end
})

core.register_node("fireworks:firework_3", {
	description = "Blue Firework",
	inventory_image = "firework_rocket_item.png",
	drawtype = "mesh",
	mesh = "firework_rocket.b3d",
	tiles = {"firework_rocket.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
collision_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
selection_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3, firework=1},
	color = {r=100,g=100,b=255},
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "fire:flint_and_steel" then
		firework_launch(pos, 3)
		end
	end,
	on_timer = function(pos)
		firework_launch(pos, 3)
	end
})

core.register_node("fireworks:firework_4", {
	description = "Purple Magenta Violet Firework",
	inventory_image = "firework_rocket_item.png",
	drawtype = "mesh",
	mesh = "firework_rocket.b3d",
	tiles = {"firework_rocket.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
collision_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
selection_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3, firework=1},
	color = {r=255,g=80,b=255},
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "fire:flint_and_steel" then
		firework_launch(pos, 4)
		end
	end,
	on_timer = function(pos)
		firework_launch(pos, 4)
	end
})

core.register_node("fireworks:firework_5", {
	description = "Smile Firework",
	inventory_image = "firework_rocket_item.png",
	drawtype = "mesh",
	mesh = "firework_rocket.b3d",
	tiles = {"firework_rocket.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
collision_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
selection_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3, firework=1},
	color = {r=225,g=225,b=100},
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "fire:flint_and_steel" then
		firework_launch(pos, 5)
		end
	end,
	on_timer = function(pos)
		firework_launch(pos, 5)
	end
})

core.register_node("fireworks:firework_6", {
	description = "Red Shower Firework",
	inventory_image = "firework_rocket_item.png",
	drawtype = "mesh",
	mesh = "firework_rocket.b3d",
	tiles = {"firework_rocket.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
collision_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
selection_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3, firework=1},
	color = {r=255,g=100,b=100},
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "fire:flint_and_steel" then
		firework_launch(pos, 6)
		end
	end,
	on_timer = function(pos)
		firework_launch(pos, 6)
	end
})

core.register_node("fireworks:firework_7", {
	description = "Green Shower Firework",
	inventory_image = "firework_rocket_item.png",
	drawtype = "mesh",
	mesh = "firework_rocket.b3d",
	tiles = {"firework_rocket.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
collision_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
selection_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3, firework=1},
	color = {r=100,g=255,b=100},
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "fire:flint_and_steel" then
		firework_launch(pos, 7)
		end
	end,
	on_timer = function(pos)
		firework_launch(pos, 7)
	end
})

core.register_node("fireworks:firework_8", {
	description = "Blue Shower Firework",
	inventory_image = "firework_rocket_item.png",
	drawtype = "mesh",
	mesh = "firework_rocket.b3d",
	tiles = {"firework_rocket.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
collision_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
selection_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3, firework=1},
	color = {r=100,g=100,b=255},
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "fire:flint_and_steel" then
		firework_launch(pos, 8)
		end
	end,
	on_timer = function(pos)
		firework_launch(pos, 8)
	end
})

core.register_node("fireworks:firework_9", {
	description = "Purple Magenta Violet Shower Firework",
	inventory_image = "firework_rocket_item.png",
	drawtype = "mesh",
	mesh = "firework_rocket.b3d",
	tiles = {"firework_rocket.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
collision_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
selection_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3, firework=1},
	color = {r=255,g=80,b=255},
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "fire:flint_and_steel" then
		firework_launch(pos, 9)
		end
	end,
	on_timer = function(pos)
		firework_launch(pos, 9)
	end
})

core.register_node("fireworks:firework_10", {
	description = "Yellow Ball Firework",
	inventory_image = "firework_rocket_item.png",
	drawtype = "mesh",
	mesh = "firework_rocket.b3d",
	tiles = {"firework_rocket.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
collision_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
selection_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3, firework=1},
	color = {r=225,g=225,b=100},
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "fire:flint_and_steel" then
		firework_launch(pos, 10)
		end
	end,
	on_timer = function(pos)
		firework_launch(pos, 10)
	end
})

core.register_node("fireworks:firework_11", {
	description = "Red Ball Firework",
	inventory_image = "firework_rocket_item.png",
	drawtype = "mesh",
	mesh = "firework_rocket.b3d",
	tiles = {"firework_rocket.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
collision_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
selection_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3, firework=1},
	color = {r=255,g=100,b=100},
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "fire:flint_and_steel" then
		firework_launch(pos, 11)
		end
	end,
	on_timer = function(pos)
		firework_launch(pos, 11)
	end
})

core.register_node("fireworks:firework_12", {
	description = "Blue Ball Firework",
	inventory_image = "firework_rocket_item.png",
	drawtype = "mesh",
	mesh = "firework_rocket.b3d",
	tiles = {"firework_rocket.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
collision_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
selection_box = {
	type = "fixed",
	fixed = {{-.2, -.5, -.2, .2, .5, .2}},
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3, firework=1},
	color = {r=100,g=100,b=255},
	on_rightclick = function(pos, node, clicker, item)
		if item:get_name() == "fire:flint_and_steel" then
		firework_launch(pos, 12)
		end
	end,
	on_timer = function(pos)
		firework_launch(pos, 12)
	end
})

core.register_node("fireworks:firework_plant_1", {
	description = "Firework Plant",
	drawtype = "plantlike",
	tiles = {"fireworks_firework_plant_1.png"},
	inventory_image = "fireworks_firework_plant_1.png",
	paramtype = "light",
	paramtype2 = "degrotate",
	visual_scale = 1.2,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.25, .3}
	},
	on_construct = function(pos)
		core.swap_node(pos, {name = "fireworks:firework_plant_1", param2 = 60})
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_timer = function(pos, elapsed)
		local under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		if not under then
			-- Node under not yet loaded, try later
			core.get_node_timer(pos):start(300)
			return
		end

		if core.get_item_group(under.name, "soil") == 0 then
			core.get_node_timer(pos):stop()
			return
		end

		core.set_node(pos, {name = "fireworks:firework_plant_2", param2 = 60})
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_rotate = screwdriver.disallow,
	groups = {snappy=1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_craft({
	output = "fireworks:firework_plant_1 2",
	recipe = {
		{"default:paper", "tnt:gunpowder", "default:stick"}
	}
})

core.register_node("fireworks:firework_plant_2", {
	drawtype = "plantlike",
	tiles = {"fireworks_firework_plant_2.png"},
	paramtype = "light",
	paramtype2 = "degrotate",
	visual_scale = 1.2,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.25, .3}
	},
	drop = "fireworks:firework_plant_1",
	on_timer = function(pos, elapsed)
		local under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		if not under then
			-- Node under not yet loaded, try later
			core.get_node_timer(pos):start(300)
			return
		end

		if core.get_item_group(under.name, "soil") == 0 then
			core.get_node_timer(pos):stop()
			return
		end

		core.set_node(pos, {name = "fireworks:firework_plant_3", param2 = 60})
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_rotate = screwdriver.disallow,
	groups = {snappy=1, attached_node=1, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("fireworks:firework_plant_3", {
	drawtype = "plantlike",
	tiles = {"fireworks_firework_plant_3.png"},
	paramtype = "light",
	paramtype2 = "degrotate",
	visual_scale = 1.2,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, -.25, .3}
	},
	drop = "fireworks:firework_plant_1",
	on_timer = function(pos, elapsed)
		local under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		if not under then
			-- Node under not yet loaded, try later
			core.get_node_timer(pos):start(300)
			return
		end

		if core.get_item_group(under.name, "soil") == 0 then
			core.get_node_timer(pos):stop()
			return
		end

		core.set_node(pos, {name = "fireworks:firework_".. math.random(0, 12)})
if lp ~= true then
		core.get_node_timer(pos):start(math.random(300, 1500))
end
	end,
	on_rotate = screwdriver.disallow,
	groups = {snappy=1, attached_node=1, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})
