core.register_node("crystal_radio:wifi", {
	description = "Crystal Radio",
	tiles = {"wifi_top.png", "wifi_top.png", "wifi_side.png", "wifi_side.png", "wifi_side.png","wifi_front.png"},
	paramtype2 = "facedir",
	groups = {snappy=2, choppy=2, cracky=3},
	legacy_facedir_simple = true,
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec",
			"size[9,10]"..
			"list[current_player;crystal_radio:wifi;0,.3;9,5;]"..
			"list[current_player;main;.5,5.85;8,1;]"..
			"list[current_player;main;.5,7.08;8,3;8]" ..
			"listring[current_player;crystal_radio:wifi]"..
			"listring[current_player;main]" ..
			default.get_hotbar_bg(.5,5.85))
		meta:set_string("infotext", "Crystal Radio")
	end,
})

core.register_craft({
	output = "crystal_radio:wifi",
	recipe = {
		{"default:diamond", "default:mese_crystal", "default:diamond"},
		{"default:diamond", "default:steel_ingot", "default:diamond"},
		{"default:diamond", "default:diamond", "default:diamond"}
	}
})

core.register_on_joinplayer(function(player)
	local inv = player:get_inventory()
	inv:set_size("crystal_radio:wifi", 9*5)
end)
