
travelnet.MAX_STATIONS_PER_NETWORK = 24

-- set this to true if you want a simulated beam effect
travelnet.travelnet_effect_enabled	= true
-- set this to true if you want a sound to be played when the travelnet is used
travelnet.travelnet_sound_enabled	= true

-- if you set this to false, travelnets cannot be created
-- (this may be useful if you want nothing but the elevators on your server)
travelnet.travelnet_enabled			= true
-- if you set travelnet.elevator_enabled to false, you will not be able to
-- craft, place or use elevators
travelnet.elevator_enabled			= true
-- if you set this to false, doors will be disabled
travelnet.doors_enabled				= true

-- starts an abm which re-adds travelnet stations to networks in case the savefile got lost
travelnet.abm_enabled				= false

-- change these if you want other receipes for travelnet or elevator
travelnet.travelnet_recipe = {
	{"default:glass", "default:steel_ingot", "default:glass"},
	{"default:glass", "default:mese", "default:glass"},
	{"default:glass", "default:steel_ingot", "default:glass"}
}
travelnet.elevator_recipe = {
	{"default:steel_ingot", "default:glass", "default:steel_ingot"},
	{"default:steel_ingot", "", "default:steel_ingot"},
	{"default:steel_ingot", "default:glass", "default:steel_ingot"}
}
