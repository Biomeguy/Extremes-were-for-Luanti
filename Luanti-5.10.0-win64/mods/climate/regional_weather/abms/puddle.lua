local BLOCK_PREFIX = "regional_weather:puddle_"
local VARIANT_COUNT = 39
local MIN_DISTANCE = 4

local GROUND_COVERS = {
	"group:soil",
	"group:stone",
	"group:sand",
	"group:wood",
	"default:permafrost",
	"default:permafrost_with_moss",
	"default:permafrost_with_stones"
}

if not regional_weather.settings.puddles then
	for i=1,VARIANT_COUNT do
		for r=0,270,90  do
			core.register_alias(BLOCK_PREFIX .. i .. "_" .. r, "air")
		end
	end
	return
end

local apply_water_group
if regional_weather.settings.puddles_water then
	apply_water_group = 1
end

for i = 1,VARIANT_COUNT do
	for flip = 0,1 do
		local name = BLOCK_PREFIX .. i
		local index = i
		if i < 10 then index = "0" .. i end
		local texture = "weather_puddle_" .. index .. ".png^[opacity:128"
		if flip == 1 then
			name = name .. "_flipped"
			texture = texture .. "^[transformFX"
		end
		core.register_node(name, {
			tiles = { texture },
			drawtype = "nodebox",
			pointable = false,
			buildable_to = true,
			floodable = true,
			sunlight_propagates = true,
			paramtype = "light",
			paramtype2 = "facedir",
			use_texture_alpha = "blend",
			node_box = {
				type  = "fixed",
				fixed = {-.5, -.5, -.5, .5, -.49, .5}
			},
			collision_box = {
				type  = "fixed",
				fixed = {-.5, -.5, -.5, .5, -.45, .5}
			},
			groups = {
				not_in_creative_inventory = 1,
				crumbly = 3,
				attached_node = 1,
				slippery = 1,
				flora = 1,
				water = apply_water_group,
				weather_puddle = 1
			},
			drop = "",
			sounds = {
				footstep = {
					name = "weather_puddle",
					gain = 0.8
				}
			}
		})
	end
end

core.register_alias("regional_weather:puddle", BLOCK_PREFIX .. "14")

local function get_random_puddle()
	local index = math.random(1, VARIANT_COUNT)
	local rotation = math.random(0, 3) * 90
	local flip = math.random(0, 1)
	local name = BLOCK_PREFIX .. index
	if flip == 1 then
		name = name .. "_flipped"
	end
	local param2 = core.dir_to_facedir(core.yaw_to_dir(rotation))
	return { name = name, param2 = param2 }
end

-- Makes Puddles when raining
climate_api.register_abm({
	label			= "create rain puddles",
	nodenames	= GROUND_COVERS,
	neighbors	= { "air" },
	interval	= 8,
	chance		= 150,
	catch_up	= false,

	 conditions	= {
		 min_height		= regional_weather.settings.min_height,
		 max_height		= regional_weather.settings.max_height,
		 min_humidity	= 55,
		 min_heat			= 30,
		 daylight			= 15
	 },

	 pos_override = function(pos)
		 return vector.add(pos, { x = 0, y = 1, z = 0 })
	 end,

   action = function (pos, node, env)
		 if core.get_node(pos).name ~= "air" then return end
		 if core.find_node_near(pos, MIN_DISTANCE, "group:weather_puddle") then return end
		 core.set_node(pos, get_random_puddle())
	 end
})

-- Makes puddles dry up when not raining
climate_api.register_abm({
	label = "remove rain puddles",
	nodenames	= { "group:regional_weather_puddle" },
	interval	= 10,
	chance		= 3,
	catch_up	= true,

	action = function (pos, node, env)
		if env.humidity < 55 then
			core.remove_node(pos)
		elseif env.heat < 30 and regional_weather.settings.snow_cover then
			core.set_node(pos, {name = "regional_weather:snow_cover_1"})
    end
	end
})
