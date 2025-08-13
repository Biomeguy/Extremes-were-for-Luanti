-- SETTINGS
function mesecon.setting(setting, default)
	if type(default) == "boolean" then
		local read = core.settings:get_bool("mesecon."..setting)
		if read == nil then
			return default
		else
			return read
		end
	elseif type(default) == "string" then
		return core.settings:get("mesecon."..setting) or default
	elseif type(default) == "number" then
		return tonumber(core.settings:get("mesecon."..setting) or default)
	end
end
