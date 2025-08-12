local depends = (...)
if not depends.mobs_redo then return end

for name, tag in pairs({santa = "Santa Claus", mrs_claus = "Mrs. Claus"}) do
	mobs:register_mob("noel:" .. name, {
		type = "npc",
		passive = true,
		pathfinding = false,
		nametag = tag,
		hp_min = 20,
		hp_max = 20,
		armor = 0,
		collisionbox = {-.35, 0, -.35, .35, 1.8, .35},
		visual = "mesh",
		mesh = "character.b3d",
		textures = {"noel_" .. name .. ".png"},
		makes_footstep_sound = false,
		sounds = {},
		walk_velocity = 0,
		run_velocity = 0,
		jump = false,
		water_damage = 0,
		lava_damage = 0,
		light_damage = 0,
		view_range = 15,
		owner = "",
		fear_height = 3,
		animation = {
			speed_normal = 30,
			speed_run = 30,
			stand_start = 0,
			stand_end = 79,
		},
		follow = {"noel:candycane", "noel:gingerbread_cookie"},
		on_rightclick = function(self, clicker)
			if mobs:capture_mob(self, clicker, 100, 100, 100, false, nil) then return end
		end
	})

	mobs:register_egg("noel:" .. name, tag, "noel_gumdrop.png^[multiply:red", 1)
	mobs:alias_mob("mobs:" .. name, "noel:" .. name)
end

for name, tag in pairs({reindeer = "Reindeer", rudolf = "Rudolf"}) do
	mobs:register_mob("noel:" .. name, {
		type = "animal",
		passive = true,
		pathfinding = false,
		hp_min = 20,
		hp_max = 20,
		armor = 0,
		collisionbox = {-.2, -.01, -.2, .2, 1.2, .2},
		visual = "mesh",
		mesh = "noel_reindeer.b3d",
		textures = {"noel_" .. name .. ".png"},
		makes_footstep_sound = false,
		walk_velocity = 0,
		run_velocity = 0,
		jump = false,
		water_damage = 0,
		lava_damage = 0,
		light_damage = 0,
		animation = {
			speed_normal = 25,
			speed_normal = 25,
			speed_run = 25,
			stand_start = 0,
			stand_end = 200,
			walk_start = 149,
			walk_end = 150,
			run_start = 150,
			run_end = 170,
		},
		follow = {"noel:candycane", "noel:gingerbread_cookie"},
		view_range = 15,
		fear_height = 3,
		on_rightclick = function(self, clicker)
			if mobs:feed_tame(self, clicker, 0, false, true) then return end
			if mobs:capture_mob(self, clicker, 100, 100, 100, false, nil) then return end
		end
	})

	mobs:register_egg("noel:" .. name, tag, "noel_gumdrop.png^[multiply:saddlebrown", 1)
	mobs:alias_mob("mobs:" .. name, "noel:" .. name)
end
