mobs:register_mob("nssm:morde", {
	type = "monster",
	hp_max = 47,
	hp_min = 37,
	collisionbox = {-.4, -.1, -.4, .4, 1.6, .4},
	visual = "mesh",
	rotate= 270,
	mesh = "morde.x",
	textures = {{"morde.png"}},
	visual_size = {x= 10, y= 10},
	makes_footstep_sound = true,
	view_range = 20,
	walk_velocity = .5,
	reach = 3,
	run_velocity = 3.5,
	damage = 6,
	jump = true,
    sounds = {
		random = "morde"
	},
	drops = {
		{name = "nssm:energy_pearl", chance = 1, min = 2, max = 4},
		{name = "nssm:proud_soul_fragment", chance = 3, min = 1, max = 1}
	},
	armor = 60,
	fear_height = 4,
	floats = 1,
	lava_damage = 0,
	fire_damage = 0,
	group_attack = true,
	attack_animals = true,
	blood_texture = "morparticle.png",
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 25,
		stand_start = 10,
		stand_end = 40,
		walk_start = 50,
		walk_end = 90,
		run_start = 100,
		run_end = 120,
		punch_start = 130,
		punch_end = 160
	},

	custom_attack = function(self)
		self.morde_timer = self.morde_timer or os.time()

		if os.time() - self.morde_timer > 1 then
			self.morde_timer = os.time()

			local s = self.object:get_pos()
			local p = self.attack:get_pos()

			self:set_animation("punch")

			self.health = self.health + (self.damage*2)

			if core.line_of_sight({x = p.x, y = p.y +1.5, z = p.z}, {x = s.x, y = s.y +1.5, z = s.z}) == true then
		-- play attack sound
		if self.sounds.attack then
			core.sound_play(self.sounds.attack, {
				object = self.object,
				max_hear_distance = self.sounds.distance
			}, true)
		end
		-- punch player
		self.attack:punch(self.object, 1.,  {
			full_punch_interval=1.,
			damage_groups = {fleshy = self.damage}
		}, nil)

		local m = 3
		core.add_particlespawner({
			amount = 6,
			time = 1,
			minpos = vector.subtract(p, .5),
			maxpos = vector.add(p, .5),
			minvel = {x=(s.x-p.x)*m, y=(s.y-p.y+1)*m, z=(s.z-p.z)*m},
			maxvel = {x=(s.x-p.x)*m, y=(s.y-p.y+1)*m, z=(s.z-p.z)*m},
			minacc = {x=s.x-p.x, y=s.y-p.y+1, z=s.z-p.z},
			maxacc = {x=s.x-p.x, y=s.y-p.y+1, z=s.z-p.z},
			exptime = {min = .2, max = .3},
			minsize = 2,
			maxsize = 3,
			texture = "morparticle.png"})
			end
		end
	end,

	on_die = function(self, pos)
		core.add_entity(pos, "nssm:mortick")
	end,
})

core.register_entity("nssm:mortick", {
initial_properties = {
	visual = "mesh",
	mesh = "mortick.x",
	textures = {"mortick.png"},
	hp_min = 10000,
	hp_max = 10000,
	armor = 100,
	physical = false,
	collisionbox = {-.2, -.2, -.2, .2, .2, .2},
	visual_size = {x= 3, y= 3},
},
	on_step = function(self, dtime)
		self.age = self.age or os.time()
		self.timer = self.timer or 0
		self.timer = self.timer+dtime

		local s = self.object:get_pos()
		local s1 = {x=s.x, y = s.y-1, z = s.z}

		--The mortick dies when above fire
		local name = core.get_node(s1).name

		if name == "fire:basic_flame"
		or name == "fire:permanent_flame"
		or name == "nssm:phoenix_fire"
		or name == "burning_bush:leaves" then
			self.object:remove()
		end

		--Find player to attack:
		self.attack = (self.attack or 0)

		local objects = core.get_objects_inside_radius(s, 8)

		for _,obj in ipairs(objects) do
			if obj:is_player() then
				self.attack = obj
			end
		end

		--If found a player follow him
		if self.attack ~= 0 then
			local p = self.attack:get_pos()

			-- Just incase player teleports away or leaves game
			if not p then
				self.attack = 0
				return
			end
			local horp = self.attack:get_look_horizontal()+1.5

			p.y = p.y + 1
			p.x = p.x- math.cos(horp) /2.5
			p.z = p.z- math.sin(horp) /2.5
			local m = 10
			local v = {x=-(s.x-p.x)*m, y=-(s.y-p.y)*m, z=-(s.z-p.z)*m}
			local yaws = horp +math.pi

			--stay attached to players back:
			self.object:set_velocity(v)
			self.object:set_yaw(yaws)

			--damage player every ten seconds:
			if self.timer > 10 then
				self.timer = 0
				self.attack:set_hp(self.attack:get_hp() - 1)
			end
		elseif os.time()-self.age > 15 then
			self.object:remove()
		end
	end
})
