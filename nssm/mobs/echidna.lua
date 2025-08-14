mobs:register_mob("nssm:echidna", {
	type = "monster",
	hp_max = 240,
	hp_min = 240,
	collisionbox = {-.6, 0, -.6, .6, 2, .6},
	visual = "mesh",
	mesh = "echidna.x",
	textures = {{"echidnapes.png"}},
	visual_size = {x= 6, y= 6},
	makes_footstep_sound = true,
	view_range = 30,
	rotate = 270,
	lifetimer = 500,
	fear_height = 4,
	walk_velocity = 2,
	run_velocity = 3.5,
	damage = 12,
	jump = true,
    sounds = {
		random = "echidna"
	},
	drops = {
		{name = "nssm:energy_pearl", chance = 1, min = 6, max = 7},
		{name = "nssm:snake_scute", chance = 1, min = 1, max = 1}
	},
	armor = 40,
	lava_damage = 0,
	fire_damage = 0,
	blood_texture = "nssm_blood.png",
	blood_amount = 10,
	jump_height = 8,
	attack_type = "dogshoot",
	dogshoot_switch = true,
	arrow = "nssm:super_gas",
	reach = 5,
	shoot_interval = 3,
	animation = {
		speed_normal = 15,
		speed_run = 25,
		stand_start = 60,
		stand_end = 140,
		walk_start = 1,
		walk_end = 40,
		run_start = 1,
		run_end = 40,
		punch_start = 160,
		punch_end = 190,
		shoot_start = 200,
		shoot_end = 240
	}
})

function gas_explosion(pos)
	if core.is_protected(pos, "") then
		return
	end
	for dx= -2, 2 do
	for dy= -1, 4 do
	for dz= -2, 2 do
		local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}

		if core.is_protected(p, "") then
			return
		end
		local n = core.get_node(p).name
		if n== "air" then
			core.set_node(p, {name="nssm:venomous_gas"})
		end
	end
	end
	end
end

mobs:register_arrow("nssm:super_gas", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"tnt_smoke.png^[colorize:green:170"},
	velocity = 8,

	hit_player = function(self, player)
		local p = player:get_pos()
		gas_explosion(p)
	end,

	hit_node = function(self, pos, node)
		gas_explosion(pos)
	end
})
