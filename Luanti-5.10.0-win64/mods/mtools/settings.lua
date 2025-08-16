
local modpath = core.get_modpath("mtools")

local settings = Settings(modpath .. "/brewing.conf")
brewing.settings.donut_eat_hp = tonumber(settings:get("donut_eat_hp"))
brewing.settings.freeze_hit_points = tonumber(settings:get("freeze_hit_points"))
brewing.settings.freeze_time = tonumber(settings:get("freeze_time"))
brewing.settings.star_blue_amulet_speedup= tonumber(settings:get("star_blue_amulet_speedup"))
-- Chi Mod Settings
if core.get_modpath("chi") then
	--Add
	brewing.settings.chi_magic_donut = tonumber(settings:get("chi_magic_donut"))
	brewing.settings.chi_fay_cake = tonumber(settings:get("chi_fay_cake"))
	brewing.settings.chi_nymph_salad = tonumber(settings:get("chi_nymph_salad"))
	--Subtract
	brewing.settings.chi_magic_wand = tonumber(settings:get("chi_magic_wand"))
end