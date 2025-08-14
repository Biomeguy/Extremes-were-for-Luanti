mobs:register_mob("nssm:masticone", {
	type = "monster",
	hp_max = 25,
	hp_min = 24,
	collisionbox = {-.45, 0, -.45, .45, .4, .45},
	visual = "mesh",
	mesh = "masticone.x",
	textures = {
		{"masticone.png"}
	},
	visual_size = {x= 4, y= 4},
	makes_footstep_sound = true,
	view_range = 15,
	lifetimer = 500,
	fear_height = 4,
	rotate = 270,
	walk_velocity = 1.5,
	run_velocity = 2.5,
  	sounds = {
		random = "masticone"
	},
	damage = 5,
	reach = 1.5,
	jump = true,
	drops = {
		{name = "nssm:energy_pearl", chance = 1, min = 7, max = 8},
		{name = "nssm:masticone_fang", chance = 1, min = 1, max = 2},
		{name = "nssm:masticone_skull_fragments", chance = 2, min = 1, max = 2}
	},
	armor = 60,
	lava_damage = 10,
	fire_damage = 10,
	floats = 0,
	group_attack = true,
	attack_animals = true,
	blood_texture = "nssm_blood_blue.png",
	attack_type = "dogfight",
	animation = {
		speed_normal = 20,
		speed_run = 25,
		stand_start = 80,
		stand_end = 140,
		walk_start = 20,
		walk_end = 40,
		run_start = 20,
		run_end = 40,
		punch_start = 150,
		punch_end = 180
	},

	on_die = function(self, pos)
		self.object:remove()

		local n = core.get_node(pos).name
		if n == "default:lava_source" or n == "default:lava_flowing" then return end
		core.after(2, function()
			for i= 1, 2 do
	local pos = {x= pos.x+ math.random(-1,1), y= pos.y+ .5, z= pos.z+ math.random(-1,1)}
	n = core.get_node(pos).name

	if n == "air" then
		core.add_entity(pos, "nssm:masticone")
		core.add_particlespawner({
			amount = 100,
			time = .1,
			minpos = vector.subtract(pos, .4),
			maxpos = vector.add(pos, .4),
			minvel = {x=-1, y=0, z=-1},
			maxvel = {x=1, y=1, z=1},
			minacc = {x=-.5,y=5,z=-.5},
			maxacc = {x=.5,y=5,z=.5},
			exptime = {min = .1, max = 1},
			minsize = 3,
			maxsize = 4,
			texture = "tnt_smoke.png"}) end
			end
		end)
	end
})
