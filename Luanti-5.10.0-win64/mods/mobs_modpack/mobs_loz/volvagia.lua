
-- Edit of Dirt Monster by PilzAdam

mobs:register_mob("mobs_loz:volvagia", {
	type = "monster",
	passive = false,
	attack_type = "dogshoot",
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
	shoot_interval = 2.5,
	arrow = "mobs_loz:fire",
	shoot_offset = 0,
	reach = 5,
	damage = 2,
	hp_min = 100,
	hp_max = 127,
	armor = 70,
	extra_energy = 4,
	collisionbox = {-1, -2, -1, 1, 1, 1},
	visual_size = {x=3, y=3},
	visual = "mesh",
	mesh = "volvagia.b3d",
	textures = {
		{"mobs_volvagia.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 25,
	rotate = 180,
	walk_velocity = 2,
	run_velocity = 5,
	jump = false,
	drops = {
		{name = "mapgen:firestone", chance = 1, min = 3, max = 5},
		{name = "mtools:heart", chance = 2, min = 1, max = 1},
	},
	fly = true,
	fly_in = "air",
	on_die = function(self, pos)
		mobs:explosion(pos, 2, 1, 1)
core.add_particlespawner({
	amount = 9,
	time = 1,
	minpos = {x=pos.x-.7, y=pos.y+1, z=pos.z-.7},
	maxpos = {x=pos.x+.7, y=pos.y+1, z=pos.z+.7},
	minacc = {x=-.5, y=1, z=-.5},
	maxacc = {x=.5, y=1, z=.5},
	exptime = {min = 1, max = 1.5},
	minsize = 21,
	maxsize = 25,
	vertical = true,
	texture = "mobs_loz_light.png",
	glow = 9 })
	end,
	water_damage = 0,
	lava_damage = 5,
	fire_damage = -5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 2,
		stand_end = 20,
		walk_start = 2,
		walk_end = 20,
		run_start = 2,
		run_end = 20,
		punch_start = 20,
		punch_end = 42,
		shoot_start = 20,
		shoot_end = 42,
	},
})

--mobs:register_spawn("mobs_loz:volvagia", {"mapgen:volvagia_spawn"}, 20, 0, 7000, 1, 31000, false)

mobs:register_egg("mobs_loz:volvagia", "Boss Volvagia", "default_clay_dirt.png", 1)

