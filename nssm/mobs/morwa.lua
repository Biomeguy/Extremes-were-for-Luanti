mobs:register_mob("nssm:morwa", {
	type = "monster",
	hp_max = 56,
	hp_min = 49,
	collisionbox = {-1, -.1, -1, 1, 3, 1},
	visual = "mesh",
	mesh = "morwa.x",
	textures = {{"morwa.png"}},
	visual_size = {x= 10, y= 10},
	makes_footstep_sound = true,
	view_range = 25,
	fear_height = 4,
	walk_velocity = 0.5,
	run_velocity = 4,
	sounds = {
		random = "morwa"
	},
	damage = 8,
	jump = true,
	drops = {
		{name = "nssm:energy_pearl", chance = 1, min = 3, max = 4},
		{name = "nssm:wrathful_soul_fragment", chance = 3, min = 1, max = 1}
	},
	armor = 50,
	reach = 4,
	rotate = 270,
	lava_damage = 0,
	fire_damage = 0,
	group_attack = true,
	attack_animals = true,
	blood_texture = "morparticle.png",
	attack_type = "dogshoot",
	dogshoot_switch = true,
    arrow = "nssm:morarrow",
    shoot_interval = 2,
    shoot_offset = 0,
	animation = {
		speed_normal = 25,
		speed_run = 25,
		stand_start = 10,
		stand_end = 40,
		walk_start = 50,
		walk_end = 90,
		run_start = 100,
		run_end = 120,
		punch_start = 130,
		punch_end = 160,
    	shoot_start =176,
    	shoot_end=226
	},
	do_custom = function(self)
		local pos = self.object:get_pos()	if not pos then return end
		if core.get_node_light(pos) < 8 and core.get_node(pos).name == "air" then
	self.object:remove()
	core.set_node(pos, {name="nssm:morwa_statue"})
	core.get_node_timer(pos):start(1)
		end
	end,
})

mobs:register_arrow("nssm:morarrow", {
	visual = "sprite",
	visual_size = {x= .5, y= .5},
	textures = {"morarrow.png"},
	velocity= 13,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 3}
		}, nil)
	end
})
