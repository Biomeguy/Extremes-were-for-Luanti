-- Code by Mossmanikin & Neuromancer
-- support for i18n
local S = core.get_translator("trunks")

local flat_stick = {-.5, -.5, -.5, .5, -7/16, .5}
local NoDe = { {1}, {2}, {3}, {4}, {5}, --[[{6},]] {7}, {8}, {9}, {10}, {11}, {12}, {13} }

for i in pairs(NoDe) do
	local NR = NoDe[i][1]
	local iNV = NR - 1
	core.register_node("trunks:twig_"..NR, {
		description = S("Twig"),
		inventory_image = "trunks_twig_"..NR..".png",
		wield_image = "trunks_twig_"..NR..".png",
		drawtype = "nodebox",
		tiles = {"trunks_twig_"..NR..".png", "trunks_twig_"..NR..".png^[transformFY", -- mirror
			"blank.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		use_texture_alpha = "clip",
		walkable = false,
		sunlight_propagates = true,
		buildable_to = true,
		liquids_pointable = true,
		node_box = {type = "fixed", fixed = flat_stick},
		groups = {choppy=2, oddly_breakable_by_hand=2, flammable=3, attached_node=1, not_in_creative_inventory=iNV},
		drop = "trunks:twig_1",
		sounds = default.node_sound_leaves_defaults(),
		on_place = function(itemstack, placer, pointd)
			local pt = pointd
			local direction = core.dir_to_facedir(placer:get_look_dir())
			if core.get_node(pt.above).name=="air" then
				core.swap_node(pt.above, {name="trunks:twig_"..math.random(1,4), param2=direction})
				local pname = placer and placer:get_player_name() or ""
				if not core.is_creative_enabled(pname) then
					itemstack:take_item()
				end
				return itemstack
			end
		end,
	})
end

local flat_moss = {-.5, -.5, -.5, .5, -15/32--[[<-flickers if smaller]], .5}

core.register_node("trunks:moss", {
	description = S("Moss"),
	drawtype = "nodebox",
	tiles = {"trunks_moss.png"},
	inventory_image = "trunks_moss.png",
	wield_image = "trunks_moss.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	use_texture_alpha = "clip",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	node_box = {type = "fixed", fixed = flat_moss},
	selection_box = {type = "fixed", fixed = flat_stick},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	on_timer = function(pos)
		if core.find_node_near(pos, 2, "ignore") or not core.find_node_near(pos, 1, "air")
		or default.h_h_h(pos, nil, -10, 19) and default.h_h_h(pos, nil, 110) then
			core.get_node_timer(pos):start(300)
			return-- Nodes not yet loaded, try later
		end

		local light = core.get_node_light(pos)
		if not light or light < 5 then
			core.get_node_timer(pos):start(300)
			return
		end

	local airs = core.find_nodes_in_area(vector.subtract(pos, 1), vector.add(pos, 1), "air")
	local num_airs = #airs
	if num_airs >= 1 then
		for si = 1, math.min(3, num_airs) do
			local spot = airs[math.random(num_airs)]
			local dir = 0-- Change per direction
	if core.get_item_group(core.get_node({x=spot.x, y=spot.y-1, z=spot.z}).name, "trunk") ~= 0 then dir = 1
	elseif core.get_item_group(core.get_node({x=spot.x-1, y=spot.y, z=spot.z}).name, "trunk") ~= 0 then dir = 3
	elseif core.get_item_group(core.get_node({x=spot.x+1, y=spot.y, z=spot.z}).name, "trunk") ~= 0 then dir = 2
	elseif core.get_item_group(core.get_node({x=spot.x, y=spot.y, z=spot.z-1}).name, "trunk") ~= 0 then dir = 5
	elseif core.get_item_group(core.get_node({x=spot.x, y=spot.y, z=spot.z+1}).name, "trunk") ~= 0 then dir = 4
	else return end

			local pos_name = core.get_node(spot).name
			light = core.get_node_light(spot)
			if light and light >= 5 and pos_name == "air" then
	local alter = ""
	if math.random(1, 22) == 1 then
		alter = "_fungus"	end
	core.set_node(spot, {name = "trunks:moss".. alter, param2 = dir})
			end
		end
	end
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	groups = {snappy = 3, attached_node = 1, trunks_moss=1, flammable=1, timer_check = 1},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("trunks:moss_fungus", {-- Accelerates composting (other fungi should also do this)
	description = S("Moss with Fungus"),
	drawtype = "nodebox",
	tiles = {"trunks_moss_fungus.png"},
	inventory_image = "trunks_moss_fungus.png",
	wield_image = "trunks_moss_fungus.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	use_texture_alpha = "clip",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	node_box = {type = "fixed", fixed = flat_moss},
	selection_box = {type = "fixed", fixed = flat_stick},
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(300, 1500))
if core.get_node({x= pos.x, y= pos.y -1, z= pos.z}).name ~= "default:compost_pile" then return end
		pos.y = pos.y -1
		local ntimer = core.get_node_timer(pos)
		ntimer:start(ntimer:get_timeout() / ntimer:get_elapsed())
	end,
	on_timer = function(pos)
		if core.find_node_near(pos, 2, "ignore") or not core.find_node_near(pos, 1, "air")
		or default.h_h_h(pos, nil, -10, 19) and default.h_h_h(pos, nil, 110) then
			core.get_node_timer(pos):start(300)
			return-- Not good, try later
		end

		local light = core.get_node_light(pos)
		if not light or light < 5 then
			core.get_node_timer(pos):start(300)
			return
		end

	local airs = core.find_nodes_in_area(vector.subtract(pos, 1), vector.add(pos, 1), "air")
	local num_airs = #airs
	if num_airs >= 1 then
		for si = 1, math.min(3, num_airs) do
			local spot = airs[math.random(num_airs)]
			local dir = 0-- Change per direction
	if core.get_item_group(core.get_node({x=spot.x, y=spot.y-1, z=spot.z}).name, "trunk") ~= 0 then dir = 1
	elseif core.get_item_group(core.get_node({x=spot.x-1, y=spot.y, z=spot.z}).name, "trunk") ~= 0 then dir = 3
	elseif core.get_item_group(core.get_node({x=spot.x+1, y=spot.y, z=spot.z}).name, "trunk") ~= 0 then dir = 2
	elseif core.get_item_group(core.get_node({x=spot.x, y=spot.y, z=spot.z-1}).name, "trunk") ~= 0 then dir = 5
	elseif core.get_item_group(core.get_node({x=spot.x, y=spot.y, z=spot.z+1}).name, "trunk") ~= 0 then dir = 4
	else return end

			local pos_name = core.get_node(spot).name
			light = core.get_node_light(spot)
			if light and light >= 5 and pos_name == "air" then
	local alter = ""
	if math.random(1, 22) == 1 then
		alter = "_fungus"	end
	core.set_node(spot, {name = "trunks:moss".. alter, param2 = dir})
			end
		end
	end
		core.get_node_timer(pos):start(math.random(300, 1500))
	end,
	groups = {snappy = 3, attached_node = 1, trunks_moss=1, flammable=1, timer_check = 1},
	sounds = default.node_sound_fruits_defaults(),
})

core.register_node("trunks:twigs", {
	description = S("Twigs Block"),
	paramtype2 = "facedir",
	tiles = {"trunks_twigs.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("trunks:twigs_slab", {
	description = S("Twigs Slab"),
	drawtype = "nodebox",
	tiles = {"trunks_twigs.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {-.5, -.5, -.5, .5, 0, .5}
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("trunks:twigs_roof", {
	description = S("Twigs Roof"),
	drawtype = "nodebox",
	tiles = {"trunks_twigs.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, 0, 0, .5, .5, .5},
			{-.5, -.5, -.5, .5, 0, 0}
		}
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("trunks:twigs_roof_corner", {
	description = S("Twigs Roof Corner 1"),
	drawtype = "nodebox",
	tiles = {"trunks_twigs_corner.png", "trunks_twigs_corner.png", "trunks_twigs.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, 0, 0, 0, .5, .5},
			{0, -.5, 0, .5, 0, .5},
			{-.5, -.5, -.5, 0, 0, 0}
		}
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

core.register_node("trunks:twigs_roof_corner_2", {
	description = S("Twigs Roof Corner 2"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"trunks_twigs_corner.png",
		"trunks_twigs_corner.png",
		"trunks_twigs.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-.5, -.5, 0, 0, 0, .5},
			{0, 0, 0, .5, .5, .5},
			{-.5, 0, -.5, 0, .5, 0}
		}
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})
