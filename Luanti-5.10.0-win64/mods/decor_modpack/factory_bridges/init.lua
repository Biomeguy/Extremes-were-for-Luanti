FB = {}
FB.NAME = "factory_bridges"

if (core.get_modpath("intllib")) then
	FB.LOCAL = intllib.Getter()
else
	FB.LOCAL = function(s) return s end
end

dofile(core.get_modpath(FB.NAME).."/models.lua")
dofile(core.get_modpath(FB.NAME).."/nodes.lua")

core.register_craftitem(FB.NAME..":i01", {
	description = FB.LOCAL("i01"),
	inventory_image = FB.NAME.."_i01.png",
})

core.register_craftitem(FB.NAME..":i02", {
	description = FB.LOCAL("i02"),
	inventory_image = FB.NAME.."_i02.png",
})

dofile(core.get_modpath(FB.NAME).."/crafts.lua")

dofile(core.get_modpath(FB.NAME).."/wooden_bridges.lua")
