
-- language support
local S = ethereal.intllib

-- stairsplus active
local stairs_plus = core.global_exists("stairsplus")

-- stair selection function
local do_stair = function(description, name, node, groups, texture, sound, worldaligntex)

	stairs.register_stair_and_slab(name, node, groups, texture,
		S(description .. " Stair"), S(description .. " Slab"), sound, worldaligntex)

	if stairs_plus then

		stairsplus:register_all("ethereal", name, node, {
			description = S(description),
			tiles = texture,
			groups = groups,
			sounds = sound,
		})

	end
end


-- Register Stairs

do_stair(
	"Blue Marble",
	"blue_marble",
	"ethereal:blue_marble",
	{cracky = 1},
	{"ethereal_blue_marble.png"},
	default.node_sound_stone_defaults(),
	true)

do_stair(
	"Blue Marble Tile",
	"blue_marble_tile",
	"ethereal:blue_marble_tile",
	{cracky = 1},
	{"ethereal_blue_marble_tile.png"},
	default.node_sound_stone_defaults(),
	true)

do_stair(
	"Frost Wood",
	"frost_wood",
	"ethereal:frost_wood",
	{choppy = 2, oddly_breakable_by_hand = 1},
	{"frost_wood.png"},
	default.node_sound_wood_defaults(),
	false)

do_stair(
	"Healing Wood",
	"yellow_wood",
	"ethereal:yellow_wood",
	{choppy = 2, oddly_breakable_by_hand = 1},
	{"yellow_wood.png"},
	default.node_sound_wood_defaults(),
	false)

do_stair(
	"Banana Wood",
	"banana_wood",
	"ethereal:banana_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"banana_wood.png"},
	default.node_sound_wood_defaults(),
	false)

do_stair(
	"Willow Wood",
	"willow_wood",
	"ethereal:willow_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 2},
	{"willow_wood.png"},
	default.node_sound_wood_defaults(),
	false)

do_stair(
	"Redwood",
	"redwood_wood",
	"ethereal:redwood_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"redwood_wood.png"},
	default.node_sound_wood_defaults(),
	false)

do_stair(
	"Bamboo",
	"bamboo_wood",
	"ethereal:bamboo_block",
	{snappy = 2, choppy = 1, oddly_breakable_by_hand = 1, flammable = 2},
	{"bamboo_floor.png"},
	default.node_sound_wood_defaults(),
	false)

do_stair(
	"Sakura Wood",
	"sakura_wood",
	"ethereal:sakura_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	{"ethereal_sakura_wood.png"},
	default.node_sound_wood_defaults(),
	false)
