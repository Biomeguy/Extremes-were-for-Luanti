
mobs:register_mob("mobs_loz:business_scrub", {
	type = "monster",
	passive = false,
	attack_type = "shoot",
	arrow = "mobs_loz:deku_nut",
	shoot_interval = 1.5,
	shoot_offset = 1.5,
	hp_min = 10,
	hp_max = 25,
	armor = 150,
	collisionbox = {-.2, -.1, -.2, .2, .4, .2},
	visual = "mesh",
	mesh = "business_scrub.b3d",
	textures = {
		{"mobs_business_scrub.png"},
	},
	visual_size = {x=1, y=1},
	blood_texture = "default_wood.png",
	view_range = 10,
	walk_velocity = .001,
	run_velocity = .001,
	jump = false,
	jump_height = 0,
	knock_back = 0,
	makes_footstep_sound = false,
	drops = {
		{name = "farming:spent_biomasse", chance = 1, min = 2, max = 5},
		{name = "mobs_loz:nut", chance = 9, min = 1, max = 2},
		{name = "mapgen:blue_rupee", chance = 10, min = 1, max = 3},
	},
	on_die = function(self, pos)
		core.add_entity(pos, "mobs_loz:business_scrub_standing")
	end,
	on_activate = function(self)
		self:set_animation("stand")
	end,
	on_rightclick = function(self, clicker)
	local item = clicker:get_wielded_item()

	if item:get_name() == "farming:carrot" then
if not mobs.is_creative(clicker:get_player_name()) then
	item:take_item()
	clicker:set_wielded_item(item)
end
	local pos = self.object:get_pos()
	core.add_particlespawner({
		amount = 3,
		time = .5,
		minpos = {x=pos.x-.2, y=pos.y+.5, z=pos.z-.2},
		maxpos = {x=pos.x+.2, y=pos.y+.1, z=pos.z+.2},
		minvel = {x=-1, y=2, z=-1},
		maxvel = {x=1, y=4, z=1},
		minacc = {x=0, y=-7, z=0},
		maxacc = {x=0, y=-7, z=0},
		exptime = {min = 1, max = 2},
		minsize = 2,
		maxsize = 3,
		texture = "mtools_heart.png"})
	core.add_entity(pos, "mobs_loz:business_scrub_passive")
	self.object:remove()
	end
	end,
	water_damage = -1,
	lava_damage = 1,
	light_damage = -1,
	light_damage_min = 8,
	animation = {
		speed_normal = 15,
		speed_run = 25,
		stand_start = 28,
		stand_end = 28,
		walk_start = 28,
		walk_end = 28,
		run_start = 28,
		run_end = 28,
		shoot_start = 28,
		shoot_end = 57,
	},
})

mobs:register_egg("mobs_loz:business_scrub", "Business Scrub", "default_beech_leaves.png", 1)

mobs:register_mob("mobs_loz:business_scrub_standing", {
	type = "animal",
	passive = true,
	reach = 1,
	damage = 2,
	hp_min = 10,
	hp_max = 25,
	armor = 90,
	collisionbox = {-.25, 0, -.25, .25, 1, .25},
	visual = "mesh",
	mesh = "business_scrub.b3d",
	textures = {
		{"mobs_business_scrub.png"},
	},
	visual_size = {x=1, y=1},
	blood_texture = "default_wood.png",
	view_range = 10,
	walk_velocity = .001,
	run_velocity = .001,
	walk_chance = 0,
	knock_back = 0,
	jump = false,
	jump_height = 0,
	makes_footstep_sound = false,
	drops = {
		{name = "farming:spent_biomasse", chance = 1, min = 2, max = 5},
		{name = "mtools:heart", chance = 5, min = 1, max = 1},
		{name = "mobs_loz:nut", chance = 9, min = 1, max = 2},
		{name = "mapgen:blue_rupee", chance = 10, min = 1, max = 3},
	},
	water_damage = -1,
	lava_damage = 1,
	light_damage = -1,
	light_damage_min = 8,
	animation = {
		speed_normal = 15,
		speed_run = 25,
		stand_start = 1,
		stand_end = 20,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
		shoot_start = 28,
		shoot_end = 57,
	},
	on_rightclick = function(self, clicker)
	local item = clicker:get_wielded_item()
	local pname = clicker:get_player_name()
	local pos = self.object:get_pos()	if not pos then return end
	pos.y = pos.y + .5

	if item:get_name() == "mapgen:green_rupee" then
		if not mobs.is_creative(pname) then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		core.add_item(pos, {name = "default:beech_leaves"})
	elseif item:get_name() == "mapgen:blue_rupee" then
		if not mobs.is_creative(pname) then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		core.add_item(pos, {name = "default:stick"})
	elseif item:get_name() == "mapgen:red_rupee" then
		if not mobs.is_creative(pname) then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		core.add_item(pos, {name = "default:dirt"})
	end
	end,
})

mobs:register_mob("mobs_loz:business_scrub_passive", {
	type = "animal",
	passive = true,
	reach = 1,
	damage = 2,
	hp_min = 10,
	hp_max = 25,
	armor = 90,
	collisionbox = {-.25, 0, -.25, .25, 1, .25},
	visual = "mesh",
	mesh = "business_scrub.b3d",
	textures = {
		{"mobs_business_scrub.png"},
	},
	runaway = true,
	knock_back = 1,
	runaway_timer = 20,
	visual_size = {x=1, y=1},
	blood_texture = "default_wood.png",
	view_range = 10,
	walk_velocity = 1.5,
	run_velocity = 5,
	jump_height = 5,
	makes_footstep_sound = true,
	drops = {
		{name = "farming:spent_biomasse", chance = 1, min = 2, max = 5},
		{name = "mtools:heart", chance = 5, min = 1, max = 1},
		{name = "mobs_loz:nut", chance = 9, min = 1, max = 2},
		{name = "mapgen:blue_rupee", chance = 10, min = 1, max = 3},
	},
	water_damage = -1,
	lava_damage = 1,
	light_damage = -1,
	light_damage_min = 8,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 1,
		stand_end = 20,
		walk_start = 60,
		walk_end = 80,
		run_start = 60,
		run_end = 80,
	},
	on_rightclick = function(self, clicker)
	local item = clicker:get_wielded_item()
	local pname = clicker:get_player_name()
	local pos = self.object:get_pos()	if not pos then return end

	if item:get_name() == "farming:carrot" then
if not mobs.is_creative(pname) then
	item:take_item()
	clicker:set_wielded_item(item)
end
	core.add_particlespawner({
		amount = 3,
		time = .5,
		minpos = {x=pos.x-.2, y=pos.y+.9, z=pos.z-.2},
		maxpos = {x=pos.x+.2, y=pos.y+.6, z=pos.z+.2},
		minvel = {x=-1, y=2, z=-1},
		maxvel = {x=1, y=4, z=1},
		minacc = {x=0, y=-7, z=0},
		maxacc = {x=0, y=-7, z=0},
		exptime = {min = 1, max = 2},
		minsize = 2,
		maxsize = 3,
		texture = "mtools_heart.png"})
	end
	pos.y = pos.y + .5

	if item:get_name() == "mapgen:green_rupee" then
		if not mobs.is_creative(pname) then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		core.add_item(pos, {name = "default:beech_leaves"})
	elseif item:get_name() == "mapgen:blue_rupee" then
		if not mobs.is_creative(pname) then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		core.add_item(pos, {name = "default:stick"})
	elseif item:get_name() == "mapgen:red_rupee" then
		if not mobs.is_creative(pname) then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		core.add_item(pos, {name = "default:dirt"})
	end
	end,
})

mobs:register_mob("mobs_loz:business_scrub_passive2", {
	type = "animal",
	passive = true,
	reach = 1,
	damage = 2,
	hp_min = 10,
	hp_max = 25,
	armor = 90,
	collisionbox = {-.25, 0, -.25, .25, 1, .25},
	visual = "mesh",
	mesh = "business_scrub.b3d",
	textures = {
		{"mobs_business_scrub_beard.png"},
	},
	runaway = true,
	knock_back = 1,
	runaway_timer = 20,
	visual_size = {x=1, y=1},
	blood_texture = "default_wood.png",
	view_range = 10,
	walk_velocity = 1.5,
	run_velocity = 5,
	jump_height = 5,
	makes_footstep_sound = true,
	drops = {
		{name = "mobs_loz:weird_beard", chance = 1, min = 1, max = 1},
		{name = "farming:spent_biomasse", chance = 1, min = 2, max = 5},
		{name = "mtools:heart", chance = 5, min = 1, max = 1},
		{name = "mobs_loz:nut", chance = 9, min = 1, max = 2},
		{name = "mapgen:blue_rupee", chance = 10, min = 1, max = 3},
	},
	water_damage = -1,
	lava_damage = 1,
	light_damage = -1,
	light_damage_min = 8,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 1,
		stand_end = 20,
		walk_start = 60,
		walk_end = 80,
		run_start = 60,
		run_end = 80,
	},
	on_rightclick = function(self, clicker)
	local item = clicker:get_wielded_item()
	local pname = clicker:get_player_name()
	local pos = self.object:get_pos()	if not pos then return end
	pos.y = pos.y + .5

	if item:get_name() == "mapgen:green_rupee" then
		if not mobs.is_creative(pname) then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		core.add_item(pos, {name = "default:beech_leaves"})
	elseif item:get_name() == "mapgen:blue_rupee" then
		if not mobs.is_creative(pname) then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		core.add_item(pos, {name = "default:stick"})
	elseif item:get_name() == "mapgen:red_rupee" then
		if not mobs.is_creative(pname) then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		core.add_item(pos, {name = "default:dirt"})
	end
	end,
})

mobs:register_egg("mobs_loz:business_scrub_passive", "Business Scrub (passive)", "default_beech_leaves.png", 1)

core.register_craftitem("mobs_loz:nut", {
	description = "Deku Nut",
	inventory_image = "mobs_nut.png",
})

core.register_craftitem("mobs_loz:weird_beard", {
	description = "Weird Beard",
	inventory_image = "mobs_weird_beard.png",
	groups = {not_in_creative_inventory=1}
})


