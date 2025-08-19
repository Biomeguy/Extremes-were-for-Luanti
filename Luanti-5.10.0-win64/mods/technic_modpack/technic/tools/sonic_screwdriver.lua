local sonic_screwdriver_max_charge = 15000

local S = technic.getter

technic.register_power_tool("technic:sonic_screwdriver", sonic_screwdriver_max_charge)

-- screwdriver handler code reused from luanti/minetest_game screwdriver @a9ac480
local ROTATE_FACE = 1
local ROTATE_AXIS = 2

local function nextrange(x, max)
	x = x + 1
	if x > max then
		x = 0
	end
	return x
end

-- Handles rotation
local function screwdriver_handler(itemstack, user, pointd, mode)
	if pointd.type ~= "node" then
		return
	end

	local pos = pointd.under

	if core.is_protected(pos, user:get_player_name()) then
		core.record_protection_violation(pos, user:get_player_name())
		return
	end

	local node = core.get_node(pos)
	local ndef = core.registered_nodes[node.name]
	if not ndef or not ndef.paramtype2 == "facedir" or
			(ndef.drawtype == "nodebox" and
			not ndef.node_box.type == "fixed") or
			node.param2 == nil then
		return
	end

	-- contrary to the default screwdriver, do not check for can_dig, to allow rotating machines with CLU's in them
	-- this is consistent with the previous sonic screwdriver

	local meta1 = core.deserialize(itemstack:get_meta():get_string(""))
	if not meta1 or not meta1.charge or meta1.charge < 100 then
		return
	end

	core.sound_play("technic_sonic_screwdriver", {pos = pos, gain = 0.3, max_hear_distance = 10})

	-- Set param2
	local rotationPart = node.param2 % 32 -- get first 4 bits
	local preservePart = node.param2 - rotationPart

	local axisdir = math.floor(rotationPart / 4)
	local rotation = rotationPart - axisdir * 4
	if mode == ROTATE_FACE then
		rotationPart = axisdir * 4 + nextrange(rotation, 3)
	elseif mode == ROTATE_AXIS then
		rotationPart = nextrange(axisdir, 5) * 4
	end

	node.param2 = preservePart + rotationPart
	core.swap_node(pos, node)

	if not technic.creative_mode then
		meta1.charge = meta1.charge - 100
		itemstack:get_meta():set_string("", core.serialize(meta1))
		technic.set_RE_wear(itemstack, meta1.charge, sonic_screwdriver_max_charge)
	end

	return itemstack
end

core.register_tool("technic:sonic_screwdriver", {
	description = S("Sonic Screwdriver (left-click rotates face, right-click rotates axis)"),
	inventory_image = "technic_sonic_screwdriver.png",
	wear_represents = "technic_RE_charge",
	on_refill = technic.refill_RE_charge,
	groups = {not_repaired_by_anvil = 1},
	on_use = function(itemstack, user, pointd)
		screwdriver_handler(itemstack, user, pointd, ROTATE_FACE)
		return itemstack
	end,
	on_place = function(itemstack, user, pointd)
		screwdriver_handler(itemstack, user, pointd, ROTATE_AXIS)
		return itemstack
	end,
})

core.register_craft({
	output = "technic:sonic_screwdriver",
	recipe = {
		{"", "default:diamond", ""},
		{"mesecons_insulated:fiber", "technic:battery", "mesecons_insulated:fiber"},
		{"mesecons_insulated:fiber", "default:mithril_ingot", "mesecons_insulated:fiber"}
	}
})
