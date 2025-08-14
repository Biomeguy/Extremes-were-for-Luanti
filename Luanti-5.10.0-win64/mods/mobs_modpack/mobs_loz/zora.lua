
-- zora by D00Med
-- an edit of mese monster by Zeg9

mobs:register_mob("mobs_loz:zora_male", {
	type = "animal",
	passive = true,
	damage = 0,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 80,
	collisionbox = {-0.4, -0, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	mesh = "zora_male.b3d",
	textures = {
		{"mobs_zora_male.png"},
	},
	blood_texture = "mapgen_ice_shard.png",
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 2,
	run_velocity = 6,
	runaway = true,
	runaway_timer = 40,
	jump = false,
	stepheight = 0,
	fly = true,
	fly_in = {"default:water_source", "default:water_flowing"},
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	drops = {
		{name = "mapgen:waterstone", chance = 14, min = 1, max = 1},
		{name = "mapgen:ice_shard", chance = 9, min = 1, max = 3},
		{name = "mapgen:green_rupee", chance = 5, min = 1, max = 2},
		{name = "mtools:heart", chance = 7, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 1,
		stand_end = 20,
		walk_start = 25,
		walk_end = 45,
		run_start = 25,
		run_end = 45,
	},
	do_custom = function(self)

		if not self.child and math.random(1, 50000) == 1 then
			local pos = self.object:get_pos()

			core.add_item(pos, "mobs_loz:scale")
		end
	end,
	on_rightclick = function(self, clicker)
	local item = clicker:get_wielded_item()
	local pname = clicker:get_player_name()

	if item:get_name() == "mapgen:nyan_rupee" and self.gave_item ~= true then
		if not core.is_creative_enabled(pname) then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		local pos = self.object:get_pos()
		pos.y = pos.y + 0.5
		core.add_item(pos, {name = "mapgen:waterstone"})
		self.gave_item = true
	end
	end,
})

mobs:register_egg("mobs_loz:zora_male", "Zora (male)", "default_ice.png", 1)

mobs:register_mob("mobs_loz:zora_female", {
	type = "animal",
	passive = true,
	damage = 0,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 80,
	collisionbox = {-0.4, -0, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	mesh = "zora_female.b3d",
	textures = {
		{"mobs_zora_female.png"},
	},
	blood_texture = "mapgen_ice_shard.png",
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 3,
	run_velocity = 7,
	runaway = true,
	runaway_timer = 40,
	jump = false,
	stepheight = 0,
	fly = true,
	fly_in = {"default:water_source", "default:water_flowing"},
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	drops = {
		{name = "mapgen:waterstone", chance = 14, min = 1, max = 1},
		{name = "mapgen:ice_shard", chance = 9, min = 1, max = 3},
		{name = "mapgen:green_rupee", chance = 5, min = 1, max = 2},
		{name = "mtools:heart", chance = 7, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 1,
		stand_end = 20,
		walk_start = 25,
		walk_end = 45,
		run_start = 25,
		run_end = 45,
	},
	do_custom = function(self)

		if not self.child and math.random(1, 50000) == 1 then
			local pos = self.object:get_pos()

			core.add_item(pos, "mobs_loz:scale")
		end
	end,
	on_rightclick = function(self, clicker)
	local item = clicker:get_wielded_item()
	local pname = clicker:get_player_name()

	if item:get_name() == "mapgen:nyan_rupee" and self.gave_item ~= true then
		if not core.is_creative_enabled(pname) then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		local pos = self.object:get_pos()
		pos.y = pos.y + 0.5
		core.add_item(pos, {name = "mapgen:waterstone"})
		self.gave_item = true
	end
	end,
})

mobs:register_egg("mobs_loz:zora_female", "Zora (female)", "default_ice.png^[colorize:red:70", 1)

playereffects.register_effect_type("scale_swim", "Fast Swim", nil, {"swim"}, 
	function(player)
		player:set_physics_override({speed = 4})
	end,
	
	function(effect, player)
		player:set_physics_override({speed = 1})
	end,
	false
)

core.register_craftitem("mobs_loz:scale", {
	description = "Zora scale",
	inventory_image = "mobs_zora_scale.png",
	on_use = function(item, user)
		local breath = user:get_breath()
		user:set_breath(breath+5)
		local pos = user:get_pos()
	if core.get_node(pos).name == "default:water_source" or core.get_node(pos).name == "default:fresh_water_source" then
		playereffects.apply_effect_type("scale_swim", 4, user)
	end
	end,
})
