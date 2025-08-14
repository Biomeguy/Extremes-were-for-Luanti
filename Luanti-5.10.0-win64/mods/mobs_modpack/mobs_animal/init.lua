
local path = core.get_modpath("mobs_animal")

-- Load support for intllib.
local S, NS = dofile(path.."/intllib.lua")
mobs.intllib = S

-- Animals

dofile(path .. "/chicken.lua") -- JKmurray
dofile(path .. "/cow.lua") -- KrupnoPavel
dofile(path .. "/rat.lua") -- PilzAdam
dofile(path .. "/sheep.lua") -- PilzAdam
dofile(path .. "/warthog.lua") -- KrupnoPavel
dofile(path .. "/bee.lua") -- KrupnoPavel
dofile(path .. "/bunny.lua") -- ExeterDad
dofile(path .. "/kitten.lua") -- Jordach/BFD
dofile(path .. "/penguin.lua") -- D00Med
dofile(path .. "/panda.lua") -- AspireMint
dofile(path .. "/dolphin.lua") -- starninjas

dofile(path .. "/lucky_block.lua")

print (S("[MOD] Mobs Redo Animals loaded"))
