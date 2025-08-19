
local S = technic.getter

core.register_tool("technic:treetap", {
	description = S("Tree Tap"),
	inventory_image = "technic_tree_tap.png",
	on_use = function(itemstack, user, pointd)
		if pointd.type ~= "node" then
			return
		end
		local pos = pointd.under
		if core.is_protected(pos, user:get_player_name()) then
			core.record_protection_violation(pos, user:get_player_name())
			return
		end
		local node = core.get_node(pos)
		local node_name = node.name
		if node_name ~= "rubber_tree:trunk" then
			return
		end
		core.set_node(pos, {name = "rubber_tree:trunk_empty"})
		core.get_node_timer(pos):start(math.random(120, 300))
		core.handle_node_drops(pointd.above, {"technic:raw_latex"}, user)
		if not technic.creative_mode then
			local item_wear = tonumber(itemstack:get_wear())
			item_wear = item_wear + 819
			if item_wear > 65535 then
				itemstack:clear()
				return itemstack
			end
			itemstack:set_wear(item_wear)
		end
		return itemstack
	end,
})

core.register_craft({
	output = "technic:treetap",
	recipe = {
		{"pipeworks:tube_1", "group:wood", "default:stick"},
		{"", "default:stick", "default:stick"}
	},
})

core.register_craftitem("technic:raw_latex", {
	description = S("Raw Latex"),
	inventory_image = "technic_raw_latex.png",
})

core.register_craft({
	type = "cooking",
	output = "default:glue",
	recipe = "technic:raw_latex",
})

core.register_craftitem("technic:rubber", {
	description = S("Rubber Fiber"),
	inventory_image = "technic_rubber.png",
})
