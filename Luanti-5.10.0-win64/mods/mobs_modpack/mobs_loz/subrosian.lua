
mobs:register_mob("mobs_loz:subrosian", {
	type = "animal",
	passive = true,
	damage = 0,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 120,
	collisionbox = {-.4, 0, -.4, .4, 1, .4},
	visual = "mesh",
	mesh = "subrosian.b3d",
	textures = {
		{"mobs_subrosian.png"},
		{"mobs_subrosian2.png"},
		{"mobs_subrosian3.png"},
	},
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = .5,
	run_velocity = 0,
	jump = true,
	jump_height = 4,
	fall_damage = 0,
	fall_speed = -6,
	stepheight = 3,
	drops = {
		{name = "default:stone", chance = 9, min = 1, max = 3},
		{name = "mapgen:red_ore", chance = 1, min = 1, max = 2},
		{name = "mapgen:blue_ore", chance = 3, min = 1, max = 2},
		{name = "mtools:heart", chance = 2, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 12,
		speed_run = 15,
		stand_start = 20,
		stand_end = 40,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
	},
	on_rightclick = function(self, clicker)
	local item = clicker:get_wielded_item()
	local pname = clicker:get_player_name()
	local pos = self.object:get_pos()	if not pos then return end
	pos.y = pos.y + .5

	if item:get_name() == "mapgen:red_ore" then
		if not core.is_creative_enabled(pname) then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		core.add_item(pos, {name = "default:obsidian"})
	elseif item:get_name() == "mapgen:blue_ore" then
		if not core.is_creative_enabled(pname) then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		core.add_item(pos, {name = "default:copper_lump"})
	elseif item:get_name() == "mapgen:nyan_rupee" then
		if not core.is_creative_enabled(pname) then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		core.add_item(pos, {name = "default:iron_lump"})
	end
	end,
})

mobs:register_egg("mobs_loz:subrosian", "Subrosian", "mapgen_subrosiansand.png", 1)
