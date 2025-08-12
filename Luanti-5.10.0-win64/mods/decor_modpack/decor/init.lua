
decor = {}
local path = core.get_modpath("decor")

dofile(path.."/nodes.lua")
dofile(path.."/crafts.lua")
dofile(path.."/cottages.lua")

dofile(path.."/src/tetris.lua")
dofile(path.."/src/lantern.lua")
dofile(path.."/src/molotov.lua")

if core.get_modpath("homedecor_i18n") and core.get_modpath("unifieddyes") then
homedecor = {}

dofile(path.."/handlers/nodeboxes.lua")
dofile(path.."/handlers/expansion.lua")
dofile(path.."/handlers/inventory.lua")
dofile(path.."/handlers/registration.lua")
dofile(path.."/handlers/water_particles.lua")

screwdriver = screwdriver or {}

homedecor.plain_wood    = { name = "homedecor_generic_wood_plain.png",  color = 0xffa76820 }
homedecor.mahogany_wood = { name = "homedecor_generic_wood_plain.png",  color = 0xff7d2506 }
homedecor.white_wood    = "homedecor_generic_wood_plain.png"
homedecor.dark_wood     = { name = "homedecor_generic_wood_plain.png",  color = 0xff39240f }
homedecor.lux_wood      = { name = "homedecor_generic_wood_luxury.png", color = 0xff643f23 }

homedecor.color_black     = 0xff303030
homedecor.color_dark_grey = 0xff606060
homedecor.color_med_grey  = 0xffa0a0a0

dofile(path.."/src/misc.lua")
dofile(path.."/src/tables.lua")
dofile(path.."/src/electronics.lua")
dofile(path.."/src/roofing.lua")
dofile(path.."/src/doors_gates_and_fences.lua")
dofile(path.."/src/lighting.lua")
dofile(path.."/src/kitchen.lua")
dofile(path.."/src/bathroom.lua")
dofile(path.."/src/office.lua")
dofile(path.."/src/window_treatments.lua")
dofile(path.."/src/furniture.lua")
dofile(path.."/src/exterior.lua")
dofile(path.."/src/crafts.lua")
end
dofile(path.."/src/shield_functions.lua")
