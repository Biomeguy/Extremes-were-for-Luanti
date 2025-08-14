local path = core.get_modpath("nssm")

nssm = {
	multimobs = tonumber(core.settings:get("multimobs")) or 1000,
	spiders_litter_web = core.settings:get_bool("spiders_litter_web", true)
}

if core.get_modpath("mobs") then
--Mobs
dofile(path.. "/mobs/ant_queen.lua")
dofile(path.. "/mobs/ant_soldier.lua")
dofile(path.. "/mobs/ant_worker.lua")
dofile(path.. "/mobs/black_widow.lua")
dofile(path.. "/mobs/crab.lua")
dofile(path.. "/mobs/crocodile.lua")
dofile(path.. "/mobs/daddy_long_legs.lua")
dofile(path.. "/mobs/echidna.lua")
dofile(path.. "/mobs/lava_titan.lua")
dofile(path.. "/mobs/mantis_beast.lua")
dofile(path.. "/mobs/mantis.lua")
dofile(path.. "/mobs/masticone.lua")
dofile(path.. "/mobs/mordain.lua")
dofile(path.. "/mobs/morgre.lua")
dofile(path.. "/mobs/morde.lua")
dofile(path.. "/mobs/morgut.lua")
dofile(path.. "/mobs/morlu.lua")
dofile(path.. "/mobs/morvalar.lua")
dofile(path.. "/mobs/morvy.lua")
dofile(path.. "/mobs/morwa.lua")
dofile(path.. "/mobs/octopus.lua")
dofile(path.. "/mobs/sandworm.lua")
dofile(path.. "/mobs/tarantula.lua")
dofile(path.. "/mobs/uloboros.lua")

dofile(path.. "/spawn.lua")
end
--Schematics
dofile(path.. "/nssm_schems.lua")

--Others
dofile(path.. "/nssm_materials.lua")
dofile(path.. "/nssm_mapgen.lua")
dofile(path.. "/nssm_api.lua")
dofile(path.. "/nssm_weapons.lua")
if core.get_modpath("3d_armor") then
	dofile(path.. "/nssm_armor.lua")
end
