-- Load support for intllib.
local MP = core.get_modpath(core.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

vehicles = {}

dofile(core.get_modpath("vehicles").."/api.lua")

local step = 1.1

local enable_built_in = true

if enable_built_in then
core.register_entity("vehicles:missile", {
	initial_properties = {
visual = "mesh",
mesh = "missile.b3d",
textures = {"vehicles_missile.png"},
collisionbox = {-1, -.5, -1, 1, .5, 1},
	},
	on_rightclick = function(self, clicker)
		clicker:set_attach(self.object, "", {x=0,y=0,z=0}, {x=0,y=1,z=0}) 
	end,
	on_step = function(self, obj, pos)
		core.after(10, function()
			self.object:remove()
		end)
		local player = self.launcher
		if player == nil then
			self.object:remove()
			return
		end
		local dir = player:get_look_dir();
		if dir == nil then
			self.object:remove()
			return
		end
		local vec = {x=dir.x*16,y=dir.y*16,z=dir.z*16}
		local yaw = player:get_look_horizontal()
		self.object:set_yaw(yaw+math.pi/2)
		self.object:set_velocity(vec)
		local pos = self.object:get_pos()
		local vec = self.object:get_velocity()
core.add_particlespawner({
	amount = 1,
	time = .5,
	minpos = {x=pos.x-.2, y=pos.y, z=pos.z-.2},
	maxpos = {x=pos.x+.2, y=pos.y, z=pos.z+.2},
	minvel = {x=-vec.x/2, y=-vec.y/2, z=-vec.z/2},
	maxvel = {x=-vec.x, y=-vec.y, z=-vec.z},
	minacc = {x=0, y=-1, z=0},
	maxacc = {x=0, y=-1, z=0},
	exptime = {min = .2, max = .6},
	minsize = 3,
	maxsize = 4,
	texture = "vehicles_smoke.png"})
		local objs = core.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "vehicles:missile" and obj ~= self.vehicle and obj ~= self.launcher and obj:get_luaentity().name ~= "__builtin:item" then
					obj:punch(self.object, 1., {
						full_punch_interval=1.,
						damage_groups={fleshy=12},
					}, nil)
					local pos = self.object:getpos()
					tnt.boom(pos, {damage_radius=5,radius=5,ignore_protection=false})
					self.object:remove()
				end
			end
		end

		for dx=-1,1 do
			for dy=-1,1 do
				for dz=-1,1 do
					local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
					local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = core.get_node(p).name
					if n ~= "vehicles:missile" and n ~= "vehicles:jet" and n ~= "air" then
						local pos = self.object:getpos()
						tnt.boom(pos, {damage_radius=5,radius=5,ignore_protection=false})
						self.object:remove()
						return
					end
				end
			end
		end
	end,
})


core.register_craftitem("vehicles:missile_2_item", {
	description = S("Missile"),
	inventory_image = "vehicles_missile_inv.png"
})

core.register_craftitem("vehicles:bullet_item", {
	description = S("Bullet"),
	inventory_image = "vehicles_bullet_inv.png"
})


core.register_entity("vehicles:missile_2", {
	initial_properties = {
visual = "mesh",
mesh = "missile.b3d",
textures = {"vehicles_missile.png"},
collisionbox = {0,0,0, 0,0,0},
	},
	on_step = function(self, dtime)
		core.after(10, function()
			self.object:remove()
		end)
		local velo = self.object:get_velocity()
		if velo.y <= 1.2 and velo.y >= -1.2 then
			self.object:set_animation({x=1, y=1}, 5, 0)
		elseif velo.y <= -1.2 then
			self.object:set_animation({x=4, y=4}, 5, 0)
		elseif velo.y >= 1.2 then
			self.object:set_animation({x=2, y=2}, 5, 0)
		end
		local pos = self.object:get_pos()
core.add_particlespawner({
	amount = 2,
	time = .5,
	minpos = {x=pos.x-.2, y=pos.y, z=pos.z-.2},
	maxpos = {x=pos.x+.2, y=pos.y, z=pos.z+.2},
	minvel = {x=-velo.x/2, y=-velo.y/2, z=-velo.z/2},
	maxvel = {x=-velo.x, y=-velo.y, z=-velo.z},
	minacc = {x=0, y=-1, z=0},
	maxacc = {x=0, y=-1, z=0},
	exptime = {min = .2, max = .6},
	minsize = 3,
	maxsize = 4,
	texture = "vehicles_smoke.png"})
		local objs = core.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "vehicles:missile_2" and obj ~= self.vehicle and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.launcher, 1., {
							full_punch_interval=1.,
							damage_groups={fleshy=12},
						}, nil)
						self.object:remove()
					end
				end
			end

		for dx=-1,1 do
			for dy=-1,1 do
				for dz=-1,1 do
					local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
					local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = core.get_node(p).name
					if n ~= "vehicles:missile_2" and n ~= "vehicles:tank" and n ~= "vehicles:jet" and n ~= "air" then
						local pos = self.object:getpos()
	core.add_particlespawner({
		amount = 30,
		time = .5,
		minpos = vector.subtract(pos, .5),
		maxpos = vector.add(pos, .5),
		minvel = {x=-1, y=-1, z=-1},
		maxvel = {x=1, y=1, z=1},
		minacc = {x=0, y=.2, z=0},
		maxacc = {x=0, y=.6, z=0},
		exptime = {min = .5, max = 1},
		minsize = 10,
		maxsize = 20,
		texture = "vehicles_explosion.png"})
						tnt.boom(pos, {damage_radius=5,radius=5,ignore_protection=false})
						self.object:remove()
						return
					end
				end
			end
		end
	end,
})

core.register_entity("vehicles:water", {
	initial_properties = {
visual = "sprite",
textures = {"blank.png"},
collisionbox = {0,0,0, 0,0,0},
	},
	on_activate = function(self)
		self.object:set_acceleration({x=0, y=-1, z=0})
	end,
	on_step = function(self, dtime)
		core.after(5, function()
			self.object:remove()
		end)
		local pos = self.object:get_pos()
	core.add_particlespawner({
		amount = 1,
		time = 1,
		pos = pos,
		minvel = {x=0, y=0, z=0},
		maxvel = {x=0, y=-.2, z=0},
		minacc = {x=0, y=-1, z=0},
		maxacc = {x=0, y=-1, z=0},
		exptime = 1,
		minsize = 4,
		maxsize = 5,
		texture = "vehicles_water.png"})
	local node = core.get_node(pos).name
	if node == "fire:basic_flame" then
	core.remove_node(pos)
	end
	end
})

core.register_entity("vehicles:bullet", {
	initial_properties = {
visual = "mesh",
mesh = "bullet.b3d",
textures = {"vehicles_bullet.png"},
collisionbox = {0,0,0, 0,0,0},
	},
	on_activate = function(self)
		local pos = self.object:get_pos()
		core.sound_play("shot", 
		{gain = .4, max_hear_distance = 3, loop = false})
	end,
	on_step = function(self, dtime)
		core.after(10, function()
			self.object:remove()
		end)
		local pos = self.object:get_pos()
		local objs = core.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "vehicles:bullet" and obj ~= self.vehicle and obj:get_luaentity().name ~= "__builtin:item" then
					obj:punch(self.launcher, 1., {
						full_punch_interval=1.,
						damage_groups={fleshy=5},
					}, nil)
					self.object:remove()
				end
			end
		end

		for dx=-1,1 do
			for dy=-1,1 do
				for dz=-1,1 do
					local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
					local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = core.get_node(p).name
					if n ~= "vehicles:bullet" and n ~= "air" then
						self.object:remove()
						return
					end
				end
			end
		end
	end,
})

core.register_entity("vehicles:tank", {
	initial_properties = {
visual = "mesh",
mesh = "tank.b3d",
textures = {"vehicles_tank.png"},
physical = true,
collisionbox = {-1, 0, -.9, 1, 1.5, .9},
hp_max = 200,
stepheight = 1.5,
	},
	owner = "",
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=13, z=-3}, true, {x=0, y=6, z=-2})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
		speed = 6,
		decell = .5, 
		shoots = true, 
		arrow = "vehicles:missile_2",
		reload_time = 1,
		shoot_y = 2,
		moving_anim = {x=3, y=8},
		stand_anim = {x=1, y=1},
		})
	end,
})

vehicles.register_spawner("vehicles:tank", S("Tank"), "vehicles_tank_inv.png")

core.register_entity("vehicles:tank2", {
	initial_properties = {
visual = "mesh",
mesh = "tank.b3d",
textures = {"vehicles_tank2.png"},
stepheight = 1.5,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -.9, 1, 1.5, .9},
	},
	owner = "",
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=13, z=-3}, true, {x=0, y=6, z=-2})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
		speed = 6,
		decell = .5, 
		shoots = true, 
		arrow = "vehicles:missile_2",
		reload_time = 1,
		shoot_y = 2,
		moving_anim = {x=3, y=8},
		stand_anim = {x=1, y=1},
		})
	end,
})

vehicles.register_spawner("vehicles:tank2", S("Desert Tank"), "vehicles_tank2_inv.png")

core.register_entity("vehicles:turret", {
	initial_properties = {
visual = "mesh",
mesh = "turret_gun.b3d",
textures = {"vehicles_turret.png"},
stepheight = 1.5,
hp_max = 50,
physical = true,
collisionbox = {-.6, 0, -.6, .6, .9, .6},
	},
	groups = {fleshy=3, level=5},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5.5, z=-7}, true, {x=0, y=1, z=-6})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
	self.object:setvelocity({x=0, y=-1, z=0})
	if self.driver then
		vehicles.object_drive(self, dtime, {
			fixed = true,
			shoot_y = 1.5,
			arrow = "vehicles:bullet",
			shoots = true,
			reload_time = .2,
		})
		return false
		end
		return true
	end,
})

vehicles.register_spawner("vehicles:turret", S("Gun turret"), "vehicles_turret_inv.png")

core.register_entity("vehicles:assaultsuit", {
	initial_properties = {
visual = "mesh",
mesh = "assaultsuit.b3d",
textures = {"vehicles_assaultsuit.png"},
stepheight = 1.5,
hp_max = 200,
physical = true,
collisionbox = {-.8, 0, -.8, .8, 3, .8},
	},
	owner = "",
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=20, z=8})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
		speed = 8,
		decell = .5, 
		shoots = true,
		arrow = "vehicles:bullet",
		reload_time = .2,
		shoots2 = true,
		arrow2 = "vehicles:missile_2",
		reload_time2 = 1,
		moving_anim = {x=120, y=140},
		stand_anim = {x=1, y=1},
		jump_type = "hover",
		jump_anim = {x=60, y=70},
		shoot_anim = {x=40, y=51},
		shoot_anim2 = {x=40, y=51},
		shoot_y = 3.5,
		shoot_y2 = 4,
		},
		function() self.standing = false end,
		function()
			if not self.standing then
				self.object:set_animation({x=1, y=1}, 20, 0)
				self.standing = true
			end
		end)
	end,
})

vehicles.register_spawner("vehicles:assaultsuit", "Assault Suit", "vehicles_assaultsuit_inv.png")

core.register_entity("vehicles:firetruck", {
	initial_properties = {
visual = "mesh",
mesh = "firetruck.b3d",
textures = {"vehicles_firetruck.png"},
stepheight = 1.5,
hp_max = 200,
physical = true,
collisionbox = {-1.1, 0, -1.1, 1.1, 1.9, 1.1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=5}, false, {x=0, y=2, z=5})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 10,
			decell = .5,
			shoots = true,
			arrow = "vehicles:water",
			infinite_arrow = true,
			reload_time = .2,
			driving_sound = "engine",
			sound_duration = 11,
			handling = {initial=1.3, braking=2},
		})
	end,
})

vehicles.register_spawner("vehicles:firetruck", S("Fire truck"), "vehicles_firetruck_inv.png")

core.register_entity("vehicles:geep", {
	initial_properties = {
visual = "mesh",
mesh = "geep.b3d",
textures = {"vehicles_geep.png"},
stepheight = 1.5,
hp_max = 200,
physical = true,
collisionbox = {-1.1, 0, -1.1, 1.1, 1, 1.1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif self.driver and clicker ~= self.driver and not self.rider then
		clicker:set_attach(self.object, "", {x=0, y=5, z=-5}, false, {x=0, y=0, z=-2})
		self.rider = true
		elseif self.driver and clicker ~=self.driver and self.rider then
		clicker:set_detach()
		self.rider = false
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=-2, y=7, z=-1}, true, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 14, 
			decell = .6,
			boost = true,
			boost_duration = 6,
			boost_effect = "vehicles_nitro.png",
			sound_duration = 11,
			driving_sound = "engine",
			brakes = true,
		},
		function()
		local pos = self.object:get_pos()
		core.add_particlespawner({
			amount = 4,
			time = 1,
			pos = pos,
			exptime = {min = .5, max = 1},
			minsize = 10,
			maxsize = 15,
			texture = "vehicles_dust.png"})
		end)
	end,
})

vehicles.register_spawner("vehicles:geep", S("Geep"), "vehicles_geep_inv.png")

core.register_entity("vehicles:ambulance", {
	initial_properties = {
visual = "mesh",
mesh = "ambulance.b3d",
textures = {"vehicles_ambulance.png"},
stepheight = 1.5,
hp_max = 200,
physical = true,
collisionbox = {-1.4, 0, -1.4, 1.4, 2, 1.4},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif self.driver and clicker ~= self.driver and not self.rider then
		clicker:set_attach(self.object, clicker, {x=0, y=5, z=4}, false, {x=0, y=7, z=10})
		self.rider = true
		clicker:set_hp(20)
		elseif self.driver and clicker ~= self.driver and self.rider then
		clicker:set_detach()
		self.rider = false
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=7, z=14})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 13, 
			decell = .6,
			moving_anim = {x=1, y=3},
			stand_anim = {x=1, y=1},
			driving_sound = "engine",
			sound_duration = 11,
			handling = {initial=1.3, braking=2},
			brakes = true,
		},
		function()
			if not self.siren_ready then
				core.sound_play("ambulance", 
				{pos=self.object:getpos(), gain = .1, max_hear_distance = 3, loop = false})
				self.siren_ready = true
				core.after(4, function()
					self.siren_ready = false
				end)
			end
		end)
	end,
})

vehicles.register_spawner("vehicles:ambulance", S("Ambulance"), "vehicles_ambulance_inv.png")

core.register_entity("vehicles:ute", {
	initial_properties = {
visual = "mesh",
mesh = "ute.b3d",
textures = {"vehicles_ute.png"},
stepheight = 1.5,
hp_max = 200,
physical = true,
collisionbox = {-1.4, 0, -1.4, 1.4, 1, 1.4},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif self.driver and clicker ~= self.driver and not self.rider then
		clicker:set_attach(self.object, clicker, {x=0, y=5, z=-5}, false, {x=0, y=0, z=-2})
		self.rider = true
		elseif self.driver and clicker ~=self.driver and self.rider then
		clicker:set_detach()
		self.rider = false
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 17, 
			decell = .95,
			boost = true,
			boost_duration = 6,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		},
		function()
		local pos = self.object:get_pos()
		core.add_particlespawner({
			amount = 15,
			time = 1,
			pos = pos,
			exptime = {min = .5, max = 1},
			minsize = 10,
			maxsize = 15,
			texture = "vehicles_dust.png"})
		end)
	end,
})

vehicles.register_spawner("vehicles:ute", S("Ute (dirty)"), "vehicles_ute_inv.png")

core.register_entity("vehicles:ute2", {
	initial_properties = {
visual = "mesh",
mesh = "ute.b3d",
textures = {"vehicles_ute2.png"},
stepheight = 1.5,
hp_max = 200,
physical = true,
collisionbox = {-1.4, 0, -1.4, 1.4, 1, 1.4},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif self.driver and clicker ~= self.driver and not self.rider then
		clicker:set_attach(self.object, clicker, {x=0, y=5, z=-5}, {x=0, y=0, z=0})
		self.rider = true
		elseif self.driver and clicker ~=self.driver and self.rider then
		clicker:set_detach()
		self.rider = false
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
	self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 17, 
			decell = .95,
			boost = true,
			boost_duration = 6,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("vehicles:ute2", S("Ute (clean)"), "vehicles_ute_inv.png")

core.register_entity("vehicles:astonmaaton", {
	initial_properties = {
visual = "mesh",
mesh = "astonmaaton.b3d",
textures = {"vehicles_astonmaaton.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
	self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 19, 
			decell = .99,
			boost = true,
			boost_duration = 5,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("vehicles:astonmaaton", S("Aston Maaton (white)"), "vehicles_astonmaaton_inv.png")

core.register_entity("vehicles:nizzan", {
	initial_properties = {
visual = "mesh",
mesh = "nizzan.b3d",
textures = {"vehicles_nizzan.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 18, 
			decell = .99,
			boost = true,
			boost_duration = 5,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		},
		function()
		local pos = self.object:get_pos()
		core.add_particlespawner({
			amount = 15,
			time = 1,
			pos = pos,
			exptime = {min = .5, max = 1},
			minsize = 10,
			maxsize = 15,
			texture = "vehicles_dust.png"})
		end)
	end,
})

vehicles.register_spawner("vehicles:nizzan", S("Nizzan (brown)"), "vehicles_nizzan_inv.png")

core.register_entity("vehicles:nizzan2", {
	initial_properties = {
visual = "mesh",
mesh = "nizzan.b3d",
textures = {"vehicles_nizzan2.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_activate = function(self)
		self.nitro = true
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 18, 
			decell = .99,
			boost = true,
			boost_duration = 5,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		},
		function()
		local pos = self.object:get_pos()
		core.add_particlespawner({
			amount = 15,
			time = 1,
			pos = pos,
			exptime = {min = .2, max = .5},
			minsize = 20,
			maxsize = 25,
			texture = "vehicles_dust.png"})
		end)
	end,
})

vehicles.register_spawner("vehicles:nizzan2", S("Nizzan (green)"), "vehicles_nizzan_inv2.png")

core.register_entity("vehicles:lambogoni", {
	initial_properties = {
visual = "mesh",
mesh = "lambogoni.b3d",
textures = {"vehicles_lambogoni.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 19, 
			decell = .99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("vehicles:lambogoni", S("Lambogoni (grey)"), "vehicles_lambogoni_inv.png")

core.register_entity("vehicles:lambogoni2", {
	initial_properties = {
visual = "mesh",
mesh = "lambogoni.b3d",
textures = {"vehicles_lambogoni2.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 19, 
			decell = .99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("vehicles:lambogoni2", S("Lambogoni (yellow)"), "vehicles_lambogoni2_inv.png")

core.register_entity("vehicles:masda", {
	initial_properties = {
visual = "mesh",
mesh = "masda.b3d",
textures = {"vehicles_masda.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 21, 
			decell = .99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("vehicles:masda", S("Masda (pink)"), "vehicles_masda_inv.png")

core.register_entity("vehicles:masda2", {
	initial_properties = {
visual = "mesh",
mesh = "masda.b3d",
textures = {"vehicles_masda2.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_activate = function(self)
		self.nitro = true
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 21, 
			decell = .99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("vehicles:masda2", S("Masda (orange)"), "vehicles_masda_inv2.png")

core.register_entity("vehicles:policecar", {
	initial_properties = {
visual = "mesh",
mesh = "policecar.b3d",
textures = {"vehicles_policecar.png"},
stepheight = step,
hp_max = 190,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_activate = function(self)
		self.nitro = true
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 20, 
			decell = .99,
			boost = true,
			boost_duration = 8,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("vehicles:policecar", S("Police Car (US)"), "vehicles_policecar_inv.png")

core.register_entity("vehicles:musting", {
	initial_properties = {
visual = "mesh",
mesh = "musting.b3d",
textures = {"vehicles_musting.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_activate = function(self)
		self.nitro = true
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 17, 
			decell = .99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("vehicles:musting", S("Musting (purple)"), "vehicles_musting_inv2.png")

core.register_entity("vehicles:musting2", {
	initial_properties = {
visual = "mesh",
mesh = "musting.b3d",
textures = {"vehicles_musting2.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 17, 
			decell = .99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("vehicles:musting2", S("Musting (white)"), "vehicles_musting_inv.png")

core.register_entity("vehicles:fourd", {
	initial_properties = {
visual = "mesh",
mesh = "fourd.b3d",
textures = {"vehicles_fourd.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_activate = function(self)
		self.nitro = true
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 15, 
			decell = .99,
			driving_sound = "engine",
			sound_duration = 11,
			moving_anim = {x=3, y=18},
			stand_anim = {x=1, y=1},
			brakes = true,
		})
	end,
})

vehicles.register_spawner("vehicles:fourd", S("Fourd"), "vehicles_fourd_inv.png")

core.register_entity("vehicles:fewawi", {
	initial_properties = {
visual = "mesh",
mesh = "fewawi.b3d",
textures = {"vehicles_fewawi.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		local ctrl = clicker:get_player_control()
		if ctrl.sneak then
	if not self.lights then
	self.object:set_properties({textures = {"vehicles_fewawi_lights.png"},})
	self.lights = true
	else
	self.object:set_properties({textures = {"vehicles_fewawi.png"},})
	self.lights = false		
	end
		else
	if self.driver and clicker == self.driver then
	vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
	elseif not self.driver then
	vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
	core.sound_play("engine_start", 
	{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
	self.sound_ready = false
	core.after(14, function()
	self.sound_ready = true
	end)
	end
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 20, 
			decell = .99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("vehicles:fewawi", S("Fewawi (red)"), "vehicles_fewawi_inv.png")

core.register_entity("vehicles:fewawi2", {
	initial_properties = {
visual = "mesh",
mesh = "fewawi.b3d",
textures = {"vehicles_fewawi2.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		local ctrl = clicker:get_player_control()
		if ctrl.sneak then
	if not self.lights then
	self.object:set_properties({textures = {"vehicles_fewawi_lights2.png"},})
	self.lights = true
	else
	self.object:set_properties({textures = {"vehicles_fewawi2.png"},})
	self.lights = false
	end
		else
	if self.driver and clicker == self.driver then
	vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
	elseif not self.driver then
	vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
	core.sound_play("engine_start", 
	{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
	self.sound_ready = false
	core.after(14, function()
	self.sound_ready = true
	end)
	end
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 20, 
			decell = .99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("vehicles:fewawi2", S("Fewawi (blue)"), "vehicles_fewawi_inv2.png")

core.register_entity("vehicles:pooshe", {
	initial_properties = {
visual = "mesh",
mesh = "pooshe.b3d",
textures = {"vehicles_pooshe.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_activate = function(self)
		self.nitro = true
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 15, 
			decell = .99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("vehicles:pooshe", S("Pooshe (red)"), "vehicles_pooshe_inv.png")

core.register_entity("vehicles:pooshe2", {
	initial_properties = {
visual = "mesh",
mesh = "pooshe.b3d",
textures = {"vehicles_pooshe2.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		core.sound_play("engine_start", 
		{to_player=self.driver:get_player_name(), gain = 4, max_hear_distance = 3, loop = false})
		self.sound_ready = false
		core.after(14, function()
		self.sound_ready = true
		end)
		end
	end,
	on_punch = vehicles.on_punch,
	on_activate = function(self)
		self.nitro = true
	end,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 20, 
			decell = .99,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			driving_sound = "engine",
			sound_duration = 11,
			brakes = true,
		})
	end,
})

vehicles.register_spawner("vehicles:pooshe2", S("Pooshe (yellow)"), "vehicles_pooshe_inv2.png")

core.register_entity("vehicles:lightcycle", {
	initial_properties = {
visual = "mesh",
mesh = "lightcycle.b3d",
textures = {"vehicles_lightcycle.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		self.sound_ready = true
		end
	end,
	on_activate = function(self)
		self.nitro = true
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 20, 
			decell = .85,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			place_node = "vehicles:light_barrier",
			place_trigger = true,
			death_node = "vehicles:light_barrier2",
			handling = {initial=3, braking=2.2}
		})
	end,
})

vehicles.register_spawner("vehicles:lightcycle", S("Lightcycle"), "vehicles_lightcycle_inv.png")

core.register_entity("vehicles:lightcycle2", {
	initial_properties = {
visual = "mesh",
mesh = "lightcycle.b3d",
textures = {"vehicles_lightcycle2.png"},
stepheight = step,
hp_max = 200,
physical = true,
collisionbox = {-1, 0, -1, 1.3, 1, 1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=2, z=4})
		self.sound_ready = true
		end
	end,
	on_activate = function(self)
		self.nitro = true
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 20, 
			decell = .85,
			boost = true,
			boost_duration = 4,
			boost_effect = "vehicles_nitro.png",
			place_node = "vehicles:light_barrier2",
			place_trigger = true,
			death_node = "vehicles:light_barrier",
			handling = {initial=3, braking=2.2}
		})
	end,
})

vehicles.register_spawner("vehicles:lightcycle2", S("Lightcycle 2"), "vehicles_lightcycle_inv2.png")

core.register_entity("vehicles:jet", {
	initial_properties = {
visual = "mesh",
mesh = "jet.b3d",
textures = {"vehicles_jet.png"},
hp_max = 200,
physical = true,
collisionbox = {-1, -.9, -.9, 1, .9, .9},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=4, z=3}, false, {x=0, y=4, z=3})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 20, 
			decell = .95,
			shoots = true,
			arrow = "vehicles:missile_2",
			reload_time = 1,
			moving_anim = {x=10, y=10},
			stand_anim = {x=1, y=1},
			fly = true,
			fly_mode = "rise",
		})
	end,
})

vehicles.register_spawner("vehicles:jet", S("Jet"), "vehicles_jet_inv.png")

core.register_entity("vehicles:apache", {
	initial_properties = {
visual = "mesh",
mesh = "apache.b3d",
textures = {"vehicles_helicopter2.png"},
hp_max = 200,
physical = true,
collisionbox = {-1.8, 0, -1.8, 1.8, 1.5, 1.8},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=10, z=17}, true, {x=0, y=10, z=14})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 16, 
			decell = .95,
			shoots = true,
			arrow = "vehicles:missile_2",
			reload_time = 1,
			shoots2 = true,
			shoot_y = 3, 
			shoot_y2 = 1.5,
			arrow2 = "vehicles:bullet",
			reload_time2 = .1,
			moving_anim = {x=2, y=18},
			stand_anim = {x=25, y=25},
			fly = true,
			fly_mode = "rise",
			gravity = .2,
			animation_speed = 40,
		})
	end,
})

vehicles.register_spawner("vehicles:apache", S("Apache Helicopter"), "vehicles_helicopter2_inv.png")

core.register_entity("vehicles:helicopter", {
	initial_properties = {
visual = "mesh",
mesh = "helicopter.b3d",
textures = {"vehicles_helicopter.png"},
hp_max = 100,
physical = true,
collisionbox = {-1.2, 0, -1.2, 1.2, 2, 1.2},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=4, z=1}, false, {x=0, y=2, z=13})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 10, 
			decell = .95,
			moving_anim = {x=1, y=20},
			stand_anim = {x=1, y=1},
			fly = true,
			fly_mode = "rise",
			animation_speed = 35,
		})
	end,
})

vehicles.register_spawner("vehicles:helicopter", S("Helicopter"), "vehicles_helicopter_inv.png")

core.register_entity("vehicles:plane", {
	initial_properties = {
visual = "mesh",
mesh = "plane.b3d",
textures = {"vehicles_plane.png"},
hp_max = 200,
physical = true,
collisionbox = {-1.1, 0, -1, 1, 1.9, 1.1},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=8, z=3}, false, {x=0, y=9, z=0})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		if self.anim and not self.driver then 
			self.object:set_animation({x=1, y=1}, 5, 0)
		end
		return vehicles.on_step(self, dtime, {
			speed = 14, 
			decell = .95,
			fly = true,
			fly_mode = "hold",
		},
		function()
			if not self.anim then
				self.object:set_animation({x=1, y=9}, 20, 0)
				self.anim = true
			end
		end,
		function()
			self.anim = false
		end)
	end,
})

vehicles.register_spawner("vehicles:plane", S("Plane"), "vehicles_plane_inv.png")

core.register_entity("vehicles:parachute", {
	initial_properties = {
visual = "mesh",
mesh = "parachute.b3d",
textures = {"vehicles_parachute.png"},
hp_max = 2,
physical = true,
collisionbox = {-.5, -1, -.5, .5, 1, .5},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=0, z=-1.5}, false, {x=0, y=-4, z=0})
		end
	end,
	on_step = function(self, dtime)
	if self.driver then
		vehicles.object_glide(self, dtime, 8, .92, -.2, "", "")
		return false
		end
		return true
	end,
})

core.register_tool("vehicles:backpack", {
	description = S("Parachute"),
	inventory_image = "vehicles_backpack.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	on_use = function(item, user, pointd)
		local dir = user:get_look_dir()
		local pos = user:get_pos()
--		local pname = user:get_player_name()
		local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+1+dir.y,z=pos.z+dir.z}, "vehicles:parachute")
		local entity = obj:get_luaentity()
		if obj.driver and user == obj.driver then
		vehicles.object_detach(entity, user, {x=0, y=0, z=0})
		elseif not obj.driver then
		vehicles.object_attach(entity, user, {x=0, y=0, z=0}, true, {x=0, y=2, z=0})
		end
		item:take_item()
		return item
	end,
})

core.register_entity("vehicles:airballoon", {
	initial_properties = {
visual = "mesh",
mesh = "airballoon.b3d",
textures = {"vehicles_airballoon.png"},
hp_max = 200,
physical = true,
collisionbox = {-.8, -.2, -.8, .8, .6, .8},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=0, z=1}, true, {x=0, y=2, z=5})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 2, 
			decell = .95,
			moving_anim = {x=2, y=20},
			stand_anim = {x=1, y=1},
			fly = true,
			fly_mode = "hold",
			gravity = .2,
			animation_speed = 45,
		})
	end,
})

vehicles.register_spawner("vehicles:airballoon", "Airballoon", "vehicles_airballoon_inv.png")

core.register_entity("vehicles:spinner", {
	initial_properties = {
visual = "mesh",
mesh = "spinner.b3d",
textures = {"vehicles_spinner.png"},
stepheight = 1.5,
hp_max = 200,
physical = true,
collisionbox = {-.4, -.2, -.4, .4, .2, .4},
	},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=1.5, z=0}, true, {x=0, y=2, z=0})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 11, 
			decell = .6,
			destroy_node = "farming:wheat_S8",-- Interesting
			moving_anim = {x=3, y=18},
			stand_anim = {x=1, y=1},
			jump_type = "jump",
			jump_anim = {x=3, y=18},
			handling = {initial=3, braking=3}
		})
	end,
})

vehicles.register_spawner("vehicles:spinner", "Spinner", "vehicles_spinner_inv.png")

core.register_tool("vehicles:rc", {
	description = S("Rc (use with missiles)"),
	inventory_image = "vehicles_rc.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	on_use = function(item, user)
		local pname = user:get_player_name()
		local inv = core.get_inventory({type="player", name=pname})
		if inv:contains_item("main", "vehicles:missile_2_item") then
			inv:remove_item("main", "vehicles:missile_2_item")
			local pos = user:get_pos()
			local dir = user:get_look_dir()
			local obj = core.add_entity({x=pos.x+dir.x,y=pos.y+1+dir.y,z=pos.z+dir.z}, "vehicles:missile")
			local object = obj:get_luaentity()
			object.launcher = user
			object.vehicle = nil
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:set_velocity(vec)
			return item
		end
	end,
})

--crafting recipes and materials

core.register_craftitem("vehicles:wheel", {
	description = S("Wheel"),
	inventory_image = "vehicles_wheel.png",
})

core.register_craftitem("vehicles:engine", {
	description = S("Engine"),
	inventory_image = "vehicles_engine.png",
})

core.register_craftitem("vehicles:body", {
	description = S("Car Body"),
	inventory_image = "vehicles_car_body.png",
})

core.register_craftitem("vehicles:armor", {
	description = S("Armor plating"),
	inventory_image = "vehicles_armor.png",
})

core.register_craftitem("vehicles:gun", {
	description = S("Vehicle Gun"),
	inventory_image = "vehicles_gun.png",
})

core.register_craftitem("vehicles:propeller", {
	description = S("Propeller"),
	inventory_image = "vehicles_propeller.png",
})

core.register_craftitem("vehicles:jet_engine", {
	description = S("Jet Engine"),
	inventory_image = "vehicles_jet_engine.png",
})

core.register_craft({
	output = "vehicles:propeller",
	recipe = {
		{"default:steel_ingot", "", ""},
		{"", "group:stick", ""},
		{"", "", "default:steel_ingot"}
	}
})

core.register_craft({
	output = "vehicles:jet_engine",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "vehicles:propeller", "default:steel_ingot"},
		{"", "default:steel_ingot", ""}
	}
})

core.register_craft({
	output = "vehicles:armor",
	recipe = {
		{"", "default:gold_lump", ""},
		{"", "default:iron_lump", ""},
		{"", "default:copper_lump", ""}
	}
})

core.register_craft({
	output = "vehicles:gun",
	recipe = {
		{"", "vehicles:armor", ""},
		{"vehicles:armor", "default:coal_lump", "vehicles:armor"},
		{"", "default:steel_ingot", ""}
	}
})

core.register_craft({
	output = "vehicles:wheel",
	recipe = {
		{"", "default:coal_lump", ""},
		{"default:coal_lump", "default:steel_ingot", "default:coal_lump"},
		{"", "default:coal_lump", ""}
	}
})

core.register_craft({
	output = "vehicles:engine",
	recipe = {
		{"default:copper_ingot", "", "default:copper_ingot"},
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"},
		{"", "default:steel_ingot", ""}
	}
})

core.register_craft({
	output = "vehicles:body",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "default:steel_ingot", "default:glass"},
		{"", "", ""}
	}
})

core.register_craft({
	output = "vehicles:bullet_item 5",
	recipe = {{"default:coal_lump", "default:iron_lump"}}
})

core.register_craft({
	output = "vehicles:missile_2_item",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"", "default:torch", ""},
		{"default:stick", "default:coal_lump", "default:stick"}
	}
})

core.register_craft({
	output = "vehicles:masda_spawner",
	recipe = {
		{"", "dye:magenta", ""},
		{"", "vehicles:body", ""},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:masda2_spawner",
	recipe = {
		{"", "dye:orange", ""},
		{"", "vehicles:body", ""},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:ute_spawner",
	recipe = {
		{"", "dye:brown", ""},
		{"default:steel_ingot", "vehicles:body", ""},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:ute2_spawner",
	recipe = {
		{"", "dye:white", ""},
		{"default:steel_ingot", "vehicles:body", ""},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:nizzan2_spawner",
	recipe = {
		{"", "dye:green", ""},
		{"", "vehicles:body", ""},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:nizzan_spawner",
	recipe = {
		{"", "dye:brown", ""},
		{"", "vehicles:body", ""},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:astonmaaton_spawner",
	recipe = {
		{"", "dye:white", ""},
		{"", "vehicles:body", ""},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:pooshe_spawner",
	recipe = {
		{"", "dye:red", ""},
		{"", "vehicles:body", ""},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:pooshe2_spawner",
	recipe = {
		{"", "dye:yellow", ""},
		{"", "vehicles:body", ""},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:lambogoni_spawner",
	recipe = {
		{"", "dye:grey", ""},
		{"", "vehicles:body", ""},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:lambogoni2_spawner",
	recipe = {
		{"", "dye:yellow", ""},
		{"", "vehicles:body", "dye:grey"},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:fewawi_spawner",
	recipe = {
		{"", "dye:red", ""},
		{"", "vehicles:body", "default:glass"},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:fewawi2_spawner",
	recipe = {
		{"", "dye:blue", ""},
		{"", "vehicles:body", "default:glass"},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:musting_spawner",
	recipe = {
		{"", "dye:violet", ""},
		{"", "vehicles:body", ""},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:musting2_spawner",
	recipe = {
		{"", "dye:blue", ""},
		{"", "vehicles:body", ""},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:policecar_spawner",
	recipe = {
		{"", "dye:blue", "dye:red"},
		{"", "vehicles:body", ""},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:tank_spawner",
	recipe = {
		{"", "vehicles:gun", ""},
		{"vehicles:armor", "vehicles:engine", "vehicles:armor"},
		{"vehicles:wheel", "vehicles:wheel", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:tank2_spawner",
	recipe = {
		{"default:desert_sand", "vehicles:gun", ""},
		{"vehicles:armor", "vehicles:engine", "vehicles:armor"},
		{"vehicles:wheel", "vehicles:wheel", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:turret_spawner",
	recipe = {
		{"", "vehicles:gun", ""},
		{"vehicles:armor", "vehicles:engine", "vehicles:armor"},
	}
})

core.register_craft({
	output = "vehicles:jet_spawner",
	recipe = {
		{"", "vehicles:gun", ""},
		{"vehicles:jet_engine", "default:steel_ingot", "vehicles:jet_engine"},
		{"", "default:steel_ingot", ""}
	}
})

core.register_craft({
	output = "vehicles:plane_spawner",
	recipe = {
		{"", "vehicles:propeller", ""},
		{"default:steel_ingot", "vehicles:engine", "default:steel_ingot"},
		{"", "default:steel_ingot", ""}
	}
})

core.register_craft({
	output = "vehicles:helicopter_spawner",
	recipe = {
		{"", "vehicles:propeller", ""},
		{"vehicles:propeller", "vehicles:engine", "default:glass"},
		{"", "default:steel_ingot", ""}
	}
})

core.register_craft({
	output = "vehicles:apache_spawner",
	recipe = {
		{"", "vehicles:propeller", ""},
		{"vehicles:propeller", "vehicles:engine", "default:glass"},
		{"", "vehicles:armor", "default:steel_ingot"}
	}
})

core.register_craft({
	output = "vehicles:lightcycle_spawner",
	recipe = {
		{"default:steel_ingot", "vehicles:engine", "dye:cyan"},
		{"vehicles:wheel", "default:steel_ingot", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:lightcycle2_spawner",
	recipe = {
		{"default:steel_ingot", "vehicles:engine", "dye:orange"},
		{"vehicles:wheel", "default:steel_ingot", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:firetruck_spawner",
	recipe = {
		{"", "dye:red", ""},
		{"vehicles:body", "vehicles:engine", "vehicles:body"},
		{"vehicles:wheel", "default:steel_ingot", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:geep_spawner",
	recipe = {
		{"", "", ""},
		{"", "vehicles:engine", ""},
		{"vehicles:wheel", "vehicles:armor", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:ambulance_spawner",
	recipe = {
		{"", "", ""},
		{"vehicles:body", "vehicles:body", "dye:white"},
		{"vehicles:wheel", "vehicles:engine", "vehicles:wheel"}
	}
})

core.register_craft({
	output = "vehicles:assaultsuit_spawner",
	recipe = {
		{"vehicles:gun", "default:glass", "vehicles:armor"},
		{"", "vehicles:engine", ""},
		{"vehicles:armor", "", "vehicles:armor"}
	}
})

core.register_craft({
	output = "vehicles:backpack",
	recipe = {
		{"group:grass", "group:grass", "group:grass"},
		{"group:stick", "", "group:stick"},
		{"", "group:wood", ""}
	}
})


--decorative nodes

if core.settings:get_bool("vehicles_nodes") ~= false then
function vehicles.register_simplenode(name, desc, texture, light)
core.register_node("vehicles:"..name, {
	description = desc,
	tiles = {texture},
	groups = {cracky=1},
	paramtype2 = "facedir",
	light_source = light,
	sound = default.node_sound_stone_defaults(),
})
end--function vehicles.register_simplenode(name, desc, texture, light)

vehicles.register_simplenode("road", S("Road surface"), "vehicles_road.png", 0)
vehicles.register_simplenode("concrete", S("Concrete"), "vehicles_concrete.png", 0)
vehicles.register_simplenode("arrows", S("Turning Arrows(left)"), "vehicles_arrows.png", 10)
vehicles.register_simplenode("arrows_flp", S("Turning Arrows(right)"), "vehicles_arrows_flp.png", 10)
vehicles.register_simplenode("checker", S("Checkered surface"), "vehicles_checker.png", 0)
vehicles.register_simplenode("stripe", S("Road surface (stripe)"), "vehicles_road_stripe.png", 0)
vehicles.register_simplenode("stripe2", S("Road surface (double stripe)"), "vehicles_road_stripe2.png", 0)
vehicles.register_simplenode("stripe3", S("Road surface (white stripes)"), "vehicles_road_stripes3.png", 0)
vehicles.register_simplenode("stripe4", S("Road surface (yellow stripes)"), "vehicles_road_stripe4.png", 0)
vehicles.register_simplenode("window", S("Building glass"), "vehicles_window.png", 0)
vehicles.register_simplenode("stripes", S("Hazard stipes"), "vehicles_stripes.png", 10)

core.register_node("vehicles:lights", {
	description = S("Tunnel Lights"),
	tiles = {"vehicles_lights_top.png", "vehicles_lights_top.png", "vehicles_lights.png"},
	groups = {cracky=1},
	paramtype2 = "facedir",
	light_source = 14,
})

if core.get_modpath("stairs") then
stairs.register_stair_and_slab("road_surface", "vehicles:road",
		{cracky = 1},
		{"vehicles_road.png"},
		S("Road Surface Stair"),
		S("Road Surface Slab"),
		default.node_sound_stone_defaults())
end

core.register_node("vehicles:neon_arrow", {
	description = S("neon arrows (left)"),
	drawtype = "signlike",
	visual_scale = 2.,
	tiles = {{
		name = "vehicles_neon_arrow.png",
		animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 1.},
	}},
	inventory_image = "vehicles_neon_arrow_inv.png",
	weild_image = "vehicles_neon_arrow_inv.png",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,	
	light_source = 14,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "wallmounted",
		fixed = {-.5, -.5, -.5, .5, -.4, .5}
	},
	groups = {cracky=3,dig_immediate=3},
})

core.register_node("vehicles:neon_arrow_flp", {
	description = S("neon arrows (right)"),
	drawtype = "signlike",
	visual_scale = 2.,
	tiles = {{
		name = "vehicles_neon_arrow.png^[transformFX",
		animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 1.},
	}},
	inventory_image = "vehicles_neon_arrow_inv.png^[transformFX",
	weild_image = "vehicles_neon_arrow_inv.png^[transformFX",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,	
	light_source = 14,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "wallmounted",
		fixed = {-.5, -.5, -.5, .5, -.4, .5}
	},
	groups = {cracky=3,dig_immediate=3},
})

core.register_node("vehicles:add_arrow", {
	description = S("arrows(left)"),
	drawtype = "signlike",
	visual_scale = 2.,
	tiles = {"vehicles_arrows.png"},
	inventory_image = "vehicles_arrows.png",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,	
	light_source = 14,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "wallmounted",
		fixed = {-.5, -.5, -.5, .5, -.4, .5}
	},
	groups = {cracky=3,dig_immediate=3},
})

core.register_node("vehicles:add_arrow_flp", {
	description = S("arrows(right)"),
	drawtype = "signlike",
	visual_scale = 2.,
	tiles = {"vehicles_arrows_flp.png"},
	inventory_image = "vehicles_arrows_flp.png",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,	
	light_source = 14,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "wallmounted",
		fixed = {-.5, -.5, -.5, .5, -.4, .5}
	},
	groups = {cracky=3,dig_immediate=3},
})

core.register_node("vehicles:scifi_ad", {
	description = S("scifi_nodes sign"),
	drawtype = "signlike",
	visual_scale = 3.,
	tiles = {{
		name = "vehicles_scifinodes.png",
		animation = {type = "vertical_frames", aspect_w = 58, aspect_h = 58, length = 1.},
	}},
	inventory_image = "vehicles_scifinodes_inv.png",
	weild_image = "vehicles_scifinodes_inv.png",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,	
	light_source = 14,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "wallmounted",
		fixed = {-.5, -.5, -.5, .5, -.4, .5}
	},
	groups = {cracky=3,dig_immediate=3},
})

core.register_node("vehicles:mt_sign", {
	description = S("mt sign"),
	drawtype = "signlike",
	visual_scale = 3.,
	tiles = {"vehicles_neonmt.png",},
	inventory_image = "vehicles_neonmt.png",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,	
	light_source = 14,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "wallmounted",
		fixed = {-.5, -.5, -.5, .5, -.4, .5}
	},
	groups = {cracky=3,dig_immediate=3},
})

core.register_node("vehicles:pacman_sign", {
	description = S("pacman sign"),
	drawtype = "signlike",
	visual_scale = 2.,
	tiles = {"vehicles_pacman.png",},
	inventory_image = "vehicles_pacman.png",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,	
	light_source = 14,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "wallmounted",
		fixed = {-.5, -.5, -.5, .5, -.4, .5}
	},
	groups = {cracky=3,dig_immediate=3},
})

core.register_node("vehicles:whee_sign", {
	description = S("whee sign"),
	drawtype = "signlike",
	visual_scale = 3.,
	tiles = {"vehicles_whee.png",},
	inventory_image = "vehicles_whee.png",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,	
	light_source = 14,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "wallmounted",
		fixed = {-.5, -.5, -.5, .5, -.4, .5}
	},
	groups = {cracky=3,dig_immediate=3},
})

core.register_node("vehicles:checker_sign", {
	description = S("Checkered sign"),
	drawtype = "signlike",
	visual_scale = 3.,
	tiles = {"vehicles_checker2.png",},
	inventory_image = "vehicles_checker2.png",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 5,
	is_ground_content = true,
	selection_box = {
		type = "wallmounted",
		fixed = {-.5, -.5, -.5, .5, -.4, .5}
	},
	groups = {cracky=3,dig_immediate=3},
})

core.register_node("vehicles:car_sign", {
	description = S("Car sign"),
	drawtype = "signlike",
	visual_scale = 3.,
	tiles = {"vehicles_sign1.png",},
	inventory_image = "vehicles_sign1.png",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 5,
	is_ground_content = true,
	selection_box = {
		type = "wallmounted",
		fixed = {-.5, -.5, -.5, .5, -.4, .5}
	},
	groups = {cracky=3,dig_immediate=3},
})

core.register_node("vehicles:nyan_sign", {
	description = S("Nyancat sign"),
	drawtype = "signlike",
	visual_scale = 2.,
	tiles = {"vehicles_sign2.png",},
	inventory_image = "vehicles_sign2.png",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 5,
	is_ground_content = true,
	selection_box = {
		type = "wallmounted",
		fixed = {-.5, -.5, -.5, .5, -.4, .5}
	},
	groups = {cracky=3,dig_immediate=3},
})

core.register_node("vehicles:flag", {
	description = S("Flag"),
	drawtype = "torchlike",
	visual_scale = 3.,
	tiles = {"vehicles_flag.png",},
	inventory_image = "vehicles_flag.png",
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 5,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, -.4, .5}
	},
	groups = {cracky=3,dig_immediate=3},
})

core.register_node("vehicles:tyres", {
	description = S("tyre stack"),
	tiles = {"vehicles_tyre.png", "vehicles_tyre.png", "vehicles_tyre_side.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-.4375, -.5, -.4375, .4375, .5, .4375},
			{-.5, -.4375, -.4375, .5, -.0625, .4375},
			{-.5, 0, -.4375, .5, .4375, .4375},
			{-.4375, 0, -.5, .4375, .4375, .5},
			{-.4375, -.4375, -.5, .4375, -.0625, .5},
		}
	},
	groups = {cracky=1, falling_node=1},
})

--nodeboxes from xpanes 
--[[
(MIT)
Copyright (C) 2014-2016 xyz
Copyright (C) 2014-2016 BlockMen
Copyright (C) 2016 Auke Kok <sofar@foo-projects.org>
Copyright (C) 2014-2016 Various Luanti developers
]]

core.register_node("vehicles:light_barrier", {
	description = S("Light Barrier"),
	tiles = {"vehicles_lightblock.png^[transformR90",
	"vehicles_lightblock.png^[transformR90", "vehicles_lightblock.png"},
	use_texture_alpha = "blend",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
			type = "connected",
			fixed = {{-1/32, -1/2, -1/32, 1/32, 1/2, 1/32}},
			connect_front = {{-1/32, -1/2, -1/2, 1/32, 1/2, -1/32}},
			connect_left = {{-1/2, -1/2, -1/32, -1/32, 1/2, 1/32}},
			connect_back = {{-1/32, -1/2, 1/32, 1/32, 1/2, 1/2}},
			connect_right = {{1/32, -1/2, -1/32, 1/2, 1/2, 1/32}},
	},
	connects_to = {"vehicles:light_barrier",},
	sunlight_propagates = true,
	walkable = false,
	light_source = 9,
	groups = {cracky=3,dig_immediate=3,not_in_creative_inventory=1},
	on_construct = function(pos)
		core.get_node_timer(pos):start(4)
	end,
	on_timer = function(pos)
		core.remove_node(pos)
	end,
})

core.register_node("vehicles:light_barrier2", {
	description = S("Light Barrier 2"),
	tiles = {"vehicles_lightblock2.png^[transformR90",
	"vehicles_lightblock2.png^[transformR90", "vehicles_lightblock2.png"},
	use_texture_alpha = "blend",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
			type = "connected",
			fixed = {{-1/32, -1/2, -1/32, 1/32, 1/2, 1/32}},
			connect_front = {{-1/32, -1/2, -1/2, 1/32, 1/2, -1/32}},
			connect_left = {{-1/2, -1/2, -1/32, -1/32, 1/2, 1/32}},
			connect_back = {{-1/32, -1/2, 1/32, 1/32, 1/2, 1/2}},
			connect_right = {{1/32, -1/2, -1/32, 1/2, 1/2, 1/32}},
	},
	connects_to = {"vehicles:light_barrier2",},
	sunlight_propagates = true,
	walkable = false,
	light_source = 9,
	groups = {cracky=3,dig_immediate=3,not_in_creative_inventory=1},
	on_construct = function(pos)
		core.get_node_timer(pos):start(4)
	end,
	on_timer = function(pos)
		core.remove_node(pos)
	end,
})

end
end
