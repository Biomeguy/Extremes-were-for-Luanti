local rope = {}
local S = core.get_translator("xdecor")

-- Maximum length a rope can extend to
local MAX_ROPES = 30

local ropesounds = default.node_sound_defaults()

-- Code by Mirko K. (modified by Temperest, Wulfsdad, kilbith and Wuzzy) (License: GPL).
function rope.place(itemstack, placer, pointd)
	local protection_bypass = core.check_player_privs(placer, "protection_bypass")
	local pname = placer:get_player_name()
	local creative = core.is_creative_enabled(pname)
	if pointd.type == "node" then
		-- Use pointed node's on_rightclick function first, if present
		if placer and not placer:get_player_control().sneak then
			local node = core.get_node(pointd.under)
			if core.registered_nodes[node.name] and core.registered_nodes[node.name].on_rightclick then
				return core.registered_nodes[node.name].on_rightclick(pointd.under, node, placer, itemstack) or itemstack
			end
		end
		local pos = pointd.above
		-- Check protection
		if core.is_protected(pos, pname) and not protection_bypass then
			core.record_protection_violation(pos, pname)
			return itemstack
		end

		local oldnode = core.get_node(pos)
		local stackname = itemstack:get_name()
		-- Limit rope length to max. stack size or MAX_ROPES (whatever is smaller).
		-- Prevents the rope to extend infinitely in Creative Mode.
		local max_ropes = math.min(itemstack:get_stack_max(), MAX_ROPES)

		-- Start placing ropes and extend it downwards until we hit an obstacle,
		-- run out of ropes or hit the maximum rope length.
		local start_pos = table.copy(pos)
		local ropes_to_place = 0
		local new_rope_nodes = {}
		while oldnode.name == "air" and (creative or (ropes_to_place < itemstack:get_count())) and ropes_to_place < max_ropes do
			-- Stop extending rope into protected area
			if core.is_protected(pos, pname) and not protection_bypass then
				break
			end

			table.insert(new_rope_nodes, table.copy(pos))
			pos.y = pos.y - 1
			oldnode = core.get_node(pos)
			ropes_to_place = ropes_to_place + 1
		end
		local newnode = {name = stackname}
		if ropes_to_place == 1 then
			core.set_node(new_rope_nodes[1], newnode)
		else
			core.bulk_set_node(new_rope_nodes, newnode)
		end
		if not creative then
			itemstack:take_item(ropes_to_place)
		end

		-- Play placement sound manually
		if ropes_to_place > 0 then
			core.sound_play(ropesounds.place, {pos=start_pos}, true)
		end
	end

	return itemstack
end

function rope.remove(pos, oldnode, digger, rope_name)
	local num = 0
	local below = {x = pos.x, y = pos.y, z = pos.z}
	local pname = digger:get_player_name()
	local digger_inv = digger:get_inventory()

	while core.get_node(below).name == rope_name do
		-- Stop removing rope in protected area
		if core.is_protected(pos, pname) and not core.check_player_privs(digger, "protection_bypass") then
			break
		end
		core.remove_node(below)
		below.y = below.y - 1
		num = num + 1
	end

	if num == 0 then return end

	-- Play dig sound manually
	core.sound_play(ropesounds.dug, {pos=pos}, true)

	-- Give/drop rope items
	local creative = core.is_creative_enabled(pname)
	if not creative or not digger_inv:contains_item("main", rope_name) then
		if creative then
			num = 1
		end
		local item = rope_name.." "..num
		local leftover = digger_inv:add_item("main", rope_name.." "..num)
		if not leftover:is_empty() then
			core.add_item(pos, leftover)
		end
	end

	return true
end

xdecor.register("rope", {
	description = S("Rope"),
	drawtype = "plantlike",
	tiles = {"xdecor_rope.png"},
	inventory_image = "xdecor_rope_inv.png",
	wield_image = "xdecor_rope_inv.png",
	walkable = false,
	climbable = true,
	groups = {snappy = 1, oddly_breakable_by_hand = 3, flammable = 2},
	is_ground_content = false,
	selection_box = xdecor.pixelbox(8, {{3, 0, 3, 2, 8, 2}}),
	node_placement_prediction = "",
	on_place = rope.place,

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		pos = vector.new(pos.x, pos.y-1, pos.z)
		local pname = digger:get_player_name()

		if not core.is_protected(pos, pname) or
			core.get_player_privs(pname).protection_bypass then
	rope.remove(pos, oldnode, digger, "xdecor:rope")
		end
	end,
	sounds = ropesounds,
})

xdecor.register("hemp_rope", {
	description = S("Hemp Rope"),
	drawtype = "plantlike",
	tiles = {"xdecor_hemp_rope.png"},
	inventory_image = "xdecor_hemp_rope.png",
	wield_image = "xdecor_hemp_rope.png",
	walkable = false,
	climbable = true,
	groups = {snappy = 1, oddly_breakable_by_hand = 1, flammable = 2},
	is_ground_content = false,
	selection_box = xdecor.pixelbox(8, {{3, 0, 3, 2, 8, 2}}),
	node_placement_prediction = "",
	on_place = rope.place,

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		pos = vector.new(pos.x, pos.y-1, pos.z)
		local pname = digger:get_player_name()

		if not core.is_protected(pos, pname) or
			core.get_player_privs(pname).protection_bypass then
	rope.remove(pos, oldnode, digger, "xdecor:hemp_rope")
		end
	end,
	sounds = ropesounds,
})

-- Recipes

core.register_craft({
	output = "xdecor:rope",
	recipe = {
		{"fabric:string", "fabric:string"},
		{"fabric:string", "fabric:string"},
		{"fabric:string", "fabric:string"}
	}
})

core.register_craft({
	output = "xdecor:hemp_rope 6",
	recipe = {
		{"farming:hemp_fibre", "farming:cotton", "farming:hemp_fibre"},
		{"farming:hemp_fibre", "farming:cotton", "farming:hemp_fibre"},
		{"farming:hemp_fibre", "farming:cotton", "farming:hemp_fibre"}
	}
})
