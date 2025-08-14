
local S = mobs.intllib


-- Cow by sirrobzeroone

mobs:register_mob("mobs_animal:cow", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	attack_npcs = false,
	reach = 2,
	damage = 4,
	hp_min = 5,
	hp_max = 20,
	armor = 200,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.2, 0.4},
	visual = "mesh",
	mesh = "mobs_cow.b3d",
	textures = {
		{"mobs_cow.png"},
		{"mobs_cow2.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_cow",
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	jump_height = 6,
	pushable = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},
		{name = "mobs:leather", chance = 1, min = 0, max = 2},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		stand_start = 0,
		stand_end = 30,
		stand_speed = 20,
		stand1_start = 35,
		stand1_end = 75,
		stand1_speed = 20,
		walk_start = 85,
		walk_end = 114,
		walk_speed = 20,
		run_start = 120,
		run_end = 140,
		run_speed = 30,
		punch_start = 145,
		punch_end = 160,
		punch_speed = 20,
		die_start = 165,
		die_end = 185,
		die_speed = 10,
		die_loop = false,
	},
	follow = {"farming:wheat", "default:grass_1", "farming:cut_grass", "farming:hay_pile"},
	view_range = 8,
	replace_rate = 10,
	replace_what = {
		{"group:grass", "air", 0},
		{"default:dirt_with_grass", "default:dirt", -1},
		{"farming:wheat_S8", "air", 0}
	},
	fear_height = 2,
	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 8, true, true) then

			-- if fed 7x wheat or grass then cow can be milked again
			if self.food and self.food > 6 then
				self.gotten = false
			end

			return
		end

		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 60, false, nil) then return end

		local tool = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- milk cow with empty bucket
		if tool:get_name() == "bucket:bucket_empty" then

			--if self.gotten == true
			if self.child == true then
				return
			end

			if self.gotten == true then
				core.chat_send_player(name,
					S("Cow already milked!"))
				return
			end

			local inv = clicker:get_inventory()

			tool:take_item()
			clicker:set_wielded_item(tool)

			if inv:room_for_item("main", {name = "mobs:bucket_milk"}) then
				clicker:get_inventory():add_item("main", "mobs:bucket_milk")
			else
				local pos = self.object:get_pos()
				pos.y = pos.y + 0.5
				core.add_item(pos, {name = "mobs:bucket_milk"})
			end

			self.gotten = true -- milked

			return
		end
	end,
	on_replace = function(self, pos, oldnode, newnode)

		self.food = (self.food or 0) + 1

		-- if cow replaces 8x grass then it can be milked again
		if self.food >= 8 then
			self.food = 0
			self.gotten = false
		end
	end,
})


mobs:spawn({
	name = "mobs_animal:cow",
	nodes = {"default:dirt_with_grass", "ethereal:grove_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 5,
	max_height = 200,
	day_toggle = true,
})


mobs:register_egg("mobs_animal:cow", S("Cow"), "mobs_cow_inv.png")

mobs:register_mob("mobs_animal:cow2", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	attack_npcs = false,
	pathfinding = 1,
	reach = 2,
	damage = 4,
	hp_min = 5,
	hp_max = 20,
	armor = 200,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 1, 0.2},
	visual = "mesh",
	mesh = "mobs_cow2.b3d",
	textures = {
		{"mobs_cow_tyrol_grey_01.png"},
		{"mobs_cow_tyrol_grey_02.png"},
		{"mobs_cow_simmental_01.png"},
		{"mobs_cow_simmental_02.png"},
		{"mobs_cow_red_belted_galloway_01.png"},
		{"mobs_cow_red_belted_galloway_02.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random ="mobs_cow_ran",
		attack ="mobs_cow_att",
		death ="mobs_cow_dth",
		damage ="mobs_cow_dam",
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	jump_height = 6,
	pushable = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},
		{name = "mobs:leather", chance = 1, min = 0, max = 2},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		stand_start = 0,
		stand_end = 30,
		stand_speed = 24,
		stand1_start = 35,
		stand1_end = 75,
		stand1_speed = 24,
		walk_start = 85,
		walk_end = 114,
		walk_speed = 24,
		run_start = 120,
		run_end = 140,
		run_speed = 24,
		punch_start = 145,
        punch_end = 165,
        punch_speed = 34,
		die_start = 191,  
        die_end = 210,
        die_speed = 26, 
        die_loop = false,
	},
	follow = {"farming:wheat", "default:grass_1", "farming:cut_grass", "farming:hay_pile"},
	view_range = 8,
	replace_rate = 10,
	replace_what = {
		{"group:grass", "air", 0},
		{"default:dirt_with_grass", "default:dirt", -1},
		{"farming:wheat_S8", "air", 0}
	},
	fear_height = 2,
	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 8, true, true) then

			-- if fed 7x wheat or grass then cow can be milked again
			if self.food and self.food > 6 then
				self.gotten = false
			end

			return
		end

		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 60, false, nil) then return end

		local tool = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- milk cow with empty bucket
		if tool:get_name() == "bucket:bucket_empty" then

			--if self.gotten == true
			if self.child == true then
				return
			end

			if self.gotten == true then
				core.chat_send_player(name, S("Cow already milked!"))
				return
			end

			local inv = clicker:get_inventory()

			tool:take_item()
			clicker:set_wielded_item(tool)

			if inv:room_for_item("main", {name = "mobs:bucket_milk"}) then
				clicker:get_inventory():add_item("main", "mobs:bucket_milk")
			else
				local pos = self.object:get_pos()
				pos.y = pos.y + 0.5
				core.add_item(pos, {name = "mobs:bucket_milk"})
			end

			self.gotten = true -- milked

			return
		end
	end,
	on_replace = function(self, pos, oldnode, newnode)

		self.food = (self.food or 0) + 1

		-- if cow replaces 8x grass then it can be milked again
		if self.food >= 8 then
			self.food = 0
			self.gotten = false
		end
	end,
})


mobs:spawn({
	name = "mobs_animal:cow2",
	nodes = {"default:dirt_with_grass", "ethereal:grove_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 5,
	max_height = 200,
	day_toggle = true,
})

mobs:register_egg("mobs_animal:cow2", S("Cow 2"), "mobs_cow_red_belted_galloway_01.png", 1)


-- bucket of milks
core.register_craftitem(":mobs:bucket_milk", {
	description = S("Bucket of Milk"),
	inventory_image = "mobs_bucket_milk.png",
	stack_max = 1,
	on_use = core.item_eat(8, "bucket:bucket_empty"),
	groups = {milk = 1},
})

core.register_craftitem(":mobs:bucket_skim_milk", {
	description = S("Bucket of Skim Milk"),
	inventory_image = "foods_bucket_1.png",
	stack_max = 1,
	on_use = core.item_eat(7, "bucket:bucket_empty"),
	groups = {milk = 1},
})

core.register_craftitem(":mobs:bucket_whey", {
	description = S("Bucket of Whey"),
	inventory_image = "foods_bucket_1.png",
	stack_max = 1,
	on_use = core.item_eat(7, "bucket:bucket_empty"),
	groups = {milk = 1},
})

core.register_craftitem(":mobs:bucket_cream", {
	description = S("Bucket of Cream"),
	inventory_image = "foods_bucket_2.png",
	stack_max = 1,
	on_use = core.item_eat(8, "bucket:bucket_empty"),
})

core.register_craftitem(":mobs:bucket_evaporated_milk", {
	description = S("Bucket of Evaporated Milk"),
	inventory_image = "foods_bucket_2.png",
	stack_max = 1,
	on_use = core.item_eat(8, "bucket:bucket_empty"),
	groups = {milk = 1},
})

core.register_craftitem(":mobs:bucket_condensed_milk", {
	description = S("Bucket of Condensed Milk"),
	inventory_image = "foods_bucket_3.png",
	stack_max = 1,
	on_use = core.item_eat(8, "bucket:bucket_empty"),
})

-- glass of milk
core.register_craftitem(":mobs:glass_milk", {
	description = S("Glass of Milk"),
	inventory_image = "mobs_glass_milk.png",
	on_use = core.item_eat(2, "vessels:drinking_glass"),
	groups = {milk_glass = 1, flammable = 3, vessel = 1},
})

core.register_craft({
	type = "shapeless",
	output = "mobs:glass_milk 4",
	recipe = {"vessels:drinking_glass", "vessels:drinking_glass",
		"vessels:drinking_glass", "vessels:drinking_glass", "mobs:bucket_milk"},
	replacements = {{"mobs:bucket_milk", "bucket:bucket_empty"}}
})

core.register_craft({
	type = "shapeless",
	output = "mobs:bucket_milk",
	recipe = {"mobs:glass_milk", "mobs:glass_milk",
		"mobs:glass_milk", "mobs:glass_milk", "bucket:bucket_empty"},
	replacements = {
		{"mobs:glass_milk", "vessels:drinking_glass"},
		{"mobs:glass_milk", "vessels:drinking_glass"},
		{"mobs:glass_milk", "vessels:drinking_glass"},
		{"mobs:glass_milk", "vessels:drinking_glass"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "mobs:bucket_cream",
	recipe = {"mobs:bucket_milk", "foods:separater"},
	replacements = {
		{ "mobs:bucket_milk", "mobs:bucket_skim_milk"},
		{"foods:separater", "foods:separater"}
	}
})

-- butter
core.register_craftitem(":mobs:butter", {
	description = S("Butter"),
	inventory_image = "mobs_butter.png",
	on_use = core.item_eat(1),
	groups = {butter = 1, flammable = 2},
})

core.register_craft({
	type = "shapeless",
	output = "mobs:butter",
	recipe = {"mobs:bucket_cream", "foods:churn", "farming:salt"},
	replacements = {
		{ "mobs:bucket_cream", "mobs:bucket_whey"},
		{"foods:churn", "foods:churn"}
	}
})

core.register_craft({
	type = "shapeless",
	output = "mobs:butter",
	recipe = {"mobs:bucket_cream", "foods:churn", "default:mangrove_leaves"},
	replacements = {
		{"mobs:bucket_cream", "mobs:bucket_whey"},
		{"foods:churn", "foods:churn"}
	}
})
-- some saplings are high in sodium so makes a good replacement item
core.register_craft({
	type = "shapeless",
	output = "mobs:butter",
	recipe = {"mobs:bucket_cream", "foods:churn", "default:sapling"},
	replacements = {
		{"mobs:bucket_cream", "mobs:bucket_whey"},
		{"foods:churn", "foods:churn"}
	}
})

-- cheese wedge
core.register_craftitem(":mobs:cheese", {
	description = S("Cheese"),
	inventory_image = "mobs_cheese.png",
	on_use = core.item_eat(4),
	groups = {cheese = 1, flammable = 2},
})

core.register_craft({
	type = "shapeless",
	output = "mobs:cheese",
	recipe = {"mobs:bucket_milk"},
	replacements = {{"mobs:bucket_milk", "mobs:bucket_whey"}}
})

-- cheese block
core.register_node(":mobs:cheese_block", {
	description = S("Cheese Block"),
	tiles = {"mobs_cheese_block.png"},
	is_ground_content = false,
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults()
})

register_nine("mobs:cheese_block", "mobs:cheese")

core.register_craft({
	type = "cooking",
	cooktime = 5,
	output = "mobs:bucket_evaporated_milk",
	recipe = "mobs:bucket_milk",
})

core.register_craft({
	type = "shapeless",
	output = "mobs:bucket_condensed_milk",
	recipe = {"mobs:bucket_evaporated_milk", "group:sugar", "group:sugar"},
})

core.register_craft({
	type = "shapeless",
	output = "mobs:bucket_condensed_milk",
	recipe = {"mobs:bucket_evaporated_milk", "foods:molasses_1", "foods:molasses_1"},
	replacements = {
		{"foods:molasses_1", "vessels:glass_bottle"},
		{"foods:molasses_1", "vessels:glass_bottle"}
	}
})
