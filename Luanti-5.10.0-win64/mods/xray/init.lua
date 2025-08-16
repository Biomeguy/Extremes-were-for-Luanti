-- get content id of default:stone
local c_stone = core.get_content_id("default:stone")

-- Init content id of xray:stone (will be set after register_node)
local c_xray_stone = c_stone

-- expose api
xray = {}

-- the range of the xray effect
xray.range = 5

-- how long before the nodes turn back to stone
xray.timer = 5

-- mode is used to store the xray mode for each player
xray.mode = {}

-- should we spew out log messages?
xray.debug = false

-- log
xray.log = function(message)
  if not xray.debug then
    return
  end
  core.log("action", "[xray] "..message)
end

local function player_in_range(pos)
  for _, object in ipairs(core.get_objects_inside_radius(pos, xray.range + 2)) do
    if object:is_player() and xray.mode[object:get_player_name()] == 1 then
      return true
    end
  end
  return false
end

xray.replace = function(player_pos)
  local count = 0

  -- Gen pos1 and pos2
  player_pos = vector.round(player_pos)
  local pos1 = vector.subtract(player_pos, xray.range)
  local pos2 = vector.add(player_pos, xray.range)

  -- Read data into LVM
  local vm = core.get_voxel_manip()
  local emin, emax = vm:read_from_map(pos1, pos2)
  local a = VoxelArea:new{
    MinEdge = emin,
    MaxEdge = emax
  }
  local data = vm:get_data()

  -- Modify data
  for z = pos1.z, pos2.z do
    for y = pos1.y, pos2.y do
      for x = pos1.x, pos2.x do
        local vi = a:index(x, y, z)
        if data[vi] == c_stone then
          data[vi] = c_xray_stone
          if xray.debug then
            count = count + 1
          end
        end
      end
    end
  end

  -- Write data
  vm:set_data(data)
  vm:write_to_map(true)

  -- Log
  xray.log("Replaced " .. count .. " default:stone nodes near " .. core.pos_to_string(player_pos))
end

-- restore xray to stone
xray.restore = function(pos)
  if player_in_range(pos) then
    return
  end

  local count = 0

  -- Bulk update nodes around
  local c_xray = core.get_content_id("xray:stone")
  local pos1 = vector.subtract(pos, xray.range + 2)
  local pos2 = vector.add(pos, xray.range + 2)

  -- Read data into LVM
  local vm = core.get_voxel_manip()
  local emin, emax = vm:read_from_map(pos1, pos2)
  local a = VoxelArea:new{
    MinEdge = emin,
    MaxEdge = emax
  }
  local data = vm:get_data()

  -- Modify data
  for z = pos1.z, pos2.z do
    for y = pos1.y, pos2.y do
      for x = pos1.x, pos2.x do
        local vi = a:index(x, y, z)
        if data[vi] == c_xray and not player_in_range({x = x, y = y, z = z}) then
          data[vi] = c_stone
          if xray.debug then
            count = count + 1
          end
        end
      end
    end
  end
  vm:set_data(data)
  vm:write_to_map(true)

  -- Log
  xray.log("Restored " .. count .. " xray:stone nodes near " .. core.pos_to_string(pos))
end

-- register_chatcommand
core.register_chatcommand("xray", {
	params = "<on|off>",
	description = "Make stone near you transparent.",
	privs = {shout = true},
	func = function(name, param)
		if param == 'on' then
			xray.mode[name] = 1
			core.chat_send_player(name, "Xray turned on.")
		elseif param == 'off' then
			xray.mode[name] = 0
			core.chat_send_player(name, "Xray turned off.")
		else
			core.chat_send_player(name, "Please enter 'on' or 'off'.")
		end
	end,
})

-- register_node
core.register_node("xray:stone", {
	description = "Xray Stone",
	drawtype = "glasslike",
	tiles = {"xray_stone.png"},
	paramtype = "light",
	light_source = 12,
	is_ground_content = true,
	legacy_mineral = true,
	drop = 'default:rocks',
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

-- Set content id of xray:stone
c_xray_stone = core.get_content_id("xray:stone")

-- register_globalstep - replace default:stone with xray:stone in range of players with xray
core.register_globalstep(
	function(dtime)
		for _, player in ipairs(core.get_connected_players()) do
		if xray.mode[player:get_player_name()] == 1 then
			xray.replace(player:get_pos())
		end
	end
end)

-- register_abm - restore any stray xray:stone nodes to default:stone
core.register_abm({
  nodenames = {"xray:stone"},
  interval = xray.timer,
  chance = 1,
  action = xray.restore,
})
