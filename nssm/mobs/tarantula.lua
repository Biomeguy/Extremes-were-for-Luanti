mobs:register_mob("nssm:tarantula", {
	type = "monster",
	hp_max = 50,
	hp_min = 50,
	collisionbox = {-.5, 0, -.5, .5, .9, .5},
	visual = "mesh",
	mesh = "tarantula.x",
	textures = {{"tarantula.png"}},
	visual_size = {x= 8, y= 8},
	makes_footstep_sound = true,
	view_range = 20,
	lifetimer = 500,
	walk_velocity = .7,
	fear_height = 4,
	run_velocity = 3,
    rotate = 270,
    sounds = {
		random = "tarry"
	},
	damage = 8,
	jump = true,
	drops = {
		{name = "nssm:super_silk_gland", chance = 1, min = 3, max = 5}
	},
	armor = 60,
	water_damage = 1,
	lava_damage = 7,
	fire_damage = 7,
	reach = 3,
	knock_back = false,
	blood_texture = "nssm_blood_blue.png",
	stepheight = 1.1,
	dogshoot_switch = true,
	attack_type = "dogshoot",
    arrow = "nssm:thickwebball",
    shoot_interval = 2,
    shoot_offset = 1,
	animation = {
		speed_normal = 20,
		speed_run = 25,
		stand_start = 1,
		stand_end = 60,
		walk_start = 100,
		walk_end = 140,
		run_start = 140,
		run_end = 160,
		punch_start = 180,
		punch_end = 200,
		shoot_start = 180,
		shoot_end = 200
	},
	on_die = function(self, pos)
		self.object:remove()

		core.add_particlespawner({
			amount = 200,
			time = .1,
			minpos = vector.subtract(pos, 1),
			maxpos = vector.add(pos, 1),
			minvel = {x=-1, y=0, z=-1},
			maxvel = {x=1, y=1, z=1},
			minacc = {x=-.5,y=5,z=-.5},
			maxacc = {x=.5,y=5,z=.5},
			exptime = {min = .1, max = 1},
			minsize = 3,
			maxsize = 4,
			texture = "tnt_smoke.png"})
		core.add_entity(pos, "nssm:tarantula_propower")
	end,
})

function explosion_thickweb(pos)
	pos.y = round(pos.y)
	if core.is_protected(pos, "") then
		return
	end
	for j=0, 1 do
		local p = {x=pos.x, y=pos.y+j, z=pos.z}
		local n = core.get_node(p).name
		if n == "air" and not core.is_protected(p,"") then
			core.set_node(p, {name="nssm:thick_web"})
		end
	end
end

mobs:register_arrow("nssm:thickwebball", {
	visual = "sprite",
	visual_size = {x = 2, y = 2},
	textures = {"thick_web_ball.png"},
	velocity = 8,

	hit_player = function(self, player)
		local p = player:get_pos()
		explosion_thickweb(p)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 6},
		}, nil)
	end,

	hit_node = function(self, pos, node)
		explosion_thickweb(pos)
	end
})


mobs:register_mob("nssm:tarantula_propower", {
	type = "monster",
	hp_max = 90,
	hp_min = 90,
	collisionbox = {-.5, 0, -.5, .5, 1, .5},
	visual = "mesh",
	mesh = "tarantula_propower.x",
	textures = {{"tarantula.png"}},
	visual_size = {x= 10, y= 10},
	makes_footstep_sound = true,
	view_range = 30,
	lifetimer = 500,
	walk_velocity = 1.5,
	run_velocity = 3.3,
    rotate = 270,
    sounds = {
		random = "tarry"
	},
	damage = 12,
	jump = true,
	drops = {
		{name = "nssm:energy_pearl", chance = 1, min = 16, max = 18},
		{name = "nssm:spider_leg", chance = 1, min = 1, max = 8},
		{name = "nssm:tarantula_chelicerae", chance = 1, min = 1, max = 1},
		{name = "nssm:silk_gland", chance = 2, min = 1, max = 3},
		{name = "nssm:spider_meat", chance = 2, min = 1, max = 2}
	},
	armor = 40,
	water_damage = 1,
	lava_damage = 3,
	fire_damage = 3,
	reach = 4,
	knock_back = false,
	blood_texture = "nssm_blood_blue.png",
	stepheight = 2.1,
	attack_type = "dogfight",
	animation = {
		speed_normal = 20,
		speed_run = 25,
		stand_start = 1,
		stand_end = 60,
		walk_start = 100,
		walk_end = 140,
		run_start = 140,
		run_end = 160,
		punch_start = 180,
		punch_end = 200
	}
})
