-- caverealms v.0.8 by HeroOfTheWinds
-- original cave code modified from paramat's subterrain
-- For Minetest 0.4.8 stable
-- Depends default
-- License: code WTFPL


caverealms = {} --create a container for functions and constants

--grab a shorthand for the filepath of the mod
local modpath = core.get_modpath(core.get_current_modname())

--load companion lua files
dofile(modpath.."/config.lua") --configuration file; holds various constants
dofile(modpath.."/crafting.lua")
dofile(modpath.."/nodes.lua")

local H_LAG = caverealms.config.h_lag --15 --max height for stalagmites
local H_LAC = caverealms.config.h_lac --20 --...stalactites
local H_CRY = caverealms.config.h_cry --9 --max height of glow crystals
local H_CLAC = caverealms.config.h_clac --13 --max height of glow crystal stalactites

function caverealms:above_solid(x,y,z,area,data)
	local c_air = core.get_content_id("air")

	local ai = area:index(x,y+1,z-3)
	if data[ai] == c_air then
		return false
	else
		return true
	end
end

function caverealms:below_solid(x,y,z,area,data)
	local c_air = core.get_content_id("air")

	local ai = area:index(x,y-1,z-3)
	if data[ai] == c_air then
		return false
	else
		return true
	end
end

--stalagmite spawner
function caverealms:stalagmite(x,y,z, area, data)

	if not caverealms:below_solid(x,y,z,area,data) then
		return
	end
	
	--contest ids
	local c_stone = core.get_content_id("default:stone")

	local top = math.random(6,H_LAG) --grab a random height for the stalagmite
	for j = 0, top do --y
		for k = -3, 3 do
			for l = -3, 3 do
				if j == 0 then
					if k*k + l*l <= 9 then
						local vi = area:index(x+k, y+j, z+l-3)
						data[vi] = c_stone
					end
				elseif j <= top/5 then
					if k*k + l*l <= 4 then
						local vi = area:index(x+k, y+j, z+l-3)
						data[vi] = c_stone
					end
				elseif j <= top/5 * 3 then
					if k*k + l*l <= 1 then
						local vi = area:index(x+k, y+j, z+l-3)
						data[vi] = c_stone
					end
				else
					local vi = area:index(x, y+j, z-3)
					data[vi] = c_stone
				end
			end
		end
	end
end

--stalactite spawner
function caverealms:stalactite(x,y,z, area, data)

	if not caverealms:above_solid(x,y,z,area,data) then
		return
	end

	--contest ids
	local c_stone = core.get_content_id("default:stone")--("caverealms:limestone")

	local bot = math.random(-H_LAC, -6) --grab a random height for the stalagmite
	for j = bot, 0 do --y
		for k = -3, 3 do
			for l = -3, 3 do
				if j >= -1 then
					if k*k + l*l <= 9 then
						local vi = area:index(x+k, y+j, z+l-3)
						data[vi] = c_stone
					end
				elseif j >= bot/5 then
					if k*k + l*l <= 4 then
						local vi = area:index(x+k, y+j, z+l-3)
						data[vi] = c_stone
					end
				elseif j >= bot/5 * 3 then
					if k*k + l*l <= 1 then
						local vi = area:index(x+k, y+j, z+l-3)
						data[vi] = c_stone
					end
				else
					local vi = area:index(x, y+j, z-3)
					data[vi] = c_stone
				end
			end
		end
	end
end

--glowing crystal stalagmite spawner
function caverealms:crystal_stalagmite(x,y,z, area, data, biome)

	if not caverealms:below_solid(x,y,z,area,data) then
		return
	end
	
	--contest ids
	local c_stone = core.get_content_id("default:stone")
	local c_crystal = core.get_content_id("caverealms:glow_crystal")
	local c_crystore = core.get_content_id("caverealms:glow_ore")
	local c_emerald = core.get_content_id("caverealms:glow_emerald")
	local c_emore = core.get_content_id("caverealms:glow_emerald_ore")
	local c_mesecry = core.get_content_id("caverealms:glow_mese")
	local c_meseore = core.get_content_id("default:stone_with_mese")
	local c_ruby = core.get_content_id("caverealms:glow_ruby")
	local c_rubore = core.get_content_id("caverealms:glow_ruby_ore")
	local c_ameth = core.get_content_id("caverealms:glow_amethyst")
	local c_amethore = core.get_content_id("caverealms:glow_amethyst_ore")
	local c_ice = core.get_content_id("default:ice")
	local c_thinice = core.get_content_id("caverealms:thin_ice")

	--for randomness
	local mode = 1
	if math.random(15) == 1 then
		mode = 2
	end
	if biome == 3 then
		if math.random(25) == 1 then
			mode = 2
		else
			mode = 1
		end
	end
	if biome == 4 or biome == 5 then
		if math.random(3) == 1 then
			mode = 2
		end
	end

	local stalids = {
 		{{c_crystore, c_crystal}, {c_emore, c_emerald}},
 		{{c_emore, c_emerald}, {c_crystore, c_crystal}},
 		{{c_emore, c_emerald}, {c_meseore, c_mesecry}},
 		{{c_ice, c_thinice}, {c_crystore, c_crystal}},
		{{c_ice, c_thinice}, {c_crystore, c_crystal}},
		{{c_rubore, c_ruby}, {c_meseore, c_mesecry}},
		{{c_crystore, c_crystal}, {c_rubore, c_ruby}},
		{{c_rubore, c_ruby}, {c_emore, c_emerald}},
		{{c_amethore, c_ameth}, {c_meseore, c_mesecry}},
 	}

 	local nid_a
 	local nid_b
	local nid_s = c_stone --stone base, will be rewritten to ice in certain biomes

 	if biome > 3 and biome < 6 then
 		if mode == 1 then
 			nid_a = c_ice
			nid_b = c_thinice
			nid_s = c_ice
 		else
 			nid_a = c_crystore
			nid_b = c_crystal
 		end
 	elseif mode == 1 then
 		nid_a = stalids[biome][1][1]
 		nid_b = stalids[biome][1][2]
 	else
 		nid_a = stalids[biome][2][1]
 		nid_b = stalids[biome][2][2]
 	end

	local top = math.random(5,H_CRY) --grab a random height for the stalagmite
	for j = 0, top do --y
		for k = -3, 3 do
			for l = -3, 3 do
				if j == 0 then
					if k*k + l*l <= 9 then
						local vi = area:index(x+k, y+j, z+l-3)
						data[vi] = nid_s
					end
				elseif j <= top/5 then
					if k*k + l*l <= 4 then
						local vi = area:index(x+k, y+j, z+l-3)
						data[vi] = nid_a
					end
				elseif j <= top/5 * 3 then
					if k*k + l*l <= 1 then
						local vi = area:index(x+k, y+j, z+l-3)
						data[vi] = nid_b
					end
				else
					local vi = area:index(x, y+j, z-3)
					data[vi] = nid_b
				end
			end
		end
	end
end

--crystal stalactite spawner
function caverealms:crystal_stalactite(x,y,z, area, data, biome)

	if not caverealms:above_solid(x,y,z,area,data) then
		return
	end

	--contest ids
	local c_stone = core.get_content_id("default:stone")
	local c_crystore = core.get_content_id("caverealms:glow_ore")
	local c_crystal = core.get_content_id("caverealms:glow_crystal")
	local c_emerald = core.get_content_id("caverealms:glow_emerald")
	local c_emore = core.get_content_id("caverealms:glow_emerald_ore")
	local c_mesecry = core.get_content_id("caverealms:glow_mese")
	local c_meseore = core.get_content_id("default:stone_with_mese")
	local c_ruby = core.get_content_id("caverealms:glow_ruby")
	local c_rubore = core.get_content_id("caverealms:glow_ruby_ore")
	local c_ameth = core.get_content_id("caverealms:glow_amethyst")
	local c_amethore = core.get_content_id("caverealms:glow_amethyst_ore")
	local c_ice = core.get_content_id("default:ice")
	local c_thinice = core.get_content_id("caverealms:thin_ice")

	--for randomness
	local mode = 1
	if math.random(15) == 1 then
		mode = 2
	end
	if biome == 3 then
		if math.random(25) == 1 then
			mode = 2
		else
			mode = 1
		end
	end
	if biome == 4 or biome == 5 then
		if math.random(3) == 1 then
			mode = 2
		end
	end

	local stalids = {
 		{{c_crystore, c_crystal}, {c_emore, c_emerald}},
 		{{c_emore, c_emerald}, {c_crystore, c_crystal}},
 		{{c_emore, c_emerald}, {c_meseore, c_mesecry}},
 		{{c_ice, c_thinice}, {c_crystore, c_crystal}},
		{{c_ice, c_thinice}, {c_crystore, c_crystal}},
		{{c_rubore, c_ruby}, {c_meseore, c_mesecry}},
		{{c_crystore, c_crystal}, {c_rubore, c_ruby}},
		{{c_rubore, c_ruby}, {c_emore, c_emerald}},
		{{c_amethore, c_ameth}, {c_meseore, c_mesecry}},
 	}

 	local nid_a
 	local nid_b
	local nid_s = c_stone --stone base, will be rewritten to ice in certain biomes

 	if biome > 3 and biome < 6 then
 		if mode == 1 then
 			nid_a = c_ice
			nid_b = c_thinice
			nid_s = c_ice
 		else
 			nid_a = c_crystore
			nid_b = c_crystal
 		end
 	elseif mode == 1 then
 		nid_a = stalids[biome][1][1]
 		nid_b = stalids[biome][1][2]
 	else
 		nid_a = stalids[biome][2][1]
 		nid_b = stalids[biome][2][2]
 	end

	local bot = math.random(-H_CLAC, -6) --grab a random height for the stalagmite
	for j = bot, 0 do --y
		for k = -3, 3 do
			for l = -3, 3 do
				if j >= -1 then
					if k*k + l*l <= 9 then
						local vi = area:index(x+k, y+j, z+l-3)
						data[vi] = nid_s
					end
				elseif j >= bot/5 then
					if k*k + l*l <= 4 then
						local vi = area:index(x+k, y+j, z+l-3)
						data[vi] = nid_a
					end
				elseif j >= bot/5 * 3 then
					if k*k + l*l <= 1 then
						local vi = area:index(x+k, y+j, z+l-3)
						data[vi] = nid_b
					end
				else
					local vi = area:index(x, y+j, z-3)
					data[vi] = nid_b
				end
			end
		end
	end
end

--glowing crystal stalagmite spawner
function caverealms:salt_stalagmite(x,y,z, area, data, biome)

	if not caverealms:below_solid(x,y,z,area,data) then
		return
	end
	
	--contest ids
	local c_stone = core.get_content_id("default:stone")
	local c_salt = core.get_content_id("caverealms:salt_crystal")
	
	local scale = math.random(2, 4)
	if scale == 2 then
		for j = -3, 3 do
			for k = -3, 3 do
				local vi = area:index(x+j, y, z+k)
				data[vi] = c_stone
				if math.abs(j) ~= 3 and math.abs(k) ~= 3 then
					local vi = area:index(x+j, y+1, z+k)
					data[vi] = c_stone
				end
			end
		end
	else
		for j = -4, 4 do
			for k = -4, 4 do
				local vi = area:index(x+j, y, z+k)
				data[vi] = c_stone
				if math.abs(j) ~= 4 and math.abs(k) ~= 4 then
					local vi = area:index(x+j, y+1, z+k)
					data[vi] = c_stone
				end
			end
		end
	end
	for j = 2, scale + 2 do --y
		for k = -2, scale - 2 do
			for l = -2, scale - 2 do
				local vi = area:index(x+k, y+j, z+l)
				data[vi] = c_salt -- make cube
			end
		end
	end
end

--[[ Old function to create giant 'shrooms
function caverealms:giant_shroom(x, y, z, area, data)

	if not caverealms:below_solid(x,y,z,area,data) then
		return
	end

	--as usual, grab the content ID's
	local c_cap = core.get_content_id("caverealms:mushroom_cap")
	local c_stem = core.get_content_id("caverealms:mushroom_stem")
	local c_gills = core.get_content_id("caverealms:mushroom_gills")

	z = z - 5
	--cap
	for k = -5, 5 do
	for l = -5, 5 do
		if k*k + l*l <= 25 then
			local vi = area:index(x+k, y+5, z+l)
			data[vi] = c_cap
		end
		if k*k + l*l <= 16 then
			local vi = area:index(x+k, y+6, z+l)
			data[vi] = c_cap
			vi = area:index(x+k, y+5, z+l)
			data[vi] = c_gills
		end
		if k*k + l*l <= 9 then
			local vi = area:index(x+k, y+7, z+l)
			data[vi] = c_cap
		end
		if k*k + l*l <= 4 then
			local vi = area:index(x+k, y+8, z+l)
			data[vi] = c_cap
		end
	end
	end
	--stem
	for j = 0, 5 do
		for k = -1,1 do
			local vi = area:index(x+k, y+j, z)
			data[vi] = c_stem
			if k == 0 then
				local ai = area:index(x, y+j, z+1)
				data[ai] = c_stem
				ai = area:index(x, y+j, z-1)
				data[ai] = c_stem
			end
		end
	end
end]]

if core.get_modpath("mobs_monster") then
	if caverealms.config.dm_spawn == true then
		dofile(modpath.."/dungeon_master.lua") --special DMs for DM's Lair biome
	end
end

-- Parameters

local YMIN = caverealms.config.ymin -- Approximate realm limits.
local YMAX = caverealms.config.ymax

local STAGCHA = caverealms.config.stagcha --0.002 --chance of stalagmites
local STALCHA = caverealms.config.stalcha --0.003 --chance of stalactites
local CRYSTAL = caverealms.config.crystal --0.007 --chance of glow crystal formations
local GEMCHA = caverealms.config.gemcha --0.03 --chance of small glow gems
local MUSHCHA = caverealms.config.mushcha --0.04 --chance of mushrooms
local MYCCHA = caverealms.config.myccha --0.03 --chance of mycena mushrooms
local WORMCHA = caverealms.config.wormcha --0.03 --chance of glow worms
local GIANTCHA = caverealms.config.giantcha --0.001 -- chance of giant mushrooms
local ICICHA = caverealms.config.icicha --0.035 -- chance of icicles
local FLACHA = caverealms.config.flacha --0.04 --chance of constant flames

local DM_TOP = caverealms.config.dm_top -- -4000 --level at which Dungeon Master Realms start to appear
local DM_BOT = caverealms.config.dm_bot -- -5000 --level at which "" ends
local DEEP_CAVE = caverealms.config.deep_cave -- -7000 --level at which deep cave biomes take over

-- 2D noise for biome

local np_biome = {
	offset = 0,
	scale = 1,
	spread = {x=200, y=200, z=200},
	seed = 9130,
	octaves = 3,
	persist = 0.5
}

local c_Coalsapl, c_Ironsapl, c_Coppersapl, c_Goldsapl, c_Mesesapl, c_Diamondsapl

-- On generated function

core.register_on_generated(function(minp, maxp)
	if maxp.y > -2000 and maxp.y < -10 then
local spot = core.find_nodes_in_area(minp, maxp, {"default:stone"})
for n = 1, #spot do
	if math.random(1, 25) == 1 then
		local pos = {x = spot[n].x, y = spot[n].y, z = spot[n].z}
		if core.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "air" then
			if math.random(1,2) == 1 then
			core.add_node({x=pos.x, y=pos.y-1, z=pos.z}, {name = "caverealms:stalagtite"})
			else
			core.add_node({x=pos.x, y=pos.y-1, z=pos.z}, {name = "caverealms:stalagtite1"})
			end
		elseif core.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" then
			if math.random(1,2) == 1 then
			core.add_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "caverealms:stalagmite"})
			else
			core.add_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "caverealms:stalagmite1"})
			end
		end
	end
end
	end
	--if out of range of caverealms limits
	if minp.y > YMAX or maxp.y < YMIN then
		return --quit; otherwise, you'd have stalagmites all over the place
	end
	--easy reference to commonly used values
	local t1 = os.clock()
	local x1 = maxp.x
	local y1 = maxp.y
	local z1 = maxp.z
	local x0 = minp.x
	local y0 = minp.y
	local z0 = minp.z

	--print ("[caverealms] chunk minp ("..x0.." "..y0.." "..z0..")") --tell people you are generating a chunk

	local vm, emin, emax = core.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local data = vm:get_data()
	local p2s = vm:get_param2_data()

	--grab content IDs
	local c_air = core.get_content_id("air")
	local c_stone = core.get_content_id("default:stone")

	local c_ice = core.get_content_id("default:ice")
	local c_thinice = core.get_content_id("caverealms:thin_ice")
	local c_gem = core.get_content_id("caverealms:glow_gem")
	local c_saltgem = core.get_content_id("caverealms:salt_gem")
	local c_spike = core.get_content_id("caverealms:spike")
	local c_moss = core.get_content_id("caverealms:rocks_with_moss")
	local c_lichen = core.get_content_id("caverealms:rocks_with_lichen")
	local c_algae = core.get_content_id("caverealms:rocks_with_algae")
	local c_salt = core.get_content_id("caverealms:stone_with_salt")
	local c_hcobble = core.get_content_id("caverealms:hot_cobble")
	local c_gobsidian = core.get_content_id("caverealms:glow_obsidian")
	local c_gobsidian2 = core.get_content_id("caverealms:glow_obsidian_2")
	local c_coalblock = core.get_content_id("default:coal_block")
	local c_desand = core.get_content_id("default:desert_sand")
	local c_coaldust = core.get_content_id("caverealms:coal_dust")
	local c_fungus = core.get_content_id("caverealms:fungus")
	local c_mycena = core.get_content_id("caverealms:mycena")
	local c_mush_sapling = core.get_content_id("caverealms:mushroom_sapling")
	local c_e_mush_sapling = core.get_content_id("caverealms:e_mushroom_sapling")
	local c_mushgrass_1 = core.get_content_id("caverealms:mushroomgrass_1")
	local c_mushgrass_2 = core.get_content_id("caverealms:mushroomgrass_2")
	local c_mushgrass_3 = core.get_content_id("caverealms:mushroomgrass_3")
	local c_mushgrass_4 = core.get_content_id("caverealms:mushroomgrass_4")
	local c_worm = core.get_content_id("caverealms:glow_worm")
	local c_worm_green = core.get_content_id("caverealms:glow_worm_green")
	local c_fire_vine = core.get_content_id("caverealms:fire_vine")
	local c_iciu = core.get_content_id("caverealms:icicle_up")
	local c_icid = core.get_content_id("caverealms:icicle_down")
	local c_icid2 = core.get_content_id("caverealms:icicle")
	local c_flame = core.get_content_id("caverealms:constant_flame")
if core.get_modpath("mineraltrees") then
	c_Coalsapl = core.get_content_id("mineraltrees:Coalsapling")
	c_Ironsapl = core.get_content_id("mineraltrees:Ironsapling")
	c_Coppersapl = core.get_content_id("mineraltrees:Coppersapling")
	c_Goldsapl = core.get_content_id("mineraltrees:Goldsapling")
	c_Mesesapl = core.get_content_id("mineraltrees:Mesesapling")
	c_Diamondsapl = core.get_content_id("mineraltrees:Diamondsapling")
end

	--mandatory values
	local sidelen = x1 - x0 + 1 --length of a mapblock
	local chulens = {x=sidelen, y=sidelen, z=sidelen} --table of chunk edges
	local chulens2D = {x=sidelen, y=sidelen, z=1}
	local minposxyz = {x=x0, y=y0, z=z0} --bottom corner
	local minposxz = {x=x0, y=z0} --2D bottom corner

	local nvals_biome = core.get_perlin_map(np_biome, chulens2D):get2dMap_flat({x=x0+150, y=z0+50}) --2D noise for biomes (will be 3D humidity/temp later)

	local nixyz = 1 --3D node index
	local nixz = 1 --2D node index
	local nixyz2 = 1 --second 3D index for second loop


	for z = z0, z1 do -- for each xy plane progressing northwards
		--increment indices
		nixyz = nixyz + 1


		--decoration loop
		for y = y0, y1 do -- for each x row progressing upwards
		
			local c_selected_worm = c_worm

			local is_deep = false
			if y < DEEP_CAVE then
				is_deep = true
			end
		

			local vi = area:index(x0, y, z)
			for x = x0, x1 do -- for each node do
				
				--determine biome
				local biome = 0 --preliminary declaration
				local n_biome = nvals_biome[nixz] --make an easier reference to the noise

				--compare noise values to determine a biome
				if n_biome <= -0.5 then
					if is_deep and n_biome <= -0.25 then
						biome = 8 --glow obsidian
					else
						biome = 2 --fungal
						c_selected_worm = c_worm_green
					end

				elseif n_biome < 0 then
						biome = 0 -- none

				elseif n_biome < 0.5 then
					if is_deep and n_biome <= 0.25 then
						biome = 7 --salt crystal
					else
						biome = 2 --fungal
					end

				elseif n_biome < 0.65 then
					biome = 1 --moss

				elseif n_biome < 0.85 then
					if is_deep and n_biome <= 0.75 then
						biome = 9 --coal dust
					else
						biome = 3 --algae
						c_selected_worm = c_worm_green
					end

				else
					if is_deep and n_biome <= .95 then
						biome = 5 --deep glaciated
					else
						biome = 4 --glaciated
					end
				end

				--print(biome)

				if biome > 0 then
					if y <= DM_TOP and y >= DM_BOT then
						biome = 6 --DUNGEON MASTER'S LAIR
						c_selected_worm = c_fire_vine
					end

					--ceiling
					local ai = area:index(x,y+1,z) --above index
					if data[ai] == c_stone and data[vi] == c_air then --ceiling
						if math.random() < ICICHA and (biome == 4 or biome == 5) then
	if math.random(1,4) == 1 then
		data[vi] = c_icid2
	else
		data[vi] = c_icid
	end
						end
						if math.random() < WORMCHA then
							data[vi] = c_selected_worm
							local bi = area:index(x,y-1,z)
							if data[bi] == c_stone or data[bi] == c_air then
							data[bi] = c_selected_worm
							local bbi = area:index(x,y-2,z)
							if math.random(2) == 1 and data[bbi] == c_stone or data[bbi] == c_air then
								data[bbi] = c_selected_worm
								local bbbi = area:index(x,y-3,z)
								if math.random(2) == 1 and data[bbbi] == c_stone or data[bbbi] == c_air then
									data[bbbi] = c_selected_worm
								end
							end
							end
						end
						if math.random() < STALCHA then
							caverealms:stalactite(x,y,z, area, data)
						end
						if math.random() < CRYSTAL then
							caverealms:crystal_stalactite(x,y,z, area, data, biome)
						end
					end
					--ground
					local bi = area:index(x,y-1,z) --below index
					if data[bi] == c_stone and data[vi] == c_air then --ground
						local ai = area:index(x,y+1,z)
						--place floor material, add plants/decorations
						if biome == 1 then
							data[vi] = c_moss
							if math.random() < GEMCHA and data[ai] == c_air then
								data[ai] = c_gem
							end
	if math.random() < CRYSTAL and data[ai] == c_air and core.get_modpath("mineraltrees") then
		if math.random(1,3) == 3 then
		data[ai] = c_Coalsapl
		elseif math.random(1,3) == 3 then
		data[ai] = c_Ironsapl
		elseif math.random(1,3) == 3 then
		data[ai] = c_Coppersapl
		elseif math.random(1,3) == 2 then
		data[ai] = c_Goldsapl
		elseif math.random(1,3) == 2 then
		data[ai] = c_Mesesapl
		else
		data[ai] = c_Diamondsapl
		end
	end
						elseif biome == 2 then
							data[vi] = c_lichen
							if math.random() < MUSHCHA and data[ai] == c_air then --mushrooms
								data[ai] = c_fungus
							end
							if math.random() < MYCCHA and data[ai] == c_air then --mycena mushrooms
								data[ai] = c_mycena
							end
	if math.random() < GIANTCHA and data[ai] == c_air then --giant mushrooms
		if math.random(2) == 1 then
			data[ai] = c_mush_sapling-- caverealms:giant_shroom(x, y, z, area, data)
		else
			data[ai] = c_e_mush_sapling
		end
	end
	if math.random(1,4) == 1 and data[ai] == c_air then --mushroom grasses
		if math.random(1,3) == 1 then
		data[ai] = c_mushgrass_1
		elseif math.random(1,3) == 1 then
		data[ai] = c_mushgrass_2
		elseif math.random(1,3) == 1 then
		data[ai] = c_mushgrass_3
		else
		data[ai] = c_mushgrass_4
		end
		p2s[ai] = math.random(0,3)
	end
	if math.random() < CRYSTAL and data[ai] == c_air and core.get_modpath("mineraltrees") then
		if math.random(1,3) == 3 then
		data[ai] = c_Coalsapl
		elseif math.random(1,3) == 3 then
		data[ai] = c_Ironsapl
		elseif math.random(1,3) == 3 then
		data[ai] = c_Coppersapl
		elseif math.random(1,3) == 2 then
		data[ai] = c_Goldsapl
		elseif math.random(1,3) == 2 then
		data[ai] = c_Mesesapl
		else
		data[ai] = c_Diamondsapl
		end
	end
						elseif biome == 3 then
							data[vi] = c_algae
	if math.random() < CRYSTAL and data[ai] == c_air and core.get_modpath("mineraltrees") then
		if math.random(1,3) == 3 then
		data[ai] = c_Coalsapl
		elseif math.random(1,3) == 3 then
		data[ai] = c_Ironsapl
		elseif math.random(1,3) == 3 then
		data[ai] = c_Coppersapl
		elseif math.random(1,3) == 2 then
		data[ai] = c_Goldsapl
		elseif math.random(1,3) == 2 then
		data[ai] = c_Mesesapl
		else
		data[ai] = c_Diamondsapl
		end
	end
						elseif biome == 4 then
							data[vi] = c_thinice
							local bi = area:index(x,y-1,z)
							data[bi] = c_thinice
							if math.random() < ICICHA and data[ai] == c_air then --if glaciated, place icicles
								data[ai] = c_iciu
							end
						elseif biome == 5 then
							data[vi] = c_ice
							local bi = area:index(x,y-1,z)
							data[bi] = c_ice
							if math.random() < ICICHA and data[ai] == c_air then --if glaciated, place icicles
								data[ai] = c_iciu
							end
						elseif biome == 6 then
							data[vi] = c_hcobble
							if math.random() < FLACHA and data[ai] == c_air then --neverending flames
								data[ai] = c_flame
							end
						elseif biome == 7 then
							local bi = area:index(x,y-1,z)
							data[vi] = c_salt
							data[bi] = c_salt
							if math.random() < GEMCHA and data[ai] == c_air then
								data[ai] = c_saltgem
							end
							if math.random() < STAGCHA then
								caverealms:salt_stalagmite(x,y,z, area, data)
							end
						elseif biome == 8 then
							local bi = area:index(x,y-1,z)
							if math.random() < 0.5 then
								data[vi] = c_gobsidian
								data[bi] = c_gobsidian
							else
								data[vi] = c_gobsidian2
								data[bi] = c_gobsidian2
							end
							if math.random() < FLACHA and data[ai] == c_air then --neverending flames
								data[ai] = c_flame
							end
						elseif biome == 9 then
							local bi = area:index(x,y-1,z)
							if math.random() < 0.05 then
								data[vi] = c_coalblock
								data[bi] = c_coalblock
							elseif math.random() < 0.15 then
								data[vi] = c_coaldust
								data[bi] = c_coaldust
							else
								data[vi] = c_desand
								data[bi] = c_desand
							end
							if math.random() < FLACHA * 0.75 and data[ai] == c_air then --neverending flames
								data[ai] = c_flame
							end
							if math.random() < GEMCHA and data[ai] == c_air then
								data[ai] = c_spike
							end
						end

						if math.random() < STAGCHA then
							caverealms:stalagmite(x,y,z, area, data)
						end
						if math.random() < CRYSTAL then
							caverealms:crystal_stalagmite(x,y,z, area, data, biome)
						end
					end

				end
				nixyz2 = nixyz2 + 1
				nixz = nixz + 1
				vi = vi + 1
			end
			nixz = nixz - sidelen --shift the 2D index back
		end
		nixz = nixz + sidelen --shift the 2D index up a layer
	end

	--send data back to voxelmanip
	vm:set_data(data)
	vm:set_param2_data(p2s)
	--calc lighting
	vm:set_lighting({day=0, night=0})
	vm:calc_lighting()
	--write it to world
	vm:write_to_map(data)

	--local chugent = math.ceil((os.clock() - t1) * 1000) --grab how long it took
	--print ("[caverealms] "..chugent.." ms") --tell people how long
end)
print("[caverealms] loaded!")
