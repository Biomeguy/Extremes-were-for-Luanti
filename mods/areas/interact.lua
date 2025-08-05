local S = core.get_translator("areas")

local old_is_protected = core.is_protected
function core.is_protected(pos, name)
	if not areas:canInteract(pos, name) then
		return true
	end
	return old_is_protected(pos, name)
end

core.register_on_protection_violation(function(pos, name)
	if not areas:canInteract(pos, name) then
		local owners = areas:getNodeOwners(pos)
		core.chat_send_player(name,
			S("@1 is protected by @2.",
				core.pos_to_string(pos),
				table.concat(owners, ", ")))
	end
end)
