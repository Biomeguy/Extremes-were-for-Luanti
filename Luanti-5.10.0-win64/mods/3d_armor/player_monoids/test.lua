
local speed = player_monoids.speed

core.register_privilege("monoid_master", {
	description = "Allows testing of player monoids.",
	give_to_singleplayer = false,
})

local function test(player)
	local ch_id = speed:add_change(player, 10)
	local p_name = player:get_player_name()

	core.chat_send_player(p_name, "Your speed is: " .. speed:value(player))

	core.after(3, function()
		speed:del_change(player, ch_id)
		core.chat_send_player(p_name, "Your speed is: " .. speed:value(player))
	end)
end

core.register_chatcommand("test_monoids", {
	description = "Runs a test on monoids",
	privs = { monoid_master = true },
	func = function(p_name)
		test(core.get_player_by_name(p_name))
	end,
})
