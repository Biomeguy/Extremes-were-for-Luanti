
function streets.copytable(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in next, orig, nil do
			copy[streets.copytable(orig_key)] = streets.copytable(orig_value)
		end
		setmetatable(copy, streets.copytable(getmetatable(orig)))
	else
		copy = orig
	end
	return copy
end

function streets.register_road_surface(data)
	streets.surfaces.surfacetypes["streets:" .. data.name] = data
end
