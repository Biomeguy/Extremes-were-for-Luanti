
local S = ethereal.intllib

-- Sapling Registration Functions

-- grow tree functions
function ethereal.grow_yellow_tree(pos)
	add_tree(pos, 4, 0, 4, ethereal.yellowtree)
end

function ethereal.grow_banana_tree(pos)
	add_tree(pos, 3, 0, 3, ethereal.bananatree)
end

function ethereal.grow_frost_tree(pos)
	add_tree(pos, 4, 0, 4, ethereal.frosttrees)
end

function ethereal.grow_willow_tree(pos)
	if on_compost(pos) then
		if not enough_height(pos, 9) then
		core.get_node_timer(pos):start(300)
		return end
		add_tree(pos, 5, 1, 5, ethereal.willow2)
		return
	end
	add_tree(pos, 3, 1, 3, ethereal.willow)
end

function ethereal.grow_redwood_tree(pos)
	if on_compost(pos) then
		if not enough_height(pos, 28) then
		core.get_node_timer(pos):start(300)
		return end
		add_tree(pos, 9, 4, 9, ethereal.redwood_tree2)
		return
	end
	add_tree(pos, 8, 2, 8, ethereal.redwood_tree)
end

function ethereal.grow_sakura_tree(pos)
	if math.random(10) == 1 then
		add_tree(pos, 5, 0, 5, ethereal.sakura_tree, nil,
			{{"ethereal:sakura_leaves", "ethereal:sakura_leaves2"}})
	else
		add_tree(pos, 5, 0, 5, ethereal.sakura_tree)
	end
end

local function grow_sapling(pos, node)

	local under = core.get_node({x= pos.x, y= pos.y- 1, z= pos.z}).name

	local height = core.registered_nodes[node.name].grown_height

	-- do we have enough height to grow sapling into tree?
	if not height or not enough_height(pos, height) then
		core.get_node_timer(pos):start(math.random(200, 300))
		return
	end

	-- Check if Ethereal Sapling is growing on correct substrate	(TODO use biome heat and humidity instead of grounds)
	if node.name == "ethereal:yellow_tree_sapling"
		and core.get_item_group(under, "soil") > 0 then
		ethereal.grow_yellow_tree(pos)

	elseif node.name == "ethereal:banana_tree_sapling"
		and under == "ethereal:grove_dirt" then
		ethereal.grow_banana_tree(pos)

	elseif node.name == "ethereal:frost_tree_sapling"
		and under == "default:dirt_with_blue_moss" then
		ethereal.grow_frost_tree(pos)

	elseif node.name == "ethereal:willow_sapling"
		and under == "default:dirt_with_swamp_grass" then
		if #core.find_nodes_in_area({x = pos.x + 5, y = pos.y - 1, z = pos.z + 5},
			{x = pos.x - 5, y = pos.y - 1, z = pos.z - 5}, {"default:water_source", "default:fresh_water_source"}) > 0 then

			core.log("action", "A cascading willow sapling grows into a tree at ".. core.pos_to_string(pos))
			ethereal.grow_willow_tree(pos)
		else
			core.set_node(pos, {name = "default:dry_shrub"})
		end

	elseif node.name == "ethereal:redwood_sapling"
		and under == "default:dirt_with_rainforest_litter" then
		ethereal.grow_redwood_tree(pos)

	elseif node.name == "ethereal:sakura_sapling"
		and under == "ethereal:grove_dirt" then
		ethereal.grow_sakura_tree(pos)
	end
end

-- register saplings
local register_sapling = function(name, desc, texture, height, fl)

	fl = fl or 2

	core.register_node("ethereal:".. name .."_sapling", {
		description = S(desc .." Tree Sapling"),
		drawtype = "plantlike",
		tiles = {texture ..".png"},
		inventory_image = texture ..".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-.3, -.5, -.3, .3, .35, .3}
		},
		on_construct = function(pos)
			core.get_node_timer(pos):start(math.random(300, 1500))
		end,
		on_timer = function(pos, elapsed)

			local node = core.get_node(pos)
			local light_level = core.get_node_light(pos)

			if not light_level or light_level < 13 then
				core.get_node_timer(pos):start(math.random(200, 300))
				return
			end

			grow_sapling(pos, node)
		end,
		groups = {snappy = 2, dig_immediate = 3, flammable = fl, attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),
		grown_height = height,
	})
end

register_sapling("willow", "Cascading Willow (Salix ninevehica)", "willow_sapling".. leaf_image("O"), 6)
register_sapling("yellow_tree", "Healing", "yellow_tree_sapling", 17, 0)
register_sapling("banana_tree", "Banana", "banana_tree_sapling", 10)
register_sapling("frost_tree", "Frost", "ethereal_frost_tree_sapling", 17, 0)
register_sapling("redwood", "Redwood", "redwood_sapling", 16)
register_sapling("sakura", "Sakura", "ethereal_sakura_sapling", 10)
