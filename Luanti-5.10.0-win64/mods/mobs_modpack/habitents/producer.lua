
local S = core.get_translator("habitents")-- Dummy call

mobs.produ = {
	names = {
		"Bob", "Duncan", "Bill", "Tom", "James", "Ian", "Lenny",
		"Dylan", "Ethan", "Sam", "Aubrey"
	},

	items = {
		--{item for sale, price, chance of appearing in producer's inventory}
		{"default:apple 10", "default:gold_ingot 2", 10},
		{"farming:wheat_bread 10", "default:gold_ingot 4", 5},
		{"default:clay 10", "default:gold_ingot 2", 12},
		{"default:brick 10", "default:gold_ingot 4", 17},
		{"default:glass 10", "default:gold_ingot 4", 17},
		{"default:obsidian 10", "default:gold_ingot 15", 50},
		{"default:diamond 1", "default:gold_ingot 5", 40},
		{"farming:wheat 10", "default:gold_ingot 2", 17},
		{"default:beech_trunk 5", "default:gold_ingot 4", 20},
		{"default:stone 10", "default:gold_ingot 8", 17},
		{"default:desert_stone 10", "default:gold_ingot 8", 27},
		{"default:sapling 1", "default:gold_ingot 1", 7},
		{"default:pick_steel 1", "default:gold_ingot 2", 7},
		{"default:sword_steel 1", "default:gold_ingot 2", 17},
		{"default:shovel_steel 1", "default:gold_ingot 1", 17},
		{"default:cactus 2", "default:gold_ingot 2", 40},
		{"default:reed 2", "default:gold_ingot 2", 40},
		{"default:mese_crystal_fragment 1", "default:dirt_with_grass 10", 90},
		{"default:mese_crystal_fragment 1", "default:gold_ingot 5", 90},
	}
}

-- Producer ( same as NPC but with right-click shop )

mobs:register_mob("habitents:producer", {
	type = "npc",
	damage = 3,
	attack_type = "dogfight",
	attack_monsters = true,
	attack_npcs = false,
	pathfinding = 1,
	--runaway_from = {"mobs_monster:stone_monster"},
	stay_near = {"default:wood", 4},
	hp_min = 10,
	hp_max = 20,
	armor = 100,
	collisionbox = {-.3, 0, -.3, .3, 1.7, .3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {
		{"mobs_villager.png"},
		{"mobs_producer.png"}, -- by Frerin
		{"mobs_producer2.png"},
		{"mobs_producer3.png"},
		{"hexplorer.png"},
		{"hnpc_male.png"},
	},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	follow = {"default:diamond", "mobs:meat", "farming:wheat_bread", "default:gold_ingot",
"farming:blackberries", "farming:blackcurrants", "farming:blueberries",
"farming:carrot", "farming:celery", "farming:cilantro", "farming:cucumber",
"farming:gooseberries", "group:grapes", "farming:huckleberries", "group:lettuce",
"farming:melon_slice", "farming:parsley", "farming:raspberries",
"farming:strawberry", "group:zucchini", "group:zucchini_cooked"},
	view_range = 15,
	fear_height = 3,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198
	},

	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()

		-- right clicking with food heals the producer
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:wheat_bread" then
			if mobs:feed_tame(self, clicker, 8, true, true) then
			self.order = "" return end
		end

		if not self.child and not clicker:get_player_control().aux1 then
			-- sneak right clicking with swords improves the producer's defences
			if core.get_item_group(item:get_name(), "sword") == 1 and clicker:get_player_control().sneak then
	local weapon_punch = core.registered_tools[item:get_name()].tool_capabilities.damage_groups["fleshy"]
	if weapon_punch > self.damage then
		self.damage = weapon_punch
	if self.weapon then
		local inv = clicker:get_inventory()
		local leftover = inv:add_item("main", self.weapon)
		if leftover:get_count() > 0 then

	-- drop tool in front of player
	local droppos = clicker:get_pos()
	local dir = clicker:get_look_dir()

	droppos.x = droppos.x + dir.x
	droppos.z = droppos.z + dir.z
	core.add_item(droppos, leftover)
		end
	end
		self.weapon = item:get_name()
		local name = clicker:get_player_name()
		if not mobs.is_creative(name) then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		core.chat_send_player(name,
		S("[NPC] <Producer> Thanks you, @1, for this "..self.weapon..".", name))
	end
			else-- opens the producer's shop
	self.attack = nil
	self.order = "stand"
	mobs_producer(self, clicker, mobs.produ)
	return
			end
		end

		self.order = ""
	end,

	on_spawn = function(self)

		self.nametag = "Producer"

		self.object:set_properties({
			nametag = self.nametag,
			nametag_color = "#FFFFFF"
		})

		return true -- return true so on_spawn is run once only
	end,

	do_custom = function(self)
if core.get_modpath("hbhunger") then
		self.hunger = (self.hunger or 0) + 1
		if self.hunger == 8000 then
	self.hunger = 0
	local pos = self.object:get_pos()	if not pos then return end
	local crop = core.find_node_near(pos, 3, {"farming:blackberry_S6", "farming:blackcurrant_S7",
	"farming:blueberry_S7", "farming:carrot_S7", "farming:carrot_S8", "farming:celery_S5", "farming:cilantro_S5",
	"farming:cucumber_S7", "farming:gooseberry_S7", "farming:gooseberry_S8", "farming:grapes_S8",
	"farming:grapes_S9", "farming:grapes_S10", "farming:grapes_S11", "farming:huckleberry_S6",
	"farming:iceberg_lettuce_S7", "farming:romaine_lettuce_S5", "farming:melon_S7", "farming:parsley_S5",
	"farming:raspberry_S6", "farming:strawberry_S10", "farming:zucchini_S7", "farming:zucchini_S8"})
		if crop then
	local n = core.get_node(crop)
	n.name = habitents.crop_correspondences[n.name]
	if n.name then
		core.set_node(crop, n)
		core.get_node_timer(crop):start(math.random(166, 286))
		self.health = math.min(self.health+6, 20)
		self.object:set_hp(self.health)
		self.hunger = -40000
	end
		else
	self.health = self.health-1
	self.object:set_hp(self.health)
		end
		end
end
	end,

	on_die = function(self, pos)
		if self.weapon then
			core.add_item(pos, self.weapon)
		end
	end,
})

mobs:register_egg("habitents:producer", "Producer", "default_desert_sandstone.png", 1)
