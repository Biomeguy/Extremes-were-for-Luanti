-- Mimic by D00Med
-- edit of Dirt Monster by PilzAdam

core.register_node("mobs_loz:mimic_chest", {
	description = "Mimic Chest",
	tiles = {"mapgen_chest_top.png", "mapgen_chest_top.png", "mapgen_chest_side.png",
		"mapgen_chest_side.png", "mapgen_chest_back.png", "mapgen_chest_front.png"},
	paramtype2 = "facedir",
	groups = {cracky=4},
	on_rightclick = function(pos, node, clicker)
		core.remove_node(pos)
		core.add_entity(pos, "mobs_loz:mimic")
	end
})

mobs:register_mob("mobs_loz:mimic", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 3,
	hp_min = 10,
	hp_max = 27,
	armor = 130,
	collisionbox = {-.5, 0, -.5, .5, 1, .5},
	visual = "mesh",
	mesh = "mimic.b3d",
	textures = {
		{"mobs_mimic.png"},
	},
	blood_texture = "mobs_rotten_blood.png",
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 3.5,
	walk_velocity = .01,
	run_velocity = 2,
	jump = false,
	jump_height = 0,
	drops = {
		{name = "mapgen:red_rupee", chance = 4, min = 1, max = 3},
		{name = "mapgen:zols_lair_spawner", chance = 4, min = 1, max = 1},
		{name = "default:gold_lump", chance = 4, min = 1, max = 1},
		{name = "mtools:heart", chance = 2, min = 1, max = 1},
	},
	do_custom = function(self)
		if self.state ~= "attack" then
			core.after(3, function(self)
			if self.state ~= "attack" and self.object ~= nil then
			local pos = self.object:get_pos()
			if pos ~= nil then
			if core.get_node(pos).name == "air" then
				core.set_node(pos, {name="mobs_loz:mimic_chest"})
			else
				core.add_item(pos, "mobs_loz:mimic_chest")
			end
			self.object:remove()
			end
			end
			end, self)
		end
	end,
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 17,
		speed_run = 19,
		stand_start = 1,
		stand_end = 1,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
		punch_start = 20,
		punch_end = 45,
	},
})
