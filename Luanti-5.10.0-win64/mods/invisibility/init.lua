
invisibility = {}

local effect_time = 180 -- 3 minutes
local hidden_names = nil


-- reset player invisibility if they go offline
core.register_on_leaveplayer(function(player)
	local name = player:get_player_name()

	if invisibility[name] then
		invisibility[name] = nil
	end
end)


-- invisibility function
function invisibility.invisible(player, toggle)
	if not player then return false end

	local name = player:get_player_name()

	invisibility[name] = toggle

	local prop

	if toggle == true then

		-- hide player and name tag
		prop = {
			visual_size = {x = 0, y = 0},
			pointable = false
		}

		player:set_nametag_attributes({
			color = {a = 0, r = 1, g = 1, b = 1}
		})
	else
		-- show player and tag
		prop = {
			visual_size = {x = 1, y = 1},
			pointable = true
		}

		if hidden_names ~= true then
			player:set_nametag_attributes({
				color = {a = 255, r = 255, g = 255, b = 255}
			})
		end
	end

	player:set_properties(prop)
end


-- invisibility potion
core.register_node("invisibility:potion", {
	description = "Invisibility Potion",
	drawtype = "plantlike",
	tiles = {"invisibility_potion.png"},
	inventory_image = "invisibility_potion.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(itemstack, user)
		local pos = user:get_pos()
		local name = user:get_player_name()

		-- are we already invisible?
		if invisibility[name] then

			core.chat_send_player(name,
				">>> You are already invisible!")

			return itemstack
		end

		-- make player invisible
		invisibility.invisible(user, true)

		-- play sound
		core.sound_play("pop", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5
		})

		-- display 10 second warning
		core.after(effect_time - 10, function()
			if invisibility[name]
			and user:get_pos() then

				core.chat_send_player(name,
					">>> You have 10 seconds before invisibility wears off!")
			end
		end)

		-- make player visible 5 minutes later
		core.after(effect_time, function()
			if invisibility[name]
			and user:get_pos() then

				-- show already hidden player
				invisibility.invisible(user, nil)

				-- play sound
				core.sound_play("pop", {
					pos = pos,
					gain = 1.0,
					max_hear_distance = 5
				})
			end
		end)

		-- take potion, return empty bottle (and rest of potion stack)
		if not core.is_creative_enabled(user:get_player_name()) then
			local item_count = user:get_wielded_item():get_count()
			local inv = user:get_inventory()
			local giving_back = "vessels:glass_bottle"

			if inv and item_count > 1 then
				if inv:room_for_item("main", {name = "vessels:glass_bottle"}) then

					inv:add_item("main", {name = "vessels:glass_bottle"})
				else
					pos.y = pos.y + 1

					core.add_item(pos, {name = "vessels:glass_bottle"})
				end

				giving_back = "invisibility:potion " .. tostring(item_count - 1)
			end

			return ItemStack(giving_back)
		end
	end,
})


-- craft recipe
core.register_craft({
	output = "invisibility:potion",
	type = "shapeless",
	recipe = {"default:sapling", "default:jungle_sapling",
		"default:pine_sapling", "default:acacia_sapling",
		"default:aspen_sapling", "default:bush_sapling",
		"default:acacia_bush_sapling",
		"vessels:glass_bottle", "flowers:mushroom_red"},
})


-- vanish command (admin only)
core.register_chatcommand("vanish", {
	params = "<name>",
	description = "Make player invisible",
	privs = {server = true},
	func = function(name, param)
		-- player online
		if param ~= ""
		and core.get_player_by_name(param) then

			name = param

		-- player not online
		elseif param ~= "" then

			return false, "Player " .. param .. " is not online!"
		end

		local player = core.get_player_by_name(name)

		-- hide / show player
		if invisibility[name] then
			invisibility.invisible(player, nil)
		else
			invisibility.invisible(player, true)
		end

	end
})

core.register_chatcommand("hidenames", {
	description = "Make all nametags invisible",
	privs = {server = true},
	func = function(name, param)
		for _, player in pairs(core.get_connected_players()) do
			player:set_nametag_attributes({color = {a = 0, r = 1, g = 1, b = 1}})
		end
		hidden_names = true
	end
})

core.register_chatcommand("shownames", {
	description = "Make all nametags visible",
	privs = {server = true},
	func = function(name, param)
		for _, player in pairs(core.get_connected_players()) do
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 255}})
		end
		hidden_names = nil
	end
})
