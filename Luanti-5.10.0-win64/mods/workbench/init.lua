-- init.lua
--
-- workbench luanti mod, by darkrose
-- Copyright (C) Lisa Milne 2012 <lisa@ltmnet.com>
--
-- updated by cornernote
-- Copyright (C) Brett O'Donnell 2012 <cornernote@gmail.com>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as
-- published by the Free Software Foundation, either version 2.1 of the
-- License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this program.  If not, see
-- <http://www.gnu.org/licenses/>


-- expose api
workbench = {}

-- on_construct
workbench.on_construct = function(pos)
	local width = core.get_item_group(core.get_node(pos).name, "craft_width")
	local meta = core.get_meta(pos)
	local inv = meta:get_inventory()
	inv:set_size("craftresult", 1)
	inv:set_size("table", width*width)
	inv:set_width("craft", width)
	meta:set_string("formspec", "size[8,"..(width+4.5).."]"
		.."list[current_name;craftresult;6,2;1,1;]"
		.."list[current_player;main;0,"..(width+0.5)..";8,4;]"
		.."list[current_name;table;0,0;"..width..","..width..";]")
	meta:set_string("infotext", width.."x"..width.." WorkBench")
	meta:set_int("width", width)
end

-- can_dig
workbench.can_dig = function(pos,player)
	local meta = core.get_meta(pos);
	local inv = meta:get_inventory()
	if inv:is_empty("table") and inv:is_empty("craftresult") then
		return true
	end
	return false
end

-- allow_metadata_inventory_move
workbench.allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
	if to_list == "craftresult" then
		return 0
	end
	if to_list == "table" then
		workbench.update_inventory(pos, true, true)
	end
	return count
end

-- allow_metadata_inventory_put
workbench.allow_metadata_inventory_put = function(pos, listname, index, stack, player)
	if listname == "craftresult" then
		return 0
	end
	return stack:get_count()
end

-- allow_metadata_inventory_take
workbench.allow_metadata_inventory_take = function(pos, listname, index, stack, player)
	return stack:get_count()
end

-- on_metadata_inventory_move
workbench.on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
	if to_list == "table" then
		workbench.update_inventory(pos)
	end
end

-- on_metadata_inventory_put
workbench.on_metadata_inventory_put = function(pos, listname, index, stack, player)
	if listname == "table" then
		workbench.update_inventory(pos)
	end
end

-- on_metadata_inventory_take
workbench.on_metadata_inventory_take = function(pos, listname, index, count, player)
	if listname == "table" then
		workbench.update_inventory(pos)
	elseif listname == "craftresult" then
		workbench.update_inventory(pos, true)
	end
end

-- update_inventory
workbench.update_inventory = function(pos,update_table,skip_update_craft)
	local meta = core.get_meta(pos)
	local inv = meta:get_inventory()
	local width = meta:get_int("width")
	local tablelist = inv:get_list("table")
	local crafted = nil
	local table_dec = nil

	-- update table
	if update_table then
		-- get craft result
		if tablelist then
			_, table_dec = core.get_craft_result({method = "normal", width = width, items = tablelist})
		end
		-- update table
		if table_dec then
			inv:set_list("table", table_dec.items)
		else
			inv:set_list("table", nil)
		end
		tablelist = table_dec.items
	end	

	-- update craft result
	if not skip_update_craft then
		-- get craft result
		if tablelist then
			crafted = core.get_craft_result({method = "normal", width = width, items = tablelist})
		end
		-- update craft result
		if crafted then
			inv:set_stack("craftresult", 1, crafted.item)
		else
			inv:set_stack("craftresult", 1, nil)
		end
	end
	
end

-- register
workbench.register = function(width, recipe)
	core.register_node("workbench:"..width.."x"..width, {
		description = "WorkBench "..width.."x"..width,
		tiles = {"workbench_"..width.."x"..width.."_top.png", "workbench_bottomANDside.png"},
		paramtype2 = "facedir",
		groups = {craft_width=width,choppy=3,oddly_breakable_by_hand=3},
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		on_construct = workbench.on_construct,
		can_dig = workbench.can_dig,
		allow_metadata_inventory_move = workbench.allow_metadata_inventory_move,
		allow_metadata_inventory_put = workbench.allow_metadata_inventory_put,
		allow_metadata_inventory_take = workbench.allow_metadata_inventory_take,
		on_metadata_inventory_move = workbench.on_metadata_inventory_move,
		on_metadata_inventory_put = workbench.on_metadata_inventory_put,
		on_metadata_inventory_take = workbench.on_metadata_inventory_take,
	})
	core.register_craft({
		output = "workbench:"..width.."x"..width,
		recipe = recipe,
	})
end

--[[ register workbenches
workbench.register(3, {
	{"group:wood","group:wood"},
	{"group:wood","group:wood"}
})]]
workbench.register(4, {
	{"default:stone","default:stone","default:stone"},
	{"group:wood","group:wood","group:wood"},
	{"group:wood","group:wood","group:wood"}
})
workbench.register(5, {
	{"default:steel_ingot","default:steel_ingot","default:steel_ingot","default:steel_ingot"},
	{"group:wood","group:wood","group:wood","group:wood"},
	{"group:wood","group:wood","group:wood","group:wood"},
	{"group:wood","group:wood","group:wood","group:wood"}
})

-- register test crafts
core.register_craft({
	output = "default:mese",
	recipe = {
		{"dwarves:adamantium_conc","dwarves:adamantium_conc","dwarves:adamantium_conc","dwarves:adamantium_conc","dwarves:adamantium_conc"},
		{"dwarves:adamantium_conc","dwarves:adamantium_conc","dwarves:adamantium_conc","dwarves:adamantium_conc","dwarves:adamantium_conc"},
		{"dwarves:adamantium_conc","dwarves:adamantium_conc","dwarves:adamantium_conc","dwarves:adamantium_conc","dwarves:adamantium_conc"},
		{"dwarves:adamantium_conc","dwarves:adamantium_conc","dwarves:adamantium_conc","dwarves:adamantium_conc","dwarves:adamantium_conc"},
		{"dwarves:adamantium_conc","dwarves:adamantium_conc","dwarves:adamantium_conc","dwarves:adamantium_conc","dwarves:adamantium_conc"}
	}
})

core.register_craft({
	output = "dwarves:adamantium_conc",
	recipe = {
		{"dwarves:adamantium","dwarves:adamantium","dwarves:adamantium","dwarves:adamantium","dwarves:adamantium"},
		{"dwarves:adamantium","dwarves:adamantium","dwarves:adamantium","dwarves:adamantium","dwarves:adamantium"},
		{"dwarves:adamantium","dwarves:adamantium","dwarves:durin_axe","dwarves:adamantium","dwarves:adamantium"},
		{"dwarves:adamantium","dwarves:adamantium","dwarves:adamantium","dwarves:adamantium","dwarves:adamantium"},
		{"dwarves:adamantium","dwarves:adamantium","dwarves:adamantium","dwarves:adamantium","dwarves:adamantium"}
	}
})

core.register_craft({
	type = "shapeless",
	output = 'default:mese',
	recipe = {"default:lava_source", "default:lava_source", "default:lava_source", "default:water_source", "default:water_source",
		"default:water_source", "default:water_source", "default:water_source", "default:water_source", "default:water_source"},
})

core.register_craft({
	output = "dwarves:durin_axe",
	recipe = {
		{'','','dwarves:adamantium','',''},
		{'','dwarves:adamantium','dwarves:adamantium','dwarves:adamantium','dwarves:adamantium'},
		{'','dwarves:adamantium','dwarves:ebony_ingot','dwarves:sapphire',''},
		{'','','default:stick','default:paper',''},
		{'','dwarves:ruby','default:stick','dwarves:ruby',''}
	}
})
