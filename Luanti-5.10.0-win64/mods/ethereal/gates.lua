
local S = ethereal.intllib

doors.register_fencegate("ethereal:fencegate_scorched", {
	description = S("Scorched Wood Fence Gate"),
	texture = "scorched_trunk.png",
	material = "ethereal:scorched_trunk",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 1}
})

doors.register_fencegate("ethereal:fencegate_frostwood", {
	description = S("Frost Wood Fence Gate"),
	texture = "frost_wood.png",
	material = "ethereal:frost_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1}
})

doors.register_fencegate("ethereal:fencegate_redwood", {
	description = S("Redwood Fence Gate"),
	texture = "redwood_wood.png",
	material = "ethereal:redwood_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

doors.register_fencegate("ethereal:fencegate_willow", {
	description = S("Willow Wood Fence Gate"),
	texture = "willow_wood.png",
	material = "ethereal:willow_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 2}
})

doors.register_fencegate("ethereal:fencegate_yellowwood", {
	description = S("Healing Wood Fence Gate"),
	texture = "yellow_wood.png",
	material = "ethereal:yellow_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1}
})

doors.register_fencegate("ethereal:fencegate_banana", {
	description = S("Banana Wood Fence Gate"),
	texture = "banana_wood.png",
	material = "ethereal:banana_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3}
})

doors.register_fencegate("ethereal:fencegate_sakura", {
	description = S("Sakura Wood Fence Gate"),
	texture = "ethereal_sakura_wood.png",
	material = "ethereal:sakura_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

-- sakura door
doors.register_door("ethereal:door_sakura", {
	tiles = {
		{name = "ethereal_sakura_door.png", backface_culling = true}
	},
	description = S("Sakura Wood Door"),
	inventory_image = "ethereal_sakura_door_inv.png",
	groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sound_open = "doors_glass_door_open",
	sound_close = "doors_glass_door_close",
	recipe = {
		{"group:stick",  "default:paper"},
		{"default:paper",  "group:stick"},
		{"ethereal:sakura_wood", "ethereal:sakura_wood"}
	}
})
