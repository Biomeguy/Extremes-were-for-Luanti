
if mobs.mod and mobs.mod == "redo" then

mobs:register_mob("mobs_jellyfish:jellyfish", {
	type = "animal",
	attack_type = "dogfight",
	damage = 5,
	reach = 1.5,
	hp_min = 10,
	hp_max = 25,
	armor = 100,
	collisionbox = {-.4, 0, -.4, .4, 1, .4},
	visual = "mesh",
	mesh = "jellyfish.b3d",
	textures = {
		{"jellyfish.png"},
		{"jellyfish2.png"},
		{"jellyfish3.png"}
	},
	makes_footstep_sound = false,
	walk_velocity = 1.5,
	run_velocity = 2.5,
	jump = false,
	stepheight = 1.3,
	fly = true,
	fly_in = "default:water_source",
	fall_speed = 0,
	view_range = 10,
	jump_height = 0,
	fall_damage = 0,
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	drops = {
		{name = "mapgen:green_rupee", chance = 5, min = 1, max = 2},
	},
	on_activate = function(self)
		local size = math.random(.6, 1.4)
		self.object:set_properties({visual_size={x=size, y=size}})
	end,
	on_die = function(self, pos)
		if core.get_modpath("mtools") and math.random(1,7) == 2 then
	core.add_item(pos, {name = "mtools:heart"})
		end
	end,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 1,
		stand_end = 20,
		walk_start = 20,
		walk_end = 40,
		run_start = 42,
		run_end = 62,
		punch_start = 1,
		punch_end = 20,
	},
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, 80, 100, 0, true, nil)
	end
})
--name, nodes, neighbours, minlight, maxlight, interval, chance, active_object_count, min_height, max_height
mobs:spawn_specific("mobs_jellyfish:jellyfish", {"default:water_source"},
	{"default:water_flowing","default:water_source"}, 5, 20, 30, 10000, 1, -31000, 0)
mobs:register_egg("mobs_jellyfish:jellyfish", "Jellyfish", "fabric_block_magenta.png", 1)
end

