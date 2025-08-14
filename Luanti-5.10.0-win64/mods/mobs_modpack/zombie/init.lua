
-- Zombie by BlockMen

mobs:register_mob("zombie:zombie", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	damage = 3,
	reach = 1.4,
	hp_min = 12,
	hp_max = 35,
	armor = 150,
	collisionbox = {-.3, -1, -.3, .3, .75, .3},
	visual = "mesh",
	mesh = "creatures_mob.x",
	textures = {
		{"mobs_zombie.png"},
	},
	visual_size = {x=1, y=1},
	blood_texture = "mobs_rotten_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_zombie",
		damage = "mobs_zombie_hit",
		attack = "mobs_zombie",
		death = "mobs_zombie_death",
	},
	walk_velocity = .5,
	run_velocity = 1,
	jump = true,
	floats = 0,
	view_range = 10,
	drops = {
		{name = "zombie:rotten_flesh", chance = 2, min = 3, max = 5},
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 10,		speed_run = 15,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 188,
		run_start = 168,		run_end = 188,
	},
})

local player_inv_lists = {"main", "craft"}

core.register_on_punchplayer(function(player, hitter, _, _, _, dmg)
	if core.settings:get_bool("remove_far_mobs") ~= true then
if hitter:get_luaentity() and hitter:get_luaentity().name == "zombie:zombie" and player and player:get_hp() - dmg < 1 then
	hitter:set_hp(hitter:get_hp()+5)-- Should it be healed on each hit
	local p = vector.round(player:get_pos())	p.y= p.y+.5
	core.add_entity(p, "zombie:zombie")-- Is meant to have the inventory items
	local player_inv = player:get_inventory()

	for _, list_name in ipairs(player_inv_lists) do
		for i = 1, player_inv:get_size(list_name) do
	local stack = player_inv:get_stack(list_name, i)
	core.add_item(p, stack:take_item(stack:get_count()))
		end
		player_inv:set_list(list_name, {})
	end
end end
	return false
end)

--name, nodes, neighbours, minlight, maxlight, interval, chance, active_object_count, min_height, max_height
mobs:spawn({
	name = "zombie:zombie",
	nodes = {"default:dirt_with_grass"},
	min_light = 0,
	max_light = 7,
	chance = 9000,
	active_object_count = 2,
	min_height = 0,
	day_toggle = false,
})

mobs:register_egg("zombie:zombie", "Zombie", "zombie_head.png", 0)

core.register_craftitem("zombie:rotten_flesh", {
	description = "Rotten Flesh",
	inventory_image = "mobs_rotten_flesh.png",
	on_use = core.item_eat(-5, "bonemeal:bone"),
	groups = {flammable = 2},
})

core.register_craft({
	output = "bonemeal:bone",
	recipe = {{"zombie:rotten_flesh"}},
	replacements = {{"zombie:rotten_flesh", "farming:spent_biomasse"}}
})
