--CaveRealms crafting.lua

--CRAFT RECIPES--

--use for coal dust
core.register_craft({
	output = "default:coal_block",
	recipe = {
		{"caverealms:coal_dust","caverealms:coal_dust","caverealms:coal_dust"},
		{"caverealms:coal_dust","caverealms:coal_dust","caverealms:coal_dust"},
		{"caverealms:coal_dust","caverealms:coal_dust","caverealms:coal_dust"}
	}
})

-- DM statue
core.register_craft({
	output = "caverealms:dm_statue",
	recipe = {
		{"caverealms:glow_ore","caverealms:hot_cobble","caverealms:glow_ore"},
		{"caverealms:hot_cobble","caverealms:hot_cobble","caverealms:hot_cobble"},
		{"caverealms:hot_cobble","caverealms:hot_cobble","caverealms:hot_cobble"}
	}
})

-- Glow obsidian brick
core.register_craft({
	output = "caverealms:glow_obsidian_brick 4",
	recipe = {
		{"caverealms:glow_obsidian", "caverealms:glow_obsidian"},
		{"caverealms:glow_obsidian", "caverealms:glow_obsidian"}
	}
})

core.register_craft({
	output = "caverealms:glow_obsidian_brick_2 4",
	recipe = {
		{"caverealms:glow_obsidian_2", "caverealms:glow_obsidian_2"},
		{"caverealms:glow_obsidian_2", "caverealms:glow_obsidian_2"}
	}
})

-- Glow obsidian glass
core.register_craft({
	output = "caverealms:glow_obsidian_glass 5",
	recipe = {
		{"default:glass", "default:glass", "default:glass"},
		{"default:glass", "default:glass", "caverealms:glow_obsidian"}
	}
})

core.register_craft({
	output = "caverealms:glow_obsidian_glass 5",
	recipe = {
		{"default:glass", "default:glass", "default:glass"},
		{"default:glass", "default:glass", "caverealms:glow_obsidian_2"}
	}
})

-- Requires ethereal:fish_raw
if core.get_modpath("ethereal") then

	-- Professional Fishing Rod
	core.register_craftitem("caverealms:angler_rod", {
		description = "Pro Fishing Rod",
		inventory_image = "caverealms_angler_rod.png",
	})

	core.register_craft({
		output = "caverealms:angler_rod",
		recipe = {
			{"","","default:steel_ingot"},
			{"", "default:steel_ingot", "caverealms:mushroom_gills"},
			{"default:steel_ingot", "", "caverealms:mushroom_gills"}
		}
	})

	-- Glow Bait
	core.register_craftitem("caverealms:glow_bait", {
		description = "Glow Bait",
		inventory_image = "caverealms_glow_bait.png",
	})

	core.register_craft({
		output = "caverealms:glow_bait 9",
		recipe = {{"caverealms:glow_worm_green"}}
	})

	-- default ethereal fish
	local fish = {
		{"ethereal:fish_raw"},
	}

	-- Pro Fishing Rod (Baited)
	core.register_craftitem("caverealms:angler_rod_baited", {
		description = "Baited Pro Fishing Rod",
		inventory_image = "caverealms_angler_rod_baited.png",
		wield_image = "caverealms_angler_rod_weild.png",
		stack_max = 1,
		liquids_pointable = true,

		on_use = function (itemstack, user, pointd)

			if pointd.type ~= "node" then
				return
			end

			local node = core.get_node(pointd.under).name

			if (node == "default:water_source"
			or node == "default:fresh_water_source")
			and math.random(1, 100) < 35 then

				local type = fish[math.random(1, #fish)][1]
				local inv = user:get_inventory()

				if inv:room_for_item("main", {name = type}) then

					inv:add_item("main", {name = type})

					if (math.random() < 0.6) then
						return ItemStack("caverealms:angler_rod_baited")
					else
						return ItemStack("caverealms:angler_rod")
					end
				else
					core.chat_send_player(user:get_player_name(),
						"Inventory full, Fish Got Away!")
				end
			end
		end,
	})

	core.register_craft({
		type = "shapeless",
		output = "caverealms:angler_rod_baited",
		recipe = {"caverealms:angler_rod", "caverealms:glow_bait"},
	})
end
