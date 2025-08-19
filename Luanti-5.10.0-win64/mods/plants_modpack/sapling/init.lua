-- support for i18n
local S = core.get_translator("sapling")

abstract_sapling = {}

core.register_node("sapling:sapling_top", {
	description = S("Sapling (top)"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"sapling16xa.png"},
	inventory_image = "sapling16xa.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .5, .3}
	},
	groups = {snappy=3,flammable=2},
	sounds = default.node_sound_leaves_defaults(),
	drop = "trunks:twig_1"
})

core.register_node("sapling:sapling_middle", {
	description = S("Sapling (middle)"),
	drawtype = "plantlike",
	tiles = {"sapling16xb.png"},
	inventory_image = "sapling16xb.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .5, .3}
	},
	groups = {snappy=3,flammable=2},
	sounds = default.node_sound_leaves_defaults(),
	drop = "trunks:twig_1"
})

core.register_node("sapling:sapling_bottom", {
	description = S("Sapling (bottom)"),
	drawtype = "plantlike",
	tiles = {"sapling16xc.png"},
	inventory_image = "sapling16xc.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-.3, -.5, -.3, .3, .5, .3}
	},
	groups = {snappy=3,flammable=2},
	sounds = default.node_sound_leaves_defaults(),
	drop = "trunks:twig_1"
})


abstract_sapling.grow_sapling_node = function(pos, height)
	local pos1 = {x=pos.x, y=pos.y+1, z=pos.z}
	local pos2 = {x=pos.x, y=pos.y+2, z=pos.z}

	if core.get_node(pos1).name == "air"  -- instead of check_air = true,
	or core.get_node(pos1).name == "default:jungle_grass_1" then
		if height == 1 then
			core.swap_node(pos1, {name="sapling:sapling_top"})
		end
		if height == 2 then
			core.swap_node(pos1, {name="sapling:sapling_bottom"})
			core.swap_node(pos2, {name="sapling:sapling_top"})
		end
		if height == 3 then
			local pos3 = {x=pos.x, y=pos.y+3, z=pos.z}
			core.swap_node(pos1, {name="sapling:sapling_bottom"})
			core.swap_node(pos2, {name="sapling:sapling_middle"})
			core.swap_node(pos3, {name="sapling:sapling_top"})
		end
	end
end

abstract_sapling.grow_sapling = function(pos)
	local height = math.random(1,3)
	abstract_sapling.grow_sapling_node(pos,height)
end

biome_lib:register_generate_plant({
    surface = {"default:dirt_with_grass"},
    max_count = 55,  --10,15
    rarity = 101 - 4,  --3,4
    min_elevation = 1, -- above sea level
	plantlife_limit = -0.9,
  },
  abstract_sapling.grow_sapling
)
