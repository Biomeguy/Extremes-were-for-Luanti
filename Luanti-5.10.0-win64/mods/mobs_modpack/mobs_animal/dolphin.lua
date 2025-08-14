
local S = mobs.intllib

local l_water_level = tonumber(core.settings:get("water_level") - 2)

-- Dolphin by starninjas

mobs:register_mob("mobs_animal:dolphin", {
	type = "animal",
	attack_type = "dogfight",
	attack_npcs = false,
	damage = 1,
	reach = 3,
	hp_min = 20,
	hp_max = 25,
	armor = 100,
	collisionbox = {-0.75, -0.5, -0.75, 0.75, 0.5, 0.75},
	visual_size = {x = 15, y = 15, z= 15},
	visual = "mesh",
	mesh = "dolphin.b3d",
	textures = {
		{"mobs_dolphin.png"}
	},
	sounds = {
		random = "dolphin",
	},
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 2, max = 4},
	},
	makes_footstep_sound = false,
	walk_velocity = 4,
	run_velocity = 6,
	fly = true,
	fly_in = "default:water_source",
	fall_speed = 0,
	rotate = 90,
	view_range = 30,
	water_damage = 0,
	lava_damage = 10,
	light_damage = 0,
	jump = false,
	stepheight = 0.1,
	animation = {
		speed_normal = 15,
		speed_run = 25,
		stand_start = 40,
		stand_end = 100,
		walk_start = 40,
		walk_end = 100,
		run_start = 40,
		run_end = 100,
	},
	follow = {"ethereal:fish_raw", "mobs_fish:clownfish", "mobs_fish:tropical", "mobs_fish:clownfish_set", "mobs_fish:tropical_set"},
	on_rightclick = function(self, clicker)
		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})
mobs:spawn_specific("mobs_animal:dolphin", {"default:water_source"}, {"default:water_flowing","default:water_source"}, 5, 20, 30, 10000, 2, -31000, l_water_level)
mobs:register_egg("mobs_animal:dolphin", S("Dolphin"), "mobs_dolphin_inv.png", 0)
