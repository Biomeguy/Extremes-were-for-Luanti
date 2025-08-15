-- Hybrid Dog's key binding methods

local on_key_releases,nr = {},0
function core.register_on_key_release(func)
	nr = nr+1
	on_key_releases[nr] = func
end
 
local on_key_presses,np = {},0
function core.register_on_key_press(func)
	np = np+1
	on_key_presses[np] = func
end

local playerkeys = {}
core.register_globalstep(function()
	for _, player in pairs(core.get_connected_players()) do
		local last_keys = playerkeys[player:get_player_name()]
		for key,stat in pairs(player:get_player_control()) do
			if stat then
				if not last_keys[key] then
					for i = 1,np do
						on_key_presses[i](player, key)
					end
					last_keys[key] = true
				end
			elseif last_keys[key] then
				for i = 1,nr do
					on_key_releases[i](player, key)
				end
				last_keys[key] = false
			end
		end
	end
end)
 
core.register_on_joinplayer(function(player)
	playerkeys[player:get_player_name()] = {}
end)
