core.register_chatcommand("sendthis", {
	params = "<player>",
	description = "Sends what you are currently holding to the receiver's inventory.",
	privs = {},
	func = function(name, param)
		local sender = core.get_player_by_name(name)
		local receiver = core.get_player_by_name(param)
		if not receiver then
			return false, "\""..param.."\" is not a valid player."
		end

		if name == param then
			return false, "You cannot send items to yourself."
		end

		local sendstack = sender:get_wielded_item()
		if sendstack:is_empty() then
			return false, "You must be holding what you wish to send."
		end
		local sendstackname = sendstack:get_name()
		local sendstackcount = sendstack:get_count()
		local stackstring = sendstackname.." "..sendstackcount

		local leftover = receiver:get_inventory():add_item("main", sendstack)
		sender:set_wielded_item(leftover)

		local partiality = ""
		if leftover:is_empty() then
			partiality = ""
		elseif leftover:get_count() == sendstack:get_count() then
			partiality = "could not be "
		else
			partiality = "partially "
		end
		core.log("action", ("%s %ssent to %s from %s"):format(stackstring, partiality, param, name))
		core.chat_send_player(param, ("%q %ssent to inventory from player %s."):format(stackstring, partiality, name))
		return true, ("%q %ssent to %s."):format(stackstring, partiality, param)
	end,
})

core.register_privilege("invasion", {
	description = "Can use /dupthis",
	give_to_singleplayer = false,
	give_to_admin = true,
})

core.register_chatcommand("dupthis", {
	description = "Duplicates what you are currently holding to the left if empty.",
	privs = {invasion=true},
	func = function(name)
		local wielder = core.get_player_by_name(name)

		local dupstack = wielder:get_wielded_item()
		if dupstack:is_empty() then
			return false, "You must be holding what you wish to duplicate."
		end

		local leftpos = wielder:get_wield_index()-1
		if not wielder:get_inventory():get_stack("main", leftpos):is_empty() then
			return false, "The left space of what you are holding must be empty."
		end

		wielder:get_inventory():set_stack("main", leftpos, dupstack)

		return true
	end,
})