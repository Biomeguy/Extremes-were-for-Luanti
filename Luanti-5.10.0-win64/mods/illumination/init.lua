illumination = {}
illumination.playerLights = {}
local using_3d_armor = core.get_modpath("3d_armor")

local lightPoint = {
	drawtype = "airlike",
	light_source = 4,
	paramtype = "light",
	walkable = false,
	diggable = false,
	pointable = false,
	buildable_to = true,
	sunlight_propagates = true,
	on_blast = function() end,
	drop = "",
	groups = {not_in_creative_inventory=1},
	on_timer = function(pos)
		for i, obj in pairs(core.get_objects_inside_radius(pos, 1)) do
	if obj:is_player() then
		return true
	end
		end
		core.remove_node(pos)
	end,
}

core.register_node("illumination:light_faint", lightPoint)
lightPoint.light_source = 8
core.register_node("illumination:light_dim", lightPoint)
lightPoint.light_source = 12
core.register_node("illumination:light_mid", lightPoint)
lightPoint.light_source = 14
core.register_node("illumination:light_full", lightPoint)

core.register_lbm({
	name = "illumination:activate_node_timers",
	nodenames = {"illumination:light_faint", "illumination:light_dim", "illumination:light_mid", "illumination:light_full"},
	run_at_every_load = true,
	action = function(pos)
		if not core.get_node_timer(pos):is_started() then
			core.get_node_timer(pos):start(2)
		end
	end
})
--[[
core.register_abm({ --This should clean up nodes that don't get deleted for some reason
	nodenames={"illumination:light_faint","illumination:light_dim","illumination:light_mid","illumination:light_full"},
	interval=1,
	chance=1,
	action = function(pos)
		local canExist = false
		for _, player in ipairs(core.get_connected_players()) do
			if illumination.playerLights[player:get_player_name()] then
				local pos1 = illumination.playerLights[player:get_player_name()].pos
				if pos1 then
					if vector.equals(pos1,pos) then
						canExist = true
					end
				end
			end
		end
		if not canExist then
			core.remove_node(pos)
		end
	end
})]]
core.register_on_joinplayer(function(player)
	illumination.playerLights[player:get_player_name()] = {
		bright = 0,
		pos = vector.new(player:get_pos())
	}
end)

core.register_on_leaveplayer(function(player, _)
	local pname = player:get_player_name()
	local remainingPlayers = {}
	for _, online in pairs(core.get_connected_players()) do
		if online:get_player_name() ~= pname then
			remainingPlayers[online:get_player_name()] = illumination.playerLights[online:get_player_name()]
		end
	end
	illumination.playerLights = remainingPlayers
end)

local function canLight(nodeName) 
	return (nodeName == "air" or nodeName == "illumination:light_faint" or nodeName == "illumination:light_dim" or nodeName == "illumination:light_mid" or nodeName == "illumination:light_full")
end

local LHL = tonumber(core.settings:get("left_handed_light_at")) or 0
if LHL > 8 then
	LHL =8
end

core.register_globalstep(function(dtime)
	for _, player in ipairs(core.get_connected_players()) do
		if illumination.playerLights[player:get_player_name()] then
			local light = 0
			if core.registered_nodes[player:get_wielded_item():get_name()] then
				light = core.registered_nodes[player:get_wielded_item():get_name()].light_source
			end
			local left_hand = 0
			if core.registered_nodes[player:get_inventory():get_stack("main", LHL):get_name()] then
				left_hand = core.registered_nodes[player:get_inventory():get_stack("main", LHL):get_name()].light_source
			end
			if left_hand > light then
				light = left_hand
			end
if using_3d_armor then
	if armor.def[player:get_player_name()].head_lamp > 0 then
		light = 14
	end
end

			local pos = player:get_pos()
			pos.x = math.floor(pos.x + .5)
			pos.y = math.floor(pos.y + .5)
			pos.z = math.floor(pos.z + .5)
			if not canLight(core.get_node(pos).name) then
				if canLight(core.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name) then
					pos = {x=pos.x, y=pos.y+1, z=pos.z}
				elseif canLight(core.get_node({x=pos.x, y=pos.y+2, z=pos.z}).name) then
					pos = {x=pos.x, y=pos.y+2, z=pos.z}
				elseif canLight(core.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name) then
					pos = {x=pos.x, y=pos.y-1, z=pos.z}
				elseif canLight(core.get_node({x=pos.x+1, y=pos.y, z=pos.z}).name) then
					pos = {x=pos.x+1, y=pos.y, z=pos.z}
				elseif canLight(core.get_node({x=pos.x, y=pos.y, z=pos.z+1}).name) then
					pos = {x=pos.x, y=pos.y, z=pos.z+1}
				elseif canLight(core.get_node({x=pos.x-1, y=pos.y, z=pos.z}).name) then
					pos = {x=pos.x-1, y=pos.y, z=pos.z}
				elseif canLight(core.get_node({x=pos.x, y=pos.y, z=pos.z-1}).name) then
					pos = {x=pos.x, y=pos.y, z=pos.z-1}
				elseif canLight(core.get_node({x=pos.x+1, y=pos.y+1, z=pos.z}).name) then
					pos = {x=pos.x+1, y=pos.y+1, z=pos.z}
				elseif canLight(core.get_node({x=pos.x-1, y=pos.y+1, z=pos.z}).name) then
					pos = {x=pos.x-1, y=pos.y+1, z=pos.z}
				elseif canLight(core.get_node({x=pos.x, y=pos.y+1, z=pos.z+1}).name) then
					pos = {x=pos.x, y=pos.y+1, z=pos.z+1}
				elseif canLight(core.get_node({x=pos.x, y=pos.y+1, z=pos.z-1}).name) then
					pos = {x=pos.x, y=pos.y+1, z=pos.z-1}
				end
			end
			local pos1 = illumination.playerLights[player:get_player_name()].pos
			local lightLast = illumination.playerLights[player:get_player_name()].bright

			illumination.playerLights[player:get_player_name()] = {}
			if canLight(core.get_node(pos).name) then
				illumination.playerLights[player:get_player_name()].bright = light
				illumination.playerLights[player:get_player_name()].pos = pos
				local nodeName = "air"
				if light > 2 then
					nodeName = "illumination:light_faint"
				end
				if light > 7 then
					nodeName = "illumination:light_dim"
				end
				if light > 10 then
					nodeName = "illumination:light_mid"
				end
				if light > 13 then
					nodeName = "illumination:light_full"
				end
				if nodeName then
					core.set_node(pos, {name=nodeName})
					if nodeName ~= "air" then
						core.get_node_timer(pos):start(1)
					end
				end
			end

			if pos1 then
				if canLight(core.get_node(pos1).name) then
					if not vector.equals(pos, pos1) then
						core.remove_node(pos1)
					end
				end
			end
		end
	end
end)