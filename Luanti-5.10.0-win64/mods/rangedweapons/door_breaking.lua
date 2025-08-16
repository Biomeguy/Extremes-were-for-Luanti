

if core.get_modpath("doors") then

core.override_item("doors:door_wood_a", {
	on_timer = function(pos)
		core.swap_node(pos, {name = "air"})
		core.add_item(pos, "default:wood 5")
		core.sound_play("rangedweapons_woodbreak",{pos})
	end,
})

core.override_item("doors:door_wood_b", {
	on_timer = function(pos)
		core.swap_node(pos, {name = "air"})
		core.add_item(pos, "default:wood 5")
		core.sound_play("rangedweapons_woodbreak",{pos})
	end,
})

end
