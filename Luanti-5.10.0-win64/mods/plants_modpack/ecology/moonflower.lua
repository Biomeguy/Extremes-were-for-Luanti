-- Moon Flower mod by MirceaKitsune

local SPAWN_ATTEMPTS = 5 -- How many times to attempt spawning per chunk
local SPAWN_PROBABILITY = .1 -- Probability of each spawn attempt
local OPEN_TIME_START = .2 -- Time at which moon flowers open
local OPEN_TIME_END = .8 -- Time at which moon flowers close

set_moonflower = function(pos)
	-- choose the appropriate form of the moon flower
	if (core.get_node_light(pos, .5) == 15)
	and ((core.get_timeofday() < OPEN_TIME_START) or (core.get_timeofday() > OPEN_TIME_END)) then
		core.add_node(pos, {name = "ecology:moonflower_open"})
		core.get_node_timer(pos):start(math.random(7, 10))
	else
		core.add_node(pos, {name = "ecology:moonflower_closed"})
		core.get_node_timer(pos):start(math.random(7, 10))
	end
end

core.register_node("ecology:moonflower_closed", {
	description = "Moon flower",
	drawtype = "plantlike",
	tiles = {"moonflower_closed.png"},
	inventory_image = "moonflower_closed.png",
	wield_image = "moonflower_closed.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {snappy = 3, flammable=2, flower=1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-.15, -.5, -.15, .15, .2, .15},
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(7, 10))
	end,
	on_timer = function(pos, elapsed)
		set_moonflower(pos)
	end,
})

core.register_node("ecology:moonflower_open", {
	description = "Moon flower",
	drawtype = "plantlike",
	tiles = {"moonflower_open.png"},
	inventory_image = "moonflower_open.png",
	wield_image = "moonflower_open.png",
	paramtype = "light",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	light_source = LIGHT_MAX / 2,
	groups = {snappy = 3, flammable=2, flower=1, attached_node=1, not_in_creative_inventory = 1},
	drop = 'ecology:moonflower_closed',
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-.15, -.5, -.15, .15, .2, .15},
	},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(7, 10))
	end,
	on_timer = function(pos, elapsed)
		set_moonflower(pos)
	end,
})

core.register_on_generated(function(minp, maxp, seed)
for attempts = 0, SPAWN_ATTEMPTS do
	-- choose a random location on the X and Z axis
	local coords_x = math.random(minp.x, maxp.x)
	local coords_z = math.random(minp.z, maxp.z)

	-- now scan upward until we find a suitable spot on the Y axis, if none is found this attempt has failed
	for coords_y = minp.y, maxp.y do
		local pos_here = { x = coords_x, y = coords_y, z = coords_z }
		local node_here = core.get_node(pos_here)
		local pos_top = { x = coords_x, y = coords_y + 1, z = coords_z }
		local node_top = core.get_node(pos_top)

		if (node_here.name == "default:dirt_with_grass") and (node_top.name == "air") then
			if (math.random() <= SPAWN_PROBABILITY) then
				set_moonflower(pos_top)
			end
			break
		end
	end
end
end)
