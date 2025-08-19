core.register_node("nettle:nettle", {
	description = "Nettle",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.4,
	tiles = {"nettle_nettle.png"},
	inventory_image = "nettle_nettle.png",
	wield_image = "nettle_nettle.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	damage_per_second = 1,
	groups = {snappy = 2, flora = 1, attached_node = 1, flammable = 1, nettle_weed = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
})

core.register_node("nettle:impatiens", {
	description = "Impatiens",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.4,
	tiles = {"nettle_impatiens.png"},
	inventory_image = "nettle_impatiens.png",
	wield_image = "nettle_impatiens.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 2, flora = 1, attached_node = 1, flammable = 1, nettle_weed = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("nettle:cleavers", {
	description = "Cleavers",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.2,
	tiles = {"nettle_cleavers.png"},
	inventory_image = "nettle_cleavers.png",
	wield_image = "nettle_cleavers.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	liquidtype = "source",
	liquid_alternative_flowing = "nettle:cleavers",
	liquid_alternative_source = "nettle:cleavers",
	liquid_renewable = false,
	liquid_range = 0,
	liquid_viscosity = 3,
	groups = {snappy = 2, flora = 1, attached_node = 1, flammable = 1, nettle_weed = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("nettle:carduus", {
	description = "Carduus",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.2,
	tiles = {"nettle_carduus.png"},
	inventory_image = "nettle_carduus.png",
	wield_image = "nettle_carduus.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	damage_per_second = 1,
	groups = {snappy = 2, flora = 1, attached_node = 1, flammable = 1, nettle_weed = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("nettle:scotch_broom", {
	description = "Scotch Broom",
	drawtype = "mesh",
	mesh = "nettle_scotch_broom.obj",
	waving = 1,
	tiles = {"nettle_scotch_broom.png"},
	inventory_image = "nettle_scotch_broom.png",
	wield_image = "nettle_scotch_broom.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flora = 1, flammable = 1, nettle_weed = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_node("nettle:giant_hogweed", {
	description = "Giant Hogweed",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 2,
	tiles = {"nettle_giant_hogweed.png"},
	inventory_image = "nettle_giant_hogweed.png",
	wield_image = "nettle_giant_hogweed.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	damage_per_second = 2,
	on_punch = function(pos, node, user, pointd)
		local wielded = user:get_wielded_item()

		if wielded:get_count() == 0 then
			user:set_hp(user:get_hp() - 1)
		end
	end,
	groups = {snappy = 2, flora = 1, attached_node = 1, flammable = 1, nettle_weed = 1},
	sounds = default.node_sound_leaves_defaults(),
})

core.register_abm({
	nodenames = {"group:spreading_dirt_type", "default:dirt", "group:ethereal_grass"},
	neighbors = {"default:dirt"},
	interval = 80,
	chance = 50,
	action = function(pos, node)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		if core.get_node(above).name ~= "air" then
			return
		end
		local dirts = 0
		local airs = 0
		for x_ = pos.x-1, pos.x+1 do
			for y_ = pos.y-1, pos.y+1 do
				for z_ = pos.z-1, pos.z+1 do
					local nn = core.get_node({x=x_, y=y_, z=z_}).name
					if (nn == "default:dirt") or nn == ("default:stone") then
						dirts = dirts+1;
					end
					if (nn == "air") or (core.get_item_group(nn, "flora") > 0) then
						airs = airs+1;
					end
				end
			end
		end
		if (dirts < 14) and (airs < 14) then
			return
		end
		if (core.get_node({x=pos.x, y=pos.y+2, z=pos.z}).name ~= "air") or (core.get_node_light(above, .5) < 8) then
			core.set_node(above, {name = "nettle:impatiens"})
		elseif core.get_node_light(above, .5) < 13 then
			core.set_node(above, {name = "nettle:cleavers"})
		else
			core.set_node(above, {name = "nettle:nettle"})
		end
	end
})

local function count_nodes(pos, name)
	local result = 0
	for x_ = pos.x-1, pos.x+1 do
		for y_ = pos.y-1, pos.y+1 do
			for z_ = pos.z-1, pos.z+1 do
				if core.get_node({x=x_, y=y_, z=z_}).name == name then
					result = result+1
				end
			end
		end
	end
	return result
end

local function has_neighbour(pos, name)
	local result = 0
	for x_ = pos.x-1, pos.x+1 do
		for y_ = pos.y-1, pos.y+1 do
			for z_ = pos.z-1, pos.z+1 do
				if core.get_node({x=x_, y=y_, z=z_}).name == name then
					return true
				end
			end
		end
	end
	return false
end

core.register_abm({
	nodenames = {"group:nettle_weed"},
	interval = 40,
	chance = 10,
	action = function(pos, node)
		if node.name == "nettle:nettle" then
			if count_nodes(pos, "nettle:nettle") >= 4 then
				core.set_node(pos, {name = "nettle:carduus"})
				return
			end
			if has_neighbour(pos, "nettle:impatiens") then
				core.set_node(pos, {name = "nettle:impatiens"})
				return
			end
			if has_neighbour(pos, "nettle:scotch_broom") then
				core.set_node(pos, {name = "nettle:cleavers"})
				return
			end
		elseif node.name == "nettle:carduus" then
			if count_nodes(pos, "nettle:carduus") >= 2 then
				core.set_node(pos, {name = "nettle:scotch_broom"})
				return
			end
		elseif node.name == "nettle:cleavers" then
			if count_nodes(pos, "nettle:cleavers") >= 4 then
				core.set_node(pos, {name = "nettle:giant_hogweed"})
				return
			end
			if has_neighbour(pos, "nettle:nettle") then
				core.set_node(pos, {name = "nettle:nettle"})
				return
			end
			if has_neighbour(pos, "nettle:giant_hogweed") then
				core.set_node(pos, {name = "nettle:impatiens"})
				return
			end
		elseif node.name == "nettle:impatiens" then
			if has_neighbour(pos, "nettle:cleavers") then
				core.set_node(pos, {name = "nettle:cleavers"})
				return
			end
			if has_neighbour(pos, "nettle:carduus") then
				core.set_node(pos, {name = "nettle:nettle"})
				return
			end
		elseif node.name == "nettle:scotch_broom" then
			local above = {x=pos.x, y=pos.y+1, z=pos.z}
			if core.get_node(above).name ~= "air" then
				return
			end
			for x_ = pos.x-1, pos.x+1 do
				for z_ = pos.z-1, pos.z+1 do
					if core.get_node({x=x_, y=pos.y, z=z_}).name == "air" then
						return;
					end
				end
			end
			core.set_node(above, {name = "nettle:scotch_broom"})
		end
	end
})

core.register_craft({
	type = "fuel",
	recipe = "nettle:nettle",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "nettle:impatiens",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "nettle:cleavers",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "nettle:carduus",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "nettle:scotch_broom",
	burntime = 6,
})

core.register_craft({
	type = "fuel",
	recipe = "nettle:giant_hogweed",
	burntime = 3,
})

