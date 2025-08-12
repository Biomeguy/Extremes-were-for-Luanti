ts_furniture = {}

-- If true, you can sit on chairs and benches, when right-clicking them.
ts_furniture.enable_sitting = true


local furnitures = {
	["chair"] = {
		description = "Chair",
		sitting = true,
		nodebox = {
			{ -0.3, -0.5, 0.2, -0.2, 0.5, 0.3 }, -- foot 1
			{ 0.2, -0.5, 0.2, 0.3, 0.5, 0.3 }, -- foot 2
			{ 0.2, -0.5, -0.3, 0.3, -0.1, -0.2 }, -- foot 3
			{ -0.3, -0.5, -0.3, -0.2, -0.1, -0.2 }, -- foot 4
			{ -0.3, -0.1, -0.3, 0.3, 0, 0.2 }, -- seating
			{ -0.2, 0.1, 0.22, 0.2, 0.4, 0.28 } -- conector 1-2
		},
		craft = function(recipe)
			return {
				{ "", "group:stick" },
				{ recipe, recipe },
				{ "group:stick", "group:stick" }
			}
		end
	},
	["table"] = {
		description = "Table",
		nodebox = {
			{ -0.4, -0.5, -0.4, -0.3, 0.4, -0.3 }, -- foot 1
			{ 0.3, -0.5, -0.4, 0.4, 0.4, -0.3 }, -- foot 2
			{ -0.4, -0.5, 0.3, -0.3, 0.4, 0.4 }, -- foot 3
			{ 0.3, -0.5, 0.3, 0.4, 0.4, 0.4 }, -- foot 4
			{ -0.5, 0.4, -0.5, 0.5, 0.5, 0.5 }, -- table top
		},
		craft = function(recipe)
			return {
				{ recipe, recipe, recipe },
				{ "group:stick", "", "group:stick" },
				{ "group:stick", "", "group:stick" }
			}
		end
	},
	["small_table"] = {
		description = "Small Table",
		nodebox = {
			{ -0.4, -0.5, -0.4, -0.3, 0.1, -0.3 }, -- foot 1
			{ 0.3, -0.5, -0.4, 0.4, 0.1, -0.3 }, -- foot 2
			{ -0.4, -0.5, 0.3, -0.3, 0.1, 0.4 }, -- foot 3
			{ 0.3, -0.5, 0.3, 0.4, 0.1, 0.4 }, -- foot 4
			{ -0.5, 0.1, -0.5, 0.5, 0.2, 0.5 }, -- table top
		},
		craft = function(recipe)
			return {
				{ recipe, recipe, recipe },
				{ "group:stick", "", "group:stick" }
			}
		end
	},
	["tiny_table"] = {
		description = "Tiny Table",
		nodebox = {
			{ -0.5, -0.1, -0.5, 0.5, 0, 0.5 }, -- table top
			{ -0.4, -0.5, -0.5, -0.3, -0.1, 0.5 }, -- foot 1
			{ 0.3, -0.5, -0.5, 0.4, -0.1, 0.5 }, -- foot 2
		},
		craft = function(recipe)
			local bench_name = "ts_furniture:" .. recipe:gsub(":", "_") .. "_bench"
			return {
				{ bench_name, bench_name }
			}
		end
	},
	["bench"] = {
		description = "Bench",
		sitting = true,
		nodebox = {
			{ -0.5, -0.1, 0, 0.5, 0, 0.5 }, -- seating
			{ -0.4, -0.5, 0, -0.3, -0.1, 0.5 }, -- foot 1
			{ 0.3, -0.5, 0, 0.4, -0.1, 0.5 }, -- foot 2
		},
		craft = function(recipe)
			return {
				{ recipe, recipe },
				{ "group:stick", "group:stick" }
			}
		end
	},
}

local ignore_groups = {
	["wood"] = true,
	["stone"] = true,
}

function ts_furniture.register_furniture(recipe, description, texture)
	local recipe_def = core.registered_items[recipe]
	if not recipe_def then
		return
	end

	local groups = {}
	for k, v in pairs(recipe_def.groups) do
		if not ignore_groups[k] then
			groups[k] = v
		end
	end

	for furniture, def in pairs(furnitures) do
		local node_name = "ts_furniture:" .. recipe:gsub(":", "_") .. "_" .. furniture

		def.on_rightclick = nil

		if def.sitting and ts_furniture.enable_sitting then
	if furniture == "bench" then
		def.on_rightclick = function(pos, node, clicker, itemstack, pointd)
			player_api.sit_offset(pos, node, clicker, pointd)
		end
		def.can_dig = player_api.sit_dig_offset
	else
		def.on_rightclick = function(pos, node, clicker, itemstack, pointd)
			player_api.sit_centered(pos, node, clicker, pointd)
		end
		def.can_dig = player_api.sit_dig_centered
	end
		end

		core.register_node(":" .. node_name, {
			description = description .. " " .. def.description,
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			sunlight_propagates = true,
			tiles = { texture },
			groups = groups,
			node_box = {
				type = "fixed",
				fixed = def.nodebox
			},
			on_rightclick = def.on_rightclick,
			can_dig = def.can_dig
		})

		core.register_craft({
			output = node_name,
			recipe = def.craft(recipe)
		})
	end
end

ts_furniture.register_furniture("default:aspen_wood", "Aspen", "default_aspen_wood.png")
ts_furniture.register_furniture("default:pine_wood", "Pine", "default_pine_wood.png")
ts_furniture.register_furniture("default:acacia_wood", "Acacia", "default_acacia_wood.png")
ts_furniture.register_furniture("default:wood", "Beech", "default_wood.png")
ts_furniture.register_furniture("default:jungle_wood", "Jungle Wood", "default_jungle_wood.png")
