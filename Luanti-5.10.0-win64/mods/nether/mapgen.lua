--[[

  Nether mod for luanti

  "mapgen.lua" is the modern biomes-based Nether mapgen, which
    requires Luanti v5.1 or greater
  "mapgen_nobiomes.lua" is the legacy version of the mapgen, only used
    in older versions of Luanti or in v6 worlds.


  Copyright (C) 2013 PilzAdam

  Permission to use, copy, modify, and/or distribute this software for
  any purpose with or without fee is hereby granted, provided that the
  above copyright notice and this permission notice appear in all copies.

  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
  WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR
  BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES
  OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
  WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
  ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
  SOFTWARE.

]]--


-- Parameters

local NETHER_CEILING = nether.DEPTH_CEILING
local NETHER_FLOOR   = nether.DEPTH_FLOOR
local TCAVE = 0.6
local BLEND = 128

-- parameters for central region
local REGION_BUFFER_THICKNESS   = 0.2
local CENTER_REGION_LIMIT       = TCAVE - REGION_BUFFER_THICKNESS -- Netherrack gives way to Deep-Netherrack here
local CENTER_CAVERN_LIMIT       = CENTER_REGION_LIMIT - 0.1       -- Deep-Netherrack gives way to air here
local SURFACE_CRUST_LIMIT       = CENTER_CAVERN_LIMIT * 0.25      -- Crusted-lava at the surface of the lava ocean gives way to liquid lava here
local CRUST_LIMIT               = CENTER_CAVERN_LIMIT * 0.85      -- Crusted-lava under the surface of the lava ocean gives way to liquid lava here
local BASALT_COLUMN_UPPER_LIMIT = CENTER_CAVERN_LIMIT * 0.9       -- Basalt columns may appear between these upper and lower limits
local BASALT_COLUMN_LOWER_LIMIT = CENTER_CAVERN_LIMIT * 0.25      -- This value is close to SURFACE_CRUST_LIMIT so basalt columns give way to "flowing" lava rivers


-- Shared Nether mapgen namespace
-- For mapgen files to share functions and constants
local mapgen = nether.mapgen

mapgen.TCAVE                     = TCAVE                     -- const needed in mapgen_mantle.lua
mapgen.BLEND                     = BLEND                     -- const needed in mapgen_mantle.lua
mapgen.CENTER_REGION_LIMIT       = CENTER_REGION_LIMIT       -- const needed in mapgen_mantle.lua
mapgen.CENTER_CAVERN_LIMIT       = CENTER_CAVERN_LIMIT       -- const needed in mapgen_mantle.lua
mapgen.BASALT_COLUMN_UPPER_LIMIT = BASALT_COLUMN_UPPER_LIMIT -- const needed in mapgen_mantle.lua
mapgen.BASALT_COLUMN_LOWER_LIMIT = BASALT_COLUMN_LOWER_LIMIT -- const needed in mapgen_mantle.lua

mapgen.ore_ceiling = NETHER_CEILING - BLEND -- leave a solid 128 node cap of netherrack before introducing ores
mapgen.ore_floor   = NETHER_FLOOR   + BLEND

local debugf = nether.debug

if core.read_schematic == nil then
	-- Using biomes to create the Nether requires the ability for biomes to set "node_cave_liquid = air".
	-- This feature was introduced by paramat in b1b40fef1 on 2019-05-19, but we can't test for
	-- it directly. However b2065756c was merged a few months later (in 2019-08-14) and it is easy
	-- to directly test for - it adds core.read_schematic() - so we use this as a proxy-test
	-- for whether the Luanti engine is recent enough to have implemented node_cave_liquid=air
	error("This " .. nether.modname .. " mapgen requires Luanti v5.1 or greater, use mapgen_nobiomes.lua instead.", 0)
end

-- Load specialty helper functions
dofile(nether.path .. "/mapgen_dungeons.lua")
dofile(nether.path .. "/mapgen_mantle.lua")


-- Misc math functions

-- avoid needing table lookups each time a common math function is invoked
local math_max, math_min, math_abs, math_floor = math.max, math.min, math.abs, math.floor


-- default:cloud is used to prevent ores and decorations being generated according
-- to landforms created by the native mapgen.
-- Ores and decorations can be registered against "nether:rack" instead, and the lua
-- on_generate() callback will carve the Nether with nether:rack before invoking
-- generate_decorations and generate_ores.
core.register_biome({
	name = "nether_caverns",
	node_stone = "default:cloud", -- default:cloud is used here to prevent the native mapgen from placing ores and decorations.
	node_filler = "default:cloud", -- The lua on_generate will transform default:cloud into nether:rack then decorate and add ores.
	node_dungeon = "nether:brick",
	node_dungeon_alt = "nether:brick_cracked",
	node_dungeon_stair = "stairs:stair_nether_brick",
	-- Setting node_cave_liquid to "air" avoids the need to filter lava and water out of the mapchunk and
	-- surrounding shell (overdraw nodes beyond the mapchunk).
	-- This feature was introduced by paramat in b1b40fef1 on 2019-05-19, and this mapgen.lua file should only
	-- be run if the Luanti version includes it. The earliest tag made after 2019-05-19 is 5.1.0 on 2019-10-13,
	-- however we shouldn't test version numbers. core.read_schematic() was added by b2065756c and merged in
	-- 2019-08-14 and is easy to test for, we don't use it but it should make a good proxy-test for whether the
	-- Luanti version is recent enough to have implemented node_cave_liquid=air
	node_cave_liquid = "air",
	y_max = NETHER_CEILING,
	y_min = NETHER_FLOOR,
	vertical_blend = 0,
	heat_point = 50,
	humidity_point = 50,
})


-- Ores and decorations

core.register_ore({
	ore_type       = "stratum",
	ore            = "default:bedrock",
	wherein        = {"default:stone", "nether:rack"},
	clust_scarcity = 1,
	clust_num_ores = 1,
	clust_size     = 1,
	y_max          = NETHER_CEILING+1,
	y_min          = NETHER_CEILING-8,
})

dofile(nether.path .. "/mapgen_decorations.lua")

core.register_ore({
	ore_type       = "scatter",
	ore            = "nether:glowstone",
	wherein        = "nether:rack",
	clust_scarcity = 11 * 11 * 11,
	clust_num_ores = 3,
	clust_size     = 2,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "nether:lava_crust", -- crusted lava replaces scattered glowstone in the mantle
	wherein        = "nether:rack_deep",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 4,
	clust_size     = 2,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "default:lava_source",
	wherein        = {"nether:rack", "nether:rack_deep"},
	clust_scarcity = 36 * 36 * 36,
	clust_num_ores = 4,
	clust_size     = 2,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

core.register_ore({
	ore_type        = "blob",
	ore             = "nether:sand",
	wherein         = "nether:rack",
	clust_scarcity  = 14 * 14 * 14,
	clust_size      = 8,
	y_max = mapgen.ore_ceiling,
	y_min = mapgen.ore_floor
})

core.register_ore({--	Supposed to generate if "nodungeons" is set
	ore_type       = "scatter",
	ore            = "nether:hideout",
	wherein        = "nether:rack",
	clust_scarcity = 48 * 48 * 48,
	clust_num_ores = 1,
	clust_size     = 1,
	y_max = mapgen.ore_ceiling-31,
	y_min = mapgen.ore_floor+31
})

if core.get_modpath("hell") then
core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_coal",
	wherein        = {"nether:rack", "nether:rack_deep"},
	clust_scarcity = 12 * 12 * 12,
	clust_num_ores = 30,
	clust_size     = 5,
	y_max = mapgen.ore_floor+20,
	y_min = mapgen.ore_floor-127,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_diamond",
	wherein        = {"nether:rack", "nether:rack_deep"},
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 4,
	clust_size     = 3,
	y_max = mapgen.ore_floor+20,
	y_min = mapgen.ore_floor-127,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_mese",
	wherein        = {"nether:rack", "nether:rack_deep"},
	clust_scarcity = 28 * 28 * 28,
	clust_num_ores = 5,
	clust_size     = 3,
	y_max = mapgen.ore_floor+20,
	y_min = mapgen.ore_floor-127,
})

core.register_ore({
	ore_type        = "blob",
	ore             = "default:gravel",
	wherein         = {"nether:rack", "nether:rack_deep"},
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 5,
	y_max  = mapgen.ore_floor+20,
	y_min  = mapgen.ore_floor-127,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 766,
		octaves = 1,
		persist = 0.0
	},
})

core.register_ore({
	ore_type        = "blob",
	ore             = "nether:sand",
	wherein         = {"nether:rack", "nether:rack_deep"},
	clust_scarcity  = 14 * 14 * 14,
	clust_size      = 8,
	y_max = mapgen.ore_floor+20,
	y_min = mapgen.ore_floor-127,
})
end


-- Mapgen

-- 3D noise

mapgen.np_cave = {
	offset = 0,
	scale = 1,
	spread = {x = 384, y = 128, z = 384}, -- squashed 3:1
	seed = 59033,
	octaves = 5,
	persist = 0.7,
	lacunarity = 2.0,
	--flags = ""
}

local cavePointPerlin = nil

mapgen.get_cave_point_perlin = function()
	cavePointPerlin = cavePointPerlin or core.get_perlin(mapgen.np_cave)
	return cavePointPerlin
end

mapgen.get_cave_perlin_at = function(pos)
	cavePointPerlin = cavePointPerlin or core.get_perlin(mapgen.np_cave)
	return cavePointPerlin:get_3d(pos)
end


-- Buffers and objects we shouldn't recreate every on_generate

local nobj_cave = nil
local nbuf_cave = {}
local dbuf = {}


-- Content ids

local c_air              = core.get_content_id("air")
local c_netherrack       = core.get_content_id("nether:rack")
local c_netherrack_deep  = core.get_content_id("nether:rack_deep")
local c_lavasea_source   = core.get_content_id("nether:lava_source") -- same as lava but with staggered animation to look better as an ocean
local c_lava_crust       = core.get_content_id("nether:lava_crust")
local c_native_mapgen    = core.get_content_id("default:cloud")



local yblmin = NETHER_FLOOR   + BLEND * 2
local yblmax = NETHER_CEILING - BLEND * 2
-- At both the top and bottom of the Nether, as set by NETHER_CEILING and NETHER_FLOOR,
-- there is a 128 deep cap of solid netherrack, followed by a 128-deep blending zone
-- where Nether caverns may start to appear.
-- The solid zones and blending zones are achieved by adjusting the np_cave noise to be
-- outside the range where caverns form, this function returns that adjustment.
--
-- Returns two values: the noise limit adjustment for nether caverns, and the
-- noise limit adjustment for the central region / mantle caverns
mapgen.get_mapgenblend_adjustments = function(y)

	-- floorAndCeilingBlend will normally be 0, but shifts toward 1 in the
	-- blending zone, and goes higher than 1 in the solid zone between the
	-- blending zone and the end of the nether.
	local floorAndCeilingBlend = 0
	if y > yblmax then floorAndCeilingBlend = ((y - yblmax) / BLEND) ^ 2 end
	if y < yblmin then floorAndCeilingBlend = ((yblmin - y) / BLEND) ^ 2 end

	-- the nether caverns exist when np_cave noise is greater than TCAVE, so
	-- to fade out the nether caverns, adjust TCAVE upward.
	local tcave_adj               = floorAndCeilingBlend

	-- the central regions exists when np_cave noise is below CENTER_REGION_LIMIT,
	-- so to fade out the mantle caverns adjust CENTER_REGION_LIMIT downward.
	local centerRegionLimit_adj = -(CENTER_REGION_LIMIT * floorAndCeilingBlend)

	return tcave_adj, centerRegionLimit_adj
end



-- On-generated function

local tunnelCandidate_count = 0
local tunnel_count = 0
local total_chunk_count = 0
local function on_generated(minp, maxp, seed)

	if minp.y > NETHER_CEILING or maxp.y < NETHER_FLOOR then
		return
	end

	local vm, emerge_min, emerge_max = core.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emerge_min, MaxEdge=emerge_max}
	local data = vm:get_data(dbuf)

	local x0, y0, z0 = minp.x, math_max(minp.y, NETHER_FLOOR),   minp.z
	local x1, y1, z1 = maxp.x, math_min(maxp.y, NETHER_CEILING), maxp.z

	local yCaveStride = x1 - x0 + 1
	local zCaveStride = yCaveStride * yCaveStride
	local chulens = {x = yCaveStride, y = yCaveStride, z = yCaveStride}

	nobj_cave = nobj_cave or core.get_perlin_map(mapgen.np_cave, chulens)
	local nvals_cave = nobj_cave:get_3d_map_flat(minp, nbuf_cave)

	local dungeonRooms = mapgen.build_dungeon_room_list(data, area) -- function from mapgen_dungeons.lua
	local abs_cave_noise, abs_cave_noise_adjusted

	local contains_nether = false
	local contains_mantle = false
	local contains_ocean  = false


	for y = y0, y1 do -- Y loop first to minimise tcave & lava-sea calculations

		local sea_level, cavern_limit_distance = mapgen.find_nearest_lava_sealevel(y) -- function from mapgen_mantle.lua
		local above_lavasea = y > sea_level
		local below_lavasea = y < sea_level

		local tcave_adj, centerRegionLimit_adj = mapgen.get_mapgenblend_adjustments(y)
		local tcave   = TCAVE + tcave_adj
		local tmantle = CENTER_REGION_LIMIT + centerRegionLimit_adj -- cavern_noise_adj already contains central_region_limit_adj, so tmantle is only for comparisons when cavern_noise_adj hasn't been added to the noise value

		 -- cavern_noise_adj gets added to noise value instead of added to the limit np_noise
		 -- is compared against, so subtract centerRegionLimit_adj instead of adding
		local cavern_noise_adj =
			CENTER_REGION_LIMIT * (cavern_limit_distance * cavern_limit_distance * cavern_limit_distance) -
			centerRegionLimit_adj

		for z = z0, z1 do
			local vi = area:index(x0, y, z) -- Initial voxelmanip index
			local ni = (z - z0) * zCaveStride + (y - y0) * yCaveStride + 1
			local noise2di = 1 + (z - z0) * yCaveStride

			for x = x0, x1 do

				local cave_noise = nvals_cave[ni]

				if cave_noise > tcave then
					-- Prime region
					-- This was the only region in initial versions of the Nether mod.
					-- It is the only region which portals from the surface will open into.
					data[vi] = c_air
					contains_nether = true

				elseif -cave_noise > tcave then
					-- Secondary/spare region
					-- This secondary region is unused until someone decides to do something cool or novel with it.
					-- Reaching here would require the player to first find and journey through the central region,
					-- as it's always separated from the Prime region by the central region.

					data[vi] = c_netherrack -- For now I've just left this region as solid netherrack instead of air.

					-- Only set contains_nether to true here if you want tunnels created between the secondary region
					-- and the central region.
					--contains_nether = true
					--data[vi] = c_air
				else
					-- netherrack walls and/or center region/mantle
					abs_cave_noise = math_abs(cave_noise)

					-- abs_cave_noise_adjusted makes the center region smaller as distance from the lava ocean
					-- increases, we do this by pretending the abs_cave_noise value is higher.
					abs_cave_noise_adjusted = abs_cave_noise + cavern_noise_adj

					if abs_cave_noise_adjusted >= CENTER_CAVERN_LIMIT then

						local id = data[vi] -- Check existing node to avoid removing dungeons
						if id == c_air or id == c_native_mapgen then
							if abs_cave_noise < tmantle then
								data[vi] = c_netherrack_deep
							else
								-- the shell seperating the mantle from the rest of the nether...
								data[vi] = c_netherrack -- excavate_dungeons() will mostly reverse this inside dungeons
							end
						end

					elseif above_lavasea then
						data[vi] = c_air
						contains_mantle = true
					elseif abs_cave_noise_adjusted < SURFACE_CRUST_LIMIT or (below_lavasea and abs_cave_noise_adjusted < CRUST_LIMIT) then
						data[vi] = c_lavasea_source
						contains_ocean = true
					else
						data[vi] = c_lava_crust
						contains_ocean = true
					end
				end

				ni = ni + 1
				vi = vi + 1
				noise2di = noise2di + 1
			end
		end
	end

	if contains_mantle or contains_ocean then
		mapgen.add_basalt_columns(data, area, minp, maxp) -- function from mapgen_mantle.lua
	end

	if contains_nether and contains_mantle then
		tunnelCandidate_count = tunnelCandidate_count + 1
		local success = mapgen.excavate_tunnel_to_center_of_the_nether(data, area, nvals_cave, minp, maxp) -- function from mapgen_mantle.lua
		if success then tunnel_count = tunnel_count + 1 end
	end
	total_chunk_count = total_chunk_count + 1
	if total_chunk_count % 50 == 0 then
		debugf(
			"%s of %s chunks contain both nether and lava-sea (%s%%), %s chunks generated a pathway (%s%%)",
			tunnelCandidate_count,
			total_chunk_count,
			math_floor(tunnelCandidate_count * 100 / total_chunk_count),
			tunnel_count,
			math_floor(tunnel_count * 100 / total_chunk_count)
		)
	end

	-- any air from the native mapgen has been replaced by netherrack, but we
	-- don't want netherrack inside dungeons, so fill known dungeon rooms with air.
	mapgen.excavate_dungeons(data, area, dungeonRooms) -- function from mapgen_dungeons.lua
	mapgen.decorate_dungeons(data, area, dungeonRooms) -- function from mapgen_dungeons.lua

	vm:set_data(data)

	core.generate_ores(vm)
	core.generate_decorations(vm)

	vm:set_lighting({day = 0, night = 0}, minp, maxp)
	vm:calc_lighting()
	vm:update_liquids()
	vm:write_to_map()
end


-- use knowledge of the nether mapgen algorithm to return a suitable ground level for placing a portal.
-- player_name is optional, allowing a player to spawn a remote portal in their own protected areas.
function nether.find_nether_ground_y(target_x, target_z, start_y, player_name)
	local nobj_cave_point = mapgen.get_cave_point_perlin()
	local air = 0 -- Consecutive air nodes found

	local minp_schem, maxp_schem = nether.get_schematic_volume({x = target_x, y = 0, z = target_z}, nil, "nether_portal")
	local minp = {x = minp_schem.x, y = 0, z = minp_schem.z}
	local maxp = {x = maxp_schem.x, y = 0, z = maxp_schem.z}

	for y = start_y, math_max(NETHER_FLOOR + BLEND, start_y - 4096), -1 do
		local nval_cave = nobj_cave_point:get_3d({x = target_x, y = y, z = target_z})

		if nval_cave > TCAVE then -- Cavern
			air = air + 1
		else -- Not cavern, check if 4 nodes of space above
			if air >= 4 then
				local portal_y = y + 1
				-- Check volume for non-natural nodes
				minp.y = minp_schem.y + portal_y
				maxp.y = maxp_schem.y + portal_y
				if nether.volume_is_natural_and_unprotected(minp, maxp, player_name) then
					return portal_y
				else -- Restart search a little lower
					nether.find_nether_ground_y(target_x, target_z, y - 16, player_name)
				end
			else -- Not enough space, reset air to zero
				air = 0
			end
		end
	end

	return math_max(start_y, NETHER_FLOOR + BLEND) -- Fallback
end

core.register_on_generated(on_generated)
