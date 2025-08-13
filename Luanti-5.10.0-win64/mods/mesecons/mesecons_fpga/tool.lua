return function(plg)


core.register_tool("mesecons_fpga:programmer", {
	description = "FPGA Programmer",
	inventory_image = "jeija_fpga_programmer.png",
	stack_max = 1,
	on_place = function(itemstack, placer, pointd)
		if pointd.type ~= "node" then
			return itemstack
		end

		local pos = pointd.under
		if core.get_node(pos).name:find("mesecons_fpga:fpga") ~= 1 then
			return itemstack
		end

		local meta = core.get_meta(pos)
		if meta:get_string("instr") == "//////////////" then
			core.chat_send_player(placer:get_player_name(), "This FPGA is unprogrammed.")
			return itemstack
		end
		itemstack:get_meta():set_string("", meta:get_string("instr"))
		core.chat_send_player(placer:get_player_name(), "FPGA gate configuration was successfully copied!")
		
		return itemstack
	end,
	on_use = function(itemstack, user, pointd)
		if pointd.type ~= "node" then
			return itemstack
		end

		local pos = pointd.under
		if core.get_node(pos).name:find("mesecons_fpga:fpga") ~= 1 then
			return itemstack
		end

		local imeta = itemstack:get_meta():get_string("")
		if imeta == "" then
			core.chat_send_player(user:get_player_name(), "Use shift+right-click to copy a gate configuration first.")
			return itemstack
		end

		local meta = core.get_meta(pos)
		meta:set_string("instr", imeta)
		plg.update_formspec(pos, imeta)
		core.chat_send_player(user:get_player_name(), "Gate configuration was successfully written to FPGA!")

		return itemstack
	end
})

core.register_craft({
	output = "mesecons_fpga:programmer",
	recipe = {
		{'group:mesecon_conductor_craftable'},
		{'basic_materials:silicon'}
	}
})
end
