mobs:register_mob("nssm:lava_titan", {
	type = "monster",
	hp_max = 180,
	hp_min = 180,
	collisionbox = {-.45, -.05, -.45, .45, 1.8, .45},
	visual = "mesh",
	mesh = "lava_titan.x",
	textures = {{"lava_titan.png"}},
	visual_size = {x= 2.7, y= 2.7},
	makes_footstep_sound = true,
	view_range = 20,
	fear_height = 4,
	lifetimer = 500,
	walk_velocity = .5,
	run_velocity = 1.3,
	sounds = {
		random = "lava_titan"
	},
	damage = 8,
	jump = false,
	jump_height = 0,
	drops = {
		{name = "nssm:energy_pearl", chance = 1, min = 7, max = 9},
		{name = "nssm:lava_titan_eye", chance = 1, min = 1, max = 2},
		{name = "default:molten_rock", chance = 2, min = 1, max = 3}
	},
	armor = 20,
  	rotate = 270,
	water_damage = 25,
	lava_damage = -1,
	fire_damage = 0,
	floats = 0,
	blood_texture = "default_molten_rock.png",
	blood_amount = 50,
	attack_type = "dogshoot",
	dogshoot_switch = true,
  	arrow = "nssm:lava_arrow",
  	shoot_interval = 2,
  	shoot_offset = 0,
	animation = {
		speed_normal = 25,
		speed_run = 45,
		stand_start = 120,
		stand_end = 300,
		walk_start = 10,
		walk_end = 110,
		run_start = 10,
		run_end = 110,
		punch_start = 301,
		punch_end = 340,
    	shoot_start = 340,
    	shoot_end = 400
	}
})

mobs:register_arrow("nssm:lava_arrow", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"blank.png"},
	velocity = 10,

	hit_player = function(self, player)
		local pos = self.object:get_pos()

		if core.is_protected(pos, "") then
			return
		end
		for dy= -1, 6, 1 do
		for dx= -1, 1, 2 do
		for dz= -1, 1, 2 do
			local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			local n = core.get_node(p).name

			if n== "air" and not core.is_protected(p, "") then
				core.set_node(p, {name="default:lava_flowing"})
			end
		end
		end
		end
	end
})
