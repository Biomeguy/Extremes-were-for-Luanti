local path = technic.modpath.."/machines/register"

dofile(path.."/common.lua")

-- Wiring stuff
dofile(path.."/cables.lua")
if core.get_modpath("pipeworks") then
	dofile(path.."/battery_box.lua")
end

-- Generators
dofile(path.."/solar_array.lua")
if core.get_modpath("pipeworks") then
	dofile(path.."/generator.lua")
end

-- API for machines
dofile(path.."/recipes.lua")
if core.get_modpath("pipeworks") then
	dofile(path.."/machine_base.lua")
end

-- Recipes
dofile(path.."/alloy_recipes.lua")
dofile(path.."/grinder_recipes.lua")
dofile(path.."/extractor_recipes.lua")
dofile(path.."/compressor_recipes.lua")
dofile(path.."/centrifuge_recipes.lua")
dofile(path.."/freezer_recipes.lua")

-- Multi-Machine Recipes
dofile(path.."/grindings.lua")

-- Machines
dofile(path.."/alloy_furnace.lua")
dofile(path.."/electric_furnace.lua")
dofile(path.."/grinder.lua")
dofile(path.."/extractor.lua")
dofile(path.."/compressor.lua")
dofile(path.."/centrifuge.lua")
dofile(path.."/freezer.lua")
