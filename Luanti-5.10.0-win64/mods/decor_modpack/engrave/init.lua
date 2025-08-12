-- (c) 2017 orwell96

core.register_privilege("engrave_long_names", "When using the Engraving Table, Player can set names that contain more than 40 characters and/or newlines")

core.register_node("engrave:table", {
	description = "Engraving Table",
	tiles = {"engrave_top.png", "engrave_wood.png", "engrave_wood.png^engrave_side.png"},
	groups = {choppy=2, oddly_breakable_by_hand=2, flammable=3},
	sounds = default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, item)
		local pname = clicker:get_player_name()
		if item:get_count() ==0 then
			core.chat_send_player(pname, "Please wield the item you want to name, and then click the engraving table again.")
			return
		end
		local idef = core.registered_items[item:get_name()]
		if not idef then
			core.chat_send_player(pname, "You can't name an unknown item!")
			return
		end
		local name = idef.description or item:get_name()
		local what = name or "whatever"
		if item:get_count() >1 then
			what = "stack of ".. what
		end
		
		local meta = item:get_meta()
		if meta then
			local metaname = meta:get_string("description")
			if metaname ~="" then
				name= metaname
			end
		end
		local fieldtype = "field"
		if core.check_player_privs(pname, {engrave_long_names=true}) then
			fieldtype = "textarea"
		end
core.show_formspec(pname, "engrave", "size[5.5,2.5]".. fieldtype .."[0.5,0.5;5,1;name;Enter a new name for this ".. what ..";".. name .."]button_exit[1,1.5;3,1;ok;OK]")
	end,
})

core.register_on_player_receive_fields(function(player, formname, fields)
	if formname =="engrave" and fields.name and fields.ok then
		local pname = player:get_player_name()
		if (#fields.name >40 or string.match(fields.name, "\n", nil, true)) and not core.check_player_privs(pname, {engrave_long_names=true}) then
core.chat_send_player(pname, "Insufficient Privileges: Item names that are longer than 40 characters and/or contain newlines require the 'engrave_long_names' privilege")
			return
		end
		
		local stack = player:get_wielded_item()
		if stack:get_count()==0 then
			core.chat_send_player(pname, "Please wield the item you want to name, and then click the engraving table again.")
			return
		end
		local idef = core.registered_items[stack:get_name()]
		if not idef then
			core.chat_send_player(pname, "You can't name an unknown item!")
			return
		end
		local name = idef.description or stack:get_name()
		
		local meta = stack:get_meta()
		if not meta then
			core.chat_send_player(pname, "For some reason, the stack metadata couldn't be acquired. Try again!")
			return
		end
		
		if fields.name == name then
			meta:set_string("description", "")
		else
			meta:set_string("description", fields.name)
		end
		--write back
		player:set_wielded_item(stack)
	end
end)

core.register_craft({
	output = "engrave:table",
	recipe = {
		{"", "default:diamond", "dye:black"},
		{"default:ocealite_crystal", "fabric:sheet_white", "default:ocealite_crystal"},
		{"", "group:wood", ""}
	}
})
