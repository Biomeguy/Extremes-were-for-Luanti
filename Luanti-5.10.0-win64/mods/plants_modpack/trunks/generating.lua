-- Code by Mossmanikin, Neuromancer, and others

-- TWiGS
abstract_trunks.place_twig = function(pos)
	local twig_size		= math.random(1,27)

	local right_here	= {x=pos.x  , y=pos.y+1, z=pos.z  }
	local north			= {x=pos.x  , y=pos.y+1, z=pos.z+1}
	local north_east	= {x=pos.x+1, y=pos.y+1, z=pos.z+1}
	local east			= {x=pos.x+1, y=pos.y+1, z=pos.z  }
	local south_east	= {x=pos.x+1, y=pos.y+1, z=pos.z-1}
	local south			= {x=pos.x  , y=pos.y+1, z=pos.z-1}
	local south_west	= {x=pos.x-1, y=pos.y+1, z=pos.z-1}
	local west			= {x=pos.x-1, y=pos.y+1, z=pos.z  }
	local north_west	= {x=pos.x-1, y=pos.y+1, z=pos.z+1}

	local node_here		= core.get_node(right_here)
	local node_north	= core.get_node(north)
	local node_n_e		= core.get_node(north_east)
	local node_east		= core.get_node(east)
	local node_s_e		= core.get_node(south_east)
	local node_south	= core.get_node(south)
	local node_s_w		= core.get_node(south_west)
	local node_west		= core.get_node(west)
	local node_n_w		= core.get_node(north_west)
--	small twigs
	if twig_size <= 16 then
		core.swap_node(right_here, {name="trunks:twig_"..math.random(1,4), param2=math.random(0,3)})
	end
--	big twigs
	if Big_Twigs == true then
--	big twig 1
if twig_size == 17 then
	if not (core.registered_nodes[core.get_node({x=pos.x+1,y=pos.y,z=pos.z+1}).name].buildable_to
		or core.registered_nodes[core.get_node({x=pos.x+1,y=pos.y,z=pos.z}).name].buildable_to) then

		if core.registered_nodes[node_here.name].buildable_to then
			core.swap_node(right_here, {name="trunks:twig_5"})
		end
		if core.registered_nodes[node_n_e.name].buildable_to then
			core.swap_node(north_east, {name="trunks:twig_7"})
		end
		if core.registered_nodes[node_east.name].buildable_to then
			core.swap_node(east, {name="trunks:twig_8"})
		end
	end
elseif twig_size == 18 then
	if not (core.registered_nodes[core.get_node({x=pos.x+1,y=pos.y,z=pos.z-1}).name].buildable_to
		or core.registered_nodes[core.get_node({x=pos.x,y=pos.y,z=pos.z-1}).name].buildable_to) then

		if core.registered_nodes[node_here.name].buildable_to then
			core.swap_node(right_here, {name="trunks:twig_5", param2=1})
		end
		if core.registered_nodes[node_s_e.name].buildable_to then
			core.swap_node(south_east, {name="trunks:twig_7", param2=1})
		end
		if core.registered_nodes[node_south.name].buildable_to then
			core.swap_node(south, {name="trunks:twig_8", param2=1})
		end
	end
elseif twig_size == 19 then
	if not (core.registered_nodes[core.get_node({x=pos.x+1,y=pos.y,z=pos.z-1}).name].buildable_to
		or core.registered_nodes[core.get_node({x=pos.x-1,y=pos.y,z=pos.z}).name].buildable_to) then

		if core.registered_nodes[node_here.name].buildable_to then
			core.swap_node(right_here, {name="trunks:twig_5", param2=2})
		end
		if core.registered_nodes[node_s_w.name].buildable_to then
			core.swap_node(south_west, {name="trunks:twig_7", param2=2})
		end
		if core.registered_nodes[node_west.name].buildable_to then
			core.swap_node(west, {name="trunks:twig_8", param2=2})
		end
	end
elseif twig_size == 20 then
	if not (core.registered_nodes[core.get_node({x=pos.x-1,y=pos.y,z=pos.z+1}).name].buildable_to
		or core.registered_nodes[core.get_node({x=pos.x,y=pos.y,z=pos.z+1}).name].buildable_to) then

		if core.registered_nodes[node_here.name].buildable_to then
			core.swap_node(right_here, {name="trunks:twig_5", param2=3})
		end
		if core.registered_nodes[node_n_w.name].buildable_to then
			core.swap_node(north_west, {name="trunks:twig_7", param2=3})
		end
		if core.registered_nodes[node_north.name].buildable_to then
			core.swap_node(north, {name="trunks:twig_8", param2=3})
		end
	end
--	big twig 2
elseif twig_size == 21 then
	if not (core.registered_nodes[core.get_node({x=pos.x,y=pos.y,z=pos.z+1}).name].buildable_to
		or core.registered_nodes[core.get_node({x=pos.x+1,y=pos.y,z=pos.z+1}).name].buildable_to) then

		if core.registered_nodes[node_here.name].buildable_to then
			core.swap_node(right_here, {name="trunks:twig_9"})
		end
		if core.registered_nodes[node_north.name].buildable_to then
			core.swap_node(north, {name="trunks:twig_10"})
		end
		if core.registered_nodes[node_n_e.name].buildable_to then
			core.swap_node(north_east, {name="trunks:twig_11"})
		end
	end
elseif twig_size == 22 then
	if not (core.registered_nodes[core.get_node({x=pos.x+1,y=pos.y,z=pos.z}).name].buildable_to
		or core.registered_nodes[core.get_node({x=pos.x+1,y=pos.y,z=pos.z-1}).name].buildable_to) then

		if core.registered_nodes[node_here.name].buildable_to then
			core.swap_node(right_here, {name="trunks:twig_9", param2=1})
		end
		if core.registered_nodes[node_east.name].buildable_to then
			core.swap_node(east, {name="trunks:twig_10", param2=1})
		end
		if core.registered_nodes[node_s_e.name].buildable_to then
			core.swap_node(south_east, {name="trunks:twig_11", param2=1})
		end
	end
elseif twig_size == 23 then
	if not (core.registered_nodes[core.get_node({x=pos.x,y=pos.y,z=pos.z-1}).name].buildable_to
		or core.registered_nodes[core.get_node({x=pos.x-1,y=pos.y,z=pos.z-1}).name].buildable_to) then

		if core.registered_nodes[node_here.name].buildable_to then
			core.swap_node(right_here, {name="trunks:twig_9", param2=2})
		end
		if core.registered_nodes[node_south.name].buildable_to then
			core.swap_node(south, {name="trunks:twig_10", param2=2})
		end
		if core.registered_nodes[node_s_w.name].buildable_to then
			core.swap_node(south_west, {name="trunks:twig_11", param2=2})
		end
	end
elseif twig_size == 24 then
	if not (core.registered_nodes[core.get_node({x=pos.x-1,y=pos.y,z=pos.z}).name].buildable_to
		or core.registered_nodes[core.get_node({x=pos.x-1,y=pos.y,z=pos.z+1}).name].buildable_to) then

		if core.registered_nodes[node_here.name].buildable_to then
			core.swap_node(right_here, {name="trunks:twig_9", param2=3})
		end
		if core.registered_nodes[node_west.name].buildable_to then
			core.swap_node(west, {name="trunks:twig_10", param2=3})
		end
		if core.registered_nodes[node_n_w.name].buildable_to then
			core.swap_node(north_west, {name="trunks:twig_11", param2=3})
		end
	end
elseif twig_size <= 25 then
	core.swap_node(right_here, {name="trunks:twig_"..math.random(12,13), param2=math.random(0,3)})
end
	end
end

if Twigs_on_ground == true then
biome_lib:register_generate_plant({
    surface = {"default:dirt_with_grass"},
    max_count = Twigs_on_ground_Max_Count,
    rarity = Twigs_on_ground_Rarity,
    min_elevation = 1,
	max_elevation = 40,
	near_nodes = {"group:trunk","default:fern_3","default:fern_2","default:fern_1"},
	near_nodes_size = 3,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  abstract_trunks.place_twig
)
end

if Twigs_on_water == true then
biome_lib:register_generate_plant({
    surface = {"default:water_source"},
    max_count = Twigs_on_water_Max_Count,
    rarity = Twigs_on_water_Rarity,
    min_elevation = 1,
	max_elevation = 40,
	near_nodes = {"group:trunk"},
	near_nodes_size = 3,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  abstract_trunks.place_twig
)
end

-- TRuNKS
local TRuNKS = {
--	  MoD				TRuNK					NR
    {"default",			"apple_trunk",			2},
    {"default",			"beech_trunk",			1},
    {"default",			"birch_trunk",			4},
	{"default",			"jungle_trunk",			3},
	{"default",			"pine_trunk",			5},

	{"fir",				"trunk",				6},
	{"black_oak",		"trunk",				7},
	{"black_spruce",	"trunk",				8},
	{"sequoia",			"trunk",				9},
	{"black_willow",	"trunk",				10},
}

abstract_trunks.place_trunk = function(pos)

	local right_here = {x=pos.x, y=pos.y+1, z=pos.z}
	local north = {x=pos.x, y=pos.y+1, z=pos.z+1}
	local north2 = {x=pos.x, y=pos.y+1, z=pos.z+2}
	local south = {x=pos.x, y=pos.y+1, z=pos.z-1}
	local south2 = {x=pos.x, y=pos.y+1, z=pos.z-2}
	local west = {x=pos.x-1, y=pos.y+1, z=pos.z}
	local west2 = {x=pos.x-2, y=pos.y+1, z=pos.z}
	local east = {x=pos.x+1, y=pos.y+1, z=pos.z}
	local east2 = {x=pos.x+2, y=pos.y+1, z=pos.z}

	local node_here = core.get_node(right_here)
	local node_north = core.get_node(north)
	local node_north2 = core.get_node(north2)
	local node_south = core.get_node(south)
	local node_south2 = core.get_node(south2)
	local node_west = core.get_node(west)
	local node_west2 = core.get_node(west2)
	local node_east = core.get_node(east)
	local node_east2 = core.get_node(east2)
	if core.registered_nodes[node_here.name].buildable_to then -- instead of check_air = true,
		for i in pairs(TRuNKS) do
			local	MoD =			TRuNKS[i][1]
			local	TRuNK =			TRuNKS[i][2]
			local	NR =			TRuNKS[i][3]
			local	chance =		math.random(1, 17)
			local	length =		math.random(3,5)
			if chance == NR then
				local trunk_type = math.random(1,3)
				if trunk_type == 1 then
					if core.get_modpath(MoD) then
						core.swap_node(right_here, {name=MoD..":"..TRuNK})
					else
						core.swap_node(right_here, {name="default:beech_trunk"})
					end
				elseif trunk_type == 2 and Horizontal_Trunks == true then
					if core.get_modpath(MoD) then
						if core.registered_nodes[node_north.name].buildable_to then
							core.swap_node(north, {name=MoD..":"..TRuNK, param2=4})
						end

						if length >= 4 and core.registered_nodes[node_north2.name].buildable_to then
							core.swap_node(north2, {name=MoD..":"..TRuNK, param2=4})
						end

						core.swap_node(right_here, {name=MoD..":"..TRuNK, param2=4})
						if core.registered_nodes[node_south.name].buildable_to then
							core.swap_node(south, {name=MoD..":"..TRuNK, param2=4})
						end
						if length == 5 and core.registered_nodes[node_south2.name].buildable_to then
							core.swap_node(south2, {name=MoD..":"..TRuNK, param2=4})
						end
					else
						if core.registered_nodes[node_north.name].buildable_to then
							core.swap_node(north, {name="default:beech_trunk", param2=4})
						end
						if length >= 4 and core.registered_nodes[node_north2.name].buildable_to then
							core.swap_node(north2, {name="default:beech_trunk", param2=4})
						end
						core.swap_node(right_here, {name="default:beech_trunk", param2=4})
						if core.registered_nodes[node_south.name].buildable_to then
							core.swap_node(south, {name="default:beech_trunk", param2=4})
						end
						if length == 5 and core.registered_nodes[node_south2.name].buildable_to then
							core.swap_node(south2, {name="default:beech_trunk", param2=4})
						end
					end
				elseif trunk_type == 3 and Horizontal_Trunks == true then
					if core.get_modpath(MoD) then
						if core.registered_nodes[node_west.name].buildable_to then
							core.swap_node(west, {name=MoD..":"..TRuNK, param2=12})
						end
						if length >= 4 and core.registered_nodes[node_west2.name].buildable_to then
							core.swap_node(west2, {name=MoD..":"..TRuNK, param2=12})
						end
						core.swap_node(right_here, {name=MoD..":"..TRuNK, param2=12})
						if core.registered_nodes[node_east.name].buildable_to then
							core.swap_node(east, {name=MoD..":"..TRuNK, param2=12})
						end
						if length == 5 and core.registered_nodes[node_east2.name].buildable_to then
							core.swap_node(east2, {name=MoD..":"..TRuNK, param2=12})
						end
					else
						if core.registered_nodes[node_west.name].buildable_to then
							core.swap_node(west, {name="default:beech_trunk", param2=12})
						end
						if length >= 4 and core.registered_nodes[node_west2.name].buildable_to then
							core.swap_node(west2, {name="default:beech_trunk", param2=12})
						end
						core.swap_node(right_here, {name="default:beech_trunk", param2=12})
						if core.registered_nodes[node_east.name].buildable_to then
							core.swap_node(east, {name="default:beech_trunk", param2=12})
						end
						if length == 5 and core.registered_nodes[node_east2.name].buildable_to then
							core.swap_node(east2, {name="default:beech_trunk", param2=12})
						end
					end
				end
			end
		end
	end
end

biome_lib:register_generate_plant({
    surface = {"default:dirt_with_grass"},
    max_count = Trunks_Max_Count, -- 320,
    rarity = Trunks_Rarity, -- 99,
    min_elevation = 1,
	max_elevation = 40,
	avoid_nodes = {"group:trunk"},
	avoid_radius = 1,
	near_nodes = {"group:trunk","default:fern_3","default:fern_2","default:fern_1"},
	near_nodes_size = 3,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
  },
  abstract_trunks.place_trunk
)

local mg_name = core.get_mapgen_setting("mg_name")

if mg_name ~= "v6" and mg_name ~= "singlenode" then

	core.register_decoration({
		deco_type = "simple",
		place_on = {"group:soil", "group:trunk", "group:stone"},
		sidelen = 16,
		fill_ratio = .06,
		biomes = {"coniferous_forest", "deciduous_forest", "subtropical_forest", "swamp", "rainforest"},
		y_max = 109,
		y_min = 1,
		decoration = {"trunks:moss", "trunks:moss", "trunks:moss_fungus", "trunks:moss"},
		spawn_by = "group:trunk",
		num_spawn_by = 1,
		param2 = 1,
	})

end
