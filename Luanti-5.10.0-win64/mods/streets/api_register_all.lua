
local register_surface_nodes = function(friendlyname, name, tiles, groups, sounds, craft)
	core.register_node(":streets:" .. name, {
		description = friendlyname,
		tiles = tiles,
		groups = groups,
		sounds = sounds
	})
	core.register_craft(craft)
	if core.get_modpath("moreblocks") then
		stairsplus:register_all("streets", name, "streets:" .. name, {
			description = friendlyname,
			tiles = tiles,
			groups = groups,
			sounds = sounds
		})
	end
stairs.register_stair_and_slab(name, "streets:" ..name,
	groups, tiles,
	friendlyname.." Stair", friendlyname.." Slab", sounds, true)
end

if streets.surfaces.surfacetypes then
	for _, v in pairs(streets.surfaces.surfacetypes) do
		register_surface_nodes(v.friendlyname, v.name, v.tiles, v.groups, v.sounds, v.craft)
	end
end
