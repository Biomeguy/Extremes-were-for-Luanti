local S
if (core.get_modpath("intllib")) then
	S = intllib.Getter()
else
	S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

local returnmirror = {}
returnmirror.cost_teleport = 200
returnmirror.cost_set = 20

if tonumber(core.settings:get("returnmirror_cost_teleport")) ~= nil then
	returnmirror.cost_teleport = tonumber(core.settings:get("returnmirror_cost_teleport"))
end
if tonumber(core.settings:get("returnmirror_cost_set")) ~= nil then
	returnmirror.cost_set = tonumber(core.settings:get("returnmirror_cost_set"))
end

if core.get_modpath("chi") then
	returnmirror.chi = true
else
	returnmirror.chi = false
end

returnmirror.chi_check = function(player, cost)
	local allowed
	if returnmirror.chi then
		if chi.subtract(player:get_player_name(), cost) then
			allowed = true
		else
			allowed = false
		end
	else
		allowed = true
	end
	return allowed
end

returnmirror.set_position_inactive = function(itemstack, user, pointd)
	-- Use pointed node's on_rightclick function first, if present
	if pointd.type == "node" then
		local node = core.get_node(pointd.under)
		if user and not user:get_player_control().sneak then
			if core.registered_nodes[node.name] and core.registered_nodes[node.name].on_rightclick then
				return core.registered_nodes[node.name].on_rightclick(pointd.under, node, user, itemstack) or itemstack
			end
		end
	end

	local pos = user:get_pos()
	if returnmirror.chi_check(user, returnmirror.cost_set) then
		local newitem = ItemStack("returnmirror:mirror_active")
		newitem:get_meta():set_string("desti", core.pos_to_string(pos))
		core.sound_play( {name="returnmirror_set", gain=1}, {pos=pos, max_hear_distance=12})
		return newitem
	else
		core.sound_play( {name="returnmirror_fail", gain=1}, {pos=pos, max_hear_distance=18})
	end
end

returnmirror.set_position_active = function(itemstack, user, pointd)
	-- Use pointed node's on_rightclick function first, if present
	if pointd.type == "node" then
		local node = core.get_node(pointd.under)
		if user and not user:get_player_control().sneak then
			if core.registered_nodes[node.name] and core.registered_nodes[node.name].on_rightclick then
				return core.registered_nodes[node.name].on_rightclick(pointd.under, node, user, itemstack) or itemstack
			end
		end
	end

	local pos = user:get_pos()
	if returnmirror.chi_check(user, returnmirror.cost_set) then
		itemstack:get_meta():set_string("desti", core.pos_to_string(pos))
		core.sound_play( {name="returnmirror_set", gain=1}, {pos=pos, max_hear_distance=12})
		return itemstack
	else
		core.sound_play( {name="returnmirror_fail", gain=1}, {pos=pos, max_hear_distance=18})
	end
end

local longdesc, usagehelp
if core.get_modpath("doc_items") then
	usagehelp = S("Rightclick to set the mirror's teleport location. Leftclick to immediately teleport back to the mirror's teleport location.")
	if core.get_modpath("chi") then
		longdesc = S("This item allows to teleport the user back to a previously set location, at the cost of chi.")
		usagehelp = usagehelp .. " " .. S("Setting the teleport location costs @1 chi, teleporting costs @2 chi.", returnmirror.cost_set, returnmirror.cost_teleport)
	else
		longdesc = S("This item allows to teleport its user back to a previously set location.")
	end
end

core.register_tool("returnmirror:mirror_inactive", {
	description = S("Mirror of Returning"),
	_doc_items_longdesc = longdesc,
	_doc_items_usagehelp = usagehelp,
	inventory_image = "returnmirror_mirror_inactive.png",
	wield_image = "returnmirror_mirror_inactive.png",
	tool_capabilities = {},
	range = 2,
	on_use = function(itemstack, user, pointd)
		core.sound_play( {name="returnmirror_fail", gain=1}, {pos=user:get_pos(), max_hear_distance=18})
	end,
	on_place = returnmirror.set_position_inactive,
	on_secondary_use = returnmirror.set_position_inactive,
})

core.register_tool("returnmirror:mirror_active", {
	description = S("Mirror of Returning"),
	_doc_items_create_entry = false,
	stack_max = 1,
	inventory_image = "returnmirror_mirror_active.png",
	wield_image = "returnmirror_mirror_active.png",
	tool_capabilities = {},
	range = 2,
	on_use = function(itemstack, user, pointd)
		local dest_string = itemstack:get_meta():get_string("desti")
		local dest = core.string_to_pos(dest_string)
		local src = user:get_pos()
		local fail = true
		if dest ~= nil then
			if returnmirror.chi_check(user, returnmirror.cost_teleport) then
				fail = false
				core.sound_play( {name="returnmirror_teleport", gain=1}, {pos=src, max_hear_distance=30})
				core.add_particlespawner({
					amount = 50,
					time = .1,
					minpos = {x=src.x-.4, y=src.y+.25, z=src.z-.4},
					maxpos = {x=src.x+.4, y=src.y+.75, z=src.z+.4},
					minvel = {x=-.2, y=-.2, z=-.2},
					maxvel = {x=.2, y=.2, z=.2},
					exptime = {min = 3, max = 4.5},
					minsize = 1,
					maxsize = 1.25,
					texture = "returnmirror_particle_departure.png"})
				user:set_pos(dest)
				core.sound_play( {name="returnmirror_teleport", gain=1}, {pos=dest, max_hear_distance=30})
				core.add_particlespawner({
					amount = 100,
					time = .1,
					minpos = {x=dest.x-.4, y=dest.y+.25, z=dest.z-.4},
					maxpos = {x=dest.x+.4, y=dest.y+.75, z=dest.z+.4},
					minvel = {x=-.4, y=-.3, z=-.4},
					maxvel = {x=.4, y=.3, z=.4},
					exptime = {min = 6, max = 12},
					minsize = 1,
					maxsize = 1.25,
					texture = "returnmirror_particle_arrival.png"})
			end
		end
		if fail then
			core.sound_play( {name="returnmirror_fail", gain=1}, {pos=src, max_hear_distance=18})
		end
	end,
	on_place = returnmirror.set_position_active,
	on_secondary_use = returnmirror.set_position_active,
	groups = { not_in_creative_inventory = 1 },
})

core.register_alias("returnmirror:returnmirror", "returnmirror:mirror_inactive")

if core.get_modpath("doc") then
	doc.add_entry_alias("tools", "returnmirror:mirror_inactive", "tools", "returnmirror:mirror_active")
end
