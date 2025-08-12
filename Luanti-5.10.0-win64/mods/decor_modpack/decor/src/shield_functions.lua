decor.register_shield = function(name, desc, background_color, foreground_color, mask)

	local tile_side = "castle_shield_"..background_color..".png"
	local tile_front = "castle_shield_"..background_color..".png^(castle_shield_"..foreground_color..".png^[mask:castle_shield_mask_"..mask..".png)"

	core.register_node("decor:"..name, {
		description = desc,
		tiles = {tile_side, tile_side, tile_side, tile_side, "castle_shield_back.png", tile_front},
		drawtype = "nodebox",
		paramtype2 = "facedir",
		paramtype = "light",
		groups = {cracky=3},
		sounds = default.node_sound_metal_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-.5,-.125,.375,.5,.5,.5},
				{-.4375,-.3125,.375,.425,.5,.5},
				{-.3125,-.4375,.375,.3125,.5,.5},
				{-.1875,-.5,.375,.1875,.5,.5}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-.5,-.5,.375,.5,.5,.5}
		},
	})

	core.register_craft({
		output = "decor:"..name,
		recipe = {
			{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
			{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
			{"dye:"..background_color, "default:steel_ingot", "dye:"..foreground_color},
		}
	})
end

--The following colors are permitted:
-- "black", "blue", "brown", "cyan", "dark_green", "dark_grey", "green", "grey", "magenta", "orange", "pink", "red", "violet", "white", "yellow"
--The following patterns are permitted:
-- "slash", "chevron", "cross"

-- method parameters are name, desc, background_color, foreground_color, pattern
decor.register_shield("shield_1", "Mounted Shield", "red", "blue", "slash")
decor.register_shield("shield_2", "Mounted Shield", "cyan", "yellow", "chevron")
decor.register_shield("shield_3", "Mounted Shield", "grey", "green", "cross")