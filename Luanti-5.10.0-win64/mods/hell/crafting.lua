core.register_craft({
	output = "hell:fim",
	recipe = {
		{"hell:shroom_head"},
		{"hell:fruit_no_leaf"},
		{"hell:shroom_head"}
	}
})

core.register_craft({
	output = "hell:fruit_leaves",
	recipe = {
		{"hell:fruit_leaf", "hell:fruit_leaf", "hell:fruit_leaf"},
		{"hell:fruit_leaf", "hell:fruit_leaf", "hell:fruit_leaf"},
		{"hell:fruit_leaf", "hell:fruit_leaf", "hell:fruit_leaf"}
	}
})

core.register_craft({
	output = "hell:pick_blood_top",
	recipe = {
		{"hell:blood_top", "hell:blood_top", "hell:blood_top"},
		{"", "hell:shroom_stem", ""},
		{"", "hell:shroom_stem", ""}
	}
})

core.register_craft({
	output = "hell:pick_blood_wood",
	recipe = {
		{"hell:blood_wood_cooked", "hell:blood_wood_cooked", "hell:blood_wood_cooked"},
		{"", "group:stick", ""},
		{"", "group:stick", ""}
	}
})

for _,m in pairs({"rack", "rack_blue", "ivory"}) do
	local mat = "hell:"..m

	core.register_craft({
		output = "hell:pick_"..m,
		recipe = {
			{mat, mat, mat},
			{"", "group:stick", ""},
			{"", "group:stick", ""}
		}
	})

	core.register_craft({
		output = "hell:axe_"..m,
		recipe = {
			{mat, mat},
			{mat, "group:stick"},
			{"", "group:stick"}
		}
	})

	core.register_craft({
		output = "hell:sword_"..m,
		recipe = {
			{mat},
			{mat},
			{"group:stick"}
		}
	})

	core.register_craft({
		output = "hell:shovel_"..m,
		recipe = {
			{mat},
			{"group:stick"},
			{"group:stick"}
		}
	})
end

core.register_craft({
	output = "hell:rack_brick 4",
	recipe = {
		{"hell:rack", "hell:rack"},
		{"hell:rack", "hell:rack"}
	}
})

core.register_craft({
	output = "hell:rack_brick_black 4",
	recipe = {
		{"hell:rack_black", "hell:rack_black"},
		{"hell:rack_black", "hell:rack_black"}
	}
})

core.register_craft({
	output = "hell:rack_brick_blue 4",
	recipe = {
		{"hell:rack_blue", "hell:rack_blue"},
		{"hell:rack_blue", "hell:rack_blue"}
	}
})

core.register_craft({
	output = "hell:rack_tiled 8",
	recipe = {
		{"hell:rack", "hell:rack", "hell:rack"},
		{"hell:rack", "hell:rack", "hell:rack"},
		{"hell:rack", "hell:rack", "hell:rack"}
	}
})

core.register_craft({
	output = "default:furnace",
	recipe = {
		{"hell:rack_brick", "hell:rack_brick", "hell:rack_brick"},
		{"hell:rack_brick", "", "hell:rack_brick"},
		{"hell:rack_brick", "hell:rack_brick", "hell:rack_brick"}
	}
})

core.register_craft({
	output = "hell:bloodtap",
	recipe = {
		{"hell:shroom_stem", "hell:blood_wood_cooked", "group:stick"},
		{"", "group:stick", "group:stick"}
	}
})

core.register_craft({
	output = "hell:bloodtap",
	recipe = {
		{"hell:shroom_stem", "hell:blood_wood_cooked"},
		{"", "hell:blood_wood_cooked"}
	}
})

core.register_craft({
	output = "hell:blood_wood 4",
	recipe = {{"hell:blood_stem"}}
})

core.register_craft({
	output = "hell:blood_wood_empty 4",
	recipe = {{"hell:blood_stem_empty"}}
})

core.register_craft({
	output = "hell:stick 4",
	recipe = {{"hell:blood_wood_empty"}}
})

core.register_craft({
	output = "hell:torch",
	recipe = {
		{"hell:bark"},
		{"group:stick"}
	}
})

core.register_craft({
	output = "hell:forest_wood",
	recipe = {
		{"hell:forest_planks", "hell:forest_planks", "hell:forest_planks"},
		{"hell:forest_planks", "", "hell:forest_planks"},
		{"hell:forest_planks", "hell:forest_planks", "hell:forest_planks"}
	}
})

core.register_craft({
	output = "hell:forest_planks 8",
	recipe = {{"hell:forest_wood"}}
})

core.register_craft({
	output = "hell:forest_planks 7",
	recipe = {{"hell:tree"}}
})

local sound_allowed = true
core.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
	if itemstack:get_name() ~= "hell:forest_planks"
	or itemstack:get_count() ~= 7 then
		return
	end
	local tree
	for i = 1,9 do
		if old_craft_grid[i]:get_name() == "hell:tree" then
			tree = i
			break
		end
	end
	if not tree then	-- do nth if theres no tree
		return
	end
	local rdif = math.random(-1,1)	-- add a bit randomness
	local barkstack = ItemStack("hell:bark ".. 4-rdif)
	local inv = player:get_inventory()
	if not inv:room_for_item("main", barkstack) then	-- disallow crafting if there's not enough free space
		craft_inv:set_list("craft", old_craft_grid)
		itemstack:set_name("")
		return
	end
	itemstack:set_count(7+rdif)
	inv:add_item("main", barkstack)
	if not sound_allowed then	-- avoid playing the sound multiple times, e.g. when middle mouse click
		return
	end
	core.sound_play("default_wood_footstep", {pos=player:get_pos(),  gain=.25})
	sound_allowed = false
	core.after(0, function()
		sound_allowed = true
	end)
end)

core.register_craft({
	output = "default:paper",
	recipe = {{"hell:grass_dried", "hell:grass_dried", "hell:grass_dried"}}
})


core.register_craft({
	type = "cooking",
	output = "default:coal_lump",
	recipe = "hell:tree",
})

core.register_craft({
	type = "cooking",
	output = "hell:grass_dried",
	recipe = "hell:grass",
})

core.register_craft({
	type = "cooking",
	output = "hell:pearl",
	recipe = "hell:fim",
})

core.register_craft({
	type = "cooking",
	output = "hell:blood_cooked",
	recipe = "hell:blood_item",
})

core.register_craft({
	type = "fuel",
	recipe = "hell:fruit_leaves",
	burntime = 18,
})

core.register_craft({
	type = "fuel",
	recipe = "hell:fruit_leaf",
	burntime = 2,
})

core.register_craft({
	type = "fuel",
	recipe = "hell:fruit",
	burntime = 6,
})

core.register_craft({
	type = "fuel",
	recipe = "hell:fruit_no_leaf",
	burntime = 4,
})

core.register_craft({
	type = "fuel",
	recipe = "hell:fim",
	burntime = 10,
})

core.register_craft({
	type = "fuel",
	recipe = "hell:grass_dried",
	burntime = 1,
})

core.register_craft({
	type = "fuel",
	recipe = "hell:bark",
	burntime = 5,
})

core.register_craft({
	type = "fuel",
	recipe = "hell:shroom_head",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "hell:shroom_stem",
	burntime = 3,
})

for  _,i in ipairs({"hell:blood_stem", "hell:blood_wood"}) do
	local cooked = i.."_cooked"

	core.register_craft({
		type = "cooking",
		output = cooked,
		recipe = i,
	})

	core.register_craft({
		type = "fuel",
		recipe = cooked,
		burntime = 30,
	})
end

core.register_craft({
	type = "fuel",
	recipe = "hell:blood_empty",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "hell:blood_top_empty",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "hell:blood_stem_empty",
	burntime = 30,
})

core.register_craft({
	type = "fuel",
	recipe = "hell:gills",
	burntime = 7,
})

core.register_craft({
	type = "fuel",
	recipe = "hell:pick_blood_top",
	burntime = 4,
})

core.register_craft({
	type = "fuel",
	recipe = "hell:pick_blood_wood",
	burntime = 80,
})
