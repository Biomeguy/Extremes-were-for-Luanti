
local S = mobs.intllib

-- Bee by KrupnoPavel (.b3d model by sirrobzeroone)

mobs:register_mob("mobs_animal:bee", {
	type = "animal",
	passive = true,
	hp_min = 1,
	hp_max = 2,
	armor = 200,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.5, 0.2},
	visual = "mesh",
	mesh = "mobs_bee.b3d",
	textures = {
		{"mobs_bee.png"},
	},
	blood_texture = "mobs_bee_inv.png",
	blood_amount = 1,
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_bee",
	},
	walk_velocity = 1,
	jump = true,
	drops = {
		{name = "mobs:honey", chance = 2, min = 1, max = 2},
	},
	water_damage = 1,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 0,
	fall_speed = -3,
	animation = {
		speed_normal = 15,
		stand_start = 0,
		stand_end = 30,
		walk_start = 35,
		walk_end = 65,
	},
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, 50, 90, 0, true, "mobs_animal:bee")
	end,

	do_custom = function(self, dtime)

		self.egg_timer = (self.egg_timer or 0) + dtime
		if self.egg_timer < 10 then
			return
		end
		self.egg_timer = 0

		if self.child or math.random(1, 100) > 1 then
			return
		end

		local pos = self.object:get_pos()

		core.add_item(pos, "mobs:beeswax")

		core.sound_play("default_place_node_hard", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5,
		})
	end,
--	after_activate = function(self, staticdata, def, dtime)
--		print ("------", self.name, dtime, self.health)
--	end,
})

mobs:spawn({
	name = "mobs_animal:bee",
	nodes = {"group:flower"},
	min_light = 14,
	interval = 60,
	chance = 7000,
	min_height = 3,
	max_height = 200,
	day_toggle = true,
})

mobs:register_egg("mobs_animal:bee", S("Bee"), "mobs_bee_inv.png")

-- honey
core.register_craftitem(":mobs:honey", {
	description = S("Honey"),
	inventory_image = "mobs_honey.png",
	on_use = core.item_eat(4),
	groups = {honey = 1, sugar = 1, flammable = 1},
})

-- beeswax
core.register_craftitem(":mobs:beeswax", {
	description = S("Beeswax"),
	inventory_image = "mobs_beeswax.png",
	groups = {wax = 1, flammable = 1},
})

-- beehive (when placed spawns bee)
core.register_node(":mobs:beehive", {
	description = S("Beehive"),
	drawtype = "plantlike",
	tiles = {"mobs_beehive.png"},
	inventory_image = "mobs_beehive.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	groups = {oddly_breakable_by_hand = 3, flammable = 1},
	sounds = default.node_sound_defaults(),

	on_construct = function(pos)

		local meta = core.get_meta(pos)

		meta:set_string("formspec", "size[8,6]"
			..default.gui_bg..default.gui_bg_img..default.gui_slots
			.. "image[3,0.8;0.8,0.8;mobs_bee_inv.png]"
			.. "list[current_name;beehive;4,0.5;1,1;]"
			.. "list[current_player;main;0,2.35;8,4;]"
			.. "listring[]")

		meta:get_inventory():set_size("beehive", 1)
	end,

	after_place_node = function(pos, placer, itemstack)

		if placer and placer:is_player() then

			core.set_node(pos, {name = "mobs:beehive", param2 = 1})

			if math.random(1, 4) == 1 then
				core.add_entity(pos, "mobs_animal:bee")
			end
		end
	end,

	on_punch = function(pos, node, puncher)

		-- yep, bee's don't like having their home punched by players
		puncher:set_hp(puncher:get_hp() - 4)
	end,

	allow_metadata_inventory_put = function(pos, listname, index, stack, player)

		if listname == "beehive" then
			return 0
		end

		return stack:get_count()
	end,

	can_dig = function(pos,player)

		local meta = core.get_meta(pos)

		-- only dig beehive if no honey inside
		return meta:get_inventory():is_empty("beehive")
	end,

})

core.register_craft({
	output = "mobs:beehive",
	recipe = {
		{"mobs_animal:bee", "mobs_animal:bee", "mobs_animal:bee"},
		{"mobs:beeswax", "mobs:beeswax", "mobs:beeswax"},
		{"default:paper", "default:paper", "default:paper"}
	}
})

-- honey block
core.register_node(":mobs:honey_block", {
	description = S("Honey Block"),
	tiles = {"mobs_honey_block.png"},
	groups = {snappy = 3, flammable = 2},
	sounds = default.node_sound_dirt_defaults(),
})

register_nine("mobs:honey_block", "mobs:honey")

-- beehive workings
core.register_abm({
	nodenames = {"mobs:beehive"},
	interval = 12,
	chance = 6,
	catch_up = false,
	action = function(pos, node)

		-- bee's only make honey during the day
		local tod = (core.get_timeofday() or 0) * 24000

		if tod < 5500 or tod > 18500 then
			return
		end

		-- is hive full?
		local meta = core.get_meta(pos)
		if not meta then return end -- for older beehives
		local inv = meta:get_inventory()
		local honey = inv:get_stack("beehive", 1):get_count()

		-- is hive full?
		if honey > 11 then
			return
		end

		-- no flowers no honey, nuff said!
		if #core.find_nodes_in_area_under_air(
			{x = pos.x - 4, y = pos.y - 3, z = pos.z - 4},
			{x = pos.x + 4, y = pos.y + 3, z = pos.z + 4},
			"group:flower") > 3 then

			inv:add_item("beehive", "mobs:honey")
		end
	end
})
