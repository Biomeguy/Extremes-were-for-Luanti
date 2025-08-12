
local S = ethereal.intllib

default.register_fence("ethereal:fence_scorched", {
	description = S("Scorched Fence"),
	texture = "scorched_trunk.png",
	material = "ethereal:scorched_trunk",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 1},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("ethereal:fence_frostwood", {
	description = S("Frost Fence"),
	texture = "frost_wood.png",
	material = "ethereal:frost_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("ethereal:fence_redwood", {
	description = S("Redwood Fence"),
	texture = "redwood_wood.png",
	material = "ethereal:redwood_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("ethereal:fence_willow", {
	description = S("Willow Fence"),
	texture = "willow_wood.png",
	material = "ethereal:willow_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("ethereal:fence_yellowwood", {
	description = S("Healing Wood Fence"),
	texture = "yellow_wood.png",
	material = "ethereal:yellow_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("ethereal:fence_banana", {
	description = S("Banana Wood Fence"),
	texture = "banana_wood.png",
	material = "ethereal:banana_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence("ethereal:fence_sakura", {
	description = S("Sakura Fence"),
	texture = "ethereal_sakura_wood.png",
	material = "ethereal:sakura_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})
