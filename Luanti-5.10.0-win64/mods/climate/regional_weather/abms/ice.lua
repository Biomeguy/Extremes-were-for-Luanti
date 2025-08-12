if not regional_weather.settings.ice
or not core.get_modpath("default")
or default.node_sound_ice_defaults == nil
then return end

local BLOCK_NAME = "regional_weather:ice"

core.register_node(BLOCK_NAME, {
	tiles = {"(default_ice.png^[colorize:#ffffff:50)^[opacity:200"},
	drawtype = "glasslike",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {
		not_in_creative_inventory = 1,
		cracky = 3,
		cools_lava = 1,
		slippery = 3,
		dig_immediate = 2,
		melts = 1
	},
	freezemelt = "default:fresh_water_source",
	sounds = default.node_sound_ice_defaults(),
	use_texture_alpha = "blend",
	drop = "",
	on_destruct = function(pos)
		-- asynchronous to avoid destruction loop
		core.after(0, function(pos)
			if core.get_node(pos).name ~= "air" then return end
			core.set_node(pos, { name = "default:fresh_water_source" })
		end, pos)
	end
})

climate_api.register_abm({
	label			= "freeze river water",
	nodenames = { "default:fresh_water_source" },
	neighbors	= { "air" },
	interval	= 25,
	chance		= 3,
	catch_up	= false,

	 conditions	= {
		 min_height		= regional_weather.settings.min_height,
		 max_height		= regional_weather.settings.max_height,
		 max_heat			= 25,
		 daylight			= 15
	 },

	 action = function (pos, node, env)
		 core.set_node(pos, { name = BLOCK_NAME })
	 end
})

climate_api.register_abm({
	label			= "unfreeze river water",
	nodenames = { BLOCK_NAME },
	interval	= 25,
	chance		= 4,
	catch_up	= true,

	 conditions	= {
		 min_height		= regional_weather.settings.min_height,
		 max_height		= regional_weather.settings.max_height,
		 min_heat			= 40,
		 daylight			= 15
	 },

	 action = function (pos, node, env)
		 core.set_node(pos, { name = "default:fresh_water_source" })
	 end
})