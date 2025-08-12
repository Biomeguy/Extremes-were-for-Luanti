local get_connected_players = core.get_connected_players
local lastdir = {}
local basepos = vector.new(0, 6.35, 0)

core.register_globalstep(function()
	for _, player in pairs(get_connected_players()) do
		local pname = player:get_player_name()
		local ldeg = -player:get_look_vertical()
		local ctrl, strafe = player:get_player_control()
		local attachd = player:get_attach()
	if attachd and attachd:get_luaentity() and attachd:get_luaentity().name == "oceaflight:wings" then
		ldeg = 1

	elseif ldeg > 1 then-- from flyswim
		ldeg = 1
	elseif ldeg < -1 then
		ldeg = -1	end

	if ctrl.left then
		strafe = -.3
	elseif ctrl.right then
		strafe = .3
	else
		strafe = 0	end

		if (lastdir[pname] or 0) ~= ldeg or strafe then
	lastdir[pname] = ldeg
	player:set_bone_override("Head", {
		position = {
			vec = basepos,
			absolute = true
		},
		rotation = {
			vec = {x = ldeg, y = strafe, z = 0},
			interpolation = .09
		}
	})
		end
	end
end)

core.register_on_leaveplayer(function(player)
	lastdir[player:get_player_name()] = nil
end)
