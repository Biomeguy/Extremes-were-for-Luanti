local S = technic.getter

if core.registered_nodes["default:furnace"].description == "Furnace" then
	core.override_item("default:furnace", { description = S("Fuel-Fired Furnace") })
end
