core.register_craftitem("sailing_kit:boat", {
	description = "Sailboat",
	inventory_image = "sailboat_inv.png",
	wield_image = "sailboat_inv.png",
--	wield_scale = {x = 2, y = 2, z = 1},
	liquids_pointable = true,
--	groups = {flammable = 2},

	on_place = function(itemstack, placer, pointd)
		if pointd.type ~= "node" then
			return itemstack
		end
	
		local ppos = pointd.under
		local node = mobkit.nodeatpos(ppos)
		if node and node.drawtype=='liquid' then	
			ppos.y=ppos.y+0.2
			local boat = core.add_entity(ppos, "sailing_kit:boat")
			if boat and placer then
				boat:set_yaw(placer:get_look_horizontal())
				itemstack:take_item()
			end
		end

		return itemstack
	end,
})

core.register_craftitem("sailing_kit:cloth", {
	description = "Cloth",
	inventory_image = "cloth.png",
	wield_image = "cloth.png",
	wield_scale = {x = 2, y = 2, z = 1},
})

core.register_craft({
	output = "sailing_kit:cloth",
	recipe = {
		{"fabric:sheet","fabric:sheet"},
		{"fabric:sheet","fabric:sheet"}
	}
})

core.register_craft({
	output = "sailing_kit:boat",
	recipe = {
		{"fabric:string","sailing_kit:cloth","fabric:string"},
		{"group:wood", "sailing_kit:cloth","group:wood"},
		{"group:wood", "group:wood", "group:wood"}
	}
})