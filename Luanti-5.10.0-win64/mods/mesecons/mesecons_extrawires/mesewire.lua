local mesewire_rules = {
	{x = 1, y = 0, z = 0},
	{x =-1, y = 0, z = 0},
	{x = 0, y = 1, z = 0},
	{x = 0, y =-1, z = 0},
	{x = 0, y = 0, z = 1},
	{x = 0, y = 0, z =-1},
}

if core.registered_nodes["default:mese"] then
core.override_item("default:mese", {
	mesecons = {conductor = {
		state = mesecon.state.off,
		onstate = "mesecons_extrawires:mese_powered",
		rules = mesewire_rules
	}}
})

core.register_node("mesecons_extrawires:mese_powered", {
	description = "Mese Block",
	tiles = {"default_mese_block.png^[colorize:white:50"},
	paramtype = "light",
	light_source = 5,
	drop = "default:mese",
	groups = {cracky = 1, level = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults(),
	on_blast = mesecon.on_blastnode,
	mesecons = {conductor = {
		state = mesecon.state.on,
		offstate = "default:mese",
		rules = mesewire_rules
	}}
})
end

if core.registered_nodes["solarie:wood"] then
core.override_item("solarie:wood", {
	mesecons = {conductor = {
		state = mesecon.state.off,
		onstate = "mesecons_extrawires:solarie_wood_powered",
		rules = mesewire_rules
	}}
})

core.register_node("mesecons_extrawires:solarie_wood_powered", {
	description = "Solarie Wood",
	tiles = {"solarie_wood.png^[colorize:white:20"},
	drop = "solarie:wood",
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
	on_blast = mesecon.on_blastnode,
	mesecons = {conductor = {
		state = mesecon.state.on,
		offstate = "solarie:wood",
		rules = mesewire_rules
	}}
})
end
