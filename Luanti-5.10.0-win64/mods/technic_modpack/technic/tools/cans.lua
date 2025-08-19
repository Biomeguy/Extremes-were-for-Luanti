local S = technic.getter

local function set_can_wear(itemstack, level, max_level)
	local temp
	if level == 0 then
		temp = 0
	else
		temp = 65536 - math.floor(level / max_level * 65535)
		if temp > 65535 then temp = 65535 end
		if temp < 1 then temp = 1 end
	end
	itemstack:set_wear(temp)
end

local function get_can_level(itemstack)
	if itemstack:get_meta():get_string("") == "" then
		return 0
	else
		return tonumber(itemstack:get_meta():get_string(""))
	end
end

function technic.register_can(d)
	local data = {}
	for k, v in pairs(d) do data[k] = v end
	core.register_tool(data.can_name, {
		description = data.can_description,
		inventory_image = data.can_inventory_image,
		stack_max = 1,
		wear_represents = "content_level",
		liquids_pointable = true,
		groups = {not_repaired_by_anvil = 1},
		on_use = function(itemstack, user, pointd)
			if pointd.type ~= "node" then return end
			local node = core.get_node(pointd.under)
			if node.name ~= data.liquid_source_name then return end
			local charge = get_can_level(itemstack)
			if charge == data.can_capacity then return end
			if core.is_protected(pointd.under, user:get_player_name()) then
				core.log("action", user:get_player_name().." tried to take "..node.name.." at protected position "..core.pos_to_string(pointd.under).." with a "..data.can_name)
				return
			end
			core.remove_node(pointd.under)
			charge = charge + 1
			itemstack:get_meta():set_string("", tostring(charge))
			set_can_wear(itemstack, charge, data.can_capacity)
			return itemstack
		end,
		on_place = function(itemstack, user, pointd)
			if pointd.type ~= "node" then return end
			local pos = pointd.under
			local def = core.registered_nodes[core.get_node(pos).name] or {}
			if def.on_rightclick and user and not user:get_player_control().sneak then
				return def.on_rightclick(pos, core.get_node(pos), user, itemstack, pointd)
			end
			if not def.buildable_to then
				pos = pointd.above
				def = core.registered_nodes[core.get_node(pos).name] or {}
				if not def.buildable_to then return end
			end
			local charge = get_can_level(itemstack)
			if charge == 0 then return end
			if core.is_protected(pos, user:get_player_name()) then
				core.log("action", user:get_player_name().." tried to place "..data.liquid_source_name.." at protected position "..core.pos_to_string(pos).." with a "..data.can_name)
				return
			end
			core.set_node(pos, {name=data.liquid_source_name})
			charge = charge - 1
			itemstack:get_meta():set_string("", tostring(charge))
			set_can_wear(itemstack, charge, data.can_capacity)
			return itemstack
		end,
		on_refill = function(stack)
			stack:get_meta():set_string("", tostring(data.can_capacity))
			set_can_wear(stack, data.can_capacity, data.can_capacity)
			return stack
		end,
	})
end

technic.register_can({
	can_name = "technic:water_can",
	can_description = S("Water Can"),
	can_inventory_image = "technic_water_can.png",
	can_capacity = 16,
	liquid_source_name = "default:water_source",
	liquid_flowing_name = "default:water_flowing",
})

core.register_craft({
	output = 'technic:water_can',
	recipe = {
		{'default:zinc_ingot', 'technic:rubber','default:zinc_ingot'},
		{'default:steel_ingot', '', 'default:steel_ingot'},
		{'default:zinc_ingot', 'default:steel_ingot', 'default:zinc_ingot'}
	}
})

technic.register_can({
	can_name = "technic:lava_can",
	can_description = S("Lava Can"),
	can_inventory_image = "technic_lava_can.png",
	can_capacity = 8,
	liquid_source_name = "default:lava_source",
	liquid_flowing_name = "default:lava_flowing",
})

core.register_craft({
	output = 'technic:lava_can',
	recipe = {
		{'default:zinc_ingot', 'default:stainless_steel_ingot','default:zinc_ingot'},
		{'default:stainless_steel_ingot', '', 'default:stainless_steel_ingot'},
		{'default:zinc_ingot', 'default:stainless_steel_ingot', 'default:zinc_ingot'}
	}
})
