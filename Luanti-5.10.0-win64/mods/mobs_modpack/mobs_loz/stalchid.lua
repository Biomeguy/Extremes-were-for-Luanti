
mobs:register_mob("mobs_loz:stalchild", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 2,
	hp_min = 12,
	hp_max = 27,
	armor = 130,
	collisionbox = {-.3, 0, -.3, .3, 1.2, .3},
	visual_scale = {x=.8, y=.8},
	visual = "mesh",
	mesh = "stalchild.b3d",
	textures = {
		{"mobs_stalchild.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	drops = {
		{name = "bonemeal:bone", chance = 1, min = 2, max = 5},
		{name = "mapgen:nyan_rupee", chance = 2, min = 1, max = 4},
		{name = "mtools:heart", chance = 5, min = 1, max = 1},
	},
	do_custom = function(self)
		local pos = self.object:get_pos()	if not pos then return end
		local light = core.get_node_light(pos)
		if light and light >= 14 then
			core.add_particlespawner({
			amount = 10,
			time = .5,
			minpos = {x=pos.x-.2, y=pos.y-.3, z=pos.z-.2},
			maxpos = {x=pos.x+.2, y=pos.y+.5, z=pos.z+.2},
			minvel = {x=-.5, y=2, z=-.5},
			maxvel = {x=.5, y=4, z=.5},
			minacc = {x=0, y=-7, z=0},
			maxacc = {x=0, y=-7, z=0},
			exptime = {min = 2, max = 3},
			minsize = 1,
			maxsize = 2,
			collisiondetection = true,
			texture = "default_dirt.png"})
		self.object:set_properties({physical = false})
		core.after(2, function(self)
			self.object:remove()
		end, self)
		end
	end,
	water_damage = 1,
	lava_damage = 5,
	light_damage = 1,
	fear_height = 3,
	animation = {
		speed_normal = 13,
		speed_run = 14,
		stand_start = 1,
		stand_end = 20,
		walk_start = 55,
		walk_end = 75,
		run_start = 55,
		run_end = 75,
		punch_start = 35,
		punch_end = 51,
	},
})

mobs:register_egg("mobs_loz:stalchild", "Stalchild", "default_pine_wood.png", 1)