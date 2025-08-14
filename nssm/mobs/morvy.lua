mobs:register_mob("nssm:morvy", {
	type = "monster",
	hp_max = 39,
	hp_min = 21,
	collisionbox = {-.3, 0, -.3, .3, 2.1, .3},
	visual = "mesh",
	mesh = "morvy.x",
	textures = {{"morvy.png"}},
	visual_size = {x= 5, y= 5},
	makes_footstep_sound = true,
	view_range = 35,
	fear_height = 5,
	walk_velocity = 0.7,
	run_velocity = 2,
  	rotate = 270,
	damage = 4,
	sounds = {
		random = "morvy"
	},
	jump = true,
	drops = {
		{name = "nssm:energy_pearl", chance = 1, min = 5, max = 7},
		{name = "nssm:envious_soul_fragment", chance = 3, min = 1, max = 1}
	},
	reach = 8,
	armor = 60,
	lava_damage = 0,
	fire_damage = 0,
	group_attack = true,
	attack_animals = true,
	blood_texture = "morparticle.png",
	attack_type = "dogfight",
	animation = {
		speed_normal = 20,
		speed_run = 25,
		stand_start = 10,
		stand_end = 40,
		walk_start = 50,
		walk_end = 90,
		run_start = 50,
		run_end = 90,
		punch_start = 100,
		punch_end = 130
	},

	custom_attack = function(self)
	--	self:set_animation("stand")
		self.morvy_counter = (self.morvy_counter or 0) + 1

		if self.morvy_counter == 4 then
			self:set_animation("punch")

			self.morvy_counter = 0

			local counter = 0
			local s = self.object:get_pos()
			local p = self.attack:get_pos()

			p.y = p.y + 1.5
			s.y = s.y + 1.5

			if mobs:line_of_sight(self, p, s) == true then
	--[[play attack sound
	if self.sounds.attack then
		core.sound_play(self.sounds.attack, {
		object = self.object,
		max_hear_distance = self.sounds.distance
		})
	end]]
	local objects = core.get_objects_inside_radius(s, 10)
	for _,obj in ipairs(objects) do
	    if obj:get_luaentity() and (obj:get_luaentity().name == "nssm:morbat") then
	    	counter = counter + 1
		end
	end

	local pos1 = {x=s.x+math.random(-.5, .5), y=s.y+1, z=s.z+math.random(-.5, .5)}

	if core.get_node(pos1).name == "air" and counter < 5 then
		core.add_entity(pos1, "nssm:morbat")

		core.add_particlespawner({
			amount = 20,
			time = .1,
			minpos = vector.subtract(pos1, .2),
			maxpos = vector.add(pos1, .2),
			minvel = {x=-.1, y=0, z=-.1},
			maxvel = {x=.1, y=.3, z=.1},
			minacc = {x=-.5,y=1,z=-.5},
			maxacc = {x=.5,y=1,z=.5},
			exptime = {min = .1, max = 4},
			minsize = 2,
			maxsize = 6,
			texture = "morparticle.png"})
	end
			end
		end
	end
})


-- Morbat

mobs:register_mob("nssm:morbat", {
	type = "monster",
	hp_max = 15,
	hp_min = 13,
	collisionbox = {-.2, .2, -.2, .2, .4, .2},
	visual = "mesh",
	mesh = "morbat.x",
	textures = {
		{"morbat.png"},
		{"morbat1.png"},
		{"morbat2.png"},
	},
	visual_size = {x= 3, y= 3},
	view_range = 40,
	walk_velocity = .5,
	run_velocity = 3,
  	fall_speed = 0,
  	stepheight = 3,
	sounds = {
		random = "moonheron",
	},
	damage = 4,
	reach = 2,
	jump = true,
	rotate = 270,
	drops = {
		{name = "nssm:energy_pearl", chance = 1, min = 1, max = 2},
		{name = "nssm:night_feather", chance = 1, min = 0, max = 3}
	},
	armor = 100,
	lava_damage = 0,
	fire_damage = 0,
	group_attack = true,
	attack_animals = true,
	blood_texture = "morparticle.png",
  	fly = true,
	attack_type = "shoot",
	arrow = "nssm:morarrow",
	shoot_interval = 3,
	animation = {
		speed_normal = 25,
		speed_run = 35,
		stand_start = 60,
		stand_end = 90,
		walk_start = 10,
		walk_end = 50,
		run_start = 10,
		run_end = 50,
		punch_start = 100,
		punch_end = 115
	}
})
