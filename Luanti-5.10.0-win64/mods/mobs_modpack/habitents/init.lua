
local path = core.get_modpath("habitents") .. "/"

habitents = {}
dofile(path.. "trade.lua")

-- NPCs
dofile(path.. "npc.lua") -- TenPlus1 mostly
dofile(path.. "producer.lua")
if core.get_modpath("mapgen") and core.get_modpath("mtools") then
dofile(path.. "producer2.lua") end

if core.get_modpath("hbhunger") then
habitents.crop_correspondences = nil end

dofile(path.. "assassins.lua")--Experiment
