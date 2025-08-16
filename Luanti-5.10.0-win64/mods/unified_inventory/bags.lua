--[[
Bags for Luanti

Copyright (c) 2012 cornernote, Brett O'Donnell <cornernote@gmail.com>
License: GPLv3
--]]

local S = core.get_translator("unified_inventory")
local F = core.formspec_escape
local ui = unified_inventory

ui.register_page("bags", {
	get_formspec = function(player)
		local pname = player:get_player_name()
		return { formspec = table.concat({
			ui.style_full.standard_inv_bg,
			ui.single_slot(0.925, 1.5),
			ui.single_slot(3.425, 1.5),
			ui.single_slot(5.925, 1.5),
			ui.single_slot(8.425, 1.5),
			"label["..ui.style_full.form_header_x..","..ui.style_full.form_header_y..";" .. F(S("Bags")) .. "]",
			"button[0.6125,2.75;1.875,0.75;bag1;" .. F(S("Bag @1", 1)) .. "]",
			"button[3.1125,2.75;1.875,0.75;bag2;" .. F(S("Bag @1", 2)) .. "]",
			"button[5.6125,2.75;1.875,0.75;bag3;" .. F(S("Bag @1", 3)) .. "]",
			"button[8.1125,2.75;1.875,0.75;bag4;" .. F(S("Bag @1", 4)) .. "]",
			"listcolors[#00000000;#00000000]",
			"list[detached:" .. F(pname) .. "_bags;bag1;1.075,1.65;1,1;]",
			"list[detached:" .. F(pname) .. "_bags;bag2;3.575,1.65;1,1;]",
			"list[detached:" .. F(pname) .. "_bags;bag3;6.075,1.65;1,1;]",
			"list[detached:" .. F(pname) .. "_bags;bag4;8.575,1.65;1,1;]"
		}) }
	end,
})

ui.register_button("bags", {
	type = "image",
	image = "ui_bags_icon.png",
	tooltip = S("Bags"),
	hide_lite=true
})

local function get_player_bag_stack(player, i)
	return core.get_inventory({
		type = "detached",
		name = player:get_player_name() .. "_bags"
	}):get_stack("bag" .. i, 1)
end

for bag_i = 1, 4 do
	ui.register_page("bag" .. bag_i, {
		get_formspec = function(player)
			local stack = get_player_bag_stack(player, bag_i)
			local image = stack:get_definition().inventory_image
			local slots = stack:get_definition().groups.bagslots

			local formspec = {
				ui.style_full.standard_inv_bg,
				ui.make_inv_img_grid(0.3, 1.5, 8, slots/8),
				"image[9.2,0.4;1,1;" .. image .. "]",
				"label[0.3,0.65;" .. F(S("Bag @1", bag_i)) .. "]",
				"listcolors[#00000000;#00000000]",
				"listring[current_player;main]",
				string.format("list[current_player;bag%icontents;%f,%f;8,3;]",
				    bag_i, 0.3 + ui.list_img_offset, 1.5 + ui.list_img_offset),
				"listring[current_name;bag" .. bag_i .. "contents]",
			}
			local n = #formspec + 1

			local pname = player:get_player_name() -- For if statement.
			if ui.trash_enabled
				or ui.is_creative(pname)
				or core.get_player_privs(pname).give then
					formspec[n] = ui.make_trash_slot(7.8, 0.25)
					n = n + 1
			end
			local inv = player:get_inventory()
			for i = 1, 4 do
				local def = get_player_bag_stack(player, i):get_definition()
				if def.groups.bagslots then
					local list_name = "bag" .. i .. "contents"
					local size = inv:get_size(list_name)
					local used = 0
					for si = 1, size do
						local stk = inv:get_stack(list_name, si)
						if not stk:is_empty() then
							used = used + 1
						end
					end
					local img = def.inventory_image
					local label = F(S("Bag @1", i)) .. "\n" .. used .. "/" .. size
					formspec[n] = string.format("image_button[%f,0.4;1,1;%s;bag%i;%s]",
							(i + 1.35)*1.25, img, i, label)
					n = n + 1
				end
			end
			return { formspec = table.concat(formspec) }
		end,
	})
end

core.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "" then
		return
	end
	for i = 1, 4 do
		if fields["bag" .. i] then
			local stack = get_player_bag_stack(player, i)
			if not stack:get_definition().groups.bagslots then
				return
			end
			ui.set_inventory_formspec(player, "bag" .. i)
			return
		end
	end
end)

local function save_bags_metadata(player, bags_inv)
	local is_empty = true
	local bags = {}
	for i = 1, 4 do
		local bag = "bag" .. i
		if not bags_inv:is_empty(bag) then
			-- Stack limit is 1, otherwise use stack:to_string()
			bags[i] = bags_inv:get_stack(bag, 1):get_name()
			is_empty = false
		end
	end
	local meta = player:get_meta()
	if is_empty then
		meta:set_string("unified_inventory:bags", nil)
	else
		meta:set_string("unified_inventory:bags",
			core.serialize(bags))
	end
end

local function load_bags_metadata(player, bags_inv)
	local player_inv = player:get_inventory()
	local meta = player:get_meta()
	local bags_meta = meta:get("unified_inventory:bags")
	local bags = bags_meta and core.deserialize(bags_meta) or {}
	local dirty_meta = false
	if not bags_meta then
		-- Backwards compatiblity
		for i = 1, 4 do
			local bag = "bag" .. i
			if not player_inv:is_empty(bag) then
				-- Stack limit is 1, otherwise use stack:to_string()
				bags[i] = player_inv:get_stack(bag, 1):get_name()
				dirty_meta = true
			end
		end
	end
	-- Fill detached slots
	for i = 1, 4 do
		local bag = "bag" .. i
		bags_inv:set_size(bag, 1)
		bags_inv:set_stack(bag, 1, bags[i] or "")
	end

	if dirty_meta then
		-- Requires detached inventory to be set up
		save_bags_metadata(player, bags_inv)
	end

	-- Clean up deprecated garbage after saving
	for i = 1, 4 do
		local bag = "bag" .. i
		player_inv:set_size(bag, 0)
	end
end

core.register_on_joinplayer(function(player)
	local pname = player:get_player_name()
	local bags_inv = core.create_detached_inventory(pname .. "_bags",{
		on_put = function(inv, listname, index, stack, player)
			player:get_inventory():set_size(listname .. "contents",
					stack:get_definition().groups.bagslots)
			save_bags_metadata(player, inv)
		end,
		allow_put = function(inv, listname, index, stack, player)
			local new_slots = stack:get_definition().groups.bagslots
			if not new_slots then
				return 0
			end
			local player_inv = player:get_inventory()
			local old_slots = player_inv:get_size(listname .. "contents")

			if new_slots >= old_slots then
				return 1
			end

			-- using a smaller bag, make sure it fits
			local old_list = player_inv:get_list(listname .. "contents")
			local new_list = {}
			local slots_used = 0
			local use_new_list = false

			for i, v in ipairs(old_list) do
				if v and not v:is_empty() then
					slots_used = slots_used + 1
					use_new_list = i > new_slots
					new_list[slots_used] = v
				end
			end
			if new_slots >= slots_used then
				if use_new_list then
					player_inv:set_list(listname .. "contents", new_list)
				end
				return 1
			end
			-- New bag is smaller: Disallow inserting
			return 0
		end,
		allow_take = function(inv, listname, index, stack, player)
			if player:get_inventory():is_empty(listname .. "contents") then
				return stack:get_count()
			end
			return 0
		end,
		on_take = function(inv, listname, index, stack, player)
			player:get_inventory():set_size(listname .. "contents", 0)
			save_bags_metadata(player, inv)
		end,
		allow_move = function()
			return 0
		end,
	}, pname)

	load_bags_metadata(player, bags_inv)
end)

-- register bag tools
core.register_tool("unified_inventory:bag_small", {
	description = S("Small Bag"),
	inventory_image = "bags_small.png",
	groups = {bagslots=8},
})

core.register_tool("unified_inventory:bag_medium", {
	description = S("Medium Bag"),
	inventory_image = "bags_medium.png",
	groups = {bagslots=16},
})

core.register_tool("unified_inventory:bag_large", {
	description = S("Large Bag"),
	inventory_image = "bags_large.png",
	groups = {bagslots=24},
})

-- register bag crafts
if core.get_modpath("fabric") then
	core.register_craft({
		output = "unified_inventory:bag_small",
		recipe = {
			{"fabric:string"},
			{"group:fabric_block"}
		}
	})

	core.register_craft({
		output = "unified_inventory:bag_medium",
		recipe = {
			{"fabric:string", "unified_inventory:bag_small", "fabric:string"},
			{"fabric:string", "unified_inventory:bag_small", "fabric:string"}
		}
	})

	core.register_craft({
		output = "unified_inventory:bag_large",
		recipe = {
			{"fabric:string", "unified_inventory:bag_medium", "fabric:string"},
			{"fabric:string", "unified_inventory:bag_medium", "fabric:string"}
	    }
	})
end
