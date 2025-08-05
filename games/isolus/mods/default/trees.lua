-- default/trees.lua

-- support for MT game translation.
local S = default.get_translator

local random = math.random

--
-- Grow trees from saplings
--

-- check for enough height room to grow
function enough_height(pos, height)

	local nod = core.line_of_sight(
		{x= pos.x, y= pos.y+ 1, z= pos.z},
		{x= pos.x, y= pos.y+ height, z= pos.z})

	if not nod then
		return false -- obstructed
	end
	return true -- can grow
end

-- 'can grow' function

function default.can_grow(pos, group)
	local node_under = core.get_node_or_nil({x= pos.x, y= pos.y- 1, z= pos.z})
	if not node_under then
		return false
	end
	group = group or "soil"
	if core.get_item_group(node_under.name, group) == 0 then
		core.set_node(pos, {name = "default:dry_shrub"})
		return false
	end
	local light = 13
	local meta = core.get_meta(pos)
	if meta:get_int("light_level") > 0 then
		light = light - (meta:get_int("light_level") * 3)
		meta:set_int("light_level", 0)
	end
	local light_level = core.get_node_light(pos)
	if not light_level or light_level < light then
		return false
	end
	local name = core.get_node(pos).name
	local def = core.registered_nodes[name]
	local heat_min = def.heat_min or 30
	local heat_max = def.heat_max or 80
	local humi_min = def.humidity_min or 22
	local humi_max = def.humidity_max or 120
	-- check altitude for heat and humidity
	if default.h_h_h(pos, -31000, -10) then-- Pine trees should also grow at higher altitudes
		if default.h_h_h(pos, -10, 110, heat_min, heat_max, humi_min, humi_max) then
			core.set_node(pos, {name = "default:dry_shrub"})
			return false
		end
	end
	local height = def.grown_height
	-- is there enough height to grow sapling?
	if not height or not enough_height(pos, height) then
		return false
	end
	return true
end

function default.on_grow_failed(pos)
	core.get_node_timer(pos):start(300)
end


-- 'is snow nearby' function

local function is_snow_nearby(pos)
	return core.find_node_near(pos, 1, {"group:snowy"})
end



--
-- Tree generation
--

-- Apple tree and jungle tree trunk and leaves function

local function add_trunk_and_leaves(data, a, pos, tree_cid, leaves_cid,
		height, size, iters, is_apple_tree)
	local x, y, z = pos.x, pos.y, pos.z
	local c_air = core.get_content_id("air")
	local c_ignore = core.get_content_id("ignore")
	local c_apple = core.get_content_id("default:apple_leaves_fruiting")

	-- Trunk
	data[a:index(x, y, z)] = tree_cid -- Force-place lowest trunk node to replace sapling
	for yy = y + 1, y + height - 1 do
		local vi = a:index(x, yy, z)
		local node_id = data[vi]
		if node_id == c_air or node_id == c_ignore or node_id == leaves_cid then
			data[vi] = tree_cid
		end
	end

	-- Force leaves near the trunk
	for z_dist = -1, 1 do
	for y_dist = -size, 1 do
		local vi = a:index(x - 1, y + height + y_dist, z + z_dist)
		for x_dist = -1, 1 do
			if data[vi] == c_air or data[vi] == c_ignore then
				if is_apple_tree and random(1, 8) == 1 then
					data[vi] = c_apple
				else
					data[vi] = leaves_cid
				end
			end
			vi = vi + 1
		end
	end
	end

	-- Randomly add leaves in 2x2x2 clusters.
	for i = 1, iters do
		local clust_x = x + random(-size, size - 1)
		local clust_y = y + height + random(-size, 0)
		local clust_z = z + random(-size, size - 1)

		for xi = 0, 1 do
		for yi = 0, 1 do
		for zi = 0, 1 do
			local vi = a:index(clust_x + xi, clust_y + yi, clust_z + zi)
			if data[vi] == c_air or data[vi] == c_ignore then
				if is_apple_tree and random(1, 8) == 1 then
					data[vi] = c_apple
				else
					data[vi] = leaves_cid
				end
			end
		end
		end
		end
	end
end


-- Apple tree

function default.grow_tree(pos, is_apple_tree, bad)
	--[[
		NOTE: Tree-placing code is currently duplicated in the engine
		and in games that have saplings; both are deprecated but not
		replaced yet
	--]]
	if bad then
		error("Deprecated use of default.grow_tree")
	end

	local x, y, z = pos.x, pos.y, pos.z
	local height = random(4, 5)
	local c_tree = core.get_content_id("default:apple_trunk")
	local c_leaves = core.get_content_id("default:apple_leaves")

	local vm = core.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = x - 2, y = y, z = z - 2},
		{x = x + 2, y = y + height + 1, z = z + 2}
	)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()

	add_trunk_and_leaves(data, a, pos, c_tree, c_leaves, height, 2, 8, is_apple_tree)

	vm:set_data(data)
	vm:write_to_map()
	if vm.close ~= nil then
		vm:close()
	end
end

-- Jungle tree

function default.grow_jungle_tree(pos, bad)
	--[[
		NOTE: Jungletree-placing code is currently duplicated in the engine
		and in games that have saplings; both are deprecated but not
		replaced yet
	--]]
	if bad then
		error("Deprecated use of default.grow_jungle_tree")
	end

	local x, y, z = pos.x, pos.y, pos.z
	local height = random(8, 12)
	local c_air = core.get_content_id("air")
	local c_ignore = core.get_content_id("ignore")
	local c_jungletree = core.get_content_id("default:jungle_trunk")
	local c_jungleleaves = core.get_content_id("default:jungle_leaves")

	local vm = core.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = x - 3, y = y - 1, z = z - 3},
		{x = x + 3, y = y + height + 1, z = z + 3}
	)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()

	add_trunk_and_leaves(data, a, pos, c_jungletree, c_jungleleaves,
		height, 3, 30, false)

	-- Roots
	for z_dist = -1, 1 do
		local vi_1 = a:index(x - 1, y - 1, z + z_dist)
		local vi_2 = a:index(x - 1, y, z + z_dist)
		for x_dist = -1, 1 do
			if random(1, 3) >= 2 then
				if data[vi_1] == c_air or data[vi_1] == c_ignore then
					data[vi_1] = c_jungletree
				elseif data[vi_2] == c_air or data[vi_2] == c_ignore then
					data[vi_2] = c_jungletree
				end
			end
			vi_1 = vi_1 + 1
			vi_2 = vi_2 + 1
		end
	end

	vm:set_data(data)
	vm:write_to_map()
	if vm.close ~= nil then
		vm:close()
	end
end


-- Pine tree from mg mapgen mod, design by sfan5, pointy top added by paramat

local function add_pine_needles(data, vi, c_air, c_ignore, c_snow, c_pine_needles)
	local node_id = data[vi]
	if node_id == c_air or node_id == c_ignore or node_id == c_snow then
		data[vi] = c_pine_needles
	end
end

local function add_snow(data, vi, c_air, c_ignore, c_snow)
	local node_id = data[vi]
	if node_id == c_air or node_id == c_ignore then
		data[vi] = c_snow
	end
end

function default.grow_pine_tree(pos, snow)
	local x, y, z = pos.x, pos.y, pos.z
	local maxy = y + random(9, 13) -- Trunk top

	local c_air = core.get_content_id("air")
	local c_ignore = core.get_content_id("ignore")
	local c_pine_tree = core.get_content_id("default:pine_trunk")
	local c_pine_needles  = core.get_content_id("default:pine_needles")
	local c_snow = core.get_content_id("default:snow")

	local vm = core.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = x - 3, y = y, z = z - 3},
		{x = x + 3, y = maxy + 3, z = z + 3}
	)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()

	-- Upper branches layer
	local dev = 3
	for yy = maxy - 1, maxy + 1 do
		for zz = z - dev, z + dev do
			local vi = a:index(x - dev, yy, zz)
			local via = a:index(x - dev, yy + 1, zz)
			for xx = x - dev, x + dev do
				if random() < 0.95 - dev * 0.05 then
					add_pine_needles(data, vi, c_air, c_ignore, c_snow,
						c_pine_needles)
					if snow then
						add_snow(data, via, c_air, c_ignore, c_snow)
					end
				end
				vi  = vi + 1
				via = via + 1
			end
		end
		dev = dev - 1
	end

	-- Centre top nodes
	add_pine_needles(data, a:index(x, maxy + 1, z), c_air, c_ignore, c_snow,
		c_pine_needles)
	add_pine_needles(data, a:index(x, maxy + 2, z), c_air, c_ignore, c_snow,
		c_pine_needles) -- Paramat added a pointy top node
	if snow then
		add_snow(data, a:index(x, maxy + 3, z), c_air, c_ignore, c_snow)
	end

	-- Lower branches layer
	local my = 0
	for i = 1, 20 do -- Random 2x2 squares of needles
		local xi = x + random(-3, 2)
		local yy = maxy + random(-6, -5)
		local zi = z + random(-3, 2)
		if yy > my then
			my = yy
		end
		for zz = zi, zi+1 do
			local vi = a:index(xi, yy, zz)
			local via = a:index(xi, yy + 1, zz)
			for xx = xi, xi + 1 do
				add_pine_needles(data, vi, c_air, c_ignore, c_snow,
					c_pine_needles)
				if snow then
					add_snow(data, via, c_air, c_ignore, c_snow)
				end
				vi  = vi + 1
				via = via + 1
			end
		end
	end

	dev = 2
	for yy = my + 1, my + 2 do
		for zz = z - dev, z + dev do
			local vi = a:index(x - dev, yy, zz)
			local via = a:index(x - dev, yy + 1, zz)
			for xx = x - dev, x + dev do
				if random() < 0.95 - dev * 0.05 then
					add_pine_needles(data, vi, c_air, c_ignore, c_snow,
						c_pine_needles)
					if snow then
						add_snow(data, via, c_air, c_ignore, c_snow)
					end
				end
				vi  = vi + 1
				via = via + 1
			end
		end
		dev = dev - 1
	end

	-- Trunk
	-- Force-place lowest trunk node to replace sapling
	data[a:index(x, y, z)] = c_pine_tree
	for yy = y + 1, maxy do
		local vi = a:index(x, yy, z)
		local node_id = data[vi]
		if node_id == c_air or node_id == c_ignore or
				node_id == c_pine_needles or node_id == c_snow then
			data[vi] = c_pine_tree
		end
	end

	vm:set_data(data)
	vm:write_to_map()
	if vm.close ~= nil then
		vm:close()
	end
end


function add_tree(pos, ofx, ofy, ofz, schem, rot, replace)
	-- check for schematic
	if not schem then
		print (S("Schematic not found"))
		return
	end

	rot = rot or "random"

	-- remove sapling and place schematic
	core.swap_node(pos, {name = "air"})
	core.place_schematic({x = pos.x - ofx, y = pos.y - ofy, z = pos.z - ofz},
		schem, rot, replace, false)
end

-- check if on compost to grow bigger
function on_compost(pos)
	if core.get_node({x= pos.x, y= pos.y- 1, z= pos.z}).name ~= "default:compost" then
		return false
	end
	return true
end

local path = core.get_modpath("default") .."/schematics/"

_ = {name = "air", prob = 0}
I = {name = "air", force_place = true}
__ = {name = "air", prob = 0}
II = {name = "air", force_place = true}

dofile(path .."acacia_tree.lua")
dofile(path .."apple_trees.lua")
dofile(path .."aspen_trees.lua")
dofile(path .."beech_tree.lua")
dofile(path .."birch_trees.lua")
dofile(path .."blueberry_bush.lua")
dofile(path .."coco_palms.lua")
dofile(path .."jungle_trees.lua")
dofile(path .."large_cacti.lua")
dofile(path .."mangrove_trees.lua")
dofile(path .."orange_trees.lua")
dofile(path .."pine_trees.lua")
dofile(path .."reed.lua")
dofile(path .."boulder.lua")


-- New acacia tree

function default.grow_new_acacia_tree(pos)
	add_tree(pos, 5, 1, 5, default.acacia_tree)
end


-- New apple tree

function default.grow_new_apple_tree(pos)
	if on_compost(pos) then
		if not enough_height(pos, 9) then
		core.get_node_timer(pos):start(300)
		return end
		add_tree(pos, 6, 1, 6, default.apple_tree2)
		return
	end
	add_tree(pos, 3, 1, 3, default.apple_tree)
end


-- New aspen tree

function default.grow_new_aspen_tree(pos)
	if on_compost(pos) then
		if not enough_height(pos, 21) then
		core.get_node_timer(pos):start(300)
		return end
		add_tree(pos, 7, 1, 7, default.aspen_tree2)
		return
	end
	add_tree(pos, 2, 1, 2, default.aspen_tree, "0")
end


-- New beech tree

function default.grow_new_beech_tree(pos)
	add_tree(pos, 3, 1, 3, default.beech_tree)
end


-- New birch tree

function default.grow_new_birch_tree(pos)
	if on_compost(pos) then
		if not enough_height(pos, 13) then
		core.get_node_timer(pos):start(300)
		return end
		add_tree(pos, 6, 1, 6, default.birch_tree2)
		return
	end
	local model = default.birch_tree
	if random() > .5 then
		model = default.birch_tree1
	end
	add_tree(pos, 2, 1, 2, model, "0")
end


-- New coco palm

function default.grow_new_coco_palm(pos)
	local p2 = core.get_node(pos).param2
	local ro
	if p2 == 0 or p2 > 4 then
	else
		if p2 == 1 then
			ro = "0"
		elseif p2 == 2 then
			ro = "90"
		elseif p2 == 3 then
			ro = "180"
		elseif p2 == 4 then
			ro = "270"
		end
	end
	local model = random(1, 3)
	if model == 1 then
		add_tree(pos, 4, 1, 4, default.coco_palm1, ro)
	elseif model == 2 then
		add_tree(pos, 5, 1, 5, default.coco_palm2, ro)
	elseif model == 3 then
		add_tree(pos, 7, 1, 7, default.coco_palm3, ro)
	end
end


-- New jungle tree

function default.grow_new_jungle_tree(pos)
	add_tree(pos, 2, 1, 2, default.jungle_tree)
end


-- New emergent jungle tree

function default.grow_new_emergent_jungle_tree(pos)
	add_tree(pos, 3, 5, 3, default.emergent_jungle_tree)
end


-- New mangrove tree

function default.grow_new_mangrove_tree(pos)
	local model
	if random() > .5 then
		model = default.mangrove_tree1
	else
		model = default.mangrove_tree2
	end
	add_tree(pos, 2, 1, 2, model)
end


-- New orange tree

function default.grow_new_orange_tree(pos)
	add_tree(pos, 3, 1, 3, default.orange_tree)
end


-- New pine tree

function default.grow_new_pine_tree(pos)
	if on_compost(pos) then
		if not enough_height(pos, 21) then
		core.get_node_timer(pos):start(300)
		return end
		local model = default.pine_tree2
		if random() > .5 then
			model = default.pine_tree3
		end
		add_tree(pos, 3, 1, 3, model, "0")
		return
	end
	local model = default.small_pine_tree
	if random() > .5 then
		model = default.pine_tree
	end
	add_tree(pos, 2, 1, 2, model, "0")
end


-- Bush

function default.grow_bush(pos)
	if on_compost(pos) then
		add_tree(pos, 1, 0, 1, default.bush, "0", {{"default:bush_leaves", "default:bush_leaves_fruiting"}})
		return
	end
	add_tree(pos, 1, 0, 1, default.bush, "0")
end

-- Blueberry bush

function default.grow_blueberry_bush(pos)
	add_tree(pos, 1, 0, 1, default.blueberry_bush, "0")
end


-- Acacia bush

function default.grow_acacia_bush(pos)
	add_tree(pos, 1, 0, 1, default.acacia_bush, "0")
end


-- Pine bush

function default.grow_pine_bush(pos)
	add_tree(pos, 1, 0, 1, default.pine_bush, "0")
end


-- Large cactus

function default.grow_large_cactus(pos)
	local model = default.large_cactus_fruiting
	if random() > .5 then
		model = default.large_cactus
	end
	add_tree(pos, 2, 1, 2, model)
end


--
-- Sapling 'on place' function to check protection of node and resulting tree volume
--

function default.sapling_on_place(itemstack, placer, pointd,
		sapling_name, minp_relative, maxp_relative, interval)
	-- Position of sapling
	local pos = pointd.under
	local node = core.get_node_or_nil(pos)
	local pdef = node and core.registered_nodes[node.name]

	if pdef and pdef.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
		return pdef.on_rightclick(pos, node, placer, itemstack, pointd)
	end

	if not pdef or not pdef.buildable_to then
		pos = pointd.above
		node = core.get_node_or_nil(pos)
		pdef = node and core.registered_nodes[node.name]
		if not pdef or not pdef.buildable_to then
			return itemstack
		end
	end

	local pt = pointd
	-- check if pointing at the top of the node
	if pt.above.y ~= pt.under.y+1 then
		return itemstack
	end

	local pname = placer and placer:get_player_name() or ""
	-- Check sapling position for protection
	if core.is_protected(pos, pname) then
		core.record_protection_violation(pos, pname)
		return itemstack
	end
	-- Check tree volume for protection
	if core.is_area_protected(
			vector.add(pos, minp_relative),
			vector.add(pos, maxp_relative),
			pname,
			interval) then
		core.record_protection_violation(pos, pname)
		-- Print extra information to explain
		core.chat_send_player(pname,
		    S("@1 will intersect protection on growth.",
			itemstack:get_definition().description))
		return itemstack
	end

	if placer then
		default.log_player_action(placer, "places node", sapling_name, "at", pos)
	end

	local take_item = not core.is_creative_enabled(pname)
	local newnode = {name = sapling_name}
	local ndef = core.registered_nodes[sapling_name]
	core.set_node(pos, newnode)

	-- Run callback
	if ndef and ndef.after_place_node then
		-- Deepcopy place_to and pointd because callback can modify it
		if ndef.after_place_node(table.copy(pos), placer,
				itemstack, table.copy(pointd)) then
			take_item = false
		end
	end

	-- Run script hook
	for _, callback in ipairs(core.registered_on_placenodes) do
		-- Deepcopy pos, node and pointd because callback can modify them
		if callback(table.copy(pos), table.copy(newnode),
				placer, table.copy(node or {}),
				itemstack, table.copy(pointd)) then
			take_item = false
		end
	end

	if take_item then
		itemstack:take_item()
	end

	return itemstack
end

-- Grow sapling

default.sapling_growth_defs = {}

function default.register_sapling_growth(name, def)
	default.sapling_growth_defs[name] = {
		can_grow = def.can_grow or default.can_grow,
		on_grow_failed = def.on_grow_failed or default.on_grow_failed,
		grow = assert(def.grow)
	}
end

function default.grow_sapling(pos)
	local node = core.get_node(pos)
	local sapling_def = default.sapling_growth_defs[node.name]

	if not sapling_def then
		core.log("warning", "default.grow_sapling called on undefined sapling ".. node.name)
		return
	end

	if not sapling_def.can_grow(pos) then
		sapling_def.on_grow_failed(pos)
		return
	end

	core.log("action", "Growing sapling ".. node.name .." at ".. core.pos_to_string(pos))
	sapling_def.grow(pos)
end

local function register_sapling_growth(nodename, grow)
	default.register_sapling_growth("default:".. nodename, {grow = grow})
end

if core.get_mapgen_setting("mg_name") == "v6" then
	register_sapling_growth("apple_sapling", function(pos)
		default.grow_tree(pos, random(1, 4) == 1)
	end)
	register_sapling_growth("jungle_sapling", default.grow_jungle_tree)
	register_sapling_growth("pine_sapling", function(pos)
		local snow = is_snow_nearby(pos)
		default.grow_pine_tree(pos, snow)
	end)
else
	register_sapling_growth("apple_sapling", default.grow_new_apple_tree)
	register_sapling_growth("jungle_sapling", default.grow_new_jungle_tree)
	register_sapling_growth("pine_sapling", default.grow_new_pine_tree)
end

register_sapling_growth("acacia_sapling", default.grow_new_acacia_tree)
register_sapling_growth("aspen_sapling", default.grow_new_aspen_tree)
register_sapling_growth("sapling", default.grow_new_beech_tree)
register_sapling_growth("birch_sapling", default.grow_new_birch_tree)
register_sapling_growth("orange_sapling", default.grow_new_orange_tree)
register_sapling_growth("bush_sapling", default.grow_bush)
register_sapling_growth("blueberry_bush_sapling", default.grow_blueberry_bush)
register_sapling_growth("acacia_bush_sapling", default.grow_acacia_bush)
register_sapling_growth("pine_bush_sapling", default.grow_pine_bush)
register_sapling_growth("emergent_jungle_sapling", default.grow_new_emergent_jungle_tree)

core.register_lbm({
	name = "default:convert_saplings_to_node_timer",
	nodenames = {"default:acacia_sapling", "default:apple_sapling", "default:aspen_sapling",
	"default:sapling", "default:birch_sapling", "default:coco_palm_sapling", "default:jungle_sapling",
	"default:emergent_jungle_sapling", "default:mangrove_sapling", "default:orange_sapling",
	"default:pine_sapling", "default:large_cactus_seedling", "default:bush_sapling",
	"default:blueberry_bush_sapling", "default:acacia_bush_sapling", "default:pine_bush_sapling"},
	action = function(pos)
		if not core.get_node_timer(pos):is_started() then
			core.get_node_timer(pos):start(random(300, 1500))
		end
	end
})