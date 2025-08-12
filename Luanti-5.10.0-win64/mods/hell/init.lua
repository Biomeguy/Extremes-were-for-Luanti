-- Hell Mod (based on Nyanland by Jeija, Catapult by XYZ, and Livehouse by neko259)
-- lkjoel (main developer, code, ideas, textures)
-- == CONTRIBUTERS ==
-- jordan4ibanez (code, ideas, textures)
-- Gilli (code, ideas, textures, mainly for the Glowstone)
-- Death Dealer (code, ideas, textures)
-- LolManKuba (ideas, textures)
-- IPushButton2653 (ideas, textures)
-- Menche (textures)
-- sdzen (ideas)
-- godkiller447 (ideas)
-- If I didn't list you, please let me know!

local load_time_start = core.get_us_time()

if not rawget(_G, "hell") then
	hell = {}
end

--== EDITABLE OPTIONS ==--

-- Depth of hell middle
local hell_middle = -30861
if core.get_modpath("nssm") then
hell_middle = -30700
end

-- forest bottom perlin multiplication
local f_bottom_scale = 4

-- forest bottom height
local f_h_min = hell_middle+10

-- forest top height
local f_h_max = f_h_min+125

-- Frequency of trees in hell forest (higher is less frequent)
local tree_rarity = 200

-- Frequency of glowflowers in hell forest (higher is less frequent)
local glowflower_rarity = 120

-- Frequency of hell grass in hell forest (higher is less frequent)
local grass_rarity = 2

-- Frequency of nether mushrooms in hell forest (higher is less frequent)
local mushroom_rarity = 80

local abm_tree_interval = 864
local abm_tree_chance = 100

-- height of hell generation's end
hell.start = hell_middle+50

-- Height of hell (bottom of hell is hell_middle - HELL_HEIGHT)
local HELL_HEIGHT = 30

-- Maximum amount of randomness in the map generation
local HELL_RANDOM = 2

-- Frequency of Glowstone on the "roof" of the Hell (higher is less frequent)
local GLOWSTONE_FREQ_ROOF = 500

-- Frequency of lava (higher is less frequent)
local LAVA_FREQ = 100

local hell_structure_freq = 350
local HELL_SHROOM_FREQ = 100

--== END OF EDITABLE OPTIONS ==--

local path = core.get_modpath"hell"
dofile(path .. "/settings.lua")
local hell_weird_noise = dofile(path .. "/weird_mapgen_noise.lua")
dofile(path .. "/items.lua")
dofile(path .. "/pearl.lua")


if hell.log_level >= 1 then
	function hell:inform(msg, spam, t)
		if spam <= self.log_level then
			local info
			if t then
				info = "[hell] " .. msg .. (" after ca. %.3g s"):format(
					(core.get_us_time() - t) / 1000000)
			else
				info = "[hell] " .. msg
			end
			print(info)
			if self.log_to_chat then
				core.chat_send_all(info)
			end
		end
	end
else
	function hell.inform()
	end
end


-- Weierstrass function stuff from https://github.com/slemonide/gen
local SIZE = 1000
local ssize = math.ceil(math.abs(SIZE))
local function do_ws_func(depth, a, x)
	local n = math.pi * x / (16 * SIZE)
	local y = 0
	for k=1,depth do
		y = y + math.sin(k^a * n) / k^a
	end
	return SIZE * y / math.pi
end

local chunksize = core.settings:get("chunksize") or 5
local ws_lists = {}
local function get_ws_list(a,x)
        ws_lists[a] = ws_lists[a] or {}
        local v = ws_lists[a][x]
        if v then
                return v
        end
        v = {}
        for x=x,x + (chunksize*16 - 1) do
		local y = do_ws_func(ssize, a, x)
                v[x] = y
        end
        ws_lists[a][x] = v
        return v
end


local function dif(z1, z2)
	return math.abs(z1-z2)
end

local function pymg(x1, x2, z1, z2)
	return math.max(dif(x1, x2), dif(z1, z2))
end

local function r_area(manip, width, height, pos)
	local emerged_pos1, emerged_pos2 = manip:read_from_map(
		{x=pos.x-width, y=pos.y, z=pos.z-width},
		{x=pos.x+width, y=pos.y+height, z=pos.z+width}
	)
	return VoxelArea:new({MinEdge=emerged_pos1, MaxEdge=emerged_pos2})
end

local function set_vm_data(manip, nodes, pos, t1, name, generated)
	manip:set_data(nodes)
	manip:write_to_map(not generated)
	hell:inform(name.." grew at " .. core.pos_to_string(pos),
		generated and 3 or 2, t1)
end

-- Generated variables
local HELL_BOTTOM = (hell_middle - HELL_HEIGHT)
hell.buildings = HELL_BOTTOM+12
local f_yscale_top = (f_h_max-f_h_min)/2
local f_yscale_bottom = f_yscale_top/2

local c, hell_tree_nodes
local function define_contents()
	c = {
		ignore = core.get_content_id("ignore"),
		air = core.get_content_id("air"),
		barrier = core.get_content_id("default:bedrock_barrier"),
		lava = core.get_content_id("default:lava_source"),
		gravel = core.get_content_id("default:gravel"),
		coal = core.get_content_id("default:stone_with_coal"),
		diamond = core.get_content_id("default:stone_with_diamond"),
		mese = core.get_content_id("default:stone_with_mese"),
		glow_deep = core.get_content_id("nether:glowstone_deep"),
		sand = core.get_content_id("nether:sand"),

		glowstone = core.get_content_id("nether:glowstone"),

		nether_shroom = core.get_content_id("caverealms:nether_shroom"),

		rack = core.get_content_id("hell:rack"),
		rack_black = core.get_content_id("hell:rack_black"),
		rack_blue = core.get_content_id("hell:rack_blue"),
		rack_brick = core.get_content_id("hell:rack_brick"),
		ivory = core.get_content_id("hell:ivory"),

		hell_vine = core.get_content_id("hell:vine"),
		blood = core.get_content_id("hell:blood"),
		blood_top = core.get_content_id("hell:blood_top"),
		blood_stem = core.get_content_id("hell:blood_stem"),
		hell_gills = core.get_content_id("hell:gills"),

		hell_fruit = core.get_content_id("hell:fruit"),
		hell_tree = core.get_content_id("hell:tree"),
		hell_tree_corner = core.get_content_id("hell:tree_corner"),
		hell_leaves = core.get_content_id("hell:leaves"),
		hell_grass = {
			core.get_content_id("hell:grass_small"),
			core.get_content_id("hell:grass_middle"),
			core.get_content_id("hell:grass_big")
		},
		glowflower = core.get_content_id("hell:glowflower"),
		hell_dirt = core.get_content_id("hell:dirt"),
		hell_dirt_top = core.get_content_id("hell:dirt_top"),
		hell_dirt_bottom = core.get_content_id("hell:dirt_bottom"),
	}
	local trn = {c.hell_tree, c.hell_tree_corner, c.hell_leaves,
		c.hell_fruit}
	hell_tree_nodes = {}
	for i = 1,#trn do
		hell_tree_nodes[trn[i]] = true
	end
end

local pr, contents_defined

local function return_hell_ore(id, glowstone)
	if id == c.barrier then
		return c.barrier
	end
	if id == c.glow_deep then
		return c.glow_deep
	end
	if id == c.sand then
		return c.sand
	end
	if glowstone and pr:next(0,GLOWSTONE_FREQ_ROOF) == 1 then
		return c.glowstone
	end
	if id == c.coal then
		return c.glowstone
	end
	if id == c.gravel then
		return c.rack_black
	end
	if id == c.diamond then
		return c.rack_blue
	end
	if id == c.mese then
		return c.ivory
	end
	return c.rack
end

local f_perlins = {}

local tmp = f_yscale_top*4
local tmp2 = tmp/f_bottom_scale
local perlins = {
	{ -- amp 1.75
		seed = 13,
		octaves = 3,
		persist = 0.5,
		spread = {x=50, y=50, z=50},
		scale = 1,
		offset = 0,
	},
	{-- amp 1.75
		seed = 133,
		octaves = 3,
		persist = 0.5,
		spread = {x=10, y=10, z=10},
		scale = 1,
		offset = 0,
	},
	{-- amp 1.75
		seed = 112,
		octaves = 3,
		persist = 0.5,
		spread = {x=5, y=5, z=5},
		scale = 1,
		offset = 0,
	},
	forest_top = {-- amp 2.44
		seed = 21,
		octaves = 3,
		persist = 0.8,
		spread = {x=tmp, y=tmp, z=tmp},
		scale = 1,
		offset = 0,
	},
}

-- buffers, see https://forum.core.net/viewtopic.php?f=18&t=16043
local pelin_maps
local pmap1 = {}
local pmap2 = {}
local pmap3 = {}
local pmap_f_top = {}
local data = {}

local structures_enabled = true
local vine_maxlength = math.floor(HELL_HEIGHT/4+0.5)
local hell_end = -30912
if core.get_modpath("nssm") then
hell_end = -30736
end
-- Create the Hell
core.register_on_generated(function(minp, maxp, seed)
	--avoid big map generation
	if not (maxp.y >= hell_end and minp.y <= hell.start) then
		return
	end

	local t1 = core.get_us_time()
	hell:inform("generates at: x=["..minp.x.."; "..maxp.x.."]; y=[" ..
		minp.y.."; "..maxp.y.."]; z=["..minp.z.."; "..maxp.z.."]", 2)

	if not contents_defined then
		define_contents()
		contents_defined = true
	end

	local buildings = 0
	if maxp.y <= HELL_BOTTOM then
		buildings = 1
	elseif minp.y <= hell.buildings then
		buildings = 2
	end

	local vm, emin, emax = core.get_mapgen_object("voxelmanip")
	vm:get_data(data)
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}

	pr = PseudoRandom(seed+33)
	local tab,num = {},1
	local trees,num_trees = {},1

	local side_length = maxp.x - minp.x + 1
	local map_lengths_xyz = {x=side_length, y=side_length, z=side_length}

	if not pelin_maps then
		pelin_maps = {
			a = core.get_perlin_map(perlins[1], map_lengths_xyz),
			b = core.get_perlin_map(perlins[2], map_lengths_xyz),
			c = core.get_perlin_map(perlins[3], map_lengths_xyz),
			forest_top = core.get_perlin_map(perlins.forest_top,
				map_lengths_xyz),
		}
	end
	pelin_maps.a:get_2d_map_flat({x=minp.x, y=minp.z}, pmap1)
	pelin_maps.b:get_2d_map_flat({x=minp.x, y=minp.z}, pmap2)
	pelin_maps.c:get_2d_map_flat({x=minp.x, y=minp.z}, pmap3)

	local forest_possible = maxp.y > f_h_min and minp.y < f_h_max

	local perlin_f_bottom, strassx, strassz
	if forest_possible then
		perlin_f_bottom = core.get_perlin(11, 3, 0.8, tmp2)
		pelin_maps.forest_top:get_2d_map_flat({x=minp.x, y=minp.z}, pmap_f_top)
		strassx = get_ws_list(2, minp.x)
		strassz = get_ws_list(2, minp.z)
	end

	local num2, tab2
	if buildings >= 1 then
		num2 = 1
		tab2 = hell_weird_noise({x=minp.x, y=hell.buildings-79, z=minp.z},
			pymg, 200, 8, 10, side_length-1)
	end

	local count = 0
	for z=minp.z, maxp.z do
		for x=minp.x, maxp.x do

			count = count+1

			local test = pmap1[count]+1
			local test2 = pmap2[count]
			local test3 = math.abs(pmap3[count])

			local t = math.floor(test*3+0.5)

			local h
			if test2 < 0 then
				h = math.floor(test2*3+0.5)-1
			else
				h = 3+t+pr:next(0,HELL_RANDOM)
			end

			local generate_vine = false
			if test3 >= 0.72+pr:next(0,HELL_RANDOM)/10
			and pr:next(0,HELL_RANDOM) == 1 then
				generate_vine = true
			end

			local bottom = HELL_BOTTOM+h
			local top = hell_middle-pr:next(0,HELL_RANDOM)+t

			local py_h = 0
			local difn, noisp, py_h_g
			if buildings >= 1 then
				py_h = tab2[num2].y
				num2 = num2+1

				difn = hell.buildings-py_h
				if difn == 5 then
					noisp = 1
				elseif difn < 5 then
					noisp = 2
				end
				py_h_g = hell.buildings-7
			end

			local vi = area:index(x, minp.y, z)
			if buildings == 1
			and noisp and data[vi] ~= c.barrier then
				if noisp == 1 then
					for _ = 1,side_length do
						data[vi] = c.rack_brick
						vi = vi + area.ystride
					end
				else
					for _ = 1,side_length do
						data[vi] = c.lava
						vi = vi + area.ystride
					end
				end
			else

				local r_structure = pr:next(1,hell_structure_freq)
				local r_shroom = pr:next(1,HELL_SHROOM_FREQ)
				local r_glowstone = pr:next(0,GLOWSTONE_FREQ_ROOF)
				local r_vine_length = pr:next(1,vine_maxlength)

				local f_bottom, f_top, is_forest, f_h_dirt
				if forest_possible then
					local p = {x=math.floor(x/f_bottom_scale),
						z=math.floor(z/f_bottom_scale)}
					local pstr = p.x.." "..p.z
					if not f_perlins[pstr] then
						f_perlins[pstr] = math.floor(f_h_min + (math.abs(
							perlin_f_bottom:get_2d{x=p.x, y=p.z} + 1))
							* f_yscale_bottom + 0.5)
					end
					local top_noise = pmap_f_top[count]+1
					if top_noise < 0 then
						top_noise = -top_noise/10
						--hell:inform("ERROR: (perlin noise) "..
						-- pmap_f_top[count].." is not inside [-1; 1]", 1)
					end
					f_top = math.floor(f_h_max - top_noise*f_yscale_top + 0.5)
					f_bottom = f_perlins[pstr]+pr:next(0,f_bottom_scale-1)
					is_forest = f_bottom < f_top
					f_h_dirt = f_bottom-pr:next(0,1)
				end

				for y=minp.y, maxp.y do
					local d_p_addp = data[vi]
					--if py_h >= maxp.y-4 then
					if y <= py_h and noisp and data[vi] ~= c.barrier then
						if noisp == 1 then
							data[vi] = c.rack_brick
						elseif noisp == 2 then
							if y == py_h then
								data[vi] = c.rack_brick
							elseif y == py_h_g
							and pr:next(1,3) <= 2 then
								data[vi] = c.rack
							elseif y <= py_h_g then
								data[vi] = c.lava
							else
								data[vi] = c.air
							end
						end
					elseif d_p_addp ~= c.air then

						if is_forest
						and y == f_bottom then
							data[vi] = c.hell_dirt_top
						elseif is_forest
						and y < f_bottom
						and y >= f_h_dirt then
							data[vi] = c.hell_dirt
						elseif is_forest
						and y == f_h_dirt-1 then
							data[vi] = c.hell_dirt_bottom
						elseif is_forest
						and y == f_h_dirt+1 then
							if pr:next(1,tree_rarity) == 1 then
								trees[num_trees] = {x=x, y=y, z=z}
								num_trees = num_trees+1
							elseif pr:next(1,mushroom_rarity) == 1 then
								data[vi] = c.nether_shroom
							elseif pr:next(1,glowflower_rarity) == 1 then
								data[vi] = c.glowflower
							elseif pr:next(1,grass_rarity) == 1 then
								data[vi] = c.hell_grass[pr:next(1,3)]
							else
								data[vi] = c.air
							end
						elseif is_forest
						and y > f_bottom
						and y < f_top then
							if not hell_tree_nodes[d_p_addp] then
								data[vi] = c.air
							end
						elseif is_forest
						and y == f_top then
							local sel = math.floor(strassx[x]+strassz[z]+0.5)%10
							if sel <= 5 then
								data[vi] = return_hell_ore(d_p_addp, true)
							elseif sel == 6 then
								data[vi] = c.rack_black
							elseif sel == 7 then
								data[vi] = c.glowstone
							else
								data[vi] = c.air
							end

						elseif y <= HELL_BOTTOM then
							if y <= bottom then
								data[vi] = return_hell_ore(d_p_addp, true)
							else
								data[vi] = c.lava
							end
						elseif r_structure == 1
						and y == bottom then
							tab[num] = {x=x, y=y-1, z=z}
							num = num+1
						elseif y <= bottom then
							if pr:next(1,LAVA_FREQ) == 1 then
								data[vi] = c.lava
							else
								data[vi] = return_hell_ore(d_p_addp, false)
							end
						elseif r_shroom == 1
						and r_structure ~= 1
						and y == bottom+1 then
							data[vi] = c.nether_shroom
						elseif (y == top and r_glowstone == 1) then
							data[vi] = c.glowstone
						elseif y >= top then
							data[vi] = return_hell_ore(d_p_addp, true)
						elseif y <= top-1
						and generate_vine
						and y >= top-r_vine_length then
							data[vi] = c.hell_vine
						else
							data[vi] = c.air
						end
					end
					vi = vi + area.ystride
				end
			end
		end
	end
	vm:set_data(data)
	vm:set_lighting({day = 0, night = 0}, minp, maxp)
	vm:calc_lighting()
	vm:update_liquids()
	vm:write_to_map(false)

	local t2 = core.get_us_time()
	local tr_bl_cnt = 0

	if structures_enabled then -- Blood hellstructures
		tr_bl_cnt = #tab
		for i = 1,tr_bl_cnt do
			hell.grow_hellstructure(tab[i], true)
		end
	end

	if forest_possible then -- Forest trees
		tr_bl_cnt = tr_bl_cnt + #trees
		for i = 1,#trees do
			hell.grow_tree(trees[i], true)
		end
	end

	if tr_bl_cnt > 0 then
		hell:inform(tr_bl_cnt .. " trees and blood structures set", 2, t2)
	end

	hell:inform("done", 1, t1)
end)


function hell.grow_hellstructure(pos, generated)
	local t1 = core.get_us_time()

	if not contents_defined then
		define_contents()
		contents_defined = true
	end

	if not pos.x then print(dump(pos))
		hell:inform("Error: "..dump(pos), 1)
		return
	end

	local height = 6
	local manip = core.get_voxel_manip()
	local area = r_area(manip, 2, height, pos)
	local nodes = manip:get_data()

	local vi = area:indexp(pos)
	for _ = 0, height-1 do
		nodes[vi] = c.blood_stem
		vi = vi + area.ystride
	end

	for i = -1,1 do
		for j = -1,1 do
			nodes[area:index(pos.x+i, pos.y+height, pos.z+j)] = c.blood_top
		end
	end

	for k = -1, 1, 2 do
		for l = -2+1, 2 do
			local p1 = {pos.x+2*k, pos.y+height, pos.z-l*k}
			local p2 = {pos.x+l*k, pos.y+height, pos.z+2*k}
			local udat = c.blood_top
			if math.random(2) == 1 then
				nodes[area:index(p1[1], p1[2], p1[3])] = c.blood_top
				nodes[area:index(p2[1], p2[2], p2[3])] = c.blood_top
				udat = c.blood
			end
			nodes[area:index(p1[1], p1[2]-1, p1[3])] = udat
			nodes[area:index(p2[1], p2[2]-1, p2[3])] = udat
		end
		for l = 0, 1 do
			for _,p in ipairs({
				{pos.x+k, pos.y+height-1, pos.z-l*k},
				{pos.x+l*k, pos.y+height-1, pos.z+k},
			}) do
				if math.random(2) == 1 then
					nodes[area:index(p[1], p[2], p[3])] = c.hell_gills
				end
			end
		end
	end
	set_vm_data(manip, nodes, pos, t1, "blood", generated)
end


local poshash = core.hash_node_position
local pos_from_hash = core.get_position_from_hash

local function soft_node(id)
	return id == c.air or id == c.ignore
end

local function update_minmax(min, max, p)
	min.x = math.min(min.x, p.x)
	max.x = math.max(max.x, p.x)
	min.z = math.min(min.z, p.z)
	max.z = math.max(max.z, p.z)
end

local fruit_chances = {}
for y = -2,1 do --like a hyperbola
	fruit_chances[y] = math.floor(-4/(y-2)+0.5)
end

local dirs = {
	{-1, 0, 12, 19},
	{1, 0, 12, 13},
	{0, 1, 4},
	{0, -1, 4, 10},
}

local h_max = 26
local h_stem_min = 3
local h_stem_max = 7
local h_arm_min = 2
local h_arm_max = 6
local r_arm_min = 1
local r_arm_max = 5
local fruit_rarity = 25 --a bigger number results in less fruits
local leaf_thickness = 3 --a bigger number results in more blank trees

local h_trunk_max = h_max-h_arm_max

function hell.grow_tree(pos, generated)
	local t1 = core.get_us_time()

	if not contents_defined then
		define_contents()
		contents_defined = true
	end

	local min = vector.new(pos)
	local max = vector.new(pos)
	min.y = min.y-1
	max.y = max.y+h_max

	local trunks = {}
	local trunk_corners = {}
	local h_stem = math.random(h_stem_min, h_stem_max)
	local todo,n = {{x=pos.x, y=pos.y+h_stem, z=pos.z}},1
	while n do
		local p = todo[n]
		todo[n] = nil
		n = next(todo)

		local used_dirs,u = {},1
		for _,dir in pairs(dirs) do
			if math.random(1,2) == 1 then
				used_dirs[u] = dir
				u = u+1
			end
		end
		if not used_dirs[1] then
			local dir1 = math.random(4)
			local dir2 = math.random(3)
			if dir1 <= dir2 then
				dir2 = dir2+1
			end
			used_dirs[1] = dirs[dir1]
			used_dirs[2] = dirs[dir2]
		end
		for _,dir in pairs(used_dirs) do
			local p = vector.new(p)
			local r = math.random(r_arm_min, r_arm_max)
			for j = 1,r do
				local x = p.x+j*dir[1]
				local z = p.z+j*dir[2]
				trunks[poshash{x=x, y=p.y, z=z}] = dir[3]
			end
			r = r+1
			p.x = p.x+r*dir[1]
			p.z = p.z+r*dir[2]
			trunk_corners[poshash(p)] = dir[4] or dir[3]
			local h = math.random(h_arm_min, h_arm_max)
			for i = 1,h do
				p.y = p.y + i
				trunks[poshash(p)] = true
				p.y = p.y - i
			end
			p.y = p.y+h
			--n = #todo+1 -- caused small trees
			todo[#todo+1] = p
		end
		if p.y > pos.y+h_trunk_max then
			break
		end

		n = n or next(todo)
	end
	local leaves = {}
	local fruits = {}
	local trunk_ps = {}
	local count = 0

	local ps = {}
	local trunk_count = 0
	for i,par2 in pairs(trunks) do
		local pos = pos_from_hash(i)
		update_minmax(min, max, pos)
		local z,y,x = pos.z, pos.y, pos.x
		trunk_count = trunk_count+1
		ps[trunk_count] = {z,y,x, par2}
	end

	for _,d in pairs(ps) do
		if d[4] == true then
			d[4] = nil
		end
		trunk_ps[#trunk_ps+1] = d
		local pz, py, px = unpack(d)
		count = count+1
		if count > leaf_thickness then
			count = 0
			for y = -2,2 do
				local fruit_chance = fruit_chances[y]
				for z = -2,2 do
					for x = -2,2 do
						local distq = x*x+y*y+z*z
						if distq ~= 0
						and math.random(1, math.sqrt(distq)) == 1 then
							local x = x+px
							local y = y+py
							local z = z+pz
							local vi = poshash{x=x, y=y, z=z}
							if not trunks[vi] then
								if fruit_chance
								and math.random(1, fruit_rarity) == 1
								and math.random(1, fruit_chance) == 1 then
									fruits[vi] = true
								else
									leaves[vi] = true
								end
								update_minmax(min, max, {x=x, z=z})
							end
						end
					end
				end
			end
		end
	end

	--ps = nil
	--collectgarbage()

	for i = -1,h_stem+1 do
		-- param2 explicitly set 0 due to possibly previous leaves node
		trunk_ps[#trunk_ps+1] = {pos.z, pos.y+i, pos.x, 0}
	end

	local manip = core.get_voxel_manip()
	local emerged_pos1, emerged_pos2 = manip:read_from_map(min, max)
	local area = VoxelArea:new({MinEdge=emerged_pos1, MaxEdge=emerged_pos2})
	local nodes = manip:get_data()
	local param2s = manip:get_param2_data()

	for i in pairs(leaves) do
		local p = area:indexp(pos_from_hash(i))
		if soft_node(nodes[p]) then
			nodes[p] = c.hell_leaves
			param2s[p] = math.random(0,179)
			--param2s[p] = math.random(0,44)
		end
	end

	for i in pairs(fruits) do
		local p = area:indexp(pos_from_hash(i))
		if soft_node(nodes[p]) then
			nodes[p] = c.hell_fruit
		end
	end

	for i = 1,#trunk_ps do
		local p = trunk_ps[i]
		local par = p[4]
		p = area:index(p[3], p[2], p[1])
		if par then
			param2s[p] = par
		end
		nodes[p] = c.hell_tree
	end

	for i,par2 in pairs(trunk_corners) do
		local vi = area:indexp(pos_from_hash(i))
		nodes[vi] = c.hell_tree_corner
		param2s[vi] = par2
	end

	manip:set_data(nodes)
	manip:set_param2_data(param2s)
	manip:write_to_map(not generated)
	hell:inform("a hell tree with " .. trunk_count ..
		" branch trunk nodes grew at " .. core.pos_to_string(pos),
		generated and 3 or 2, t1)
end


--abms

core.register_abm({
	nodenames = {"hell:sapling"},
	neighbors = {"hell:blood_top"},
	interval = 20,
	chance = 8,
	action = function(pos)
		local under = {x=pos.x, y=pos.y-1, z=pos.z}
		if core.get_node_light(pos) < 4
		and core.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air"
		and core.get_node(under).name == "hell:blood_top" then
			hell.grow_hellstructure(under)
		end
	end
})

core.register_abm({
	nodenames = {"hell:tree_sapling"},
	neighbors = {"group:hell_dirt"},
	interval = abm_tree_interval,
	chance = abm_tree_chance,
	action = function(pos)
		if core.get_node({x=pos.x, y=pos.y+2, z=pos.z}).name == "air"
		and core.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" then
	local udata = core.registered_nodes[core.get_node{x=pos.x, y=pos.y-1, z=pos.z}.name]
			if udata and udata.groups and udata.groups.hell_dirt then
				hell.grow_tree(pos)
			end
		end
	end
})

local function grass_allowed(pos)
	local nd = core.get_node(pos).name
	if nd == "air" then
		return true
	end
	if nd == "ignore" then
		return 0
	end
	local data = core.registered_nodes[nd]
	if not data then
		-- unknown node
		return false
	end
	local drawtype = data.drawtype
	if drawtype
	and drawtype ~= "normal"
	and drawtype ~= "liquid"
	and drawtype ~= "flowingliquid" then
		return true
	end
	local light = data.light_source
	if light
	and light > 0 then
		return true
	end
	return false
end

core.register_abm({
	nodenames = {"hell:dirt"},
	interval = 20,
	chance = 9,
	action = function(pos)
		local allowed = grass_allowed({x=pos.x, y=pos.y+1, z=pos.z})
		if allowed == 0 then
			return
		end
		if allowed then
			core.set_node(pos, {name="hell:dirt_top"})
		end
	end
})

core.register_abm({
	nodenames = {"hell:dirt_top"},
	interval = 30,
	chance = 9,
	action = function(pos)
		local allowed = grass_allowed({x=pos.x, y=pos.y+1, z=pos.z})
		if allowed == 0 then
			return
		end
		if not allowed then
			core.set_node(pos, {name="hell:dirt"})
		end
	end
})


core.register_privilege("hell",
	"Allows sending players to hell and extracting them")

dofile(path.."/crafting.lua")
dofile(path.."/portal.lua")
dofile(path.."/guide.lua")


local time = (core.get_us_time() - load_time_start) / 1000000
local msg = ("[hell] loaded after ca. %g seconds."):format(time)
if time > 0.01 then
	print(msg)
else
	core.log("info", msg)
end
